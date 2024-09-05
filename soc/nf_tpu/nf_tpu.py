from migen import *
from migen.fhdl import verilog

# internal memory

class MemTile(Module):
    def __init__(self, tile_no=0, ins_width=64, lane_width=32, mem_depth=1024):
        self.tile_no = tile_no
        self.ins_width = ins_width
        self.lane_width = lane_width
        self.mem_depth = mem_depth

        self.clk = ClockSignal()
        self.in_stream = Signal(lane_width)
        self.in_stream_valid = Signal()
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()

        self.out_stream = Signal(lane_width)
        self.out_stream_valid = Signal()
        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()

        self.bram = Memory(lane_width, mem_depth)
        self.specials += self.bram
        self.read_port = self.bram.get_port(write_capable=False)
        self.write_port = self.bram.get_port(write_capable=True)
        self.specials += self.read_port, self.write_port

        self.addr = Signal(16)
        self.len = Signal(16)
        self.state = Signal(2)

        self.STATE_PASS = 0
        self.STATE_READ = 1
        self.STATE_WRITE = 2
        self.OP_PASS = 0
        self.OP_READ = 1
        self.OP_WRITE = 2

        self.submodules.fsm = FSM(reset_state="PASS")
        self.fsm.act("PASS",
            self.out_stream.eq(self.in_stream),
            self.out_stream_valid.eq(self.in_stream_valid),
            If(self.in_ins_valid & (self.in_ins[15:8] == self.tile_no),
                Case(self.in_ins[23:16], {
                    self.OP_PASS: NextState("PASS"),
                    self.OP_READ: NextState("READ"),
                    self.OP_WRITE: NextState("WRITE")
                }),
                NextValue(self.addr, self.in_ins[39:24]),
                NextValue(self.len, self.in_ins[55:40]),
                NextValue(self.out_ins, 0),
                NextValue(self.out_ins_valid, 0)
            ).Else(
                NextValue(self.out_ins, self.in_ins),
                NextValue(self.out_ins_valid, self.in_ins_valid)
            )
        )
        self.fsm.act("READ",
            self.out_stream.eq(self.read_port.dat_r),
            self.out_stream_valid.eq(1),
            If(self.len > 0,
                NextValue(self.addr, self.addr + 1),
                NextValue(self.len, self.len - 1)
            ).Else(
                NextState("PASS")
            )
        )
        self.fsm.act("WRITE",
            If(self.in_stream_valid,
                self.write_port.we.eq(1),
                self.write_port.dat_w.eq(self.in_stream),
                If(self.len > 0,
                    NextValue(self.addr, self.addr + 1),
                    NextValue(self.len, self.len - 1)
                ).Else(
                    NextState("PASS")
                )
            )
        )

        self.comb += [
            self.read_port.adr.eq(self.addr),
            self.write_port.adr.eq(self.addr)
        ]

