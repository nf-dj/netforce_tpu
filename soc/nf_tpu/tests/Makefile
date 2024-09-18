TOPLEVEL_LANG ?= verilog
SIM ?= icarus

#MODULE := test_fp8_adder
#TOPLEVEL := fp8_e4m3_adder
MODULE := test_fp8_multiplier
TOPLEVEL := fp8_e4m3_multiplier

VERILOG_SOURCES := $(PWD)/../fp8_e4m3.v

include $(shell cocotb-config --makefiles)/Makefile.sim
