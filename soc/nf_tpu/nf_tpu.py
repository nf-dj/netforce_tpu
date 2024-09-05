from migen import *
from migen.fhdl import verilog

class DotUnit(Module):
    def __init__(self):
        self.clk = ClockSignal()

        self.in_stream_w = Signal(8)
        self.in_stream_w_valid = Signal()
        self.in_stream_e = Signal(8)
        self.in_stream_e_valid = Signal()
        self.in_weight = Signal(8)

        self.out_stream_e = Signal(8)
        self.out_stream_w = Signal(8)
        self.out_weight = Signal(8)

        self.weight = Signal(8, reset=0)
        self.sum = Signal(16, reset=0)

        self.submodules.fsm = FSM(reset_state="PASS")
        self.fsm.act("PASS",
            If(self.in_stream_w_valid,
                self.out_stream_w.eq(self.in_stream_w)
            ),
            If(self.in_stream_e_valid,
                self.out_stream_e.eq(self.in_stream_e)
            ),
            NextState("PASS")
        )
        self.fsm.act("LOAD_WEIGHT",
            If(self.in_stream_w_valid,
                NextValue(self.weight, self.in_stream_w),
                NextState("PASS")
            ),
            If(self.in_stream_e_valid,
                self.out_stream_e.eq(self.in_stream_e)
            )
        )
        self.fsm.act("MUL",
            If(self.in_stream_w_valid,
                NextValue(self.sum, self.sum + self.in_stream_w * self.in_weight),
                self.out_stream_w.eq(self.in_stream_w)
            ),
            If(self.in_stream_e_valid,
                self.out_stream_e.eq(self.in_stream_e)
            ),
            NextState("MUL")
        )
        self.fsm.act("READ_SUM",
            self.out_stream_e.eq(self.sum),
            If(self.in_stream_w_valid,
                self.out_stream_w.eq(self.in_stream_w)
            ),
            NextState("PASS")
        )

class DotTile(Module):
    def __init__(self, tile_no=0, ins_width=64, lane_width=32):
        self.tile_no = tile_no
        self.ins_width = ins_width
        self.lane_width = lane_width

        self.clk = ClockSignal()
        self.in_stream_w = Signal(lane_width)
        self.in_stream_w_valid = Signal()
        self.in_stream_e = Signal(lane_width)
        self.in_stream_e_valid = Signal()
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()

        self.out_stream_e = Signal(lane_width)
        self.out_stream_e_valid = Signal()
        self.out_stream_w = Signal(lane_width)
        self.out_stream_w_valid = Signal()
        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()

        self.state = Signal(2, reset=0)  # STATE_PASS
        self.weight_inter = Array([Signal(8) for _ in range(4)])
        self.in_weight = Signal(8)  # Added this signal as it was missing in the original

        self.STATE_PASS = 0
        self.STATE_LOAD_WEIGHT = 1
        self.STATE_MUL = 2
        self.STATE_READ_SUM = 3
        self.OP_PASS = 0
        self.OP_LOAD_WEIGHT = 1
        self.OP_MUL = 2
        self.OP_READ_SUM = 3

        self.dot_units = []
        for i in range(4):
            unit = DotUnit()
            self.dot_units.append(unit)
            setattr(self.submodules, f"dot_unit_{i}", unit)

            self.comb += [
                #unit.state.eq(self.state),
                unit.in_stream_w.eq(self.in_stream_w[i*8:i*8+8]),
                unit.in_stream_w_valid.eq(self.in_stream_w_valid),
                self.out_stream_e[i*8:i*8+8].eq(unit.out_stream_e),
                self.out_stream_w[i*8:i*8+8].eq(unit.out_stream_w),
                unit.in_stream_e.eq(self.in_stream_e[i*8:i*8+8]),
                unit.in_stream_e_valid.eq(self.in_stream_e_valid),
                unit.in_weight.eq(self.in_weight if i == 0 else self.weight_inter[i-1]),
                self.weight_inter[i].eq(unit.out_weight)
            ]

        self.fsm = FSM(reset_state="PASS")
        self.submodules += self.fsm

        self.fsm.act("PASS",
            NextValue(self.out_stream_w_valid, self.in_stream_w_valid),
            NextValue(self.out_stream_e_valid, self.in_stream_e_valid)
        )
        self.fsm.act("LOAD_WEIGHT",
            If(self.in_stream_w_valid,
                NextState("PASS")
            ),
            NextValue(self.out_stream_e_valid, self.in_stream_e_valid)
        )
        self.fsm.act("MUL",
            NextValue(self.out_stream_w_valid, self.in_stream_w_valid),
            NextValue(self.out_stream_e_valid, self.in_stream_e_valid)
        )
        self.fsm.act("READ_SUM",
            NextValue(self.out_stream_w_valid, self.in_stream_w_valid),
            NextValue(self.out_stream_e_valid, 1),
            NextState("PASS")
        )

        self.sync += [
            If(self.in_ins_valid & (self.in_ins[15:8] == self.tile_no),
                Case(self.in_ins[23:16], {
                    self.OP_PASS: self.state.eq(self.STATE_PASS),
                    self.OP_LOAD_WEIGHT: self.state.eq(self.STATE_LOAD_WEIGHT),
                    self.OP_MUL: self.state.eq(self.STATE_MUL),
                    self.OP_READ_SUM: self.state.eq(self.STATE_READ_SUM)
                }),
                self.out_ins_valid.eq(0)
            ).Else(
                self.out_ins.eq(self.in_ins),
                self.out_ins_valid.eq(self.in_ins_valid)
            )
        ]