class MemSlice(Module):
    def __init__(self, num_tiles=16, data_width=512, ins_width=64):
        self.num_tiles = num_tiles
        self.data_width = data_width
        self.ins_width = ins_width

        self.clk = ClockSignal()
        self.in_stream_w = Signal(data_width)
        self.in_stream_w_valid = Signal(num_tiles)
        self.in_stream_e = Signal(data_width)
        self.in_stream_e_valid = Signal(num_tiles)
        self.in_ins_w = Signal(ins_width)
        self.in_ins_e = Signal(ins_width)
        self.in_ins_valid_w = Signal()
        self.in_ins_valid_e = Signal()

        self.out_stream_e = Signal(data_width)
        self.out_stream_e_valid = Signal(num_tiles)
        self.out_stream_w = Signal(data_width)
        self.out_stream_w_valid = Signal(num_tiles)

        self.ins_inter_w = Array([Signal(ins_width) for _ in range(num_tiles)])
        self.ins_valid_inter_w = Array([Signal() for _ in range(num_tiles)])
        self.ins_inter_e = Array([Signal(ins_width) for _ in range(num_tiles)])
        self.ins_valid_inter_e = Array([Signal() for _ in range(num_tiles)])

        for i in range(num_tiles):
            tile_w = MemTile(tile_no=i, ins_width=ins_width, lane_width=32)
            tile_e = MemTile(tile_no=i, ins_width=ins_width, lane_width=32)
            setattr(self.submodules, f"tile_w_{i}", tile_w)
            setattr(self.submodules, f"tile_e_{i}", tile_e)

            self.comb += [
                tile_w.clk.eq(self.clk),
                tile_w.in_stream.eq(self.in_stream_w[i*32:i*32+32]),
                tile_w.in_stream_valid.eq(self.in_stream_w_valid[i]),
                self.out_stream_w[i*32:i*32+32].eq(tile_w.out_stream),
                self.out_stream_w_valid[i].eq(tile_w.out_stream_valid),
                tile_w.in_ins.eq(self.in_ins_w if i == 0 else self.ins_inter_w[i-1]),
                tile_w.in_ins_valid.eq(self.in_ins_valid_w if i == 0 else self.ins_valid_inter_w[i-1]),
                self.ins_inter_w[i].eq(tile_w.out_ins),
                self.ins_valid_inter_w[i].eq(tile_w.out_ins_valid)
            ]

            self.comb += [
                tile_e.clk.eq(self.clk),
                tile_e.in_stream.eq(self.in_stream_e[i*32:i*32+32]),
                tile_e.in_stream_valid.eq(self.in_stream_e_valid[i]),
                self.out_stream_e[i*32:i*32+32].eq(tile_e.out_stream),
                self.out_stream_e_valid[i].eq(tile_e.out_stream_valid),
                tile_e.in_ins.eq(self.in_ins_e if i == 0 else self.ins_inter_e[i-1]),
                tile_e.in_ins_valid.eq(self.in_ins_valid_e if i == 0 else self.ins_valid_inter_e[i-1]),
                self.ins_inter_e[i].eq(tile_e.out_ins),
                self.ins_valid_inter_e[i].eq(tile_e.out_ins_valid)
            ]

class MemInsDec(Module):
    def __init__(self, id_no_w=3, id_no_e=4, ins_width=64):
        self.id_no_w = id_no_w
        self.id_no_e = id_no_e
        self.ins_width = ins_width

        self.clk = ClockSignal()
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()

        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()
        self.out_slice_ins_w = Signal(ins_width)
        self.out_slice_ins_e = Signal(ins_width)
        self.out_slice_ins_valid_w = Signal()
        self.out_slice_ins_valid_e = Signal()

        self.comb += [
            self.out_slice_ins_valid_w.eq(self.in_ins_valid & (self.in_ins[0:8] == self.id_no_w)),
            self.out_slice_ins_valid_e.eq(self.in_ins_valid & (self.in_ins[0:8] == self.id_no_e)),
            self.out_slice_ins_w.eq(self.in_ins),
            self.out_slice_ins_e.eq(self.in_ins)
        ]

        self.sync += [
            If(self.out_slice_ins_valid_w | self.out_slice_ins_valid_e,
                self.out_ins.eq(0),
                self.out_ins_valid.eq(0)
            ).Else(
                self.out_ins.eq(self.in_ins),
                self.out_ins_valid.eq(self.in_ins_valid)
            )
        ]

# routing switch

