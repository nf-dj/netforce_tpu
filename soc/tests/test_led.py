#!/usr/bin/env python3
import os
import argparse
import sys
from migen import *
from litex.gen import *
from litex.soc.cores.clock import *
from litex.soc.cores.gpio import GPIOOut
from litex.soc.integration.soc_core import *
from litex.soc.integration.builder import *
from litex.build.generic_platform import *
from litex.build.lattice import LatticePlatform

_io = [
    ("clk25", 0, Pins("P6"), IOStandard("LVCMOS33")),
    ("user_led", 0, Pins("R6"), IOStandard("LVCMOS33")),
    ("serial", 0,
        Subsignal("tx", Pins("M11")),
        Subsignal("rx", Pins("N11")),
        IOStandard("LVCMOS33")
    )
]

class TestPlatform(LatticePlatform):
    default_clk_name = "clk25"
    default_clk_period = 1e9 / 25e6

    def __init__(self):
        LatticePlatform.__init__(self, "LFE5U-25F-6BG256C", _io, toolchain="trellis")

class _CRG(LiteXModule):
    def __init__(self, platform, sys_clk_freq):
        self.cd_sys = ClockDomain()

        clk25 = platform.request("clk25")

        self.pll = pll = ECP5PLL()
        pll.register_clkin(clk25, 25e6)
        pll.create_clkout(self.cd_sys, sys_clk_freq)

class TestSoc(SoCMini):
    def __init__(self, sys_clk_freq=int(40e6)):
        platform = TestPlatform()
        
        platform.add_extension(_io)

        self.crg = _CRG(platform, sys_clk_freq)

        SoCMini.__init__(self, platform, clk_freq=sys_clk_freq, with_uart=True)

        user_led = platform.request("user_led")
        self.led = GPIOOut(user_led)

        self.comb += [
            If(self.uart.source == ord('a'),
                user_led.eq(1)
            )
        ]

def main():
    soc = TestSoc()
    builder = Builder(soc, output_dir="build")
    builder.build(build_name="test_led", run=True)

if __name__ == "__main__":
    main()
