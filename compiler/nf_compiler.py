import struct

active_queue=None

ins_queue=[]
queue_names={}

OP_NOP=0

OP_PCIE_LOAD_DATA=1
OP_PCIE_WRITE_DATA=2
OP_PCIE_NOP=3

OP_DRAM_READ_INS=1
OP_DRAM_READ_DATA=2
OP_DRAM_WRITE_DATA=3

OP_SW_PASS=0
OP_SW_DATA_IN=1
OP_SW_DATA_OUT=2

OP_MEM_PASS=0
OP_MEM_READ=1
OP_MEM_WRITE=2

OP_DOT_PASS=0
OP_DOT_LOAD_WEIGHT=1
OP_DOT_MUL=2
OP_DOT_READ_SUM=3

OP_VEC_PASS=0
OP_VEC_LOAD=1
OP_VEC_ADD=2
OP_VEC_REVERT=3

ID_PCIE=0
ID_DRAM=1
ID_SW=2
ID_MEM1_W=3
ID_MEM1_E=4
ID_MEM2_W=5
ID_MEM2_E=6
ID_VEC=7
ID_DOT1=8
ID_DOT2=9

def start_script():
    ins_queue.clear()

def write_dram(path):
    print("write_dram",path)
    ins_data=b""
    for op in ins_queue:
        op+=b"\0"*(64-len(op))
        op=op[::-1]
        ins_data+=op
    f=open(path,"wb")
    f.write(ins_data)
    f.close()

def write_pcie(path):
    print("write_pcie",path)
    ins_data=b""
    for op in ins_queue:
        op+=b"\0"*(8-len(op))
        op=op[::-1]
        ins_data+=op
    f=open(path,"wb")
    f.write(ins_data)
    f.close()

def add_op(op):
    ins_queue.append(op)

def dram_load_ins(addr,length):
    op=struct.pack("<BBIH",ID_DRAM,OP_DRAM_READ_INS,addr,length-1)
    add_op(op)

def dram_load_data(addr,length):
    op=struct.pack("<BBIH",ID_DRAM,OP_DRAM_READ_DATA,addr,length-1)
    add_op(op)

def dram_write_data(addr,length):
    op=struct.pack("<BBIH",ID_DRAM,OP_DRAM_WRITE_DATA,addr,length-1)
    add_op(op)

def pcie_load_data(data):
    length=len(data)//8
    op=struct.pack("<BBH",ID_PCIE,OP_PCIE_LOAD_DATA,length-1)
    add_op(op)
    for i in range(0,len(data),8):
        op=data[i:i+8]
        op+=b"\0"*(8-len(op))
        add_op(op)

def pcie_write_data(length):
    op=struct.pack("<BBH",ID_PCIE,OP_PCIE_WRITE_DATA,length-1)
    add_op(op)

def pcie_nop(length):
    op=struct.pack("<BBH",ID_PCIE,OP_PCIE_NOP,length)
    add_op(op)

def nop(num_cycles):
    fmt="BH"
    op=struct.pack(fmt,OP_NOP,num_cycles)
    add_op(op)

def send_sync():
    fmt="B"
    op=struct.pack(fmt,OP_SEND_SYNC)
    add_op(op)

def wait_sync():
    fmt="B"
    op=struct.pack(fmt,OP_WAIT_SYNC)
    add_op(op)

def mem_pass(id_no, tile_no):
    fmt="BBB"
    op=struct.pack(fmt,id_no,tile_no,OP_MEM_PASS)
    add_op(op)

def mem_write(id_no, tile_no, addr, length):
    if length<1:
        raise Exception("Invalid length")
    fmt="<BBBHH"
    op=struct.pack(fmt,id_no,tile_no,OP_MEM_WRITE,addr,length-1)
    add_op(op)

def mem_read(id_no, tile_no, addr, length):
    fmt="<BBBHH"
    if length<1:
        raise Exception("Invalid length")
    op=struct.pack(fmt,id_no,tile_no,OP_MEM_READ,addr,length-1)
    add_op(op)

def sw_pass(tile_no):
    fmt="BBB"
    op=struct.pack(fmt,ID_SW,tile_no,OP_SW_PASS)
    add_op(op)

def sw_data_in(tile_no):
    fmt="BBB"
    op=struct.pack(fmt,ID_SW,tile_no,OP_SW_DATA_IN)
    add_op(op)

def sw_data_out(tile_no):
    fmt="BBB"
    op=struct.pack(fmt,ID_SW,tile_no,OP_SW_DATA_OUT)
    add_op(op)

def dot_pass(tile_no):
    fmt="BBB"
    op=struct.pack(fmt,ID_DOT,tile_no,OP_DOT_PASS)
    add_op(op)

def dot_load_weight(id_no,tile_no):
    fmt="BBB"
    op=struct.pack(fmt,id_no,tile_no,OP_DOT_LOAD_WEIGHT)
    add_op(op)

def dot_mul(id_no,tile_no):
    fmt="BBB"
    op=struct.pack(fmt,id_no,tile_no,OP_DOT_MUL)
    add_op(op)

def dot_read_sum(id_no,tile_no):
    fmt="BBB"
    op=struct.pack(fmt,id_no,tile_no,OP_DOT_READ_SUM)
    add_op(op)

def vec_pass(tile_no):
    fmt="BBB"
    op=struct.pack(fmt,ID_VEC,tile_no,OP_VEC_PASS)
    add_op(op)

def vec_load(tile_no):
    fmt="BBB"
    op=struct.pack(fmt,ID_VEC,tile_no,OP_VEC_LOAD)
    add_op(op)

def vec_add(tile_no):
    fmt="BBB"
    op=struct.pack(fmt,ID_VEC,tile_no,OP_VEC_ADD)
    add_op(op)

def vec_revert(tile_no):
    fmt="BBB"
    op=struct.pack(fmt,ID_VEC,tile_no,OP_VEC_REVERT)
    add_op(op)
