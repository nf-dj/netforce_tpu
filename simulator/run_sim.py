import cocotb
from cocotb.triggers import RisingEdge,FallingEdge
from cocotb.binary import BinaryValue
from cocotb.triggers import Timer
from cocotb.utils import get_sim_time

pcie_data=""
pcie_pos=0

def load_pcie():
    global pcie_data
    pcie_path = "pcie_stream.bin"
    pcie_data=open(pcie_path, "rb").read()

def sim_pcie(dut):
    global pcie_pos
    if pcie_pos+8>len(pcie_data):
        dut.pcie0_rx_tvalid.value = 0
        dut.pcie0_rx_tdata.value = 0
        return
    if dut.pcie0_rx_tready.value:
        data=pcie_data[pcie_pos:pcie_pos+8]
        pcie_pos+=8
        data_s = ''.join(format(byte, '08b') for byte in data)
        dut.pcie0_rx_tdata.value = BinaryValue(value=data_s, n_bits=64)
        print(">>> pcie stream data=%s"%(data,))
        dut.pcie0_rx_tvalid.value = 1
    dut.pcie0_tx_tready.value = 1

DRAM_SIZE=1024*1024
dram_data=bytearray(b"\0"*DRAM_SIZE)

def load_dram():
    return # XXX
    dram_path = "instructions.bin"
    data=open(dram_path, "rb").read()
    dram_data[:len(data)]=data

dram_state="idle"
dram_addr=0
dram_burst_len=0

def sim_dram(dut):
    global dram_state, dram_addr, dram_burst_len
    print("dram_state=%s dram_addr=0x%x dram_burst_len=%d dram_arvalid=%s dram_arready=%s dram_rvalid=%s dram_rready=%s"%(dram_state,dram_addr,dram_burst_len, dut.dram_arvalid.value, dut.dram_arready.value, dut.dram_rvalid.value, dut.dram_rready.value))
    print("dram_if_state=%s dram_if_burst_counter=%s dram_if_test=%s"%(dut.dram_if1.state.value.get_value(), dut.dram_if1.burst_counter.value.get_value(), dut.dram_if1.test.value))
    #if dut.dram_if1.ins_in_valid.value:
    #    print(">>> DRAM_INS_IN: dram_if_ins_in=%s dram_if_ins_in_valid=%s"%(dut.dram_if1.ins_in.value,dut.dram_if1.ins_in_valid.value))
    #if dut.dram_if1.ins_out_valid.value:
    #    print("<<< DRAM_INS_OUT: dram_if_ins_out=%s dram_if_ins_out_valid=%s dram_if_ins_out_valid_dram=%s"%(dut.dram_if1.ins_out.value,dut.dram_if1.ins_out_valid.value,dut.dram_if1.ins_out_valid_dram.value))

    if dram_state=="idle":
        dut.dram_rvalid.value = 0
        dut.dram_arready.value = 1
        if dut.dram_arvalid.value:
            print(">>> dram read request")
            dram_addr=dut.dram_araddr.value.get_value()
            print("dram_addr=%d"%dram_addr)
            if dram_addr+64>DRAM_SIZE:
                raise Exception("DRAM address out of bounds: %d"%dram_addr)
            dram_burst_len=dut.dram_arlen.value.get_value()
            print("dram_burst_len=%d"%dram_burst_len)
            dram_state="read"
    elif dram_state=="read":
        print(">>> dram read")
        dut.dram_arready.value = 0
        data=dram_data[dram_addr:dram_addr+64]
        data_s = ''.join(format(byte, '08b') for byte in data)
        dut.dram_rdata.value = BinaryValue(value=data_s, n_bits=512)
        print("dram read addr=%s burst_len=%s data=%s"%(dram_addr,dram_burst_len,data))
        dut.dram_rvalid.value = 1
        if dram_burst_len>0:
            dram_addr+=64
            dram_burst_len-=1
        else:
            dram_state="idle"

