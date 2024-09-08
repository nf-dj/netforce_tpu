#!/usr/bin/env python3
from litex.soc.integration.soc_core import SoCCore
from litex.soc.integration.builder import Builder
from litex_boards.platforms import arty
from litedram.common import LiteDRAMNativePort
from litedram.frontend.wishbone import LiteDRAMWishbone2Native
from nf_tpu import NF_TPU
from nf_ecp5 import NF_ECP5

class NF_SoC(SoCCore):
    def __init__(self, platform, **kwargs):
        sys_clk_freq = int(100e6)
        SoCCore.__init__(self, platform, clk_freq=sys_clk_freq, **kwargs)

        self.uart = self.add_uart()

        self.add_sdram("sdram",
            phy=self.sdram_phy,
            module=self.sdram_module,
            origin=self.mem_map["main_ram"],
            size=kwargs.get("max_sdram_size", 0x20000000)  # 512MB
        )

        self.tpu = NF_TPU(data_width=32)

        self.comb += [
            self.uart.sink.valid.eq(self.tpu.sink.valid),
            self.tpu.sink.data.eq(self.uart.sink.data),
            self.uart.sink.ready.eq(self.tpu.sink.ready),

            self.uart.source.data.eq(self.tpu.source.data),
            self.uart.source.valid.eq(self.tpu.source.valid),
            self.tpu.ready.eq(self.uart.source.ready)
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
