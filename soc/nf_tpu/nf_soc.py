#!/usr/bin/env python3
from litex.soc.integration.soc_core import SoCMini
from litex.soc.integration.builder import Builder
from litex_boards.platforms import arty
from litedram.common import LiteDRAMNativePort
from litedram.frontend.wishbone import LiteDRAMWishbone2Native
from litedram.modules import MT41K128M16
from nf_tpu import NF_TPU
from nf_ecp5 import NF_ECP5


class _CRG(LiteXModule):
    def __init__(self, platform, sys_clk_freq):
        self.cd_sys = ClockDomain()

        clk25 = platform.request("clk25")
        #rst_n = platform.request("user_btn_n", 0)

        self.pll = pll = ECP5PLL()
        #self.comb += pll.reset.eq(~rst_n)
        pll.register_clkin(clk25, 25e6)
        pll.create_clkout(self.cd_sys, sys_clk_freq)

class NF_SoC(SoCMini):
    def __init__(self, platform, **kwargs):
        sys_clk_freq = int(100e6)

        self.crg = _CRG(platform, sys_clk_freq)

        SoCCore.__init__(self, platform, clk_freq=sys_clk_freq, **kwargs)

        self.uart = self.add_uart()

		self.ddrphy = ECP5DDRPHY( platform.request("ddram"), sys_clk_freq=sys_clk_freq)
		#self.comb += self.crg.stop.eq(self.ddrphy.init.stop)
		#self.comb += self.crg.reset.eq(self.ddrphy.init.reset)
        self.sdram_module = MT41K128M16(sys_clk_freq, "1:2")

        self.add_sdram("sdram",
            phy=self.ddrphy,
            module=self.sdram_module,
			l2_cache_size=0,
        )

        self.tpu = NF_TPU(data_width=32)
        self.comb += [
                self.tpu.source.data.eq(self.uart.source.data),
                self.tpu.source.valid.eq(self.uart.source.valid),
                self.tpu.source.ready.eq(self.uart.source.ready),
                self.tpu.sink.valid.eq(self.uart.sink.valid),
                self.tpu.sink.data.eq(self.uart.sink.data),
                self.tpu.sink.ready.eq(self.uart.sink.ready),
        ]

        wb_sdram_port = self.sdram.crossbar.get_port()
        self.submodules.wb2native = LiteDRAMWishbone2Native(wb_sdram_port)
        self.add_wb_slave(self.mem_map["main_ram"], self.wb2native.wishbone)
        self.add_memory_region("main_ram", self.mem_map["main_ram"], wb_sdram_port.size)
        
        self.bus.add_master(name="tpu", master=self.tpu.wb)

platform = NF_ECP5()

soc = NF_SoC(platform)

builder = Builder(soc, output_dir="build", csr_csv="csr.csv")
builder.build()
