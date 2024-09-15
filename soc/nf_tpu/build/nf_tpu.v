/* Machine-generated using Migen */
module top(
	input [63:0] sink_payload_data,
	output [63:0] source_payload_data,
	output [31:0] bus_adr,
	input sys_clk,
	input sys_rst
);

reg sink_valid = 1'd0;
wire sink_ready;
reg sink_last = 1'd0;
wire source_valid;
reg source_ready = 1'd0;
wire source_last;
wire [511:0] bus_dat_w;
reg [511:0] bus_dat_r = 512'd0;
wire [63:0] bus_sel;
wire bus_cyc;
wire bus_stb;
reg bus_ack = 1'd0;
wire bus_we;


nf_tpu #(
	.ADDR_WIDTH(6'd32),
	.DATA_WIDTH(10'd512),
	.INS_WIDTH(7'd64),
	.NUM_TILES(5'd16),
	.STREAM_WIDTH(7'd64)
) nf_tpu (
	.clk(sys_clk),
	.dram_ack(bus_ack),
	.dram_dat_r(bus_dat_r),
	.reset(sys_rst),
	.sink_data(sink_payload_data),
	.sink_last(sink_last),
	.sink_valid(sink_valid),
	.source_ready(source_ready),
	.dram_addr(bus_adr),
	.dram_cyc(bus_cyc),
	.dram_dat_w(bus_dat_w),
	.dram_sel(bus_sel),
	.dram_stb(bus_stb),
	.dram_we(bus_we),
	.sink_ready(sink_ready),
	.source_data(source_payload_data),
	.source_last(source_last),
	.source_valid(source_valid)
);

endmodule
