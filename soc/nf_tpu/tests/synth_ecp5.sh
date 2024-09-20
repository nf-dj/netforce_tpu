#!/bin/bash

#module=fp4_fma
#module=dot_tile
#module=dot_slice
#module=dot_block
#module=vec_tile
#module=vec_slice
#module=sw_tile
#module=sw_slice
#module=mem_tile
module=mem_slice

# Create a temporary Yosys script
cat << EOF > temp_script.ys
read_verilog ../nf_tpu.v
synth_ecp5 -top $module
stat
show -format dot -prefix ${module}_ecp5
EOF

# Run Yosys and capture the output
yosys -s temp_script.ys

rm temp_script.ys

#dot -Tpdf ${module}_ecp5.dot -o ${module}_ecp5.pdf
