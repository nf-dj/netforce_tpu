#!/usr/bin/env python3
from litex.soc.integration.soc_core import SoCCore
from litex.soc.integration.builder import Builder
from litex_boards.platforms import arty
from litedram.common import LiteDRAMNativePort
from litedram.frontend.wishbone import LiteDRAMWishbone2Native
from litex.build.lattice import LatticePlatform
from nf_tpu import NF_Tpu

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

        self.tpu = NF_Tpu(data_width=32)

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

_io = [
    ("clk25", 0, Pins("P6"), IOStandard("LVCMOS33")),
    ("user_led", 0, Pins("R6"), IOStandard("LVCMOS33")),
    ("serial", 0,
        Subsignal("tx", Pins("M11")),
        Subsignal("rx", Pins("N11")),
        IOStandard("LVCMOS33")
    )
]

class NF_Platform(LatticePlatform):
    default_clk_name = "clk25"
    default_clk_period = 1e9 / 25e6

    def __init__(self):
        LatticePlatform.__init__(self, "LFE5U-25F-6BG256C", _io, toolchain="trellis")

platform = NF_Platform()

soc = NF_SoC(platform)

builder = Builder(soc, output_dir="build", csr_csv="csr.csv")
builder.build()
