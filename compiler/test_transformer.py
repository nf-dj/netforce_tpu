#!/usr/bin/env python
from nf_compiler import *

start_script()

dram_ins_addr=64
dram_load_ins(dram_ins_addr,14)
dram_ins_addr+=14*64

# X to mem
mem_addr=0
#for tile_no in range(64):
for tile_no in range(4):
    mem_write(4,tile_no,"w",mem_addr,12)
for tile_no in range(4):
    mem_pass(3,tile_no,"w")
for tile_no in range(4):
    sw_data_in(tile_no)

dram_data_addr=0x10000
dram_load_data(dram_data_addr,12)
dram_data_addr+=12*64

dram_load_ins(dram_ins_addr,14)
dram_ins_addr+=14*64

# X to dot
for tile_no in range(4):
    dot_load_weight(tile_no)
mem_addr=0
for tile_no in range(4):
    mem_read(4,tile_no,"w",mem_addr,1)
for tile_no in range(4):
    dot_mul(tile_no)

# W to dot
dram_load_data(dram_data_addr,4)
dram_data_addr+=12*64

dram_load_ins(dram_ins_addr,20)
dram_ins_addr+=20*64

# sum to mem
mem_addr=0
for tile_no in range(4):
    mem_write(3,tile_no,"e",mem_addr,1)
for tile_no in range(4):
    vec_add(tile_no)
for tile_no in range(4):
    dot_read_sum(tile_no)

for tile_no in range(4):
    sw_data_out(tile_no)
for tile_no in range(4):
    mem_read(3,tile_no,"e",mem_addr,1)

write_dram("dram_data.bin")
write_pcie("pcie_stream.bin")