class SwitchTile(Module):
    def __init__(self, tile_no=0, ins_width=64):
        self.tile_no = tile_no
        self.ins_width = ins_width

        self.clk = ClockSignal()
        self.in_stream = Signal(32)
        self.in_stream_valid = Signal()
        self.in_data = Signal(32)
        self.in_data_valid = Signal()
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()

        self.out_stream = Signal(32)
        self.out_stream_valid = Signal()
        self.out_data = Signal(32)
        self.out_data_valid = Signal()
        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()

        self.state = Signal(2, reset=0)  # STATE_PASS

        self.STATE_PASS = 0
        self.STATE_DRAM_IN = 1
        self.STATE_DRAM_OUT = 2

        self.submodules.fsm = FSM(reset_state="PASS")
        self.fsm.act("PASS",
            NextValue(self.out_stream, self.in_stream),
            NextValue(self.out_stream_valid, self.in_stream_valid),
            If(self.in_ins_valid & (self.in_ins[15:8] == self.tile_no),
                NextValue(self.state, self.in_ins[23:16]),
                NextValue(self.out_ins, 0),
                NextValue(self.out_ins_valid, 0),
                NextState("HANDLE_INS")
            ).Else(
                NextValue(self.out_ins, self.in_ins),
                NextValue(self.out_ins_valid, self.in_ins_valid)
            )
        )
        self.fsm.act("HANDLE_INS",
            Case(self.state, {
                self.STATE_PASS: NextState("PASS"),
                self.STATE_DRAM_IN: NextState("DRAM_IN"),
                self.STATE_DRAM_OUT: NextState("DRAM_OUT")
            })
        )
        self.fsm.act("DRAM_IN",
            NextValue(self.out_stream, self.in_data),
            NextValue(self.out_stream_valid, self.in_data_valid),
            If(self.in_ins_valid & (self.in_ins[15:8] == self.tile_no),
                NextValue(self.state, self.in_ins[23:16]),
                NextValue(self.out_ins, 0),
                NextValue(self.out_ins_valid, 0),
                NextState("HANDLE_INS")
            ).Else(
                NextValue(self.out_ins, self.in_ins),
                NextValue(self.out_ins_valid, self.in_ins_valid)
            )
        )
        self.fsm.act("DRAM_OUT",
            NextValue(self.out_data, self.in_stream),
            NextValue(self.out_data_valid, self.in_stream_valid),
            NextValue(self.out_stream, 0),
            If(self.in_ins_valid & (self.in_ins[15:8] == self.tile_no),
                NextValue(self.state, self.in_ins[23:16]),
                NextValue(self.out_ins, 0),
                NextValue(self.out_ins_valid, 0),
                NextState("HANDLE_INS")
            ).Else(
                NextValue(self.out_ins, self.in_ins),
                NextValue(self.out_ins_valid, self.in_ins_valid)
            )
        )

class SwitchSlice(Module):
    def __init__(self, num_tiles=16, data_width=512, ins_width=64):
        self.num_tiles = num_tiles
        self.data_width = data_width
        self.ins_width = ins_width

        self.clk = ClockSignal()
        self.in_stream = Signal(data_width)
        self.in_stream_valid = Signal(num_tiles)
        self.in_data = Signal(data_width)
        self.in_data_valid = Signal()
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()

        self.out_stream = Signal(data_width)
        self.out_stream_valid = Signal(num_tiles)
        self.out_data = Signal(data_width)
        self.out_data_valid = Signal()

        self.ins_inter = Array([Signal(ins_width) for _ in range(num_tiles)])
        self.ins_valid_inter = Array([Signal() for _ in range(num_tiles)])
        self.intermediate_or = Array([Signal() for _ in range(num_tiles)])
        self.tile_out_data_valid = Array([Signal() for _ in range(num_tiles)])

        for i in range(num_tiles):
            tile = SwitchTile(tile_no=i, ins_width=ins_width)
            setattr(self.submodules, f"tile_{i}", tile)

            self.comb += [
                tile.clk.eq(self.clk),
                tile.in_stream.eq(self.in_stream[i*32:i*32+32]),
                tile.in_stream_valid.eq(self.in_stream_valid[i]),
                self.out_stream[i*32:i*32+32].eq(tile.out_stream),
                self.out_stream_valid[i].eq(tile.out_stream_valid),
                tile.in_data.eq(self.in_data[i*32:i*32+32]),
                tile.in_data_valid.eq(self.in_data_valid),
                self.out_data[i*32:i*32+32].eq(tile.out_data),
                self.tile_out_data_valid[i].eq(tile.out_data_valid),
                tile.in_ins.eq(self.in_ins if i == 0 else self.ins_inter[i-1]),
                tile.in_ins_valid.eq(self.in_ins_valid if i == 0 else self.ins_valid_inter[i-1]),
                self.ins_inter[i].eq(tile.out_ins),
                self.ins_valid_inter[i].eq(tile.out_ins_valid)
            ]

            if i == 0:
                self.comb += self.intermediate_or[i].eq(self.tile_out_data_valid[i])
            else:
                self.comb += self.intermediate_or[i].eq(self.intermediate_or[i-1] | self.tile_out_data_valid[i])

        self.comb += self.out_data_valid.eq(self.intermediate_or[-1])

