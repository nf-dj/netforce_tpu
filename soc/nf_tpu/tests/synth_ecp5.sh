#!/bin/bash

# Create a temporary Yosys script
cat << EOF > temp_script.ys
#read_verilog ../fp8_e4m3.v
#synth_ecp5 -top fp8_e4m3_pipelined_adder
#read_verilog ../fp4_e3m0.v
#synth_ecp5 -top fp4_e3m0_adder
read_verilog ../bitnet.v
synth_ecp5 -top bitnet_fma
stat
show -format dot -prefix bitnet_fma_ecp5
EOF

# Run Yosys and capture the output
yosys -s temp_script.ys

rm temp_script.ys

dot -Tpdf bitnet_fma_ecp5.dot -o bitnet_fma_ecp5.pdf
