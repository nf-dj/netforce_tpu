import cocotb
from cocotb.clock import Clock
from cocotb.triggers import RisingEdge, FallingEdge, Timer
from cocotb.binary import BinaryValue
import csv

@cocotb.test()
async def test_uart_input(dut):
    # Start the clock
    clock = Clock(dut.sys_clk, 10, units="ns")
    cocotb.start_soon(clock.start())

    # Open CSV file for writing
    csv_file = open("signal_log.csv", "w", newline="")
    csv_writer = csv.writer(csv_file)

    # Define signals to measure (adjust these based on your SoC)
    signals_to_measure = [
        ("sys_clk", dut.sys_clk),
        ("sys_rst", dut.sys_rst),
        ("serial", dut.serial),
        ("uart_tx", dut.uart.tx),
        ("uart_rx", dut.uart.rx),
        ("nf_tpu_sink_valid", dut.nf_tpu.sink.valid),
        ("nf_tpu_sink_ready", dut.nf_tpu.sink.ready),
        ("nf_tpu_sink_data", dut.nf_tpu.sink.data),
        ("nf_tpu_source_valid", dut.nf_tpu.source.valid),
        ("nf_tpu_source_ready", dut.nf_tpu.source.ready),
        ("nf_tpu_source_data", dut.nf_tpu.source.data),
    ]

    # Write CSV header
    csv_writer.writerow(["cycle"] + [name for name, _ in signals_to_measure])

    # Reset the design
    dut.sys_rst.value = 1
    await Timer(100, units="ns")
    dut.sys_rst.value = 0
    await Timer(100, units="ns")

    # Open the input file
    with open("uart_input.txt", "r") as f:
        input_data = f.read().strip()

    # Configure UART
    baud_rate = 115200
    bit_time = int(1e9 / baud_rate)  # in nanoseconds

    # Function to send a byte over UART
    async def send_uart_byte(byte):
        # Start bit
        dut.serial.value = 0
        await Timer(bit_time, units="ns")

        # Data bits
        for i in range(8):
            dut.serial.value = (byte >> i) & 1
            await Timer(bit_time, units="ns")

        # Stop bit
        dut.serial.value = 1
        await Timer(bit_time, units="ns")

    # Function to log signals
    def log_signals(cycle):
        row = [cycle]
        for _, signal in signals_to_measure:
            if hasattr(signal, 'value'):
                row.append(signal.value.integer)
            else:
                row.append(signal.value)
        csv_writer.writerow(row)

    # Send each character from the input file and log signals
    cycle = 0
    for char in input_data:
        await send_uart_byte(ord(char))
        for _ in range(10):  # Log multiple cycles per character
            await RisingEdge(dut.sys_clk)
            log_signals(cycle)
            cycle += 1

    # Continue logging for a few more cycles after transmission
    for _ in range(100):
        await RisingEdge(dut.sys_clk)
        log_signals(cycle)
        cycle += 1

    # Close the CSV file
    csv_file.close()

    # Add assertions or checks here if needed
    # For example:
    # assert dut.nf_tpu_source_valid.value == 1, f"TPU output not valid after processing!"

# Run the test
if __name__ == "__main__":
    import sys
    sys.path.append(".")
    from cocotb_test.simulator import run
    run(
        python_search=["."],
        verilog_sources=["nf_soc.v"],  # Add your Verilog sources here
        toplevel="nf_soc",
        module="test_nf_soc",
    )
