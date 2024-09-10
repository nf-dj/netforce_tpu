from litex.build.lattice import LatticePlatform

_io = [
    ("clk25", 0, Pins("P6"), IOStandard("LVCMOS33")),
    ("user_led0", 0, Pins("P12"), IOStandard("LVCMOS33")),
    ("user_led1", 0, Pins("P13"), IOStandard("LVCMOS33")),
    ("user_led2", 0, Pins("P14"), IOStandard("LVCMOS33")),
    ("serial", 0,
        Subsignal("tx", Pins("M11")),
        Subsignal("rx", Pins("N11")),
        IOStandard("LVCMOS33")
    ),
    ("ddram", 0,
        Subsignal("a", Pins(
            "M1 L4 P3 N3 M3 P1 R5 R2",
            "R4 P4 K5 N4 K4 R3 T2"),
            IOStandard("SSTL135")),
        Subsignal("ba",    Pins("T3 T4 P5"), IOStandard("SSTL135")),
        Subsignal("ras_n", Pins("L2"), IOStandard("SSTL135")),
        Subsignal("cas_n", Pins("L1"), IOStandard("SSTL135")),
        Subsignal("we_n",  Pins("M2"), IOStandard("SSTL135")),
        Subsignal("cs_n",  Pins("L3"), IOStandard("SSTL135")),
        Subsignal("dm", Pins("H5 B1 K14 E14"), IOStandard("SSTL135")),
        Subsignal("dq", Pins(
            "F1 H4 G2 J4 J3 K3 H3 J5",
            "D3 C1 E3 C2 F4 C3 F3 B2",
            "F16 H14 G15 H13 J13 H12 J14 J12",
            "F14 C14 F13 C15 B16 B15 C16 D14"),
            IOStandard("SSTL135_T_DCI")),
        Subsignal("dqs_p", Pins("G1 D1 G16 D16"),
            IOStandard("DIFF_SSTL135")),
        Subsignal("dqs_n", Pins("H2 E2 H15 E15"),
            IOStandard("DIFF_SSTL135")),
        Subsignal("clk_p", Pins("N1"), IOStandard("DIFF_SSTL135")),
        Subsignal("clk_n", Pins("P2"), IOStandard("DIFF_SSTL135")),
        Subsignal("cke",   Pins("M6"), IOStandard("SSTL135")),
        Subsignal("odt",   Pins("L5"), IOStandard("SSTL135")),
        Subsignal("reset_n", Pins("M5"), IOStandard("SSTL135")),
        Misc("SLEW=FAST"),
    ),
]

class NF_ECP5(LatticePlatform):
    default_clk_name = "clk25"
    default_clk_period = 1e9 / 25e6

    def __init__(self):
        LatticePlatform.__init__(self, "LFE5U-25F-6BG256C", _io, toolchain="trellis")

