#!/usr/bin/env python3
from migen import *
from litex.build.generic_platform import *
from litex.build.sim import SimPlatform
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.soc.cores import uart
from litedram.modules import MT41K128M16
from litedram.phy.model import SDRAMPHYModel

class DRAMSimPlatform(SimPlatform):
    def __init__(self):
        _io = [
            ("sys_clk", 0, Pins(1)),
            ("sys_rst", 0, Pins(1)),
            ("serial", 0,
                Subsignal("tx", Pins(1)),
                Subsignal("rx", Pins(1)),
            ),
            ("ddram", 0,
                Subsignal("a", Pins(14)),
                Subsignal("ba", Pins(3)),
                Subsignal("ras_n", Pins(1)),
                Subsignal("cas_n", Pins(1)),
                Subsignal("we_n", Pins(1)),
                Subsignal("cs_n", Pins(1)),
                Subsignal("dm", Pins(2)),
                Subsignal("dq", Pins(16)),
                Subsignal("dqs_p", Pins(2)),
                Subsignal("dqs_n", Pins(2)),
                Subsignal("clk_p", Pins(1)),
                Subsignal("clk_n", Pins(1)),
                Subsignal("cke", Pins(1)),
                Subsignal("odt", Pins(1)),
                Subsignal("reset_n", Pins(1))
            ),
        ]
        SimPlatform.__init__(self, "SIM", _io)

    def create_programmer(self):
        return GenericProgrammer()

class DRAMTestSoC(SoCCore):
    def __init__(self, platform, **kwargs):
        sys_clk_freq = int(100e6)
        
        SoCCore.__init__(self, platform, sys_clk_freq,
            ident="DRAM Test SoC",
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
            l2_cache_size=32*1024)


if __name__ == "__main__":
    platform = DRAMSimPlatform()
    soc = DRAMTestSoC(platform,
                      cpu_type=None,
                      with_uart=False,
                      with_timer=False)
    builder = Builder(soc, output_dir="build")
    builder.build(run=False)
