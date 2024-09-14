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
        self.clk = ClockSignal()
        
        self.in_stream = Signal(32)
        self.in_stream_valid = Signal()
        self.out_stream = Signal(32)
        self.out_stream_valid = Signal()
        
        self.in_data = Signal(32)
        self.in_data_valid = Signal()
        self.out_data = Signal(32)
        self.out_data_valid = Signal()
        
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()
        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()

        self.ins_tile_no = Signal(8)
        self.ins_state = Signal(8)

        self.comb += [
            self.ins_tile_no.eq(self.in_ins[15:8]),
            self.ins_state.eq(self.in_ins[23:16])
        ]

        self.submodules.fsm = fsm = FSM(reset_state="PASS")
        fsm.act("PASS",
            NextValue(self.out_stream, self.in_stream),
            NextValue(self.out_stream_valid, self.in_stream_valid),
            If(self.in_ins_valid & (self.ins_tile_no == tile_no),
                Case(self.ins_state, {
                    0: NextState("PASS"),
                    1: NextState("DRAM_IN"),
                    2: NextState("DRAM_OUT")
                })
            )
        )
        fsm.act("DRAM_IN",
            NextValue(self.out_stream, self.in_data),
            NextValue(self.out_stream_valid, self.in_data_valid),
            If(self.in_ins_valid & (self.ins_tile_no == tile_no),
                Case(self.ins_state, {
                    0: NextState("PASS"),
                    1: NextState("DRAM_IN"),
                    2: NextState("DRAM_OUT")
                })
            )
        )
        fsm.act("DRAM_OUT",
            NextValue(self.out_data, self.in_stream),
            NextValue(self.out_data_valid, self.in_stream_valid),
            NextValue(self.out_stream, 0),
            NextValue(self.out_stream_valid, 0),
            If(self.in_ins_valid & (self.ins_tile_no == tile_no),
                Case(self.ins_state, {
                    0: NextState("PASS"),
                    1: NextState("DRAM_IN"),
                    2: NextState("DRAM_OUT")
                })
            )
        )

        self.sync += [
            If(self.in_ins_valid & (self.ins_tile_no == tile_no),
                NextValue(self.out_ins, 0),
                NextValue(self.out_ins_valid, 0)
            ).Else(
                NextValue(self.out_ins, self.in_ins),
                NextValue(self.out_ins_valid, self.in_ins_valid)
            )
        ]

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
    def __init__(self,fsm):
        self.clk = ClockSignal()
		self.fsm = fsm

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

        self.fsm.act("PASS",
            If(self.in_stream_w_valid,
                self.out_stream_w.eq(self.in_stream_w)
            ),
            If(self.in_stream_e_valid,
                self.out_stream_e.eq(self.in_stream_e)
            ),
        )
        self.fsm.act("LOAD_WEIGHT",
            If(self.in_stream_w_valid,
                NextValue(self.weight, self.in_stream_w),
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
        self.clk = ClockSignal()
        
        self.in_stream__w = Signal(lane_width)
        self.in_stream_w_valid = Signal()
        self.out_stream_e = Signal(lane_width)
        self.out_stream_e_valid = Signal()
        self.out_stream_w = Signal(lane_width)
        self.out_stream_w_valid = Signal()
        self.in_stream_e = Signal(lane_width)
        self.in_stream_e_valid = Signal()
        
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()
        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()

        self.state = Signal(2)
        self.weight_inter = Array([Signal(8) for _ in range(4)])

        self.submodules.fsm = FSM(reset_state="PASS")

        self.submodules.dots = [DotUnit(fsm = self.fsm) for _ in range(4)]
        for i, dot in enumerate(self.dots):
            self.comb += [
                dot.in_stream_w.eq(self.in_stream_w[i*8:i*8+8]),
                dot.in_stream_w_valid.eq(self.in_stream_w_valid),
                dot.out_stream_e=self.out_stream_e[i*8:i*8+8],
                dot.out_stream_w=self.out_stream_w[i*8:i*8+8],
                dot.in_stream_e.eq(self.in_stream_e[i*8:i*8+8]),
                dot.in_stream_e_valid.eq(self.in_stream_e_valid),
                dot.in_weight.eq(self.weight_inter[i-1] if i > 0 else 0),  # FIXME: Handle in_weight for i==0
				dot.out_weight.eq(self.weight_inter[i]),
            ]

		def update_state():
            return If(self.in_ins_valid & (self.in_ins[15:8] == tile_no),
                Case(self.in_ins[23:16], {
                    self.OP_PASS: NextState("PASS"),
                    self.OP_LOAD_WEIGHT: NextState("LOAD_WEIGHT"),
                    self.OP_MUL: NextState("MUL"),
                    self.OP_READ_SUM: NextState("READ_SUM")
                }),
                NextValue(self.out_ins_valid, 0)
            ).Else(
                NextValue(self.out_ins, self.in_ins),
                NextValue(self.out_ins_valid, self.in_ins_valid)
            )

        self.fsm.act("PASS",
            NextValue(self.out_stream_w_valid, self.in_stream_w_valid),
            NextValue(self.out_stream_e_valid, self.in_stream_e_valid),
			update_state()
        )
        self.fsm.act("LOAD_WEIGHT",
            If(self.in_stream_w_valid,
                NextState("PASS")
            ),
            NextValue(self.out_stream_e_valid, self.in_stream_e_valid),
			update_state()
        )
        self.fsm.act("MUL",
            NextValue(self.out_stream_w_valid, self.in_stream_w_valid),
            NextValue(self.out_stream_e_valid, self.in_stream_e_valid),
			update_state()
        )
        self.fsm.act("READ_SUM",
            NextValue(self.out_stream_w_valid, self.in_stream_w_valid),
            NextValue(self.out_stream_e_valid, 1),
            NextState("PASS"),
			update_state()
        )

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
    def __init__(self fsm):
        self.clk = ClockSignal()
		self.fsm = fsm
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

        self.submodules.fsm = FSM(reset_state="PASS")
        self.fsm.act("PASS",
            NextValue(self.out_stream_w, self.in_stream_w),
            NextValue(self.out_stream_e, self.in_stream_e),
        )
        self.fsm.act("LOAD",
            If(self.in_stream_valid_w,
                NextValue(self.const_b, self.in_stream_w)
            ),
        )
        self.fsm.act("ADD",
            If(self.in_stream_valid_e,
                NextValue(self.out_stream_e, self.in_stream_e + self.const_b)
            ),
        )
        self.fsm.act("REVERT",
            NextValue(self.out_stream_e, self.in_stream_w),
        )

class VecTile(Module):
    def __init__(self, tile_no=0, ins_width=64, lane_width=32):
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

        self.OP_PASS = 0
        self.OP_LOAD = 1
        self.OP_ADD = 2
        self.OP_REVERT = 3

        self.submodules.fsm = FSM(reset_state="PASS")

        self.vec_units = [VecUnit(fsm=fsm) for _ in range(4)]
        for i, unit in enumerate(self.vec_units):
            self.submodules += unit
            self.comb += [
                unit.in_stream_w.eq(self.in_stream_w[i*8:i*8+8]),
                unit.in_stream_valid_w.eq(self.in_stream_valid_w),
                unit.in_stream_e.eq(self.in_stream_e[i*8:i*8+8]),
                unit.in_stream_valid_e.eq(self.in_stream_valid_e),
                self.out_stream_e[i*8:i*8+8].eq(unit.out_stream_e),
                self.out_stream_w[i*8:i*8+8].eq(unit.out_stream_w)
            ]

        def update_state():
            If(self.in_ins_valid & (self.in_ins[15:8] == tile_no),
                Case(self.in_ins[23:16], {
                    self.OP_PASS: NextState("PASS"),
                    self.OP_LOAD: NextState("LOAD"),
                    self.OP_ADD: NextState("ADD"),
                    self.OP_REVERT: NextState("REVERT"),
                }),
                NextValue(self.out_ins_valid, 0)
            ).Else(
                NextValue(self.out_ins, self.in_ins),
                NextValue(self.out_ins_valid, self.in_ins_valid)
            )

        self.fsm.act("PASS",
            NextValue(self.out_stream_valid_w, self.in_stream_valid_w),
            NextValue(self.out_stream_valid_e, self.in_stream_valid_e),
            update_state(),
        )
        self.fsm.act("LOAD",
            NextValue(self.out_stream_valid_w, 0),
            NextValue(self.out_stream_valid_e, self.in_stream_valid_e),
            update_state(),
        )
        self.fsm.act("ADD",
            NextValue(self.out_stream_valid_w, self.in_stream_valid_w),
            NextValue(self.out_stream_valid_e, self.in_stream_valid_e),
            update_state(),
        )
        self.fsm.act("REVERT",
            NextValue(self.out_stream_valid_w, 0),
            NextValue(self.out_stream_valid_e, self.in_stream_valid_w),
            update_state(),
        )

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

# stream 

class Conv64To512(Module):
    def __init__(self):
        self.clk = ClockSignal()
        
        self.in_data = Signal(64)
        self.in_data_valid = Signal()
        
        self.out_data = Signal(512)
        self.out_data_valid = Signal()

        self.buffer = Array([Signal(64) for _ in range(8)])
        self.count = Signal(3)

        self.sync += [
            If(self.in_data_valid,
                self.buffer[self.count].eq(self.in_data),
                If(self.count == 7,
                    self.out_data.eq(Cat(self.buffer[0], self.buffer[1], self.buffer[2], self.buffer[3],
                                         self.buffer[4], self.buffer[5], self.buffer[6], self.buffer[7])),
                    self.out_data_valid.eq(1),
                    self.count.eq(0)
                ).Else(
                    self.count.eq(self.count + 1),
                    self.out_data_valid.eq(0)
                )
            ).Else(
                self.out_data_valid.eq(0)
            )
        ]

class Fifo512To64(Module):
    def __init__(self, fifo_depth=64):
        self.input_width = 512
        self.output_width = 64
        self.ptr_bits = log2_int(fifo_depth)

        self.clk = ClockSignal()
        self.in_data = Signal(self.input_width)
        self.wr_en = Signal()
        self.rd_en = Signal()

        self.out_data = Signal(self.output_width)
        self.out_data_valid = Signal()
        self.fifo_full = Signal()
        self.fifo_empty = Signal()

        self.fifo_mem = Memory(self.input_width, fifo_depth)
        self.specials += self.fifo_mem
        self.wr_port = self.fifo_mem.get_port(write_capable=True)
        self.rd_port = self.fifo_mem.get_port(async_read=True)
        self.specials += self.wr_port, self.rd_port

        self.wr_ptr = Signal(self.ptr_bits)
        self.rd_ptr = Signal(self.ptr_bits)
        self.rd_shift = Signal(3)
        self.fifo_length = Signal(self.ptr_bits + 1)

        self.comb += [
            self.fifo_empty.eq((self.wr_ptr == self.rd_ptr) & (self.rd_shift == 0)),
            self.fifo_full.eq((self.wr_ptr + 1) == self.rd_ptr),
            self.fifo_length.eq(Mux(self.wr_ptr >= self.rd_ptr,
                                    self.wr_ptr - self.rd_ptr,
                                    fifo_depth + self.wr_ptr - self.rd_ptr))
        ]

        self.sync += [
            If(self.wr_en & ~self.fifo_full,
               self.wr_port.adr.eq(self.wr_ptr),
               self.wr_port.dat_w.eq(self.in_data),
               self.wr_port.we.eq(1),
               self.wr_ptr.eq(self.wr_ptr + 1)
            ).Else(
                self.wr_port.we.eq(0)
            )
        ]

        self.sync += [
            If(self.rd_en & ~self.fifo_empty,
               self.rd_port.adr.eq(self.rd_ptr),
               self.out_data.eq(self.rd_port.dat_r[self.rd_shift * self.output_width:
                                                   (self.rd_shift + 1) * self.output_width]),
               self.rd_shift.eq(self.rd_shift + 1),
               self.out_data_valid.eq(1),
               If(self.rd_shift == (self.input_width // self.output_width - 1),
                  self.rd_shift.eq(0),
                  self.rd_ptr.eq(self.rd_ptr + 1)
               )
            ).Else(
                self.out_data_valid.eq(0)
            )
        ]

class StreamIO(Module):
    def __init__(self, sink, source, id_no=0, data_width=512, ins_width=64, input_width=64):
        self.sink = sink
        self.source = source

        self.in_sw_data = Signal(data_width)
        self.in_sw_data_valid = Signal()
        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()
        self.out_sw_data = Signal(data_width)
        self.out_sw_data_valid = Signal()

        self.rx_state = Signal(2)
        self.rx_len = Signal(16)
        self.tx_state = Signal(2)
        self.tx_len = Signal(16)
        self.rx_conv_in_data = Signal(input_width)
        self.rx_conv_in_data_valid = Signal()

        self.RX_STATE_INS = 0
        self.RX_STATE_DATA = 1
        self.RX_STATE_NOP = 2
        self.TX_STATE_PASS = 0
        self.TX_STATE_DATA = 1
        self.OP_READ_DATA = 1
        self.OP_WRITE_DATA = 2
        self.OP_NOP = 3

        self.submodules.rx_conv = Conv64To512()
        self.submodules.tx_fifo = Fifo512To64()

        self.comb += [
            self.sink.ready.eq((self.rx_state == self.RX_STATE_INS) | (self.rx_state == self.RX_STATE_DATA)),
            self.tx_fifo.clk.eq(ClockSignal()),
            self.tx_fifo.in_data.eq(self.in_sw_data),
            self.tx_fifo.wr_en.eq(self.in_sw_data_valid),
            self.source.data.eq(self.tx_fifo.out_data),
            self.source.valid.eq(self.tx_fifo.out_data_valid),
            self.tx_fifo.rd_en.eq(self.source.ready),
            self.rx_conv.clk.eq(ClockSignal()),
            self.rx_conv.in_data.eq(self.rx_conv_in_data),
            self.rx_conv.in_data_valid.eq(self.rx_conv_in_data_valid),
            self.out_sw_data.eq(self.rx_conv.out_data),
            self.out_sw_data_valid.eq(self.rx_conv.out_data_valid)
        ]

        self.submodules.fsm = FSM(reset_state="RX_INS")
        self.fsm.act("RX_INS",
            NextValue(self.rx_conv_in_data_valid, 0),
            If(self.sink.valid,
                If(self.sink.data[0:8] == 0,
                    Case(self.sink.data[8:16], {
                        self.OP_READ_DATA: [
                            NextState("RX_DATA"),
                            NextValue(self.rx_len, self.sink.data[16:32])
                        ],
                        self.OP_WRITE_DATA: [
                            NextValue(self.tx_state, self.TX_STATE_DATA),
                            NextValue(self.tx_len, self.sink.data[16:32])
                        ],
                        self.OP_NOP: [
                            NextState("RX_NOP"),
                            NextValue(self.rx_len, self.sink.data[16:32])
                        ]
                    }),
                    NextValue(self.out_ins, 0),
                    NextValue(self.out_ins_valid, 0)
                ).Else(
                    NextValue(self.out_ins, self.sink.data),
                    NextValue(self.out_ins_valid, 1)
                ),
                self.sink.ready.eq(1)
            ).Else(
                NextValue(self.out_ins, 0),
                NextValue(self.out_ins_valid, 0)
            )
        )
        self.fsm.act("RX_DATA",
            If(self.sink.valid,
                NextValue(self.rx_conv_in_data, self.sink.data),
                NextValue(self.rx_conv_in_data_valid, 1),
                If(self.rx_len == 0,
                    NextState("RX_INS")
                ).Else(
                    NextValue(self.rx_len, self.rx_len - 1)
                ),
                self.sink.ready.eq(1)
            ).Else(
                NextValue(self.rx_conv_in_data_valid, 0)
            )
        )
        self.fsm.act("RX_NOP",
            If(self.rx_len == 0,
                NextState("RX_INS")
            ).Else(
                NextValue(self.rx_len, self.rx_len - 1)
            )
        )

        self.sync += [
            If(self.tx_state == self.TX_STATE_DATA,
                If(self.source.valid & self.source.ready,
                    If(self.tx_len == 0,
                        NextValue(self.tx_state, self.TX_STATE_PASS),
                        NextValue(self.source.last, 1)
                    ).Else(
                        NextValue(self.tx_len, self.tx_len - 1),
                        NextValue(self.source.last, 0)
                    )
                )
            )
        ]

# external memory

class InsFifo(Module):
    def __init__(self, ins_width=64, depth=128):
        self.ins_width = ins_width
        self.depth = depth
        self.log_depth = log2_int(depth)

        self.clk = ClockSignal()
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()
        self.out_ins_ready = Signal()

        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()

        self.fifo = Memory(ins_width, depth)
        self.specials += self.fifo
        self.write_port = self.fifo.get_port(write_capable=True)
        self.read_port = self.fifo.get_port(async_read=True)
        self.specials += self.write_port, self.read_port

        self.write_ptr = Signal(self.log_depth)
        self.read_ptr = Signal(self.log_depth)
        self.fifo_full = Signal()
        self.fifo_empty = Signal()
        self.fifo_length = Signal(self.log_depth + 1)

        self.comb += [
            self.fifo_full.eq((self.write_ptr + 1) == self.read_ptr),
            self.fifo_empty.eq(self.write_ptr == self.read_ptr),
            self.fifo_length.eq(Mux(self.write_ptr >= self.read_ptr,
                                    self.write_ptr - self.read_ptr,
                                    self.depth + self.write_ptr - self.read_ptr))
        ]

        self.sync += [
            If(~self.fifo_full & self.in_ins_valid,
               self.write_port.adr.eq(self.write_ptr),
               self.write_port.dat_w.eq(self.in_ins),
               self.write_port.we.eq(1),
               self.write_ptr.eq(self.write_ptr + 1)
            ).Else(
                self.write_port.we.eq(0)
            )
        ]

        self.sync += [
            If(self.out_ins_ready,
               If(~self.fifo_empty,
                  self.read_port.adr.eq(self.read_ptr),
                  self.out_ins.eq(self.read_port.dat_r),
                  self.read_ptr.eq(self.read_ptr + 1),
                  self.out_ins_valid.eq(1)
               ).Else(
                  self.out_ins_valid.eq(0),
                  self.out_ins.eq(0)
               )
            )
        ]

class DramIO(Module):
    def __init__(self, wb, id_no=1, data_width=512, ins_width=64):
        self.wb = wb

        self.clk = ClockSignal()
        self.in_ins = Signal(ins_width)
        self.in_ins_valid = Signal()
        self.out_ins = Signal(ins_width)
        self.out_ins_valid = Signal()
        self.out_sw_data = Signal(data_width)
        self.out_sw_data_valid = Signal()
        self.in_sw_data = Signal(data_width)
        self.in_sw_data_valid = Signal()

        self.burst_counter = Signal(8)

        self.STATE_IDLE = 0
        self.STATE_READ = 1
        self.STATE_WRITE = 2
        self.OP_NOP = 0
        self.OP_READ = 1
        self.OP_WRITE = 2

        self.submodules.fifo = InsFifo(ins_width, 16)

        self.submodules.fsm = FSM(reset_state="IDLE")
        self.fsm.act("IDLE",
            NextValue(self.out_ins_valid, 0),
            NextValue(self.out_sw_data_valid, 0),
            If(self.fifo.readable & (self.fifo.dout[0:8] == id_no),
                Case(self.fifo.dout[8:16], {
                    self.OP_NOP: NextState("IDLE"),
                    self.OP_READ: [
                        NextState("READ"),
                        NextValue(self.wb.adr, self.fifo.dout[16:48]),
                        NextValue(self.burst_counter, self.fifo.dout[48:56]),
                        NextValue(self.wb.cyc, 1),
                        NextValue(self.wb.stb, 1),
                        NextValue(self.wb.we, 0)
                    ],
                    self.OP_WRITE: [
                        NextState("WRITE"),
                        NextValue(self.wb.adr, self.fifo.dout[16:48]),
                        NextValue(self.burst_counter, self.fifo.dout[48:56]),
                        NextValue(self.wb.cyc, 1),
                        NextValue(self.wb.stb, 1),
                        NextValue(self.wb.we, 1)
                    ]
                }),
                self.fifo.re.eq(1)
            )
        )
        self.fsm.act("READ",
            If(self.wb.ack,
                NextValue(self.out_sw_data, self.wb.dat_r),
                NextValue(self.out_sw_data_valid, 1),
                If(self.burst_counter == 0,
                    NextState("IDLE"),
                    NextValue(self.wb.cyc, 0),
                    NextValue(self.wb.stb, 0)
                ).Else(
                    NextValue(self.burst_counter, self.burst_counter - 1),
                    NextValue(self.wb.adr, self.wb.adr + (data_width // 8))
                )
            )
        )
        self.fsm.act("WRITE",
            If(self.in_sw_data_valid,
                NextValue(self.wb.dat_w, self.in_sw_data),
                If(self.wb.ack,
                    If(self.burst_counter == 0,
                        NextState("IDLE"),
                        NextValue(self.wb.cyc, 0),
                        NextValue(self.wb.stb, 0)
                    ).Else(
                        NextValue(self.burst_counter, self.burst_counter - 1),
                        NextValue(self.wb.adr, self.wb.adr + (data_width // 8))
                    )
                )
            )
        )

        self.comb += [
            self.fifo.din.eq(self.in_ins),
            self.fifo.we.eq(self.in_ins_valid),
            If(~self.fifo.readable | (self.fifo.dout[0:8] != id_no),
                self.out_ins.eq(self.fifo.dout),
                self.out_ins_valid.eq(self.fifo.readable),
                self.fifo.re.eq(self.out_ins_valid)
            )
        ]

# top

class NF_TPU(Module):
    def __init__(self, stream_width = 64, ins_width = 64, data_width = 512, addr_width = 32, num_tiles = 16):
        self.input_width = input_width
        self.ins_width = ins_width
        self.data_width = data_width
        self.num_tiles = num_tiles

        self.clk = ClockSignal()
        self.reset = Signal()
        self.sink = stream.Endpoint([("data", stream_width)]) 
        self.source = stream.Endpoint([("data", stream_width)])
        self.wb = wishbone.Interface()

        self.input_sw_out_data = Signal(data_width)
        self.input_sw_out_data_valid = Signal()
        self.ins_inter = Array([Signal(ins_width) for _ in range(8)])
        self.ins_valid_inter = Array([Signal() for _ in range(8)])
        self.sw_data_in = Signal(data_width)
        self.sw_data_in_valid = Signal()
        self.sw_out_data = Signal(data_width)
        self.sw_out_data_valid = Signal()
        self.slice_ins = Array([Signal(ins_width) for _ in range(8)])
        self.slice_ins_valid = Array([Signal() for _ in range(8)])
        self.stream_inter_w = Array([Signal(data_width) for _ in range(6)])
        self.stream_inter_e = Array([Signal(data_width) for _ in range(6)])
        self.stream_valid_inter_w = Array([Signal(num_tiles) for _ in range(6)])
        self.stream_valid_inter_e = Array([Signal(num_tiles) for _ in range(6)])

        self.comb += [
            self.sw_in_data_valid.eq(self.dram_sw_out_data_valid|self.stream_sw_out_data_valid),
            self.sw_in_data.eq(If(self.dram_sw_out_data_valid,self.dram_sw_out_data).Else(stream_sw_out_data)),
        ]

        self.submodules.stream_io = StreamIO(id_no=0, sink=self.sink, source=self.source data_width=data_width, ins_width=ins_width, input_width=input_width)
        self.comb += [
            self.stream_io.out_ins.eq(self.ins_inter[0]),
            self.stream_io.out_ins_valid.eq(self.ins_valid_inter[0]),
            self.stream_io.out_sw_data.eq(self.stream_out_sw_data),
            self.stream_io.out_sw_data_valid.eq(self.stream_out_sw_data_valid),
            self.stream_io.in_sw_data.eq(self.sw_out_data),
            self.stream_io.in_sw_data_valid.eq(self.sw_out_data_valid)
        ]

        self.submodules.dram_io = DramIO(wb, id_no=1, data_width=data_width, addr_width=addr_width, ins_width=ins_width)
        self.comb += [
            self.dram_io.in_ins.eq(self.ins_inter[0]),
            self.dram_io.in_ins_valid.eq(self.ins_valid_inter[0]),
            self.dram_io.in_sw_data.eq(self.sw_out_data),
            self.dram_io.in_sw_data_valid.eq(self.sw_out_data_valid),
            self.dram_io.out_ins.eq(self.ins_inter[1]),
            self.dram_io.out_ins_valid.eq(self.ins_valid_inter[1]),
            self.dram_io.out_sw_data.eq(self.dram_out_sw_data),
            self.dram_io.out_sw_data_valid.eq(self.dram_out_sw_data_valid),
        ]

        self.submodules.sw_id1 = SwitchInsDec(id_no=2)
        self.comb += [
            self.sw_id1.in_ins.eq(self.ins_inter[1]),
            self.sw_id1.in_ins_valid.eq(self.ins_valid_inter[1]),
            self.sw_id1.out_ins.eq(self.ins_inter[2]),
            self.sw_id1.out_ins_valid.eq(self.ins_valid_inter[2]),
            self.sw_id1.out_slice_ins.eq(self.slice_ins[0]),
            self.sw_id1.out_slice_ins_valid.eq(self.slice_ins_valid[0]),
        ]

        self.submodules.sw_slice1 = SwitchSlice()
        self.comb += [
            self.sw_slice1.in_stream.eq(self.stream_inter_e[0]),
            self.sw_slice1.in_stream_valid.eq(self.stream_valid_inter_e[0]),
            self.sw_slice1.out_stream.eq(self.stream_inter_w[0]),
            self.sw_slice1.out_stream_valid.eq(self.stream_valid_inter_w[0]),
            self.sw_slice1.in_data.eq(self.sw_in_data),
            self.sw_slice1.in_data_valid.eq(self.sw_in_data_valid),
            self.sw_slice1.out_data.eq(self.sw_out_data),
            self.sw_slice1.out_data_valid.eq(self.sw_out_data_valid),
            self.sw_slice1.in_ins.eq(self.slice_ins[0]),
            self.sw_slice1.in_ins_valid.eq(self.slice_ins_valid[0]),
        ]

        self.submodules.mem_id1 = MemInsDec(id_no_w=3, id_no_e=4)
        self.comb += [
            self.mem_id1.in_ins.eq(self.ins_inter[2]),
            self.mem_id1.in_ins_valid.eq(self.ins_valid_inter[2]),
            self.mem_id1.out_ins.eq(self.ins_inter[3]),
            self.mem_id1.out_ins_valid.eq(self.ins_valid_inter[3]),
            self.mem_id1.out_slice_ins_w.eq(self.slice_ins[1]),
            self.mem_id1.out_slice_ins_valid_w.eq(self.slice_ins_valid[1]),
            self.mem_id1.out_slice_ins_e.eq(self.slice_ins[2]),
            self.mem_id1.out_slice_ins_valid_e.eq(self.slice_ins_valid[2]),
        ]

        self.submodules.mem_slice1 = MemSlice()
        self.comb += [
            self.mem_slice1.in_stream_w.eq(self.stream_inter_w[0]),
            self.mem_slice1.in_stream_w_valid.eq(self.stream_valid_inter_w[0]),
            self.mem_slice1.out_stream_e.eq(self.stream_inter_e[0]),
            self.mem_slice1.out_stream_e_valid.eq(self.stream_valid_inter_e[0]),
            self.mem_slice1.out_stream_w.eq(self.stream_inter_w[1]),
            self.mem_slice1.out_stream_w_valid.eq(self.stream_valid_inter_w[1]),
            self.mem_slice1.in_stream_e.eq(self.stream_inter_e[1]),
            self.mem_slice1.in_stream_e_valid.eq(self.stream_valid_inter_e[1]),
            self.mem_slice1.in_ins_w.eq(self.slice_ins[1]),
            self.mem_slice1.in_ins_valid_w.eq(self.slice_ins_valid[1]),
            self.mem_slice1.in_ins_e.eq(self.slice_ins[2]),
            self.mem_slice1.in_ins_valid_e.eq(self.slice_ins_valid[2]),
        ]

        self.submodules.mem_id2 = MemInsDec(id_no_w=5, id_no_e=6)
        self.comb += [
            self.mem_id2.in_ins.eq(self.ins_inter[3]),
            self.mem_id2.in_ins_valid.eq(self.ins_valid_inter[3]),
            self.mem_id2.out_ins.eq(self.ins_inter[4]),
            self.mem_id2.out_ins_valid.eq(self.ins_valid_inter[4]),
            self.mem_id2.out_slice_ins_w.eq(self.slice_ins[3]),
            self.mem_id2.out_slice_ins_valid_w.eq(self.slice_ins_valid[3]),
            self.mem_id2.out_slice_ins_e.eq(self.slice_ins[4]),
            self.mem_id2.out_slice_ins_valid_e.eq(self.slice_ins_valid[4])
        ]

        self.submodules.mem_slice2 = MemSlice()
        self.comb += [
            self.mem_slice2.in_stream_w.eq(self.stream_inter_w[1]),
            self.mem_slice2.in_stream_w_valid.eq(self.stream_valid_inter_w[1]),
            self.mem_slice2.out_stream_e.eq(self.stream_inter_e[1]),
            self.mem_slice2.out_stream_e_valid.eq(self.stream_valid_inter_e[1]),
            self.mem_slice2.out_stream_w.eq(self.stream_inter_w[2]),
            self.mem_slice2.out_stream_w_valid.eq(self.stream_valid_inter_w[2]),
            self.mem_slice2.in_stream_e.eq(self.stream_inter_e[2]),
            self.mem_slice2.in_stream_e_valid.eq(self.stream_valid_inter_e[2]),
            self.mem_slice2.in_ins_w.eq(self.slice_ins[3]),
            self.mem_slice2.in_ins_valid_w.eq(self.slice_ins_valid[3]),
            self.mem_slice2.in_ins_e.eq(self.slice_ins[4]),
            self.mem_slice2.in_ins_valid_e.eq(self.slice_ins_valid[4])
        ]

        self.submodules.vec_id1 = VecInsDec(id_no=7)
        self.comb += [
            self.vec_id1.in_ins.eq(self.ins_inter[4]),
            self.vec_id1.in_ins_valid.eq(self.ins_valid_inter[4]),
            self.vec_id1.out_ins.eq(self.ins_inter[5]),
            self.vec_id1.out_ins_valid.eq(self.ins_valid_inter[5]),
            self.vec_id1.out_slice_ins.eq(self.slice_ins[5]),
            self.vec_id1.out_slice_ins_valid.eq(self.slice_ins_valid[5])
        ]

        self.submodules.vec_slice1 = VecSlice()
        self.comb += [
            self.vec_slice1.in_stream_w.eq(self.stream_inter_w[2]),
            self.vec_slice1.in_stream_w_valid.eq(self.stream_valid_inter_w[2]),
            self.vec_slice1.out_stream_e.eq(self.stream_inter_e[2]),
            self.vec_slice1.out_stream_e_valid.eq(self.stream_valid_inter_e[2]),
            self.vec_slice1.out_stream_w.eq(self.stream_inter_w[3]),
            self.vec_slice1.out_stream_w_valid.eq(self.stream_valid_inter_w[3]),
            self.vec_slice1.in_stream_e.eq(self.stream_inter_e[3]),
            self.vec_slice1.in_stream_e_valid.eq(self.stream_valid_inter_e[3]),
            self.vec_slice1.in_ins.eq(self.slice_ins[5]),
            self.vec_slice1.in_ins_valid.eq(self.slice_ins_valid[5]),
        ]

        self.submodules.dot_id1 = DotInsDec(id_no=8)
        self.comb += [
            self.dot_id1.in_ins.eq(self.ins_inter[5]),
            self.dot_id1.in_ins_valid.eq(self.ins_valid_inter[5]),
            self.dot_id1.out_ins.eq(self.ins_inter[6]),
            self.dot_id1.out_ins_valid.eq(self.ins_valid_inter[6]),
            self.dot_id1.out_slice_ins.eq(self.slice_ins[6]),
            self.dot_id1.out_slice_ins_valid.eq(self.slice_ins_valid[6])
        ]

        self.submodules.dot_slice1 = DotSlice()
        self.comb += [
            self.dot_slice1.in_stream_w.eq(self.stream_inter_w[3]),
            self.dot_slice1.in_stream_w_valid.eq(self.stream_valid_inter_w[3]),
            self.dot_slice1.out_stream_e.eq(self.stream_inter_e[3]),
            self.dot_slice1.out_stream_e_valid.eq(self.stream_valid_inter_e[3]),
            self.dot_slice1.out_stream_w.eq(self.stream_inter_w[4]),
            self.dot_slice1.out_stream_w_valid.eq(self.stream_valid_inter_w[4]),
            self.dot_slice1.in_stream_e.eq(self.stream_inter_e[4]),
            self.dot_slice1.in_stream_e_valid.eq(self.stream_valid_inter_e[4]),
            self.dot_slice1.in_ins.eq(self.slice_ins[6]),
            self.dot_slice1.in_ins_valid.eq(self.slice_ins_valid[6]),
        ]

        self.submodules.dot_id2 = DotInsDec(id_no=9)
        self.comb += [
            self.dot_id2.in_ins.eq(self.ins_inter[6]),
            self.dot_id2.in_ins_valid.eq(self.ins_valid_inter[6]),
            self.dot_id2.out_ins.eq(self.ins_inter[7]),
            self.dot_id2.out_ins_valid.eq(self.ins_valid_inter[7]),
            self.dot_id2.out_slice_ins.eq(self.slice_ins[7]),
            self.dot_id2.out_slice_ins_valid.eq(self.slice_ins_valid[7])
        ]

        self.submodules.dot_slice2 = DotSlice()
        self.comb += [
            self.dot_slice2.in_stream_w.eq(self.stream_inter_w[4]),
            self.dot_slice2.in_stream_w_valid.eq(self.stream_valid_inter_w[4]),
            self.dot_slice2.out_stream_e.eq(self.stream_inter_e[4]),
            self.dot_slice2.out_stream_e_valid.eq(self.stream_valid_inter_e[4]),
            self.dot_slice2.in_stream_e.eq(self.stream_inter_e[5]),
            self.dot_slice2.in_stream_e_valid.eq(self.stream_valid_inter_e[5]),
            self.dot_slice2.in_ins.eq(self.slice_ins[7]),
            self.dot_slice2.in_ins_valid.eq(self.slice_ins_valid[7]),
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