class SwitchInsDec(Module):
    def __init__(self, id_no=2, ins_width=64):
        self.id_no = id_no
        self.ins_width = ins_width

        self.clk = ClockSignal()
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()

        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()
        self.out_slice_ins = Signal(ins_width)
        self.out_slice_ins_valid = Signal()

        self.comb += [
            self.out_slice_ins_valid.eq(self.in_ins_valid & (self.in_ins[0:8] == self.id_no)),
            self.out_slice_ins.eq(self.in_ins)
        ]

        self.sync += [
            If(self.out_slice_ins_valid,
                self.out_ins.eq(0),
                self.out_ins_valid.eq(0)
            ).Else(
                self.out_ins.eq(self.in_ins),
                self.out_ins_valid.eq(self.in_ins_valid)
            )
        ]

# dot product compute

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

class DotInsDec(Module):
    def __init__(self, id_no=6, ins_width=64):
        self.id_no = id_no
        self.ins_width = ins_width

        self.clk = ClockSignal()
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()

        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()
        self.out_slice_ins = Signal(ins_width)
        self.out_slice_ins_valid = Signal()

        self.comb += [
            self.out_slice_ins_valid.eq(self.in_ins_valid & (self.in_ins[0:8] == self.id_no)),
            self.out_slice_ins.eq(self.in_ins)
        ]

        self.sync += [
            If(self.out_slice_ins_valid,
                self.out_ins.eq(0),
                self.out_ins_valid.eq(0)
            ).Else(
                self.out_ins.eq(self.in_ins),
                self.out_ins_valid.eq(self.in_ins_valid)
            )
        ]

# vector compute

class VecUnit(Module):
    def __init__(self):
        self.clk = ClockSignal()
        self.state = Signal(2)
        self.in_stream_w = Signal(8)
        self.in_stream_valid_w = Signal()
        self.in_stream_e = Signal(8)
        self.in_stream_valid_e = Signal()
        self.in_weight = Signal(8)

        self.out_stream_e = Signal(8)
        self.out_stream_w = Signal(8)
        self.out_weight = Signal(8)

        self.const_b = Signal(8)
        self.sum = Signal(16)

        self.STATE_PASS = 0
        self.STATE_LOAD = 1
        self.STATE_ADD = 2
        self.STATE_REVERT = 3

        self.sync += [
            Case(self.state, {
                self.STATE_PASS: [
                    self.out_stream_w.eq(self.in_stream_w),
                    self.out_stream_e.eq(self.in_stream_e)
                ],
                self.STATE_LOAD: [
                    If(self.in_stream_valid_w,
                        self.const_b.eq(self.in_stream_w)
                    )
                ],
                self.STATE_ADD: [
                    If(self.in_stream_valid_e,
                        self.out_stream_e.eq(self.in_stream_e + self.const_b)
                    )
                ],
                self.STATE_REVERT: [
                    self.out_stream_e.eq(self.in_stream_w)
                ]
            })
        ]