class DotSlice(Module):
    def __init__(self, data_width=512, num_tiles=16, ins_width=64):
        self.data_width = data_width
        self.num_tiles = num_tiles
        self.ins_width = ins_width

        self.clk = ClockSignal()
        self.in_stream_w = Signal(data_width)
        self.in_stream_w_valid = Signal(num_tiles)
        self.in_stream_e = Signal(data_width)
        self.in_stream_e_valid = Signal(num_tiles)
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()

        self.out_stream_e = Signal(data_width)
        self.out_stream_e_valid = Signal(num_tiles)
        self.out_stream_w = Signal(data_width)
        self.out_stream_w_valid = Signal(num_tiles)

        self.ins_inter = Array([Signal(ins_width) for _ in range(num_tiles)])
        self.ins_valid_inter = Array([Signal() for _ in range(num_tiles)])

        self.tiles = []
        for i in range(num_tiles):
            tile = DotTile(tile_no=i, ins_width=ins_width, lane_width=32)
            self.tiles.append(tile)
            setattr(self.submodules, f"tile_{i}", tile)

            self.comb += [
                tile.clk.eq(self.clk),
                tile.in_stream_w.eq(self.in_stream_w[i*32:i*32+32]),
                tile.in_stream_w_valid.eq(self.in_stream_w_valid[i]),
                self.out_stream_e[i*32:i*32+32].eq(tile.out_stream_e),
                self.out_stream_e_valid[i].eq(tile.out_stream_e_valid),
                self.out_stream_w[i*32:i*32+32].eq(tile.out_stream_w),
                self.out_stream_w_valid[i].eq(tile.out_stream_w_valid),
                tile.in_stream_e.eq(self.in_stream_e[i*32:i*32+32]),
                tile.in_stream_e_valid.eq(self.in_stream_e_valid[i]),
                If(i == 0,
                    tile.in_ins.eq(self.in_ins),
                    tile.in_ins_valid.eq(self.in_ins_valid)
                ).Else(
                    tile.in_ins.eq(self.ins_inter[i-1]),
                    tile.in_ins_valid.eq(self.ins_valid_inter[i-1])
                ),
                self.ins_inter[i].eq(tile.out_ins),
                self.ins_valid_inter[i].eq(tile.out_ins_valid)
            ]

if __name__ == "__main__":
    #top = DotUnit()
    #out = verilog.convert(top, ios={top.in_stream_w, top.in_stream_w_valid, top.in_stream_e, top.in_stream_e_valid, top.in_weight, top.out_stream_e, top.out_stream_w, top.out_weight})
    #top = DotTile()
    #out = verilog.convert(top, ios={top.in_stream_w, top.in_stream_w_valid, top.in_stream_e, top.in_stream_e_valid, top.in_ins, top.in_ins_valid, top.out_stream_e, top.out_stream_e_valid, top.out_stream_w, top.out_stream_w_valid, top.out_ins, top.out_ins_valid})
    top = DotSlice()
    out = verilog.convert(top, ios={top.in_stream_w, top.in_stream_w_valid, top.out_stream_e, top.out_stream_e_valid, top.out_stream_w, top.out_stream_w_valid, top.in_stream_e, top.in_stream_e_valid, top.in_ins, top.in_ins_valid})

    with open("build/nf_tpu.v", "w") as f:
        f.write(out.main_source)

