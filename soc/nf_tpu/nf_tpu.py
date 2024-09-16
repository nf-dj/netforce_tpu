from migen import *
from migen.fhdl import verilog
from litex.soc.interconnect.stream import Endpoint
from litex.soc.interconnect import wishbone
import os

class NF_TPU(Module):
    def __init__(self, platform, data_width=512, stream_width=64, addr_width=32, ins_width=64, num_tiles=16):
        self.sink = sink = Endpoint([("data", stream_width)])
        self.source = source = Endpoint([("data", stream_width)])
        self.bus = bus = wishbone.Interface(data_width=data_width, adr_width=addr_width)

        self.specials += Instance("nf_tpu",
            p_DATA_WIDTH=data_width,
            p_STREAM_WIDTH=stream_width,
            p_ADDR_WIDTH=addr_width,
            p_INS_WIDTH=ins_width,
            p_NUM_TILES=num_tiles,
            
            i_clk=ClockSignal(),
            i_reset=ResetSignal(),
            
            i_sink_data=sink.data,
            i_sink_valid=sink.valid,
            i_sink_last=sink.last,
            o_sink_ready=sink.ready,
            
            o_source_data=source.data,
            o_source_valid=source.valid,
            o_source_last=source.last,
            i_source_ready=source.ready,
            
            o_dram_addr=bus.adr,
            o_dram_dat_w=bus.dat_w,
            i_dram_dat_r=bus.dat_r,
            o_dram_we=bus.we,
            o_dram_sel=bus.sel,
            o_dram_stb=bus.stb,
            o_dram_cyc=bus.cyc,
            i_dram_ack=bus.ack
        )

        platform.add_sources(os.path.abspath(os.path.dirname(__file__)), "nf_tpu.v")

if __name__ == "__main__":
    platform = NF_ECP5()
    top = NF_TPU(platform)
    out = verilog.convert(top, ios={top.sink.data, top.source.data, top.bus.adr})

    with open("build/nf_tpu.v", "w") as f:
        f.write(out.main_source)