class VecTile(Module):
    def __init__(self, tile_no=0, ins_width=64, lane_width=32):
        self.tile_no = tile_no
        self.ins_width = ins_width
        self.lane_width = lane_width

        self.clk = ClockSignal()
        self.in_stream_w = Signal(lane_width)
        self.in_stream_valid_w = Signal()
        self.in_stream_e = Signal(lane_width)
        self.in_stream_valid_e = Signal()
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()

        self.out_stream_e = Signal(lane_width)
        self.out_stream_valid_e = Signal()
        self.out_stream_w = Signal(lane_width)
        self.out_stream_valid_w = Signal()
        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()

        self.state = Signal(2, reset=0)  # STATE_PASS

        self.STATE_PASS = 0
        self.STATE_LOAD = 1
        self.STATE_ADD = 2
        self.STATE_REVERT = 3
        self.OP_PASS = 0
        self.OP_LOAD = 1
        self.OP_ADD = 2
        self.OP_REVERT = 3

        for i in range(4):
            unit = VecUnit()
            setattr(self.submodules, f"unit_{i}", unit)

            self.comb += [
                unit.clk.eq(self.clk),
                unit.state.eq(self.state),
                unit.in_stream_w.eq(self.in_stream_w[i*8:i*8+8]),
                unit.in_stream_valid_w.eq(self.in_stream_valid_w),
                self.out_stream_e[i*8:i*8+8].eq(unit.out_stream_e),
                unit.in_stream_e.eq(self.in_stream_e[i*8:i*8+8]),
                unit.in_stream_valid_e.eq(self.in_stream_valid_e),
                self.out_stream_w[i*8:i*8+8].eq(unit.out_stream_w)
            ]

        self.sync += [
            Case(self.state, {
                self.STATE_PASS: [
                    self.out_stream_valid_w.eq(self.in_stream_valid_w),
                    self.out_stream_valid_e.eq(self.in_stream_valid_e)
                ],
                self.STATE_LOAD: [
                    self.out_stream_valid_w.eq(0),
                    self.out_stream_valid_e.eq(self.in_stream_valid_e)
                ],
                self.STATE_ADD: [
                    self.out_stream_valid_w.eq(self.in_stream_valid_w),
                    self.out_stream_valid_e.eq(self.in_stream_valid_e)
                ],
                self.STATE_REVERT: [
                    self.out_stream_valid_w.eq(0),
                    self.out_stream_valid_e.eq(self.in_stream_valid_w)
                ]
            }),

            If(self.in_ins_valid & (self.in_ins[15:8] == self.tile_no),
                Case(self.in_ins[23:16], {
                    self.OP_PASS: self.state.eq(self.STATE_PASS),
                    self.OP_LOAD: self.state.eq(self.STATE_LOAD),
                    self.OP_ADD: self.state.eq(self.STATE_ADD),
                    self.OP_REVERT: self.state.eq(self.STATE_REVERT)
                }),
                self.out_ins_valid.eq(0)
            ).Else(
                self.out_ins.eq(self.in_ins),
                self.out_ins_valid.eq(self.in_ins_valid)
            )
        ]

class VecSlice(Module):
    def __init__(self, data_width=512, num_tiles=16, ins_width=64):
        self.data_width = data_width
        self.num_tiles = num_tiles
        self.ins_width = ins_width

        self.clk = ClockSignal()
        self.in_stream_w = Signal(data_width)
        self.in_stream_w_valid = Signal(num_tiles)
        self.in_stream_e = Signal(data_width)
        self.in_stream_e_valid = Signal(num_tiles)
        self.out_stream_e_valid = Signal(num_tiles)
        self.out_stream_w_valid = Signal(num_tiles)
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()

        self.out_stream_e = Signal(data_width)
        self.out_stream_w = Signal(data_width)

        self.ins_inter = Array([Signal(ins_width) for _ in range(num_tiles)])
        self.ins_valid_inter = Array([Signal() for _ in range(num_tiles)])

        for i in range(num_tiles):
            tile = VecTile(tile_no=i)
            setattr(self.submodules, f"tile_{i}", tile)

            self.comb += [
                tile.clk.eq(self.clk),
                tile.in_stream_w.eq(self.in_stream_w[i*32:i*32+32]),
                tile.in_stream_valid_w.eq(self.in_stream_w_valid[i]),
                self.out_stream_e[i*32:i*32+32].eq(tile.out_stream_e),
                tile.out_stream_valid_e.eq(self.out_stream_e_valid[i]),
                tile.in_stream_e.eq(self.in_stream_e[i*32:i*32+32]),
                tile.in_stream_valid_e.eq(self.in_stream_e_valid[i]),
                self.out_stream_w[i*32:i*32+32].eq(tile.out_stream_w),
                tile.out_stream_valid_w.eq(self.out_stream_w_valid[i]),
                tile.in_ins.eq(self.in_ins if i == 0 else self.ins_inter[i-1]),
                tile.in_ins_valid.eq(self.in_ins_valid if i == 0 else self.ins_valid_inter[i-1]),
                self.ins_inter[i].eq(tile.out_ins),
                self.ins_valid_inter[i].eq(tile.out_ins_valid)
            ]

class VecInsDec(Module):
    def __init__(self, id_no=5, ins_width=64):
        self.id_no = id_no
        self.ins_width = ins_width

        self.clk = ClockSignal()
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()

        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()
        self.out_slice_ins = Signal(ins_width)
        self.out_slice_ins_valid = Signal()

        self.comb += [
            self.out_slice_ins_valid.eq(self.in_ins_valid & (self.in_ins[0:8] == self.id_no)),
            self.out_slice_ins.eq(self.in_ins)
        ]

        self.sync += [
            If(self.out_slice_ins_valid,
                self.out_ins.eq(0),
                self.out_ins_valid.eq(0)
            ).Else(
                self.out_ins.eq(self.in_ins),
                self.out_ins_valid.eq(self.in_ins_valid)
            )
        ]

