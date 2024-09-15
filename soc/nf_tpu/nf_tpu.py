from migen import *
from litex.soc.interconnect.csr import *

class NF_TPU(Module):
    def __init__(self):
        self.clk = ClockSignal()
        self.reset = ResetSignal()
        self.sink = stream.Endpoint([("data", stream_width)]) 
        self.source = stream.Endpoint([("data", stream_width)])
        self.wb = wishbone.Interface()

    def elaborate(self, platform):
        m = Module()
        m.submodules.nf_tpu = Instance("nf_tpu",
            i_clk = self.clk,
            i_rst = self.reset,
            i_sink_data = self.sink.data,
            i_sink_valid = self.sink.valid,
            o_source_data = self.source.data,
            o_source_valid = self.source.valid,
            o_dram_adr = self.wb.adr,
            o_dram_dat_w = self.wb.dat_w,
            i_dram_dat_r = self.wb.dat_r,
            o_dram_we = self.wb.we,
            o_dram_sel = self.wb.sel,
            o_dram_stb = self.wb.stb,
            o_dram_cyc = self.wb.cyc,
            i_dram_ack = self.wb.ack,
        )
        return m
