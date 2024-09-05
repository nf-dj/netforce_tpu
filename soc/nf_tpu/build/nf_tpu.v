/* Machine-generated using Migen */
module top(
	input [63:0] in_ins,
	input in_ins_valid,
	output reg [63:0] out_ins,
	output reg out_ins_valid,
	output [63:0] out_slice_ins,
	output out_slice_ins_valid,
	input sys_clk,
	input sys_rst
);


// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign out_slice_ins_valid = (in_ins_valid & (in_ins[7:0] == 3'd5));
assign out_slice_ins = in_ins;

always @(posedge sys_clk) begin
	if (out_slice_ins_valid) begin
		out_ins <= 1'd0;
		out_ins_valid <= 1'd0;
	end else begin
		out_ins <= in_ins;
		out_ins_valid <= in_ins_valid;
	end
	if (sys_rst) begin
		out_ins <= 64'd0;
		out_ins_valid <= 1'd0;
	end
end

endmodule
