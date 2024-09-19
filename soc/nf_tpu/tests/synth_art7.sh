#!/bin/bash

# Create a temporary Yosys script with maximum optimizations
cat << EOF > temp_script.ys
# Read the Verilog file
read_verilog ../bitnet.v

# Initial synthesis
synth_xilinx -family xc7 -top bitnet_fma

# Perform aggressive optimizations
opt -full
opt_clean -purge
opt_expr -full
opt_merge
opt_muxtree
opt_reduce -full
#opt_rmdff
opt_clean
opt -fast

# Perform arithmetic optimization (uncomment if dealing with arithmetic circuits)
abc -g AND,OR,XOR

# Re-run synthesis to apply optimizations
synth -run coarse

# Map flip-flops to FPGA resources (update the library path as needed)
# dfflibmap -liberty /path/to/your/cell/library.lib

# Perform technology mapping (update the library path as needed)
# abc -liberty /path/to/your/cell/library.lib

# Final cleanup
clean

# Generate statistics
stat

# Generate the dot file for the diagram
show -format dot -prefix bitnet_fma_optimized
EOF

# Run Yosys and capture the output
yosys -s temp_script.ys

# Convert dot file to PDF
dot -Tpdf bitnet_fma_optimized.dot -o bitnet_fma_optimized.pdf

# Clean up
rm temp_script.ys