async def clock_gen(signal, period=10):
    while True:
        signal.value = 0
        await Timer(period // 2, units='ns')
        signal.value = 1
        await Timer(period // 2, units='ns')

def write_states(dut,states_file):
    t=get_sim_time(units='ns')
    print("-- t=%s ---"%t)
    line="%s"%t
    try:
        test1="%s"%dut.mem_slice2.tiles[0].tile_w.stream_out_valid.value
    except Exception as e:
        test1="ERR: %s"%e
    try:
        test2="%s"%dut.vec_slice1.tiles[0].tile.stream_in_valid_w.value
    except:
        test2="ERR"
    try:
        test3="%s"%dut.mem_slice2.tiles[0].tile_w.state.value
    except Exception as e:
        test3="ERR: %s"%e
    try:
        test4="%s"%dut.pcie0_if.rx_tdata.value
    except Exception as e:
        test4="ERR: %s"%e
    line+=", %s, %s, %s, %s"%(test1,test2,test3,test4)

    try:
        state="0x%04x"%dut.pcie0_if.rx_state.value.get_value()
    except Exception as e:
        state="ERR: %s"%e
    line+=", %s"%state
    try:
        val="0x%04x"%dut.pcie0_if.rx_len.value.get_value()
    except Exception as e:
        val="ERR: %s"%e
    line+=", %s"%val
    try:
        val="0x%04x"%dut.pcie0_if.rx_tvalid.value.get_value()
    except Exception as e:
        val="ERR: %s"%e
    line+=", %s"%val

    try:
        state="0x%04x"%dut.pcie0_if.tx_state.value.get_value()
    except Exception as e:
        state="ERR: %s"%e
    line+=", %s"%state
    try:
        val="0x%04x"%dut.pcie0_if.tx_len.value.get_value()
    except Exception as e:
        val="ERR: %s"%e
    line+=", %s"%val
    try:
        val="0x%04x"%dut.pcie0_if.tx_fifo.fifo_length.value.get_value()
    except Exception as e:
        val="ERR: %s"%e
    line+=", %s"%val
    try:
        val="0x%04x"%dut.pcie0_if.tx_fifo.rd_shift.value.get_value()
    except Exception as e:
        val="ERR: %s"%e
    line+=", %s"%val
    try:
        val="0x%04x"%dut.pcie0_if.tx_tready.value.get_value()
    except Exception as e:
        val="ERR: %s"%e
    line+=", %s"%val

    try:
        state="0x%04x"%dut.dram_if1.state.value.get_value()
    except:
        state="ERR"
    line+=", %s"%state
    try:
        val="0x%04x"%dut.dram_if1.burst_counter.value.get_value()
    except:
        val="ERR"
    line+=", %s"%val
    try:
        val="0x%04x"%dut.dram_if1.axi_rvalid.value
    except:
        val="ERR"
    line+=", %s"%val
    try:
        val="0x%04x"%dut.dram_if1.fifo.fifo_length.value.get_value()
    except:
        val="ERR"
    line+=", %s"%val
    try:
        val="0x%04x"%dut.dram_if1.ins_in_valid.value.get_value()
    except:
        val="ERR"
    line+=", %s"%val

    try:
        ins_in="0x%04x"%dut.sw_id1.ins_in_valid.value.get_value()
    except Exception as e:
        ins_in="ERR: %s"%e
    line+=", %s"%ins_in
    try:
        val="0x%04x"%dut.sw_id1.fifo.fifo_length.value.get_value()
    except:
        val="ERR"
    line+=", %s"%val

    try:
        ins_in="0x%04x"%dut.mem_id1.ins_in_valid.value.get_value()
    except:
        ins_in="ERR"
    line+=", %s"%ins_in
    try:
        val="0x%04x"%dut.mem_id1.fifo_w.fifo_length.value.get_value()
    except:
        val="ERR"
    line+=", %s"%val
    try:
        val="0x%04x"%dut.mem_id1.fifo_e.fifo_length.value.get_value()
    except:
        val="ERR"
    line+=", %s"%val

    try:
        ins_in="0x%04x"%dut.mem_id2.ins_in_valid.value.get_value()
    except:
        ins_in="ERR"
    line+=", %s"%ins_in
    try:
        val="0x%04x"%dut.mem_id2.fifo_w.fifo_length.value.get_value()
    except:
        val="ERR"
    line+=", %s"%val
    try:
        val="0x%04x"%dut.mem_id2.fifo_e.fifo_length.value.get_value()
    except:
        val="ERR"
    line+=", %s"%val

    try:
        ins_in="0x%04x"%dut.vec_id1.ins_in_valid.value.get_value()
    except:
        ins_in="ERR"
    line+=", %s"%ins_in
    try:
        val="0x%04x"%dut.vec_id1.fifo.fifo_length.value.get_value()
    except:
        val="ERR"
    line+=", %s"%val

    try:
        ins_in="0x%04x"%dut.dot_id1.ins_in_valid.value.get_value()
    except:
        ins_in="ERR"
    line+=", %s"%ins_in
    try:
        val="0x%04x"%dut.dot_id1.fifo.fifo_length.value.get_value()
    except:
        val="ERR"
    line+=", %s"%val

    try:
        ins_in="0x%04x"%dut.dot_id2.ins_in_valid.value.get_value()
    except:
        ins_in="ERR"
    line+=", %s"%ins_in
    try:
        val="0x%04x"%dut.dot_id2.fifo.fifo_length.value.get_value()
    except:
        val="ERR"
    line+=", %s"%val

    try:
        val="0x%04x"%dut.sw_slice1.data_in_valid.value.get_value()
    except Exception as e:
        val="ERR: %s"%e
    line+=", %s"%val
    try:
        val="0x%04x"%dut.sw_slice1.data_out_valid.value.get_value()
    except Exception as e:
        val="ERR: %s"%e
    line+=", %s"%val

    for i in range(len((dut.sw_slice1.tiles))):
        tile=dut.sw_slice1.tiles[i]
        try:
            state="0x%02x"%tile.tile.state.value.get_value()
        except Exception as e:
            state="ERR: %s"%e
        try:
            ins_in="0x%04x"%tile.tile.ins_in_valid.value.get_value()
        except:
            ins_in="ERR"
        try:
            data_in="0x%04x"%tile.tile.stream_in_valid.value.get_value()
        except Exception as e:
            data_in="ERR: %s"%e
        line+=", %s, %s, %s"%(state,ins_in,data_in)

        tile=dut.mem_slice1.tiles[i]
        try:
            state="0x%02x"%tile.tile_w.state.value.get_value()
        except:
            state="ERR"
        try:
            ins_in="0x%04x"%tile.tile_w.ins_in_valid.value.get_value()
        except:
            ins_in="ERR"
        try:
            data_in="0x%04x"%tile.tile_w.stream_in_valid.value.get_value()
        except Exception as e:
            data_in="ERR: %s"%e
        try:
            data_len="0x%04x"%tile.tile_w.len.value.get_value()
        except:
            data_len="ERR"
        line+=", %s, %s, %s, %s"%(state,ins_in,data_in,data_len)

        try:
            state="0x%02x"%tile.tile_e.state.value.get_value()
        except:
            state="ERR"
        try:
            ins_in="0x%04x"%tile.tile_e.ins_in_valid.value.get_value()
        except:
            ins_in="ERR"
        try:
            data_in="0x%04x"%tile.tile_e.stream_in_valid.value.get_value()
        except:
            data_in="ERR"
        try:
            data_len="0x%04x"%tile.tile_e.len.value.get_value()
        except:
            data_len="ERR"
        line+=", %s, %s, %s, %s"%(state,ins_in,data_in,data_len)

        tile=dut.mem_slice2.tiles[i]
        try:
            state="0x%02x"%tile.tile_w.state.value.get_value()
        except:
            state="ERR"
        try:
            ins_in="0x%04x"%tile.tile_w.ins_in_valid.value.get_value()
        except:
            ins_in="ERR"
        try:
            data_in="0x%04x"%tile.tile_w.stream_in_valid.value.get_value()
        except:
            data_in="ERR"
        try:
            data_len="0x%04x"%tile.tile_w.len.value.get_value()
        except:
            data_len="ERR"
        line+=", %s, %s, %s, %s"%(state,ins_in,data_in,data_len)

        try:
            state="0x%02x"%tile.tile_e.state.value.get_value()
        except:
            state="ERR"
        try:
            ins_in="0x%04x"%tile.tile_e.ins_in_valid.value.get_value()
        except:
            ins_in="ERR"
        try:
            data_in="0x%04x"%tile.tile_e.stream_in_valid.value.get_value()
        except:
            data_in="ERR"
        try:
            data_len="0x%04x"%tile.tile_e.len.value.get_value()
        except:
            data_len="ERR"
        line+=", %s, %s, %s, %s"%(state,ins_in,data_in,data_len)

        tile=dut.vec_slice1.tiles[i]
        try:
            state="0x%02x"%tile.tile.state.value.get_value()
        except Exception as e:
            state="ERR: %s"%e
        try:
            ins_in="0x%04x"%tile.tile.ins_in_valid.value.get_value()
        except Exception as e:
            ins_in="ERR: %s"%e
        try:
            data_in_w="0x%04x"%tile.tile.stream_in_valid_w.value.get_value()
        except Exception as e:
            data_in_w="ERR: %s"%e
        try:
            data_in_e="0x%04x"%tile.tile.stream_in_valid_e.value.get_value()
        except Exception as e:
            data_in_e="ERR: %s"%e
        line+=", %s, %s, %s, %s"%(state,ins_in,data_in_w,data_in_e)

        tile=dut.dot_slice1.tiles[i]
        try:
            state="0x%02x"%tile.tile.state.value.get_value()
        except:
            state="ERR"
        try:
            ins_in="0x%04x"%tile.tile.ins_in_valid.value.get_value()
        except Exception as e:
            ins_in="ERR: %s"%e
        try:
            data_in_w="0x%04x"%tile.tile.stream_in_w_valid.value.get_value()
        except Exception as e:
            data_in_w="ERR: %s"%e
        try:
            data_in_e="0x%04x"%tile.tile.stream_in_e_valid.value.get_value()
        except Exception as e:
            data_in_e="ERR: %s"%e
        line+=", %s, %s, %s, %s"%(state,ins_in,data_in_w,data_in_e)

        tile=dut.dot_slice2.tiles[i]
        try:
            state="0x%02x"%tile.tile.state.value.get_value()
        except:
            state="ERR"
        try:
            ins_in="0x%04x"%tile.tile.ins_in_valid.value.get_value()
        except Exception as e:
            ins_in="ERR: %s"%e
        try:
            data_in_w="0x%04x"%tile.tile.stream_in_w_valid.value.get_value()
        except Exception as e:
            data_in_w="ERR: %s"%e
        try:
            data_in_e="0x%04x"%tile.tile.stream_in_e_valid.value.get_value()
        except Exception as e:
            data_in_e="ERR: %s"%e
        line+=", %s, %s, %s, %s"%(state,ins_in,data_in_w,data_in_e)

    states_file.write(line+"\n")

@cocotb.test()
async def test_npu(dut):
    print("test_npu")
    states_file_path = "states.csv"

    load_pcie()
    load_dram()

    cocotb.start_soon(clock_gen(dut.clk))

    # Reset DUT
    #dut.reset.value = 1
    #print("wait for rising edge")
    #await RisingEdge(dut.clk)
    #print("reset")
    #dut.reset.value = 0

    # Open the instructions file in binary mode
    with open(states_file_path, "w") as states_file:

        line="Time"
        line+=", TEST1, TEST2, TEST3, TEST4"
        line+=", PCIE0_IF_RX_STATE"
        line+=", PCIE0_IF_RX_LEN"
        line+=", PCIE0_IF_RX_TVALID"
        line+=", PCIE0_IF_TX_STATE"
        line+=", PCIE0_IF_TX_LEN"
        line+=", PCIE0_IF_TX_FIFO_LEN"
        line+=", PCIE0_IF_TX_FIFO_RD_SHIFT"
        line+=", PCIE0_IF_TX_TREADY"
        line+=", DRAM_IF_STATE"
        line+=", DRAM_IF_BURST_COUNTER"
        line+=", DRAM_IF_RVALID"
        line+=", DRAM_IF_FIFO_LENGTH"
        line+=", DRAM_IF_INS_IN_VALID"
        line+=", SW_ID_INS_IN_VALID"
        line+=", SW_ID_FIFO_LENGTH"
        line+=", MEM1_ID_INS_IN_VALID"
        line+=", MEM1_ID_FIFO_LENGTH_W"
        line+=", MEM1_ID_FIFO_LENGTH_E"
        line+=", MEM2_ID_INS_IN_VALID"
        line+=", MEM2_ID_FIFO_LENGTH_W"
        line+=", MEM2_ID_FIFO_LENGTH_E"
        line+=", VEC_ID_INS_IN_VALID"
        line+=", VEC_ID_FIFO_LENGTH"
        line+=", DOT1_ID_INS_IN_VALID"
        line+=", DOT1_ID_FIFO_LENGTH"
        line+=", DOT2_ID_INS_IN_VALID"
        line+=", DOT2_ID_FIFO_LENGTH"
        line+=", SW_SLICE_DATA_IN_VALID"
        line+=", SW_SLICE_DATA_OUT_VALID"
        for i in range(len(dut.sw_slice1.tiles)):
            line+=", SW_TILE_%d_STATE, SW_TILE_%d_INS_IN_VALID, SW_TILE_%d_STREAM_IN_VALID"%(i,i,i)
            line+=", MEM1_TILE_W_%d_STATE, MEM1_TILE_W_%d_INS_IN_VALID, MEM1_TILE_W_%d_STREAM_IN_VALID, MEM1_TILE_W_%s_LEN"%(i,i,i,i)
            line+=", MEM1_TILE_E_%d_STATE, MEM1_TILE_E_%d_INS_IN_VALID, MEM1_TILE_E_%d_STREAM_IN_VALID, MEM1_TILE_E_%s_LEN"%(i,i,i,i)
            line+=", MEM2_TILE_W_%d_STATE, MEM2_TILE_W_%d_INS_IN_VALID, MEM2_TILE_W_%d_STREAM_IN_VALID, MEM2_TILE_W_%s_LEN"%(i,i,i,i)
            line+=", MEM2_TILE_E_%d_STATE, MEM2_TILE_E_%d_INS_IN_VALID, MEM2_TILE_E_%d_STREAM_IN_VALID, MEM2_TILE_E_%s_LEN"%(i,i,i,i)
            line+=", VEC_TILE_%d_STATE, VEC_TILE_%d_INS_IN_VALID, VEC_TILE_%d_STREAM_IN_VALID_W, VEC_TILE_%d_STREAM_IN_VALID_E"%(i,i,i,i)
            line+=", DOT1_TILE_%d_STATE, DOT1_TILE_%d_INS_IN_VALID, DOT1_TILE_%d_STREAM_IN_VALID_W, DOT1_TILE_%d_STREAM_IN_VALID_E"%(i,i,i,i)
            line+=", DOT2_TILE_%d_STATE, DOT2_TILE_%d_INS_IN_VALID, DOT2_TILE_%d_STREAM_IN_VALID_W, DOT2_TILE_%d_STREAM_IN_VALID_E"%(i,i,i,i)
        states_file.write(line+"\n")
        
        while True:
            await RisingEdge(dut.clk)

            sim_pcie(dut)
            sim_dram(dut)
            write_states(dut,states_file)
            t=get_sim_time(units='ns')
            #if t>1200:
            if t>1000:
                break
