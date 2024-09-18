#!/bin/bash

# Create a temporary Yosys script
cat << EOF > temp_script.ys
#read_verilog ../fp8_e4m3.v
#synth_ecp5 -top fp8_e4m3_pipelined_adder
read_verilog ../fp4_e3m0.v
synth_ecp5 -top fp4_e3m0_adder
stat
EOF

# Run Yosys and capture the output
yosys -s temp_script.ys

rm temp_script.ys
