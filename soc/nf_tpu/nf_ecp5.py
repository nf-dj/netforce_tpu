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

class NF_ECP5(LatticePlatform):
    default_clk_name = "clk25"
    default_clk_period = 1e9 / 25e6

    def __init__(self):
        LatticePlatform.__init__(self, "LFE5U-25F-6BG256C", _io, toolchain="trellis")