if __name__ == "__main__":
    #top = MemTile()
    #out = verilog.convert(top, ios={top.in_stream, top.in_stream_valid, top.out_stream, top.out_stream_valid, top.in_ins, top.in_ins_valid, top.out_ins, top.out_ins_valid})
    #top = MemSlice()
    #out = verilog.convert(top, ios={top.in_stream_w, top.in_stream_w_valid, top.out_stream_e, top.out_stream_e_valid, top.in_stream_e, top.in_stream_e_valid, top.out_stream_w, top.out_stream_w_valid, top.in_ins_w, top.in_ins_e, top.in_ins_valid_w, top.in_ins_valid_e})
    #top = MemInsDec()
    #out = verilog.convert(top, ios={top.in_ins, top.in_ins_valid, top.out_ins, top.out_ins_valid, top.out_slice_ins_e, top.out_slice_ins_valid_e})
    #top = SwitchTile()
    #out = verilog.convert(top, ios={top.in_stream, top.in_stream_valid, top.out_stream, top.out_stream_valid, top.in_data, top.in_data_valid, top.out_data, top.out_data_valid, top.in_ins, top.in_ins_valid, top.out_ins, top.out_ins_valid})
    #top = SwitchSlice()
    #out = verilog.convert(top, ios={top.in_stream, top.in_stream_valid, top.out_stream, top.out_stream_valid, top.in_data, top.in_data, top.out_data, top.out_data_valid, top.in_ins, top.in_ins_valid})
    #top = SwitchInsDec()
    #out = verilog.convert(top, ios={top.in_ins, top.in_ins_valid, top.out_ins, top.out_ins_valid, top.out_slice_ins, top.out_slice_ins_valid})
    #top = DotUnit()
    #out = verilog.convert(top, ios={top.in_stream_w, top.in_stream_w_valid, top.in_stream_e, top.in_stream_e_valid, top.in_weight, top.out_stream_e, top.out_stream_w, top.out_weight})
    #top = DotTile()
    #out = verilog.convert(top, ios={top.in_stream_w, top.in_stream_w_valid, top.in_stream_e, top.in_stream_e_valid, top.in_ins, top.in_ins_valid, top.out_stream_e, top.out_stream_e_valid, top.out_stream_w, top.out_stream_w_valid, top.out_ins, top.out_ins_valid})
    #top = DotSlice()
    #out = verilog.convert(top, ios={top.in_stream_w, top.in_stream_w_valid, top.out_stream_e, top.out_stream_e_valid, top.out_stream_w, top.out_stream_w_valid, top.in_stream_e, top.in_stream_e_valid, top.in_ins, top.in_ins_valid})
    #top = DotInsDec()
    #out = verilog.convert(top, ios={top.in_ins, top.in_ins_valid, top.out_ins, top.out_ins_valid, top.out_slice_ins, top.out_slice_ins_valid})
    #top = VecUnit()
    #out = verilog.convert(top, ios={top.in_stream_w, top.in_stream_valid_w, top.out_stream_e, top.in_stream_e, top.in_stream_valid_e, top.out_stream_w, top.in_weight, top.out_weight})
    #top = VecTile()
    #out = verilog.convert(top, ios={top.in_stream_w, top.in_stream_valid_w, top.out_stream_e, top.in_stream_e, top.in_stream_valid_e, top.out_stream_w, top.in_ins, top.in_ins_valid, top.out_ins, top.out_ins_valid})
    #top = VecSlice()
    #out = verilog.convert(top, ios={top.in_stream_w, top.in_stream_w_valid, top.out_stream_e, top.out_stream_e_valid, top.out_stream_w, top.out_stream_w_valid, top.in_stream_e, top.in_stream_e_valid, top.in_ins, top.in_ins_valid})
    top = VecInsDec()
    out = verilog.convert(top, ios={top.in_ins, top.in_ins_valid, top.out_ins, top.out_ins_valid, top.out_slice_ins, top.out_slice_ins_valid})

    with open("build/nf_tpu.v", "w") as f:
        f.write(out.main_source)

