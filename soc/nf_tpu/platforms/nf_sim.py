from migen import *
from litex.build.generic_platform import *
from litex.build.sim import SimPlatform

class NF_SimPlatform(SimPlatform):
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
