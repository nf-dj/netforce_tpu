#!/usr/bin/env python3
from migen import *
from litex.build.generic_platform import *
from litex.build.sim import SimPlatform
from litex.soc.integration.soc_core import *
from litex.soc.integration.soc import *
from litex.soc.integration.builder import *
from litex.soc.cores import uart
from litedram.modules import MT41K128M16
from litedram.phy.model import SDRAMPHYModel
from nf_tpu import NF_TPU
from platforms.nf_sim import NF_SimPlatform
from platforms.nf_ecp5 import NF_ECP5
from platforms.nf_art7 import NF_Art7

class NF_SoC(SoCCore):
    def __init__(self, platform, **kwargs):
        sys_clk_freq = int(100e6)
        
        SoCCore.__init__(self, platform, sys_clk_freq,
            ident="NF_SoC",
            ident_version=True,
            **kwargs)

        self.clock_domains.cd_sys = ClockDomain()
        self.comb += self.cd_sys.clk.eq(platform.request("sys_clk"))
        self.comb += self.cd_sys.rst.eq(platform.request("sys_rst"))

        self.submodules.uart_phy = uart.UARTPHY(
            pads=platform.request("serial"),
            clk_freq=sys_clk_freq,
            baudrate=115200)
        self.submodules.uart = ResetInserter()(uart.UART(self.uart_phy))

        sdram_module = MT41K128M16(sys_clk_freq, "1:4")
        self.submodules.ddrphy = SDRAMPHYModel(
            module=sdram_module,
            data_width=32,
        )
        self.add_sdram("sdram",
            phy=self.ddrphy,
            module=sdram_module,
            origin=0x40000000,
            size=0x10000000,
            l2_cache_size=0)

        self.submodules.nf_tpu = NF_TPU(platform)
        self.bus.add_master("nf_tpu", master=self.nf_tpu.bus)

if __name__ == "__main__":
    platform = NF_SimPlatform()
    soc = NF_SoC(platform,
                      cpu_type=None,
                      with_uart=False,
                      with_timer=False)
    builder = Builder(soc, output_dir="build")
    builder.build(run=False)
