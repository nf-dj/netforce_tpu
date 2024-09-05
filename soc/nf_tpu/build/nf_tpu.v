/* Machine-generated using Migen */
module top(
	input [511:0] in_stream_w,
	input [15:0] in_stream_w_valid,
	input [511:0] in_stream_e,
	input [15:0] in_stream_e_valid,
	input [15:0] out_stream_e_valid,
	input [15:0] out_stream_w_valid,
	input [63:0] in_ins,
	input in_ins_valid,
	output reg [511:0] out_stream_e,
	output reg [511:0] out_stream_w,
	output reg sys_clk,
	input sys_rst
);

wire [63:0] vecslice0;
wire [63:0] vecslice1;
wire [63:0] vecslice2;
wire [63:0] vecslice3;
wire [63:0] vecslice4;
wire [63:0] vecslice5;
wire [63:0] vecslice6;
wire [63:0] vecslice7;
wire [63:0] vecslice8;
wire [63:0] vecslice9;
wire [63:0] vecslice10;
wire [63:0] vecslice11;
wire [63:0] vecslice12;
wire [63:0] vecslice13;
wire [63:0] vecslice14;
wire [63:0] vecslice15;
wire vecslice16;
wire vecslice17;
wire vecslice18;
wire vecslice19;
wire vecslice20;
wire vecslice21;
wire vecslice22;
wire vecslice23;
wire vecslice24;
wire vecslice25;
wire vecslice26;
wire vecslice27;
wire vecslice28;
wire vecslice29;
wire vecslice30;
wire vecslice31;
wire [31:0] vecslice_vectile0_in_stream_w;
wire vecslice_vectile0_in_stream_valid_w;
wire [31:0] vecslice_vectile0_in_stream_e;
wire vecslice_vectile0_in_stream_valid_e;
wire [63:0] vecslice_vectile0_in_ins;
wire vecslice_vectile0_in_ins_valid;
reg [31:0] vecslice_vectile0_out_stream_e;
wire vecslice_vectile0_out_stream_valid_e;
reg [31:0] vecslice_vectile0_out_stream_w;
wire vecslice_vectile0_out_stream_valid_w;
reg [63:0] vecslice_vectile0_out_ins = 64'd0;
reg vecslice_vectile0_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile0_state = 2'd0;
wire [1:0] vecslice_vectile0_vecunit0_state;
wire [7:0] vecslice_vectile0_vecunit0_in_stream_w;
wire vecslice_vectile0_vecunit0_in_stream_valid_w;
wire [7:0] vecslice_vectile0_vecunit0_in_stream_e;
wire vecslice_vectile0_vecunit0_in_stream_valid_e;
reg [7:0] vecslice_vectile0_vecunit0_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile0_vecunit0_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile0_vecunit0_const_b = 8'd0;
wire [1:0] vecslice_vectile0_vecunit1_state;
wire [7:0] vecslice_vectile0_vecunit1_in_stream_w;
wire vecslice_vectile0_vecunit1_in_stream_valid_w;
wire [7:0] vecslice_vectile0_vecunit1_in_stream_e;
wire vecslice_vectile0_vecunit1_in_stream_valid_e;
reg [7:0] vecslice_vectile0_vecunit1_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile0_vecunit1_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile0_vecunit1_const_b = 8'd0;
wire [1:0] vecslice_vectile0_vecunit2_state;
wire [7:0] vecslice_vectile0_vecunit2_in_stream_w;
wire vecslice_vectile0_vecunit2_in_stream_valid_w;
wire [7:0] vecslice_vectile0_vecunit2_in_stream_e;
wire vecslice_vectile0_vecunit2_in_stream_valid_e;
reg [7:0] vecslice_vectile0_vecunit2_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile0_vecunit2_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile0_vecunit2_const_b = 8'd0;
wire [1:0] vecslice_vectile0_vecunit3_state;
wire [7:0] vecslice_vectile0_vecunit3_in_stream_w;
wire vecslice_vectile0_vecunit3_in_stream_valid_w;
wire [7:0] vecslice_vectile0_vecunit3_in_stream_e;
wire vecslice_vectile0_vecunit3_in_stream_valid_e;
reg [7:0] vecslice_vectile0_vecunit3_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile0_vecunit3_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile0_vecunit3_const_b = 8'd0;
wire [31:0] vecslice_vectile1_in_stream_w;
wire vecslice_vectile1_in_stream_valid_w;
wire [31:0] vecslice_vectile1_in_stream_e;
wire vecslice_vectile1_in_stream_valid_e;
wire [63:0] vecslice_vectile1_in_ins;
wire vecslice_vectile1_in_ins_valid;
reg [31:0] vecslice_vectile1_out_stream_e;
wire vecslice_vectile1_out_stream_valid_e;
reg [31:0] vecslice_vectile1_out_stream_w;
wire vecslice_vectile1_out_stream_valid_w;
reg [63:0] vecslice_vectile1_out_ins = 64'd0;
reg vecslice_vectile1_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile1_state = 2'd0;
wire [1:0] vecslice_vectile1_vecunit4_state;
wire [7:0] vecslice_vectile1_vecunit4_in_stream_w;
wire vecslice_vectile1_vecunit4_in_stream_valid_w;
wire [7:0] vecslice_vectile1_vecunit4_in_stream_e;
wire vecslice_vectile1_vecunit4_in_stream_valid_e;
reg [7:0] vecslice_vectile1_vecunit4_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile1_vecunit4_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile1_vecunit4_const_b = 8'd0;
wire [1:0] vecslice_vectile1_vecunit5_state;
wire [7:0] vecslice_vectile1_vecunit5_in_stream_w;
wire vecslice_vectile1_vecunit5_in_stream_valid_w;
wire [7:0] vecslice_vectile1_vecunit5_in_stream_e;
wire vecslice_vectile1_vecunit5_in_stream_valid_e;
reg [7:0] vecslice_vectile1_vecunit5_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile1_vecunit5_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile1_vecunit5_const_b = 8'd0;
wire [1:0] vecslice_vectile1_vecunit6_state;
wire [7:0] vecslice_vectile1_vecunit6_in_stream_w;
wire vecslice_vectile1_vecunit6_in_stream_valid_w;
wire [7:0] vecslice_vectile1_vecunit6_in_stream_e;
wire vecslice_vectile1_vecunit6_in_stream_valid_e;
reg [7:0] vecslice_vectile1_vecunit6_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile1_vecunit6_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile1_vecunit6_const_b = 8'd0;
wire [1:0] vecslice_vectile1_vecunit7_state;
wire [7:0] vecslice_vectile1_vecunit7_in_stream_w;
wire vecslice_vectile1_vecunit7_in_stream_valid_w;
wire [7:0] vecslice_vectile1_vecunit7_in_stream_e;
wire vecslice_vectile1_vecunit7_in_stream_valid_e;
reg [7:0] vecslice_vectile1_vecunit7_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile1_vecunit7_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile1_vecunit7_const_b = 8'd0;
wire [31:0] vecslice_vectile2_in_stream_w;
wire vecslice_vectile2_in_stream_valid_w;
wire [31:0] vecslice_vectile2_in_stream_e;
wire vecslice_vectile2_in_stream_valid_e;
wire [63:0] vecslice_vectile2_in_ins;
wire vecslice_vectile2_in_ins_valid;
reg [31:0] vecslice_vectile2_out_stream_e;
wire vecslice_vectile2_out_stream_valid_e;
reg [31:0] vecslice_vectile2_out_stream_w;
wire vecslice_vectile2_out_stream_valid_w;
reg [63:0] vecslice_vectile2_out_ins = 64'd0;
reg vecslice_vectile2_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile2_state = 2'd0;
wire [1:0] vecslice_vectile2_vecunit8_state;
wire [7:0] vecslice_vectile2_vecunit8_in_stream_w;
wire vecslice_vectile2_vecunit8_in_stream_valid_w;
wire [7:0] vecslice_vectile2_vecunit8_in_stream_e;
wire vecslice_vectile2_vecunit8_in_stream_valid_e;
reg [7:0] vecslice_vectile2_vecunit8_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile2_vecunit8_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile2_vecunit8_const_b = 8'd0;
wire [1:0] vecslice_vectile2_vecunit9_state;
wire [7:0] vecslice_vectile2_vecunit9_in_stream_w;
wire vecslice_vectile2_vecunit9_in_stream_valid_w;
wire [7:0] vecslice_vectile2_vecunit9_in_stream_e;
wire vecslice_vectile2_vecunit9_in_stream_valid_e;
reg [7:0] vecslice_vectile2_vecunit9_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile2_vecunit9_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile2_vecunit9_const_b = 8'd0;
wire [1:0] vecslice_vectile2_vecunit10_state;
wire [7:0] vecslice_vectile2_vecunit10_in_stream_w;
wire vecslice_vectile2_vecunit10_in_stream_valid_w;
wire [7:0] vecslice_vectile2_vecunit10_in_stream_e;
wire vecslice_vectile2_vecunit10_in_stream_valid_e;
reg [7:0] vecslice_vectile2_vecunit10_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile2_vecunit10_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile2_vecunit10_const_b = 8'd0;
wire [1:0] vecslice_vectile2_vecunit11_state;
wire [7:0] vecslice_vectile2_vecunit11_in_stream_w;
wire vecslice_vectile2_vecunit11_in_stream_valid_w;
wire [7:0] vecslice_vectile2_vecunit11_in_stream_e;
wire vecslice_vectile2_vecunit11_in_stream_valid_e;
reg [7:0] vecslice_vectile2_vecunit11_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile2_vecunit11_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile2_vecunit11_const_b = 8'd0;
wire [31:0] vecslice_vectile3_in_stream_w;
wire vecslice_vectile3_in_stream_valid_w;
wire [31:0] vecslice_vectile3_in_stream_e;
wire vecslice_vectile3_in_stream_valid_e;
wire [63:0] vecslice_vectile3_in_ins;
wire vecslice_vectile3_in_ins_valid;
reg [31:0] vecslice_vectile3_out_stream_e;
wire vecslice_vectile3_out_stream_valid_e;
reg [31:0] vecslice_vectile3_out_stream_w;
wire vecslice_vectile3_out_stream_valid_w;
reg [63:0] vecslice_vectile3_out_ins = 64'd0;
reg vecslice_vectile3_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile3_state = 2'd0;
wire [1:0] vecslice_vectile3_vecunit12_state;
wire [7:0] vecslice_vectile3_vecunit12_in_stream_w;
wire vecslice_vectile3_vecunit12_in_stream_valid_w;
wire [7:0] vecslice_vectile3_vecunit12_in_stream_e;
wire vecslice_vectile3_vecunit12_in_stream_valid_e;
reg [7:0] vecslice_vectile3_vecunit12_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile3_vecunit12_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile3_vecunit12_const_b = 8'd0;
wire [1:0] vecslice_vectile3_vecunit13_state;
wire [7:0] vecslice_vectile3_vecunit13_in_stream_w;
wire vecslice_vectile3_vecunit13_in_stream_valid_w;
wire [7:0] vecslice_vectile3_vecunit13_in_stream_e;
wire vecslice_vectile3_vecunit13_in_stream_valid_e;
reg [7:0] vecslice_vectile3_vecunit13_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile3_vecunit13_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile3_vecunit13_const_b = 8'd0;
wire [1:0] vecslice_vectile3_vecunit14_state;
wire [7:0] vecslice_vectile3_vecunit14_in_stream_w;
wire vecslice_vectile3_vecunit14_in_stream_valid_w;
wire [7:0] vecslice_vectile3_vecunit14_in_stream_e;
wire vecslice_vectile3_vecunit14_in_stream_valid_e;
reg [7:0] vecslice_vectile3_vecunit14_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile3_vecunit14_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile3_vecunit14_const_b = 8'd0;
wire [1:0] vecslice_vectile3_vecunit15_state;
wire [7:0] vecslice_vectile3_vecunit15_in_stream_w;
wire vecslice_vectile3_vecunit15_in_stream_valid_w;
wire [7:0] vecslice_vectile3_vecunit15_in_stream_e;
wire vecslice_vectile3_vecunit15_in_stream_valid_e;
reg [7:0] vecslice_vectile3_vecunit15_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile3_vecunit15_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile3_vecunit15_const_b = 8'd0;
wire [31:0] vecslice_vectile4_in_stream_w;
wire vecslice_vectile4_in_stream_valid_w;
wire [31:0] vecslice_vectile4_in_stream_e;
wire vecslice_vectile4_in_stream_valid_e;
wire [63:0] vecslice_vectile4_in_ins;
wire vecslice_vectile4_in_ins_valid;
reg [31:0] vecslice_vectile4_out_stream_e;
wire vecslice_vectile4_out_stream_valid_e;
reg [31:0] vecslice_vectile4_out_stream_w;
wire vecslice_vectile4_out_stream_valid_w;
reg [63:0] vecslice_vectile4_out_ins = 64'd0;
reg vecslice_vectile4_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile4_state = 2'd0;
wire [1:0] vecslice_vectile4_vecunit16_state;
wire [7:0] vecslice_vectile4_vecunit16_in_stream_w;
wire vecslice_vectile4_vecunit16_in_stream_valid_w;
wire [7:0] vecslice_vectile4_vecunit16_in_stream_e;
wire vecslice_vectile4_vecunit16_in_stream_valid_e;
reg [7:0] vecslice_vectile4_vecunit16_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile4_vecunit16_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile4_vecunit16_const_b = 8'd0;
wire [1:0] vecslice_vectile4_vecunit17_state;
wire [7:0] vecslice_vectile4_vecunit17_in_stream_w;
wire vecslice_vectile4_vecunit17_in_stream_valid_w;
wire [7:0] vecslice_vectile4_vecunit17_in_stream_e;
wire vecslice_vectile4_vecunit17_in_stream_valid_e;
reg [7:0] vecslice_vectile4_vecunit17_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile4_vecunit17_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile4_vecunit17_const_b = 8'd0;
wire [1:0] vecslice_vectile4_vecunit18_state;
wire [7:0] vecslice_vectile4_vecunit18_in_stream_w;
wire vecslice_vectile4_vecunit18_in_stream_valid_w;
wire [7:0] vecslice_vectile4_vecunit18_in_stream_e;
wire vecslice_vectile4_vecunit18_in_stream_valid_e;
reg [7:0] vecslice_vectile4_vecunit18_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile4_vecunit18_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile4_vecunit18_const_b = 8'd0;
wire [1:0] vecslice_vectile4_vecunit19_state;
wire [7:0] vecslice_vectile4_vecunit19_in_stream_w;
wire vecslice_vectile4_vecunit19_in_stream_valid_w;
wire [7:0] vecslice_vectile4_vecunit19_in_stream_e;
wire vecslice_vectile4_vecunit19_in_stream_valid_e;
reg [7:0] vecslice_vectile4_vecunit19_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile4_vecunit19_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile4_vecunit19_const_b = 8'd0;
wire [31:0] vecslice_vectile5_in_stream_w;
wire vecslice_vectile5_in_stream_valid_w;
wire [31:0] vecslice_vectile5_in_stream_e;
wire vecslice_vectile5_in_stream_valid_e;
wire [63:0] vecslice_vectile5_in_ins;
wire vecslice_vectile5_in_ins_valid;
reg [31:0] vecslice_vectile5_out_stream_e;
wire vecslice_vectile5_out_stream_valid_e;
reg [31:0] vecslice_vectile5_out_stream_w;
wire vecslice_vectile5_out_stream_valid_w;
reg [63:0] vecslice_vectile5_out_ins = 64'd0;
reg vecslice_vectile5_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile5_state = 2'd0;
wire [1:0] vecslice_vectile5_vecunit20_state;
wire [7:0] vecslice_vectile5_vecunit20_in_stream_w;
wire vecslice_vectile5_vecunit20_in_stream_valid_w;
wire [7:0] vecslice_vectile5_vecunit20_in_stream_e;
wire vecslice_vectile5_vecunit20_in_stream_valid_e;
reg [7:0] vecslice_vectile5_vecunit20_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile5_vecunit20_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile5_vecunit20_const_b = 8'd0;
wire [1:0] vecslice_vectile5_vecunit21_state;
wire [7:0] vecslice_vectile5_vecunit21_in_stream_w;
wire vecslice_vectile5_vecunit21_in_stream_valid_w;
wire [7:0] vecslice_vectile5_vecunit21_in_stream_e;
wire vecslice_vectile5_vecunit21_in_stream_valid_e;
reg [7:0] vecslice_vectile5_vecunit21_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile5_vecunit21_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile5_vecunit21_const_b = 8'd0;
wire [1:0] vecslice_vectile5_vecunit22_state;
wire [7:0] vecslice_vectile5_vecunit22_in_stream_w;
wire vecslice_vectile5_vecunit22_in_stream_valid_w;
wire [7:0] vecslice_vectile5_vecunit22_in_stream_e;
wire vecslice_vectile5_vecunit22_in_stream_valid_e;
reg [7:0] vecslice_vectile5_vecunit22_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile5_vecunit22_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile5_vecunit22_const_b = 8'd0;
wire [1:0] vecslice_vectile5_vecunit23_state;
wire [7:0] vecslice_vectile5_vecunit23_in_stream_w;
wire vecslice_vectile5_vecunit23_in_stream_valid_w;
wire [7:0] vecslice_vectile5_vecunit23_in_stream_e;
wire vecslice_vectile5_vecunit23_in_stream_valid_e;
reg [7:0] vecslice_vectile5_vecunit23_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile5_vecunit23_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile5_vecunit23_const_b = 8'd0;
wire [31:0] vecslice_vectile6_in_stream_w;
wire vecslice_vectile6_in_stream_valid_w;
wire [31:0] vecslice_vectile6_in_stream_e;
wire vecslice_vectile6_in_stream_valid_e;
wire [63:0] vecslice_vectile6_in_ins;
wire vecslice_vectile6_in_ins_valid;
reg [31:0] vecslice_vectile6_out_stream_e;
wire vecslice_vectile6_out_stream_valid_e;
reg [31:0] vecslice_vectile6_out_stream_w;
wire vecslice_vectile6_out_stream_valid_w;
reg [63:0] vecslice_vectile6_out_ins = 64'd0;
reg vecslice_vectile6_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile6_state = 2'd0;
wire [1:0] vecslice_vectile6_vecunit24_state;
wire [7:0] vecslice_vectile6_vecunit24_in_stream_w;
wire vecslice_vectile6_vecunit24_in_stream_valid_w;
wire [7:0] vecslice_vectile6_vecunit24_in_stream_e;
wire vecslice_vectile6_vecunit24_in_stream_valid_e;
reg [7:0] vecslice_vectile6_vecunit24_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile6_vecunit24_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile6_vecunit24_const_b = 8'd0;
wire [1:0] vecslice_vectile6_vecunit25_state;
wire [7:0] vecslice_vectile6_vecunit25_in_stream_w;
wire vecslice_vectile6_vecunit25_in_stream_valid_w;
wire [7:0] vecslice_vectile6_vecunit25_in_stream_e;
wire vecslice_vectile6_vecunit25_in_stream_valid_e;
reg [7:0] vecslice_vectile6_vecunit25_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile6_vecunit25_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile6_vecunit25_const_b = 8'd0;
wire [1:0] vecslice_vectile6_vecunit26_state;
wire [7:0] vecslice_vectile6_vecunit26_in_stream_w;
wire vecslice_vectile6_vecunit26_in_stream_valid_w;
wire [7:0] vecslice_vectile6_vecunit26_in_stream_e;
wire vecslice_vectile6_vecunit26_in_stream_valid_e;
reg [7:0] vecslice_vectile6_vecunit26_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile6_vecunit26_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile6_vecunit26_const_b = 8'd0;
wire [1:0] vecslice_vectile6_vecunit27_state;
wire [7:0] vecslice_vectile6_vecunit27_in_stream_w;
wire vecslice_vectile6_vecunit27_in_stream_valid_w;
wire [7:0] vecslice_vectile6_vecunit27_in_stream_e;
wire vecslice_vectile6_vecunit27_in_stream_valid_e;
reg [7:0] vecslice_vectile6_vecunit27_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile6_vecunit27_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile6_vecunit27_const_b = 8'd0;
wire [31:0] vecslice_vectile7_in_stream_w;
wire vecslice_vectile7_in_stream_valid_w;
wire [31:0] vecslice_vectile7_in_stream_e;
wire vecslice_vectile7_in_stream_valid_e;
wire [63:0] vecslice_vectile7_in_ins;
wire vecslice_vectile7_in_ins_valid;
reg [31:0] vecslice_vectile7_out_stream_e;
wire vecslice_vectile7_out_stream_valid_e;
reg [31:0] vecslice_vectile7_out_stream_w;
wire vecslice_vectile7_out_stream_valid_w;
reg [63:0] vecslice_vectile7_out_ins = 64'd0;
reg vecslice_vectile7_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile7_state = 2'd0;
wire [1:0] vecslice_vectile7_vecunit28_state;
wire [7:0] vecslice_vectile7_vecunit28_in_stream_w;
wire vecslice_vectile7_vecunit28_in_stream_valid_w;
wire [7:0] vecslice_vectile7_vecunit28_in_stream_e;
wire vecslice_vectile7_vecunit28_in_stream_valid_e;
reg [7:0] vecslice_vectile7_vecunit28_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile7_vecunit28_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile7_vecunit28_const_b = 8'd0;
wire [1:0] vecslice_vectile7_vecunit29_state;
wire [7:0] vecslice_vectile7_vecunit29_in_stream_w;
wire vecslice_vectile7_vecunit29_in_stream_valid_w;
wire [7:0] vecslice_vectile7_vecunit29_in_stream_e;
wire vecslice_vectile7_vecunit29_in_stream_valid_e;
reg [7:0] vecslice_vectile7_vecunit29_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile7_vecunit29_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile7_vecunit29_const_b = 8'd0;
wire [1:0] vecslice_vectile7_vecunit30_state;
wire [7:0] vecslice_vectile7_vecunit30_in_stream_w;
wire vecslice_vectile7_vecunit30_in_stream_valid_w;
wire [7:0] vecslice_vectile7_vecunit30_in_stream_e;
wire vecslice_vectile7_vecunit30_in_stream_valid_e;
reg [7:0] vecslice_vectile7_vecunit30_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile7_vecunit30_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile7_vecunit30_const_b = 8'd0;
wire [1:0] vecslice_vectile7_vecunit31_state;
wire [7:0] vecslice_vectile7_vecunit31_in_stream_w;
wire vecslice_vectile7_vecunit31_in_stream_valid_w;
wire [7:0] vecslice_vectile7_vecunit31_in_stream_e;
wire vecslice_vectile7_vecunit31_in_stream_valid_e;
reg [7:0] vecslice_vectile7_vecunit31_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile7_vecunit31_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile7_vecunit31_const_b = 8'd0;
wire [31:0] vecslice_vectile8_in_stream_w;
wire vecslice_vectile8_in_stream_valid_w;
wire [31:0] vecslice_vectile8_in_stream_e;
wire vecslice_vectile8_in_stream_valid_e;
wire [63:0] vecslice_vectile8_in_ins;
wire vecslice_vectile8_in_ins_valid;
reg [31:0] vecslice_vectile8_out_stream_e;
wire vecslice_vectile8_out_stream_valid_e;
reg [31:0] vecslice_vectile8_out_stream_w;
wire vecslice_vectile8_out_stream_valid_w;
reg [63:0] vecslice_vectile8_out_ins = 64'd0;
reg vecslice_vectile8_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile8_state = 2'd0;
wire [1:0] vecslice_vectile8_vecunit32_state;
wire [7:0] vecslice_vectile8_vecunit32_in_stream_w;
wire vecslice_vectile8_vecunit32_in_stream_valid_w;
wire [7:0] vecslice_vectile8_vecunit32_in_stream_e;
wire vecslice_vectile8_vecunit32_in_stream_valid_e;
reg [7:0] vecslice_vectile8_vecunit32_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile8_vecunit32_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile8_vecunit32_const_b = 8'd0;
wire [1:0] vecslice_vectile8_vecunit33_state;
wire [7:0] vecslice_vectile8_vecunit33_in_stream_w;
wire vecslice_vectile8_vecunit33_in_stream_valid_w;
wire [7:0] vecslice_vectile8_vecunit33_in_stream_e;
wire vecslice_vectile8_vecunit33_in_stream_valid_e;
reg [7:0] vecslice_vectile8_vecunit33_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile8_vecunit33_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile8_vecunit33_const_b = 8'd0;
wire [1:0] vecslice_vectile8_vecunit34_state;
wire [7:0] vecslice_vectile8_vecunit34_in_stream_w;
wire vecslice_vectile8_vecunit34_in_stream_valid_w;
wire [7:0] vecslice_vectile8_vecunit34_in_stream_e;
wire vecslice_vectile8_vecunit34_in_stream_valid_e;
reg [7:0] vecslice_vectile8_vecunit34_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile8_vecunit34_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile8_vecunit34_const_b = 8'd0;
wire [1:0] vecslice_vectile8_vecunit35_state;
wire [7:0] vecslice_vectile8_vecunit35_in_stream_w;
wire vecslice_vectile8_vecunit35_in_stream_valid_w;
wire [7:0] vecslice_vectile8_vecunit35_in_stream_e;
wire vecslice_vectile8_vecunit35_in_stream_valid_e;
reg [7:0] vecslice_vectile8_vecunit35_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile8_vecunit35_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile8_vecunit35_const_b = 8'd0;
wire [31:0] vecslice_vectile9_in_stream_w;
wire vecslice_vectile9_in_stream_valid_w;
wire [31:0] vecslice_vectile9_in_stream_e;
wire vecslice_vectile9_in_stream_valid_e;
wire [63:0] vecslice_vectile9_in_ins;
wire vecslice_vectile9_in_ins_valid;
reg [31:0] vecslice_vectile9_out_stream_e;
wire vecslice_vectile9_out_stream_valid_e;
reg [31:0] vecslice_vectile9_out_stream_w;
wire vecslice_vectile9_out_stream_valid_w;
reg [63:0] vecslice_vectile9_out_ins = 64'd0;
reg vecslice_vectile9_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile9_state = 2'd0;
wire [1:0] vecslice_vectile9_vecunit36_state;
wire [7:0] vecslice_vectile9_vecunit36_in_stream_w;
wire vecslice_vectile9_vecunit36_in_stream_valid_w;
wire [7:0] vecslice_vectile9_vecunit36_in_stream_e;
wire vecslice_vectile9_vecunit36_in_stream_valid_e;
reg [7:0] vecslice_vectile9_vecunit36_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile9_vecunit36_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile9_vecunit36_const_b = 8'd0;
wire [1:0] vecslice_vectile9_vecunit37_state;
wire [7:0] vecslice_vectile9_vecunit37_in_stream_w;
wire vecslice_vectile9_vecunit37_in_stream_valid_w;
wire [7:0] vecslice_vectile9_vecunit37_in_stream_e;
wire vecslice_vectile9_vecunit37_in_stream_valid_e;
reg [7:0] vecslice_vectile9_vecunit37_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile9_vecunit37_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile9_vecunit37_const_b = 8'd0;
wire [1:0] vecslice_vectile9_vecunit38_state;
wire [7:0] vecslice_vectile9_vecunit38_in_stream_w;
wire vecslice_vectile9_vecunit38_in_stream_valid_w;
wire [7:0] vecslice_vectile9_vecunit38_in_stream_e;
wire vecslice_vectile9_vecunit38_in_stream_valid_e;
reg [7:0] vecslice_vectile9_vecunit38_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile9_vecunit38_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile9_vecunit38_const_b = 8'd0;
wire [1:0] vecslice_vectile9_vecunit39_state;
wire [7:0] vecslice_vectile9_vecunit39_in_stream_w;
wire vecslice_vectile9_vecunit39_in_stream_valid_w;
wire [7:0] vecslice_vectile9_vecunit39_in_stream_e;
wire vecslice_vectile9_vecunit39_in_stream_valid_e;
reg [7:0] vecslice_vectile9_vecunit39_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile9_vecunit39_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile9_vecunit39_const_b = 8'd0;
wire [31:0] vecslice_vectile10_in_stream_w;
wire vecslice_vectile10_in_stream_valid_w;
wire [31:0] vecslice_vectile10_in_stream_e;
wire vecslice_vectile10_in_stream_valid_e;
wire [63:0] vecslice_vectile10_in_ins;
wire vecslice_vectile10_in_ins_valid;
reg [31:0] vecslice_vectile10_out_stream_e;
wire vecslice_vectile10_out_stream_valid_e;
reg [31:0] vecslice_vectile10_out_stream_w;
wire vecslice_vectile10_out_stream_valid_w;
reg [63:0] vecslice_vectile10_out_ins = 64'd0;
reg vecslice_vectile10_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile10_state = 2'd0;
wire [1:0] vecslice_vectile10_vecunit40_state;
wire [7:0] vecslice_vectile10_vecunit40_in_stream_w;
wire vecslice_vectile10_vecunit40_in_stream_valid_w;
wire [7:0] vecslice_vectile10_vecunit40_in_stream_e;
wire vecslice_vectile10_vecunit40_in_stream_valid_e;
reg [7:0] vecslice_vectile10_vecunit40_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile10_vecunit40_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile10_vecunit40_const_b = 8'd0;
wire [1:0] vecslice_vectile10_vecunit41_state;
wire [7:0] vecslice_vectile10_vecunit41_in_stream_w;
wire vecslice_vectile10_vecunit41_in_stream_valid_w;
wire [7:0] vecslice_vectile10_vecunit41_in_stream_e;
wire vecslice_vectile10_vecunit41_in_stream_valid_e;
reg [7:0] vecslice_vectile10_vecunit41_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile10_vecunit41_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile10_vecunit41_const_b = 8'd0;
wire [1:0] vecslice_vectile10_vecunit42_state;
wire [7:0] vecslice_vectile10_vecunit42_in_stream_w;
wire vecslice_vectile10_vecunit42_in_stream_valid_w;
wire [7:0] vecslice_vectile10_vecunit42_in_stream_e;
wire vecslice_vectile10_vecunit42_in_stream_valid_e;
reg [7:0] vecslice_vectile10_vecunit42_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile10_vecunit42_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile10_vecunit42_const_b = 8'd0;
wire [1:0] vecslice_vectile10_vecunit43_state;
wire [7:0] vecslice_vectile10_vecunit43_in_stream_w;
wire vecslice_vectile10_vecunit43_in_stream_valid_w;
wire [7:0] vecslice_vectile10_vecunit43_in_stream_e;
wire vecslice_vectile10_vecunit43_in_stream_valid_e;
reg [7:0] vecslice_vectile10_vecunit43_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile10_vecunit43_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile10_vecunit43_const_b = 8'd0;
wire [31:0] vecslice_vectile11_in_stream_w;
wire vecslice_vectile11_in_stream_valid_w;
wire [31:0] vecslice_vectile11_in_stream_e;
wire vecslice_vectile11_in_stream_valid_e;
wire [63:0] vecslice_vectile11_in_ins;
wire vecslice_vectile11_in_ins_valid;
reg [31:0] vecslice_vectile11_out_stream_e;
wire vecslice_vectile11_out_stream_valid_e;
reg [31:0] vecslice_vectile11_out_stream_w;
wire vecslice_vectile11_out_stream_valid_w;
reg [63:0] vecslice_vectile11_out_ins = 64'd0;
reg vecslice_vectile11_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile11_state = 2'd0;
wire [1:0] vecslice_vectile11_vecunit44_state;
wire [7:0] vecslice_vectile11_vecunit44_in_stream_w;
wire vecslice_vectile11_vecunit44_in_stream_valid_w;
wire [7:0] vecslice_vectile11_vecunit44_in_stream_e;
wire vecslice_vectile11_vecunit44_in_stream_valid_e;
reg [7:0] vecslice_vectile11_vecunit44_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile11_vecunit44_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile11_vecunit44_const_b = 8'd0;
wire [1:0] vecslice_vectile11_vecunit45_state;
wire [7:0] vecslice_vectile11_vecunit45_in_stream_w;
wire vecslice_vectile11_vecunit45_in_stream_valid_w;
wire [7:0] vecslice_vectile11_vecunit45_in_stream_e;
wire vecslice_vectile11_vecunit45_in_stream_valid_e;
reg [7:0] vecslice_vectile11_vecunit45_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile11_vecunit45_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile11_vecunit45_const_b = 8'd0;
wire [1:0] vecslice_vectile11_vecunit46_state;
wire [7:0] vecslice_vectile11_vecunit46_in_stream_w;
wire vecslice_vectile11_vecunit46_in_stream_valid_w;
wire [7:0] vecslice_vectile11_vecunit46_in_stream_e;
wire vecslice_vectile11_vecunit46_in_stream_valid_e;
reg [7:0] vecslice_vectile11_vecunit46_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile11_vecunit46_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile11_vecunit46_const_b = 8'd0;
wire [1:0] vecslice_vectile11_vecunit47_state;
wire [7:0] vecslice_vectile11_vecunit47_in_stream_w;
wire vecslice_vectile11_vecunit47_in_stream_valid_w;
wire [7:0] vecslice_vectile11_vecunit47_in_stream_e;
wire vecslice_vectile11_vecunit47_in_stream_valid_e;
reg [7:0] vecslice_vectile11_vecunit47_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile11_vecunit47_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile11_vecunit47_const_b = 8'd0;
wire [31:0] vecslice_vectile12_in_stream_w;
wire vecslice_vectile12_in_stream_valid_w;
wire [31:0] vecslice_vectile12_in_stream_e;
wire vecslice_vectile12_in_stream_valid_e;
wire [63:0] vecslice_vectile12_in_ins;
wire vecslice_vectile12_in_ins_valid;
reg [31:0] vecslice_vectile12_out_stream_e;
wire vecslice_vectile12_out_stream_valid_e;
reg [31:0] vecslice_vectile12_out_stream_w;
wire vecslice_vectile12_out_stream_valid_w;
reg [63:0] vecslice_vectile12_out_ins = 64'd0;
reg vecslice_vectile12_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile12_state = 2'd0;
wire [1:0] vecslice_vectile12_vecunit48_state;
wire [7:0] vecslice_vectile12_vecunit48_in_stream_w;
wire vecslice_vectile12_vecunit48_in_stream_valid_w;
wire [7:0] vecslice_vectile12_vecunit48_in_stream_e;
wire vecslice_vectile12_vecunit48_in_stream_valid_e;
reg [7:0] vecslice_vectile12_vecunit48_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile12_vecunit48_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile12_vecunit48_const_b = 8'd0;
wire [1:0] vecslice_vectile12_vecunit49_state;
wire [7:0] vecslice_vectile12_vecunit49_in_stream_w;
wire vecslice_vectile12_vecunit49_in_stream_valid_w;
wire [7:0] vecslice_vectile12_vecunit49_in_stream_e;
wire vecslice_vectile12_vecunit49_in_stream_valid_e;
reg [7:0] vecslice_vectile12_vecunit49_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile12_vecunit49_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile12_vecunit49_const_b = 8'd0;
wire [1:0] vecslice_vectile12_vecunit50_state;
wire [7:0] vecslice_vectile12_vecunit50_in_stream_w;
wire vecslice_vectile12_vecunit50_in_stream_valid_w;
wire [7:0] vecslice_vectile12_vecunit50_in_stream_e;
wire vecslice_vectile12_vecunit50_in_stream_valid_e;
reg [7:0] vecslice_vectile12_vecunit50_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile12_vecunit50_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile12_vecunit50_const_b = 8'd0;
wire [1:0] vecslice_vectile12_vecunit51_state;
wire [7:0] vecslice_vectile12_vecunit51_in_stream_w;
wire vecslice_vectile12_vecunit51_in_stream_valid_w;
wire [7:0] vecslice_vectile12_vecunit51_in_stream_e;
wire vecslice_vectile12_vecunit51_in_stream_valid_e;
reg [7:0] vecslice_vectile12_vecunit51_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile12_vecunit51_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile12_vecunit51_const_b = 8'd0;
wire [31:0] vecslice_vectile13_in_stream_w;
wire vecslice_vectile13_in_stream_valid_w;
wire [31:0] vecslice_vectile13_in_stream_e;
wire vecslice_vectile13_in_stream_valid_e;
wire [63:0] vecslice_vectile13_in_ins;
wire vecslice_vectile13_in_ins_valid;
reg [31:0] vecslice_vectile13_out_stream_e;
wire vecslice_vectile13_out_stream_valid_e;
reg [31:0] vecslice_vectile13_out_stream_w;
wire vecslice_vectile13_out_stream_valid_w;
reg [63:0] vecslice_vectile13_out_ins = 64'd0;
reg vecslice_vectile13_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile13_state = 2'd0;
wire [1:0] vecslice_vectile13_vecunit52_state;
wire [7:0] vecslice_vectile13_vecunit52_in_stream_w;
wire vecslice_vectile13_vecunit52_in_stream_valid_w;
wire [7:0] vecslice_vectile13_vecunit52_in_stream_e;
wire vecslice_vectile13_vecunit52_in_stream_valid_e;
reg [7:0] vecslice_vectile13_vecunit52_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile13_vecunit52_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile13_vecunit52_const_b = 8'd0;
wire [1:0] vecslice_vectile13_vecunit53_state;
wire [7:0] vecslice_vectile13_vecunit53_in_stream_w;
wire vecslice_vectile13_vecunit53_in_stream_valid_w;
wire [7:0] vecslice_vectile13_vecunit53_in_stream_e;
wire vecslice_vectile13_vecunit53_in_stream_valid_e;
reg [7:0] vecslice_vectile13_vecunit53_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile13_vecunit53_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile13_vecunit53_const_b = 8'd0;
wire [1:0] vecslice_vectile13_vecunit54_state;
wire [7:0] vecslice_vectile13_vecunit54_in_stream_w;
wire vecslice_vectile13_vecunit54_in_stream_valid_w;
wire [7:0] vecslice_vectile13_vecunit54_in_stream_e;
wire vecslice_vectile13_vecunit54_in_stream_valid_e;
reg [7:0] vecslice_vectile13_vecunit54_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile13_vecunit54_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile13_vecunit54_const_b = 8'd0;
wire [1:0] vecslice_vectile13_vecunit55_state;
wire [7:0] vecslice_vectile13_vecunit55_in_stream_w;
wire vecslice_vectile13_vecunit55_in_stream_valid_w;
wire [7:0] vecslice_vectile13_vecunit55_in_stream_e;
wire vecslice_vectile13_vecunit55_in_stream_valid_e;
reg [7:0] vecslice_vectile13_vecunit55_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile13_vecunit55_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile13_vecunit55_const_b = 8'd0;
wire [31:0] vecslice_vectile14_in_stream_w;
wire vecslice_vectile14_in_stream_valid_w;
wire [31:0] vecslice_vectile14_in_stream_e;
wire vecslice_vectile14_in_stream_valid_e;
wire [63:0] vecslice_vectile14_in_ins;
wire vecslice_vectile14_in_ins_valid;
reg [31:0] vecslice_vectile14_out_stream_e;
wire vecslice_vectile14_out_stream_valid_e;
reg [31:0] vecslice_vectile14_out_stream_w;
wire vecslice_vectile14_out_stream_valid_w;
reg [63:0] vecslice_vectile14_out_ins = 64'd0;
reg vecslice_vectile14_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile14_state = 2'd0;
wire [1:0] vecslice_vectile14_vecunit56_state;
wire [7:0] vecslice_vectile14_vecunit56_in_stream_w;
wire vecslice_vectile14_vecunit56_in_stream_valid_w;
wire [7:0] vecslice_vectile14_vecunit56_in_stream_e;
wire vecslice_vectile14_vecunit56_in_stream_valid_e;
reg [7:0] vecslice_vectile14_vecunit56_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile14_vecunit56_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile14_vecunit56_const_b = 8'd0;
wire [1:0] vecslice_vectile14_vecunit57_state;
wire [7:0] vecslice_vectile14_vecunit57_in_stream_w;
wire vecslice_vectile14_vecunit57_in_stream_valid_w;
wire [7:0] vecslice_vectile14_vecunit57_in_stream_e;
wire vecslice_vectile14_vecunit57_in_stream_valid_e;
reg [7:0] vecslice_vectile14_vecunit57_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile14_vecunit57_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile14_vecunit57_const_b = 8'd0;
wire [1:0] vecslice_vectile14_vecunit58_state;
wire [7:0] vecslice_vectile14_vecunit58_in_stream_w;
wire vecslice_vectile14_vecunit58_in_stream_valid_w;
wire [7:0] vecslice_vectile14_vecunit58_in_stream_e;
wire vecslice_vectile14_vecunit58_in_stream_valid_e;
reg [7:0] vecslice_vectile14_vecunit58_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile14_vecunit58_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile14_vecunit58_const_b = 8'd0;
wire [1:0] vecslice_vectile14_vecunit59_state;
wire [7:0] vecslice_vectile14_vecunit59_in_stream_w;
wire vecslice_vectile14_vecunit59_in_stream_valid_w;
wire [7:0] vecslice_vectile14_vecunit59_in_stream_e;
wire vecslice_vectile14_vecunit59_in_stream_valid_e;
reg [7:0] vecslice_vectile14_vecunit59_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile14_vecunit59_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile14_vecunit59_const_b = 8'd0;
wire [31:0] vecslice_vectile15_in_stream_w;
wire vecslice_vectile15_in_stream_valid_w;
wire [31:0] vecslice_vectile15_in_stream_e;
wire vecslice_vectile15_in_stream_valid_e;
wire [63:0] vecslice_vectile15_in_ins;
wire vecslice_vectile15_in_ins_valid;
reg [31:0] vecslice_vectile15_out_stream_e;
wire vecslice_vectile15_out_stream_valid_e;
reg [31:0] vecslice_vectile15_out_stream_w;
wire vecslice_vectile15_out_stream_valid_w;
reg [63:0] vecslice_vectile15_out_ins = 64'd0;
reg vecslice_vectile15_out_ins_valid = 1'd0;
reg [1:0] vecslice_vectile15_state = 2'd0;
wire [1:0] vecslice_vectile15_vecunit60_state;
wire [7:0] vecslice_vectile15_vecunit60_in_stream_w;
wire vecslice_vectile15_vecunit60_in_stream_valid_w;
wire [7:0] vecslice_vectile15_vecunit60_in_stream_e;
wire vecslice_vectile15_vecunit60_in_stream_valid_e;
reg [7:0] vecslice_vectile15_vecunit60_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile15_vecunit60_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile15_vecunit60_const_b = 8'd0;
wire [1:0] vecslice_vectile15_vecunit61_state;
wire [7:0] vecslice_vectile15_vecunit61_in_stream_w;
wire vecslice_vectile15_vecunit61_in_stream_valid_w;
wire [7:0] vecslice_vectile15_vecunit61_in_stream_e;
wire vecslice_vectile15_vecunit61_in_stream_valid_e;
reg [7:0] vecslice_vectile15_vecunit61_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile15_vecunit61_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile15_vecunit61_const_b = 8'd0;
wire [1:0] vecslice_vectile15_vecunit62_state;
wire [7:0] vecslice_vectile15_vecunit62_in_stream_w;
wire vecslice_vectile15_vecunit62_in_stream_valid_w;
wire [7:0] vecslice_vectile15_vecunit62_in_stream_e;
wire vecslice_vectile15_vecunit62_in_stream_valid_e;
reg [7:0] vecslice_vectile15_vecunit62_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile15_vecunit62_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile15_vecunit62_const_b = 8'd0;
wire [1:0] vecslice_vectile15_vecunit63_state;
wire [7:0] vecslice_vectile15_vecunit63_in_stream_w;
wire vecslice_vectile15_vecunit63_in_stream_valid_w;
wire [7:0] vecslice_vectile15_vecunit63_in_stream_e;
wire vecslice_vectile15_vecunit63_in_stream_valid_e;
reg [7:0] vecslice_vectile15_vecunit63_out_stream_e = 8'd0;
reg [7:0] vecslice_vectile15_vecunit63_out_stream_w = 8'd0;
reg [7:0] vecslice_vectile15_vecunit63_const_b = 8'd0;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign vecslice_vectile0_in_stream_w = in_stream_w[31:0];
assign vecslice_vectile0_in_stream_valid_w = in_stream_w_valid[0];
assign vecslice_vectile0_out_stream_valid_e = out_stream_e_valid[0];
assign vecslice_vectile0_in_stream_e = in_stream_e[31:0];
assign vecslice_vectile0_in_stream_valid_e = in_stream_e_valid[0];
assign vecslice_vectile0_out_stream_valid_w = out_stream_w_valid[0];
assign vecslice_vectile0_in_ins = in_ins;
assign vecslice_vectile0_in_ins_valid = in_ins_valid;
assign vecslice0 = vecslice_vectile0_out_ins;
assign vecslice16 = vecslice_vectile0_out_ins_valid;
assign vecslice_vectile1_in_stream_w = in_stream_w[63:32];
assign vecslice_vectile1_in_stream_valid_w = in_stream_w_valid[1];
assign vecslice_vectile1_out_stream_valid_e = out_stream_e_valid[1];
assign vecslice_vectile1_in_stream_e = in_stream_e[63:32];
assign vecslice_vectile1_in_stream_valid_e = in_stream_e_valid[1];
assign vecslice_vectile1_out_stream_valid_w = out_stream_w_valid[1];
assign vecslice_vectile1_in_ins = vecslice0;
assign vecslice_vectile1_in_ins_valid = vecslice16;
assign vecslice1 = vecslice_vectile1_out_ins;
assign vecslice17 = vecslice_vectile1_out_ins_valid;
assign vecslice_vectile2_in_stream_w = in_stream_w[95:64];
assign vecslice_vectile2_in_stream_valid_w = in_stream_w_valid[2];
assign vecslice_vectile2_out_stream_valid_e = out_stream_e_valid[2];
assign vecslice_vectile2_in_stream_e = in_stream_e[95:64];
assign vecslice_vectile2_in_stream_valid_e = in_stream_e_valid[2];
assign vecslice_vectile2_out_stream_valid_w = out_stream_w_valid[2];
assign vecslice_vectile2_in_ins = vecslice1;
assign vecslice_vectile2_in_ins_valid = vecslice17;
assign vecslice2 = vecslice_vectile2_out_ins;
assign vecslice18 = vecslice_vectile2_out_ins_valid;
assign vecslice_vectile3_in_stream_w = in_stream_w[127:96];
assign vecslice_vectile3_in_stream_valid_w = in_stream_w_valid[3];
assign vecslice_vectile3_out_stream_valid_e = out_stream_e_valid[3];
assign vecslice_vectile3_in_stream_e = in_stream_e[127:96];
assign vecslice_vectile3_in_stream_valid_e = in_stream_e_valid[3];
assign vecslice_vectile3_out_stream_valid_w = out_stream_w_valid[3];
assign vecslice_vectile3_in_ins = vecslice2;
assign vecslice_vectile3_in_ins_valid = vecslice18;
assign vecslice3 = vecslice_vectile3_out_ins;
assign vecslice19 = vecslice_vectile3_out_ins_valid;
assign vecslice_vectile4_in_stream_w = in_stream_w[159:128];
assign vecslice_vectile4_in_stream_valid_w = in_stream_w_valid[4];
assign vecslice_vectile4_out_stream_valid_e = out_stream_e_valid[4];
assign vecslice_vectile4_in_stream_e = in_stream_e[159:128];
assign vecslice_vectile4_in_stream_valid_e = in_stream_e_valid[4];
assign vecslice_vectile4_out_stream_valid_w = out_stream_w_valid[4];
assign vecslice_vectile4_in_ins = vecslice3;
assign vecslice_vectile4_in_ins_valid = vecslice19;
assign vecslice4 = vecslice_vectile4_out_ins;
assign vecslice20 = vecslice_vectile4_out_ins_valid;
assign vecslice_vectile5_in_stream_w = in_stream_w[191:160];
assign vecslice_vectile5_in_stream_valid_w = in_stream_w_valid[5];
assign vecslice_vectile5_out_stream_valid_e = out_stream_e_valid[5];
assign vecslice_vectile5_in_stream_e = in_stream_e[191:160];
assign vecslice_vectile5_in_stream_valid_e = in_stream_e_valid[5];
assign vecslice_vectile5_out_stream_valid_w = out_stream_w_valid[5];
assign vecslice_vectile5_in_ins = vecslice4;
assign vecslice_vectile5_in_ins_valid = vecslice20;
assign vecslice5 = vecslice_vectile5_out_ins;
assign vecslice21 = vecslice_vectile5_out_ins_valid;
assign vecslice_vectile6_in_stream_w = in_stream_w[223:192];
assign vecslice_vectile6_in_stream_valid_w = in_stream_w_valid[6];
assign vecslice_vectile6_out_stream_valid_e = out_stream_e_valid[6];
assign vecslice_vectile6_in_stream_e = in_stream_e[223:192];
assign vecslice_vectile6_in_stream_valid_e = in_stream_e_valid[6];
assign vecslice_vectile6_out_stream_valid_w = out_stream_w_valid[6];
assign vecslice_vectile6_in_ins = vecslice5;
assign vecslice_vectile6_in_ins_valid = vecslice21;
assign vecslice6 = vecslice_vectile6_out_ins;
assign vecslice22 = vecslice_vectile6_out_ins_valid;
assign vecslice_vectile7_in_stream_w = in_stream_w[255:224];
assign vecslice_vectile7_in_stream_valid_w = in_stream_w_valid[7];
assign vecslice_vectile7_out_stream_valid_e = out_stream_e_valid[7];
assign vecslice_vectile7_in_stream_e = in_stream_e[255:224];
assign vecslice_vectile7_in_stream_valid_e = in_stream_e_valid[7];
assign vecslice_vectile7_out_stream_valid_w = out_stream_w_valid[7];
assign vecslice_vectile7_in_ins = vecslice6;
assign vecslice_vectile7_in_ins_valid = vecslice22;
assign vecslice7 = vecslice_vectile7_out_ins;
assign vecslice23 = vecslice_vectile7_out_ins_valid;
assign vecslice_vectile8_in_stream_w = in_stream_w[287:256];
assign vecslice_vectile8_in_stream_valid_w = in_stream_w_valid[8];
assign vecslice_vectile8_out_stream_valid_e = out_stream_e_valid[8];
assign vecslice_vectile8_in_stream_e = in_stream_e[287:256];
assign vecslice_vectile8_in_stream_valid_e = in_stream_e_valid[8];
assign vecslice_vectile8_out_stream_valid_w = out_stream_w_valid[8];
assign vecslice_vectile8_in_ins = vecslice7;
assign vecslice_vectile8_in_ins_valid = vecslice23;
assign vecslice8 = vecslice_vectile8_out_ins;
assign vecslice24 = vecslice_vectile8_out_ins_valid;
assign vecslice_vectile9_in_stream_w = in_stream_w[319:288];
assign vecslice_vectile9_in_stream_valid_w = in_stream_w_valid[9];
assign vecslice_vectile9_out_stream_valid_e = out_stream_e_valid[9];
assign vecslice_vectile9_in_stream_e = in_stream_e[319:288];
assign vecslice_vectile9_in_stream_valid_e = in_stream_e_valid[9];
assign vecslice_vectile9_out_stream_valid_w = out_stream_w_valid[9];
assign vecslice_vectile9_in_ins = vecslice8;
assign vecslice_vectile9_in_ins_valid = vecslice24;
assign vecslice9 = vecslice_vectile9_out_ins;
assign vecslice25 = vecslice_vectile9_out_ins_valid;
assign vecslice_vectile10_in_stream_w = in_stream_w[351:320];
assign vecslice_vectile10_in_stream_valid_w = in_stream_w_valid[10];
assign vecslice_vectile10_out_stream_valid_e = out_stream_e_valid[10];
assign vecslice_vectile10_in_stream_e = in_stream_e[351:320];
assign vecslice_vectile10_in_stream_valid_e = in_stream_e_valid[10];
assign vecslice_vectile10_out_stream_valid_w = out_stream_w_valid[10];
assign vecslice_vectile10_in_ins = vecslice9;
assign vecslice_vectile10_in_ins_valid = vecslice25;
assign vecslice10 = vecslice_vectile10_out_ins;
assign vecslice26 = vecslice_vectile10_out_ins_valid;
assign vecslice_vectile11_in_stream_w = in_stream_w[383:352];
assign vecslice_vectile11_in_stream_valid_w = in_stream_w_valid[11];
assign vecslice_vectile11_out_stream_valid_e = out_stream_e_valid[11];
assign vecslice_vectile11_in_stream_e = in_stream_e[383:352];
assign vecslice_vectile11_in_stream_valid_e = in_stream_e_valid[11];
assign vecslice_vectile11_out_stream_valid_w = out_stream_w_valid[11];
assign vecslice_vectile11_in_ins = vecslice10;
assign vecslice_vectile11_in_ins_valid = vecslice26;
assign vecslice11 = vecslice_vectile11_out_ins;
assign vecslice27 = vecslice_vectile11_out_ins_valid;
assign vecslice_vectile12_in_stream_w = in_stream_w[415:384];
assign vecslice_vectile12_in_stream_valid_w = in_stream_w_valid[12];
assign vecslice_vectile12_out_stream_valid_e = out_stream_e_valid[12];
assign vecslice_vectile12_in_stream_e = in_stream_e[415:384];
assign vecslice_vectile12_in_stream_valid_e = in_stream_e_valid[12];
assign vecslice_vectile12_out_stream_valid_w = out_stream_w_valid[12];
assign vecslice_vectile12_in_ins = vecslice11;
assign vecslice_vectile12_in_ins_valid = vecslice27;
assign vecslice12 = vecslice_vectile12_out_ins;
assign vecslice28 = vecslice_vectile12_out_ins_valid;
assign vecslice_vectile13_in_stream_w = in_stream_w[447:416];
assign vecslice_vectile13_in_stream_valid_w = in_stream_w_valid[13];
assign vecslice_vectile13_out_stream_valid_e = out_stream_e_valid[13];
assign vecslice_vectile13_in_stream_e = in_stream_e[447:416];
assign vecslice_vectile13_in_stream_valid_e = in_stream_e_valid[13];
assign vecslice_vectile13_out_stream_valid_w = out_stream_w_valid[13];
assign vecslice_vectile13_in_ins = vecslice12;
assign vecslice_vectile13_in_ins_valid = vecslice28;
assign vecslice13 = vecslice_vectile13_out_ins;
assign vecslice29 = vecslice_vectile13_out_ins_valid;
assign vecslice_vectile14_in_stream_w = in_stream_w[479:448];
assign vecslice_vectile14_in_stream_valid_w = in_stream_w_valid[14];
assign vecslice_vectile14_out_stream_valid_e = out_stream_e_valid[14];
assign vecslice_vectile14_in_stream_e = in_stream_e[479:448];
assign vecslice_vectile14_in_stream_valid_e = in_stream_e_valid[14];
assign vecslice_vectile14_out_stream_valid_w = out_stream_w_valid[14];
assign vecslice_vectile14_in_ins = vecslice13;
assign vecslice_vectile14_in_ins_valid = vecslice29;
assign vecslice14 = vecslice_vectile14_out_ins;
assign vecslice30 = vecslice_vectile14_out_ins_valid;
assign vecslice_vectile15_in_stream_w = in_stream_w[511:480];
assign vecslice_vectile15_in_stream_valid_w = in_stream_w_valid[15];

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	out_stream_e <= 512'd0;
	out_stream_e[31:0] <= vecslice_vectile0_out_stream_e;
	out_stream_e[63:32] <= vecslice_vectile1_out_stream_e;
	out_stream_e[95:64] <= vecslice_vectile2_out_stream_e;
	out_stream_e[127:96] <= vecslice_vectile3_out_stream_e;
	out_stream_e[159:128] <= vecslice_vectile4_out_stream_e;
	out_stream_e[191:160] <= vecslice_vectile5_out_stream_e;
	out_stream_e[223:192] <= vecslice_vectile6_out_stream_e;
	out_stream_e[255:224] <= vecslice_vectile7_out_stream_e;
	out_stream_e[287:256] <= vecslice_vectile8_out_stream_e;
	out_stream_e[319:288] <= vecslice_vectile9_out_stream_e;
	out_stream_e[351:320] <= vecslice_vectile10_out_stream_e;
	out_stream_e[383:352] <= vecslice_vectile11_out_stream_e;
	out_stream_e[415:384] <= vecslice_vectile12_out_stream_e;
	out_stream_e[447:416] <= vecslice_vectile13_out_stream_e;
	out_stream_e[479:448] <= vecslice_vectile14_out_stream_e;
	out_stream_e[511:480] <= vecslice_vectile15_out_stream_e;
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile15_out_stream_valid_e = out_stream_e_valid[15];
assign vecslice_vectile15_in_stream_e = in_stream_e[511:480];
assign vecslice_vectile15_in_stream_valid_e = in_stream_e_valid[15];

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	out_stream_w <= 512'd0;
	out_stream_w[31:0] <= vecslice_vectile0_out_stream_w;
	out_stream_w[63:32] <= vecslice_vectile1_out_stream_w;
	out_stream_w[95:64] <= vecslice_vectile2_out_stream_w;
	out_stream_w[127:96] <= vecslice_vectile3_out_stream_w;
	out_stream_w[159:128] <= vecslice_vectile4_out_stream_w;
	out_stream_w[191:160] <= vecslice_vectile5_out_stream_w;
	out_stream_w[223:192] <= vecslice_vectile6_out_stream_w;
	out_stream_w[255:224] <= vecslice_vectile7_out_stream_w;
	out_stream_w[287:256] <= vecslice_vectile8_out_stream_w;
	out_stream_w[319:288] <= vecslice_vectile9_out_stream_w;
	out_stream_w[351:320] <= vecslice_vectile10_out_stream_w;
	out_stream_w[383:352] <= vecslice_vectile11_out_stream_w;
	out_stream_w[415:384] <= vecslice_vectile12_out_stream_w;
	out_stream_w[447:416] <= vecslice_vectile13_out_stream_w;
	out_stream_w[479:448] <= vecslice_vectile14_out_stream_w;
	out_stream_w[511:480] <= vecslice_vectile15_out_stream_w;
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile15_out_stream_valid_w = out_stream_w_valid[15];
assign vecslice_vectile15_in_ins = vecslice14;
assign vecslice_vectile15_in_ins_valid = vecslice30;
assign vecslice15 = vecslice_vectile15_out_ins;
assign vecslice31 = vecslice_vectile15_out_ins_valid;
assign vecslice_vectile0_vecunit0_state = vecslice_vectile0_state;
assign vecslice_vectile0_vecunit0_in_stream_w = vecslice_vectile0_in_stream_w[7:0];
assign vecslice_vectile0_vecunit0_in_stream_valid_w = vecslice_vectile0_in_stream_valid_w;
assign vecslice_vectile0_vecunit0_in_stream_e = vecslice_vectile0_in_stream_e[7:0];
assign vecslice_vectile0_vecunit0_in_stream_valid_e = vecslice_vectile0_in_stream_valid_e;
assign vecslice_vectile0_vecunit1_state = vecslice_vectile0_state;
assign vecslice_vectile0_vecunit1_in_stream_w = vecslice_vectile0_in_stream_w[15:8];
assign vecslice_vectile0_vecunit1_in_stream_valid_w = vecslice_vectile0_in_stream_valid_w;
assign vecslice_vectile0_vecunit1_in_stream_e = vecslice_vectile0_in_stream_e[15:8];
assign vecslice_vectile0_vecunit1_in_stream_valid_e = vecslice_vectile0_in_stream_valid_e;
assign vecslice_vectile0_vecunit2_state = vecslice_vectile0_state;
assign vecslice_vectile0_vecunit2_in_stream_w = vecslice_vectile0_in_stream_w[23:16];
assign vecslice_vectile0_vecunit2_in_stream_valid_w = vecslice_vectile0_in_stream_valid_w;
assign vecslice_vectile0_vecunit2_in_stream_e = vecslice_vectile0_in_stream_e[23:16];
assign vecslice_vectile0_vecunit2_in_stream_valid_e = vecslice_vectile0_in_stream_valid_e;
assign vecslice_vectile0_vecunit3_state = vecslice_vectile0_state;
assign vecslice_vectile0_vecunit3_in_stream_w = vecslice_vectile0_in_stream_w[31:24];
assign vecslice_vectile0_vecunit3_in_stream_valid_w = vecslice_vectile0_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	vecslice_vectile0_out_stream_e <= 32'd0;
	vecslice_vectile0_out_stream_e[7:0] <= vecslice_vectile0_vecunit0_out_stream_e;
	vecslice_vectile0_out_stream_e[15:8] <= vecslice_vectile0_vecunit1_out_stream_e;
	vecslice_vectile0_out_stream_e[23:16] <= vecslice_vectile0_vecunit2_out_stream_e;
	vecslice_vectile0_out_stream_e[31:24] <= vecslice_vectile0_vecunit3_out_stream_e;
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile0_vecunit3_in_stream_e = vecslice_vectile0_in_stream_e[31:24];
assign vecslice_vectile0_vecunit3_in_stream_valid_e = vecslice_vectile0_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	vecslice_vectile0_out_stream_w <= 32'd0;
	vecslice_vectile0_out_stream_w[7:0] <= vecslice_vectile0_vecunit0_out_stream_w;
	vecslice_vectile0_out_stream_w[15:8] <= vecslice_vectile0_vecunit1_out_stream_w;
	vecslice_vectile0_out_stream_w[23:16] <= vecslice_vectile0_vecunit2_out_stream_w;
	vecslice_vectile0_out_stream_w[31:24] <= vecslice_vectile0_vecunit3_out_stream_w;
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile1_vecunit4_state = vecslice_vectile1_state;
assign vecslice_vectile1_vecunit4_in_stream_w = vecslice_vectile1_in_stream_w[7:0];
assign vecslice_vectile1_vecunit4_in_stream_valid_w = vecslice_vectile1_in_stream_valid_w;
assign vecslice_vectile1_vecunit4_in_stream_e = vecslice_vectile1_in_stream_e[7:0];
assign vecslice_vectile1_vecunit4_in_stream_valid_e = vecslice_vectile1_in_stream_valid_e;
assign vecslice_vectile1_vecunit5_state = vecslice_vectile1_state;
assign vecslice_vectile1_vecunit5_in_stream_w = vecslice_vectile1_in_stream_w[15:8];
assign vecslice_vectile1_vecunit5_in_stream_valid_w = vecslice_vectile1_in_stream_valid_w;
assign vecslice_vectile1_vecunit5_in_stream_e = vecslice_vectile1_in_stream_e[15:8];
assign vecslice_vectile1_vecunit5_in_stream_valid_e = vecslice_vectile1_in_stream_valid_e;
assign vecslice_vectile1_vecunit6_state = vecslice_vectile1_state;
assign vecslice_vectile1_vecunit6_in_stream_w = vecslice_vectile1_in_stream_w[23:16];
assign vecslice_vectile1_vecunit6_in_stream_valid_w = vecslice_vectile1_in_stream_valid_w;
assign vecslice_vectile1_vecunit6_in_stream_e = vecslice_vectile1_in_stream_e[23:16];
assign vecslice_vectile1_vecunit6_in_stream_valid_e = vecslice_vectile1_in_stream_valid_e;
assign vecslice_vectile1_vecunit7_state = vecslice_vectile1_state;
assign vecslice_vectile1_vecunit7_in_stream_w = vecslice_vectile1_in_stream_w[31:24];
assign vecslice_vectile1_vecunit7_in_stream_valid_w = vecslice_vectile1_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_4;
// synthesis translate_on
always @(*) begin
	vecslice_vectile1_out_stream_e <= 32'd0;
	vecslice_vectile1_out_stream_e[7:0] <= vecslice_vectile1_vecunit4_out_stream_e;
	vecslice_vectile1_out_stream_e[15:8] <= vecslice_vectile1_vecunit5_out_stream_e;
	vecslice_vectile1_out_stream_e[23:16] <= vecslice_vectile1_vecunit6_out_stream_e;
	vecslice_vectile1_out_stream_e[31:24] <= vecslice_vectile1_vecunit7_out_stream_e;
// synthesis translate_off
	dummy_d_4 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile1_vecunit7_in_stream_e = vecslice_vectile1_in_stream_e[31:24];
assign vecslice_vectile1_vecunit7_in_stream_valid_e = vecslice_vectile1_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_5;
// synthesis translate_on
always @(*) begin
	vecslice_vectile1_out_stream_w <= 32'd0;
	vecslice_vectile1_out_stream_w[7:0] <= vecslice_vectile1_vecunit4_out_stream_w;
	vecslice_vectile1_out_stream_w[15:8] <= vecslice_vectile1_vecunit5_out_stream_w;
	vecslice_vectile1_out_stream_w[23:16] <= vecslice_vectile1_vecunit6_out_stream_w;
	vecslice_vectile1_out_stream_w[31:24] <= vecslice_vectile1_vecunit7_out_stream_w;
// synthesis translate_off
	dummy_d_5 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile2_vecunit8_state = vecslice_vectile2_state;
assign vecslice_vectile2_vecunit8_in_stream_w = vecslice_vectile2_in_stream_w[7:0];
assign vecslice_vectile2_vecunit8_in_stream_valid_w = vecslice_vectile2_in_stream_valid_w;
assign vecslice_vectile2_vecunit8_in_stream_e = vecslice_vectile2_in_stream_e[7:0];
assign vecslice_vectile2_vecunit8_in_stream_valid_e = vecslice_vectile2_in_stream_valid_e;
assign vecslice_vectile2_vecunit9_state = vecslice_vectile2_state;
assign vecslice_vectile2_vecunit9_in_stream_w = vecslice_vectile2_in_stream_w[15:8];
assign vecslice_vectile2_vecunit9_in_stream_valid_w = vecslice_vectile2_in_stream_valid_w;
assign vecslice_vectile2_vecunit9_in_stream_e = vecslice_vectile2_in_stream_e[15:8];
assign vecslice_vectile2_vecunit9_in_stream_valid_e = vecslice_vectile2_in_stream_valid_e;
assign vecslice_vectile2_vecunit10_state = vecslice_vectile2_state;
assign vecslice_vectile2_vecunit10_in_stream_w = vecslice_vectile2_in_stream_w[23:16];
assign vecslice_vectile2_vecunit10_in_stream_valid_w = vecslice_vectile2_in_stream_valid_w;
assign vecslice_vectile2_vecunit10_in_stream_e = vecslice_vectile2_in_stream_e[23:16];
assign vecslice_vectile2_vecunit10_in_stream_valid_e = vecslice_vectile2_in_stream_valid_e;
assign vecslice_vectile2_vecunit11_state = vecslice_vectile2_state;
assign vecslice_vectile2_vecunit11_in_stream_w = vecslice_vectile2_in_stream_w[31:24];
assign vecslice_vectile2_vecunit11_in_stream_valid_w = vecslice_vectile2_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_6;
// synthesis translate_on
always @(*) begin
	vecslice_vectile2_out_stream_e <= 32'd0;
	vecslice_vectile2_out_stream_e[7:0] <= vecslice_vectile2_vecunit8_out_stream_e;
	vecslice_vectile2_out_stream_e[15:8] <= vecslice_vectile2_vecunit9_out_stream_e;
	vecslice_vectile2_out_stream_e[23:16] <= vecslice_vectile2_vecunit10_out_stream_e;
	vecslice_vectile2_out_stream_e[31:24] <= vecslice_vectile2_vecunit11_out_stream_e;
// synthesis translate_off
	dummy_d_6 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile2_vecunit11_in_stream_e = vecslice_vectile2_in_stream_e[31:24];
assign vecslice_vectile2_vecunit11_in_stream_valid_e = vecslice_vectile2_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_7;
// synthesis translate_on
always @(*) begin
	vecslice_vectile2_out_stream_w <= 32'd0;
	vecslice_vectile2_out_stream_w[7:0] <= vecslice_vectile2_vecunit8_out_stream_w;
	vecslice_vectile2_out_stream_w[15:8] <= vecslice_vectile2_vecunit9_out_stream_w;
	vecslice_vectile2_out_stream_w[23:16] <= vecslice_vectile2_vecunit10_out_stream_w;
	vecslice_vectile2_out_stream_w[31:24] <= vecslice_vectile2_vecunit11_out_stream_w;
// synthesis translate_off
	dummy_d_7 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile3_vecunit12_state = vecslice_vectile3_state;
assign vecslice_vectile3_vecunit12_in_stream_w = vecslice_vectile3_in_stream_w[7:0];
assign vecslice_vectile3_vecunit12_in_stream_valid_w = vecslice_vectile3_in_stream_valid_w;
assign vecslice_vectile3_vecunit12_in_stream_e = vecslice_vectile3_in_stream_e[7:0];
assign vecslice_vectile3_vecunit12_in_stream_valid_e = vecslice_vectile3_in_stream_valid_e;
assign vecslice_vectile3_vecunit13_state = vecslice_vectile3_state;
assign vecslice_vectile3_vecunit13_in_stream_w = vecslice_vectile3_in_stream_w[15:8];
assign vecslice_vectile3_vecunit13_in_stream_valid_w = vecslice_vectile3_in_stream_valid_w;
assign vecslice_vectile3_vecunit13_in_stream_e = vecslice_vectile3_in_stream_e[15:8];
assign vecslice_vectile3_vecunit13_in_stream_valid_e = vecslice_vectile3_in_stream_valid_e;
assign vecslice_vectile3_vecunit14_state = vecslice_vectile3_state;
assign vecslice_vectile3_vecunit14_in_stream_w = vecslice_vectile3_in_stream_w[23:16];
assign vecslice_vectile3_vecunit14_in_stream_valid_w = vecslice_vectile3_in_stream_valid_w;
assign vecslice_vectile3_vecunit14_in_stream_e = vecslice_vectile3_in_stream_e[23:16];
assign vecslice_vectile3_vecunit14_in_stream_valid_e = vecslice_vectile3_in_stream_valid_e;
assign vecslice_vectile3_vecunit15_state = vecslice_vectile3_state;
assign vecslice_vectile3_vecunit15_in_stream_w = vecslice_vectile3_in_stream_w[31:24];
assign vecslice_vectile3_vecunit15_in_stream_valid_w = vecslice_vectile3_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_8;
// synthesis translate_on
always @(*) begin
	vecslice_vectile3_out_stream_e <= 32'd0;
	vecslice_vectile3_out_stream_e[7:0] <= vecslice_vectile3_vecunit12_out_stream_e;
	vecslice_vectile3_out_stream_e[15:8] <= vecslice_vectile3_vecunit13_out_stream_e;
	vecslice_vectile3_out_stream_e[23:16] <= vecslice_vectile3_vecunit14_out_stream_e;
	vecslice_vectile3_out_stream_e[31:24] <= vecslice_vectile3_vecunit15_out_stream_e;
// synthesis translate_off
	dummy_d_8 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile3_vecunit15_in_stream_e = vecslice_vectile3_in_stream_e[31:24];
assign vecslice_vectile3_vecunit15_in_stream_valid_e = vecslice_vectile3_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_9;
// synthesis translate_on
always @(*) begin
	vecslice_vectile3_out_stream_w <= 32'd0;
	vecslice_vectile3_out_stream_w[7:0] <= vecslice_vectile3_vecunit12_out_stream_w;
	vecslice_vectile3_out_stream_w[15:8] <= vecslice_vectile3_vecunit13_out_stream_w;
	vecslice_vectile3_out_stream_w[23:16] <= vecslice_vectile3_vecunit14_out_stream_w;
	vecslice_vectile3_out_stream_w[31:24] <= vecslice_vectile3_vecunit15_out_stream_w;
// synthesis translate_off
	dummy_d_9 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile4_vecunit16_state = vecslice_vectile4_state;
assign vecslice_vectile4_vecunit16_in_stream_w = vecslice_vectile4_in_stream_w[7:0];
assign vecslice_vectile4_vecunit16_in_stream_valid_w = vecslice_vectile4_in_stream_valid_w;
assign vecslice_vectile4_vecunit16_in_stream_e = vecslice_vectile4_in_stream_e[7:0];
assign vecslice_vectile4_vecunit16_in_stream_valid_e = vecslice_vectile4_in_stream_valid_e;
assign vecslice_vectile4_vecunit17_state = vecslice_vectile4_state;
assign vecslice_vectile4_vecunit17_in_stream_w = vecslice_vectile4_in_stream_w[15:8];
assign vecslice_vectile4_vecunit17_in_stream_valid_w = vecslice_vectile4_in_stream_valid_w;
assign vecslice_vectile4_vecunit17_in_stream_e = vecslice_vectile4_in_stream_e[15:8];
assign vecslice_vectile4_vecunit17_in_stream_valid_e = vecslice_vectile4_in_stream_valid_e;
assign vecslice_vectile4_vecunit18_state = vecslice_vectile4_state;
assign vecslice_vectile4_vecunit18_in_stream_w = vecslice_vectile4_in_stream_w[23:16];
assign vecslice_vectile4_vecunit18_in_stream_valid_w = vecslice_vectile4_in_stream_valid_w;
assign vecslice_vectile4_vecunit18_in_stream_e = vecslice_vectile4_in_stream_e[23:16];
assign vecslice_vectile4_vecunit18_in_stream_valid_e = vecslice_vectile4_in_stream_valid_e;
assign vecslice_vectile4_vecunit19_state = vecslice_vectile4_state;
assign vecslice_vectile4_vecunit19_in_stream_w = vecslice_vectile4_in_stream_w[31:24];
assign vecslice_vectile4_vecunit19_in_stream_valid_w = vecslice_vectile4_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_10;
// synthesis translate_on
always @(*) begin
	vecslice_vectile4_out_stream_e <= 32'd0;
	vecslice_vectile4_out_stream_e[7:0] <= vecslice_vectile4_vecunit16_out_stream_e;
	vecslice_vectile4_out_stream_e[15:8] <= vecslice_vectile4_vecunit17_out_stream_e;
	vecslice_vectile4_out_stream_e[23:16] <= vecslice_vectile4_vecunit18_out_stream_e;
	vecslice_vectile4_out_stream_e[31:24] <= vecslice_vectile4_vecunit19_out_stream_e;
// synthesis translate_off
	dummy_d_10 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile4_vecunit19_in_stream_e = vecslice_vectile4_in_stream_e[31:24];
assign vecslice_vectile4_vecunit19_in_stream_valid_e = vecslice_vectile4_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_11;
// synthesis translate_on
always @(*) begin
	vecslice_vectile4_out_stream_w <= 32'd0;
	vecslice_vectile4_out_stream_w[7:0] <= vecslice_vectile4_vecunit16_out_stream_w;
	vecslice_vectile4_out_stream_w[15:8] <= vecslice_vectile4_vecunit17_out_stream_w;
	vecslice_vectile4_out_stream_w[23:16] <= vecslice_vectile4_vecunit18_out_stream_w;
	vecslice_vectile4_out_stream_w[31:24] <= vecslice_vectile4_vecunit19_out_stream_w;
// synthesis translate_off
	dummy_d_11 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile5_vecunit20_state = vecslice_vectile5_state;
assign vecslice_vectile5_vecunit20_in_stream_w = vecslice_vectile5_in_stream_w[7:0];
assign vecslice_vectile5_vecunit20_in_stream_valid_w = vecslice_vectile5_in_stream_valid_w;
assign vecslice_vectile5_vecunit20_in_stream_e = vecslice_vectile5_in_stream_e[7:0];
assign vecslice_vectile5_vecunit20_in_stream_valid_e = vecslice_vectile5_in_stream_valid_e;
assign vecslice_vectile5_vecunit21_state = vecslice_vectile5_state;
assign vecslice_vectile5_vecunit21_in_stream_w = vecslice_vectile5_in_stream_w[15:8];
assign vecslice_vectile5_vecunit21_in_stream_valid_w = vecslice_vectile5_in_stream_valid_w;
assign vecslice_vectile5_vecunit21_in_stream_e = vecslice_vectile5_in_stream_e[15:8];
assign vecslice_vectile5_vecunit21_in_stream_valid_e = vecslice_vectile5_in_stream_valid_e;
assign vecslice_vectile5_vecunit22_state = vecslice_vectile5_state;
assign vecslice_vectile5_vecunit22_in_stream_w = vecslice_vectile5_in_stream_w[23:16];
assign vecslice_vectile5_vecunit22_in_stream_valid_w = vecslice_vectile5_in_stream_valid_w;
assign vecslice_vectile5_vecunit22_in_stream_e = vecslice_vectile5_in_stream_e[23:16];
assign vecslice_vectile5_vecunit22_in_stream_valid_e = vecslice_vectile5_in_stream_valid_e;
assign vecslice_vectile5_vecunit23_state = vecslice_vectile5_state;
assign vecslice_vectile5_vecunit23_in_stream_w = vecslice_vectile5_in_stream_w[31:24];
assign vecslice_vectile5_vecunit23_in_stream_valid_w = vecslice_vectile5_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_12;
// synthesis translate_on
always @(*) begin
	vecslice_vectile5_out_stream_e <= 32'd0;
	vecslice_vectile5_out_stream_e[7:0] <= vecslice_vectile5_vecunit20_out_stream_e;
	vecslice_vectile5_out_stream_e[15:8] <= vecslice_vectile5_vecunit21_out_stream_e;
	vecslice_vectile5_out_stream_e[23:16] <= vecslice_vectile5_vecunit22_out_stream_e;
	vecslice_vectile5_out_stream_e[31:24] <= vecslice_vectile5_vecunit23_out_stream_e;
// synthesis translate_off
	dummy_d_12 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile5_vecunit23_in_stream_e = vecslice_vectile5_in_stream_e[31:24];
assign vecslice_vectile5_vecunit23_in_stream_valid_e = vecslice_vectile5_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_13;
// synthesis translate_on
always @(*) begin
	vecslice_vectile5_out_stream_w <= 32'd0;
	vecslice_vectile5_out_stream_w[7:0] <= vecslice_vectile5_vecunit20_out_stream_w;
	vecslice_vectile5_out_stream_w[15:8] <= vecslice_vectile5_vecunit21_out_stream_w;
	vecslice_vectile5_out_stream_w[23:16] <= vecslice_vectile5_vecunit22_out_stream_w;
	vecslice_vectile5_out_stream_w[31:24] <= vecslice_vectile5_vecunit23_out_stream_w;
// synthesis translate_off
	dummy_d_13 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile6_vecunit24_state = vecslice_vectile6_state;
assign vecslice_vectile6_vecunit24_in_stream_w = vecslice_vectile6_in_stream_w[7:0];
assign vecslice_vectile6_vecunit24_in_stream_valid_w = vecslice_vectile6_in_stream_valid_w;
assign vecslice_vectile6_vecunit24_in_stream_e = vecslice_vectile6_in_stream_e[7:0];
assign vecslice_vectile6_vecunit24_in_stream_valid_e = vecslice_vectile6_in_stream_valid_e;
assign vecslice_vectile6_vecunit25_state = vecslice_vectile6_state;
assign vecslice_vectile6_vecunit25_in_stream_w = vecslice_vectile6_in_stream_w[15:8];
assign vecslice_vectile6_vecunit25_in_stream_valid_w = vecslice_vectile6_in_stream_valid_w;
assign vecslice_vectile6_vecunit25_in_stream_e = vecslice_vectile6_in_stream_e[15:8];
assign vecslice_vectile6_vecunit25_in_stream_valid_e = vecslice_vectile6_in_stream_valid_e;
assign vecslice_vectile6_vecunit26_state = vecslice_vectile6_state;
assign vecslice_vectile6_vecunit26_in_stream_w = vecslice_vectile6_in_stream_w[23:16];
assign vecslice_vectile6_vecunit26_in_stream_valid_w = vecslice_vectile6_in_stream_valid_w;
assign vecslice_vectile6_vecunit26_in_stream_e = vecslice_vectile6_in_stream_e[23:16];
assign vecslice_vectile6_vecunit26_in_stream_valid_e = vecslice_vectile6_in_stream_valid_e;
assign vecslice_vectile6_vecunit27_state = vecslice_vectile6_state;
assign vecslice_vectile6_vecunit27_in_stream_w = vecslice_vectile6_in_stream_w[31:24];
assign vecslice_vectile6_vecunit27_in_stream_valid_w = vecslice_vectile6_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_14;
// synthesis translate_on
always @(*) begin
	vecslice_vectile6_out_stream_e <= 32'd0;
	vecslice_vectile6_out_stream_e[7:0] <= vecslice_vectile6_vecunit24_out_stream_e;
	vecslice_vectile6_out_stream_e[15:8] <= vecslice_vectile6_vecunit25_out_stream_e;
	vecslice_vectile6_out_stream_e[23:16] <= vecslice_vectile6_vecunit26_out_stream_e;
	vecslice_vectile6_out_stream_e[31:24] <= vecslice_vectile6_vecunit27_out_stream_e;
// synthesis translate_off
	dummy_d_14 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile6_vecunit27_in_stream_e = vecslice_vectile6_in_stream_e[31:24];
assign vecslice_vectile6_vecunit27_in_stream_valid_e = vecslice_vectile6_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_15;
// synthesis translate_on
always @(*) begin
	vecslice_vectile6_out_stream_w <= 32'd0;
	vecslice_vectile6_out_stream_w[7:0] <= vecslice_vectile6_vecunit24_out_stream_w;
	vecslice_vectile6_out_stream_w[15:8] <= vecslice_vectile6_vecunit25_out_stream_w;
	vecslice_vectile6_out_stream_w[23:16] <= vecslice_vectile6_vecunit26_out_stream_w;
	vecslice_vectile6_out_stream_w[31:24] <= vecslice_vectile6_vecunit27_out_stream_w;
// synthesis translate_off
	dummy_d_15 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile7_vecunit28_state = vecslice_vectile7_state;
assign vecslice_vectile7_vecunit28_in_stream_w = vecslice_vectile7_in_stream_w[7:0];
assign vecslice_vectile7_vecunit28_in_stream_valid_w = vecslice_vectile7_in_stream_valid_w;
assign vecslice_vectile7_vecunit28_in_stream_e = vecslice_vectile7_in_stream_e[7:0];
assign vecslice_vectile7_vecunit28_in_stream_valid_e = vecslice_vectile7_in_stream_valid_e;
assign vecslice_vectile7_vecunit29_state = vecslice_vectile7_state;
assign vecslice_vectile7_vecunit29_in_stream_w = vecslice_vectile7_in_stream_w[15:8];
assign vecslice_vectile7_vecunit29_in_stream_valid_w = vecslice_vectile7_in_stream_valid_w;
assign vecslice_vectile7_vecunit29_in_stream_e = vecslice_vectile7_in_stream_e[15:8];
assign vecslice_vectile7_vecunit29_in_stream_valid_e = vecslice_vectile7_in_stream_valid_e;
assign vecslice_vectile7_vecunit30_state = vecslice_vectile7_state;
assign vecslice_vectile7_vecunit30_in_stream_w = vecslice_vectile7_in_stream_w[23:16];
assign vecslice_vectile7_vecunit30_in_stream_valid_w = vecslice_vectile7_in_stream_valid_w;
assign vecslice_vectile7_vecunit30_in_stream_e = vecslice_vectile7_in_stream_e[23:16];
assign vecslice_vectile7_vecunit30_in_stream_valid_e = vecslice_vectile7_in_stream_valid_e;
assign vecslice_vectile7_vecunit31_state = vecslice_vectile7_state;
assign vecslice_vectile7_vecunit31_in_stream_w = vecslice_vectile7_in_stream_w[31:24];
assign vecslice_vectile7_vecunit31_in_stream_valid_w = vecslice_vectile7_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_16;
// synthesis translate_on
always @(*) begin
	vecslice_vectile7_out_stream_e <= 32'd0;
	vecslice_vectile7_out_stream_e[7:0] <= vecslice_vectile7_vecunit28_out_stream_e;
	vecslice_vectile7_out_stream_e[15:8] <= vecslice_vectile7_vecunit29_out_stream_e;
	vecslice_vectile7_out_stream_e[23:16] <= vecslice_vectile7_vecunit30_out_stream_e;
	vecslice_vectile7_out_stream_e[31:24] <= vecslice_vectile7_vecunit31_out_stream_e;
// synthesis translate_off
	dummy_d_16 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile7_vecunit31_in_stream_e = vecslice_vectile7_in_stream_e[31:24];
assign vecslice_vectile7_vecunit31_in_stream_valid_e = vecslice_vectile7_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_17;
// synthesis translate_on
always @(*) begin
	vecslice_vectile7_out_stream_w <= 32'd0;
	vecslice_vectile7_out_stream_w[7:0] <= vecslice_vectile7_vecunit28_out_stream_w;
	vecslice_vectile7_out_stream_w[15:8] <= vecslice_vectile7_vecunit29_out_stream_w;
	vecslice_vectile7_out_stream_w[23:16] <= vecslice_vectile7_vecunit30_out_stream_w;
	vecslice_vectile7_out_stream_w[31:24] <= vecslice_vectile7_vecunit31_out_stream_w;
// synthesis translate_off
	dummy_d_17 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile8_vecunit32_state = vecslice_vectile8_state;
assign vecslice_vectile8_vecunit32_in_stream_w = vecslice_vectile8_in_stream_w[7:0];
assign vecslice_vectile8_vecunit32_in_stream_valid_w = vecslice_vectile8_in_stream_valid_w;
assign vecslice_vectile8_vecunit32_in_stream_e = vecslice_vectile8_in_stream_e[7:0];
assign vecslice_vectile8_vecunit32_in_stream_valid_e = vecslice_vectile8_in_stream_valid_e;
assign vecslice_vectile8_vecunit33_state = vecslice_vectile8_state;
assign vecslice_vectile8_vecunit33_in_stream_w = vecslice_vectile8_in_stream_w[15:8];
assign vecslice_vectile8_vecunit33_in_stream_valid_w = vecslice_vectile8_in_stream_valid_w;
assign vecslice_vectile8_vecunit33_in_stream_e = vecslice_vectile8_in_stream_e[15:8];
assign vecslice_vectile8_vecunit33_in_stream_valid_e = vecslice_vectile8_in_stream_valid_e;
assign vecslice_vectile8_vecunit34_state = vecslice_vectile8_state;
assign vecslice_vectile8_vecunit34_in_stream_w = vecslice_vectile8_in_stream_w[23:16];
assign vecslice_vectile8_vecunit34_in_stream_valid_w = vecslice_vectile8_in_stream_valid_w;
assign vecslice_vectile8_vecunit34_in_stream_e = vecslice_vectile8_in_stream_e[23:16];
assign vecslice_vectile8_vecunit34_in_stream_valid_e = vecslice_vectile8_in_stream_valid_e;
assign vecslice_vectile8_vecunit35_state = vecslice_vectile8_state;
assign vecslice_vectile8_vecunit35_in_stream_w = vecslice_vectile8_in_stream_w[31:24];
assign vecslice_vectile8_vecunit35_in_stream_valid_w = vecslice_vectile8_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_18;
// synthesis translate_on
always @(*) begin
	vecslice_vectile8_out_stream_e <= 32'd0;
	vecslice_vectile8_out_stream_e[7:0] <= vecslice_vectile8_vecunit32_out_stream_e;
	vecslice_vectile8_out_stream_e[15:8] <= vecslice_vectile8_vecunit33_out_stream_e;
	vecslice_vectile8_out_stream_e[23:16] <= vecslice_vectile8_vecunit34_out_stream_e;
	vecslice_vectile8_out_stream_e[31:24] <= vecslice_vectile8_vecunit35_out_stream_e;
// synthesis translate_off
	dummy_d_18 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile8_vecunit35_in_stream_e = vecslice_vectile8_in_stream_e[31:24];
assign vecslice_vectile8_vecunit35_in_stream_valid_e = vecslice_vectile8_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_19;
// synthesis translate_on
always @(*) begin
	vecslice_vectile8_out_stream_w <= 32'd0;
	vecslice_vectile8_out_stream_w[7:0] <= vecslice_vectile8_vecunit32_out_stream_w;
	vecslice_vectile8_out_stream_w[15:8] <= vecslice_vectile8_vecunit33_out_stream_w;
	vecslice_vectile8_out_stream_w[23:16] <= vecslice_vectile8_vecunit34_out_stream_w;
	vecslice_vectile8_out_stream_w[31:24] <= vecslice_vectile8_vecunit35_out_stream_w;
// synthesis translate_off
	dummy_d_19 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile9_vecunit36_state = vecslice_vectile9_state;
assign vecslice_vectile9_vecunit36_in_stream_w = vecslice_vectile9_in_stream_w[7:0];
assign vecslice_vectile9_vecunit36_in_stream_valid_w = vecslice_vectile9_in_stream_valid_w;
assign vecslice_vectile9_vecunit36_in_stream_e = vecslice_vectile9_in_stream_e[7:0];
assign vecslice_vectile9_vecunit36_in_stream_valid_e = vecslice_vectile9_in_stream_valid_e;
assign vecslice_vectile9_vecunit37_state = vecslice_vectile9_state;
assign vecslice_vectile9_vecunit37_in_stream_w = vecslice_vectile9_in_stream_w[15:8];
assign vecslice_vectile9_vecunit37_in_stream_valid_w = vecslice_vectile9_in_stream_valid_w;
assign vecslice_vectile9_vecunit37_in_stream_e = vecslice_vectile9_in_stream_e[15:8];
assign vecslice_vectile9_vecunit37_in_stream_valid_e = vecslice_vectile9_in_stream_valid_e;
assign vecslice_vectile9_vecunit38_state = vecslice_vectile9_state;
assign vecslice_vectile9_vecunit38_in_stream_w = vecslice_vectile9_in_stream_w[23:16];
assign vecslice_vectile9_vecunit38_in_stream_valid_w = vecslice_vectile9_in_stream_valid_w;
assign vecslice_vectile9_vecunit38_in_stream_e = vecslice_vectile9_in_stream_e[23:16];
assign vecslice_vectile9_vecunit38_in_stream_valid_e = vecslice_vectile9_in_stream_valid_e;
assign vecslice_vectile9_vecunit39_state = vecslice_vectile9_state;
assign vecslice_vectile9_vecunit39_in_stream_w = vecslice_vectile9_in_stream_w[31:24];
assign vecslice_vectile9_vecunit39_in_stream_valid_w = vecslice_vectile9_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_20;
// synthesis translate_on
always @(*) begin
	vecslice_vectile9_out_stream_e <= 32'd0;
	vecslice_vectile9_out_stream_e[7:0] <= vecslice_vectile9_vecunit36_out_stream_e;
	vecslice_vectile9_out_stream_e[15:8] <= vecslice_vectile9_vecunit37_out_stream_e;
	vecslice_vectile9_out_stream_e[23:16] <= vecslice_vectile9_vecunit38_out_stream_e;
	vecslice_vectile9_out_stream_e[31:24] <= vecslice_vectile9_vecunit39_out_stream_e;
// synthesis translate_off
	dummy_d_20 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile9_vecunit39_in_stream_e = vecslice_vectile9_in_stream_e[31:24];
assign vecslice_vectile9_vecunit39_in_stream_valid_e = vecslice_vectile9_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_21;
// synthesis translate_on
always @(*) begin
	vecslice_vectile9_out_stream_w <= 32'd0;
	vecslice_vectile9_out_stream_w[7:0] <= vecslice_vectile9_vecunit36_out_stream_w;
	vecslice_vectile9_out_stream_w[15:8] <= vecslice_vectile9_vecunit37_out_stream_w;
	vecslice_vectile9_out_stream_w[23:16] <= vecslice_vectile9_vecunit38_out_stream_w;
	vecslice_vectile9_out_stream_w[31:24] <= vecslice_vectile9_vecunit39_out_stream_w;
// synthesis translate_off
	dummy_d_21 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile10_vecunit40_state = vecslice_vectile10_state;
assign vecslice_vectile10_vecunit40_in_stream_w = vecslice_vectile10_in_stream_w[7:0];
assign vecslice_vectile10_vecunit40_in_stream_valid_w = vecslice_vectile10_in_stream_valid_w;
assign vecslice_vectile10_vecunit40_in_stream_e = vecslice_vectile10_in_stream_e[7:0];
assign vecslice_vectile10_vecunit40_in_stream_valid_e = vecslice_vectile10_in_stream_valid_e;
assign vecslice_vectile10_vecunit41_state = vecslice_vectile10_state;
assign vecslice_vectile10_vecunit41_in_stream_w = vecslice_vectile10_in_stream_w[15:8];
assign vecslice_vectile10_vecunit41_in_stream_valid_w = vecslice_vectile10_in_stream_valid_w;
assign vecslice_vectile10_vecunit41_in_stream_e = vecslice_vectile10_in_stream_e[15:8];
assign vecslice_vectile10_vecunit41_in_stream_valid_e = vecslice_vectile10_in_stream_valid_e;
assign vecslice_vectile10_vecunit42_state = vecslice_vectile10_state;
assign vecslice_vectile10_vecunit42_in_stream_w = vecslice_vectile10_in_stream_w[23:16];
assign vecslice_vectile10_vecunit42_in_stream_valid_w = vecslice_vectile10_in_stream_valid_w;
assign vecslice_vectile10_vecunit42_in_stream_e = vecslice_vectile10_in_stream_e[23:16];
assign vecslice_vectile10_vecunit42_in_stream_valid_e = vecslice_vectile10_in_stream_valid_e;
assign vecslice_vectile10_vecunit43_state = vecslice_vectile10_state;
assign vecslice_vectile10_vecunit43_in_stream_w = vecslice_vectile10_in_stream_w[31:24];
assign vecslice_vectile10_vecunit43_in_stream_valid_w = vecslice_vectile10_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_22;
// synthesis translate_on
always @(*) begin
	vecslice_vectile10_out_stream_e <= 32'd0;
	vecslice_vectile10_out_stream_e[7:0] <= vecslice_vectile10_vecunit40_out_stream_e;
	vecslice_vectile10_out_stream_e[15:8] <= vecslice_vectile10_vecunit41_out_stream_e;
	vecslice_vectile10_out_stream_e[23:16] <= vecslice_vectile10_vecunit42_out_stream_e;
	vecslice_vectile10_out_stream_e[31:24] <= vecslice_vectile10_vecunit43_out_stream_e;
// synthesis translate_off
	dummy_d_22 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile10_vecunit43_in_stream_e = vecslice_vectile10_in_stream_e[31:24];
assign vecslice_vectile10_vecunit43_in_stream_valid_e = vecslice_vectile10_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_23;
// synthesis translate_on
always @(*) begin
	vecslice_vectile10_out_stream_w <= 32'd0;
	vecslice_vectile10_out_stream_w[7:0] <= vecslice_vectile10_vecunit40_out_stream_w;
	vecslice_vectile10_out_stream_w[15:8] <= vecslice_vectile10_vecunit41_out_stream_w;
	vecslice_vectile10_out_stream_w[23:16] <= vecslice_vectile10_vecunit42_out_stream_w;
	vecslice_vectile10_out_stream_w[31:24] <= vecslice_vectile10_vecunit43_out_stream_w;
// synthesis translate_off
	dummy_d_23 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile11_vecunit44_state = vecslice_vectile11_state;
assign vecslice_vectile11_vecunit44_in_stream_w = vecslice_vectile11_in_stream_w[7:0];
assign vecslice_vectile11_vecunit44_in_stream_valid_w = vecslice_vectile11_in_stream_valid_w;
assign vecslice_vectile11_vecunit44_in_stream_e = vecslice_vectile11_in_stream_e[7:0];
assign vecslice_vectile11_vecunit44_in_stream_valid_e = vecslice_vectile11_in_stream_valid_e;
assign vecslice_vectile11_vecunit45_state = vecslice_vectile11_state;
assign vecslice_vectile11_vecunit45_in_stream_w = vecslice_vectile11_in_stream_w[15:8];
assign vecslice_vectile11_vecunit45_in_stream_valid_w = vecslice_vectile11_in_stream_valid_w;
assign vecslice_vectile11_vecunit45_in_stream_e = vecslice_vectile11_in_stream_e[15:8];
assign vecslice_vectile11_vecunit45_in_stream_valid_e = vecslice_vectile11_in_stream_valid_e;
assign vecslice_vectile11_vecunit46_state = vecslice_vectile11_state;
assign vecslice_vectile11_vecunit46_in_stream_w = vecslice_vectile11_in_stream_w[23:16];
assign vecslice_vectile11_vecunit46_in_stream_valid_w = vecslice_vectile11_in_stream_valid_w;
assign vecslice_vectile11_vecunit46_in_stream_e = vecslice_vectile11_in_stream_e[23:16];
assign vecslice_vectile11_vecunit46_in_stream_valid_e = vecslice_vectile11_in_stream_valid_e;
assign vecslice_vectile11_vecunit47_state = vecslice_vectile11_state;
assign vecslice_vectile11_vecunit47_in_stream_w = vecslice_vectile11_in_stream_w[31:24];
assign vecslice_vectile11_vecunit47_in_stream_valid_w = vecslice_vectile11_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_24;
// synthesis translate_on
always @(*) begin
	vecslice_vectile11_out_stream_e <= 32'd0;
	vecslice_vectile11_out_stream_e[7:0] <= vecslice_vectile11_vecunit44_out_stream_e;
	vecslice_vectile11_out_stream_e[15:8] <= vecslice_vectile11_vecunit45_out_stream_e;
	vecslice_vectile11_out_stream_e[23:16] <= vecslice_vectile11_vecunit46_out_stream_e;
	vecslice_vectile11_out_stream_e[31:24] <= vecslice_vectile11_vecunit47_out_stream_e;
// synthesis translate_off
	dummy_d_24 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile11_vecunit47_in_stream_e = vecslice_vectile11_in_stream_e[31:24];
assign vecslice_vectile11_vecunit47_in_stream_valid_e = vecslice_vectile11_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_25;
// synthesis translate_on
always @(*) begin
	vecslice_vectile11_out_stream_w <= 32'd0;
	vecslice_vectile11_out_stream_w[7:0] <= vecslice_vectile11_vecunit44_out_stream_w;
	vecslice_vectile11_out_stream_w[15:8] <= vecslice_vectile11_vecunit45_out_stream_w;
	vecslice_vectile11_out_stream_w[23:16] <= vecslice_vectile11_vecunit46_out_stream_w;
	vecslice_vectile11_out_stream_w[31:24] <= vecslice_vectile11_vecunit47_out_stream_w;
// synthesis translate_off
	dummy_d_25 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile12_vecunit48_state = vecslice_vectile12_state;
assign vecslice_vectile12_vecunit48_in_stream_w = vecslice_vectile12_in_stream_w[7:0];
assign vecslice_vectile12_vecunit48_in_stream_valid_w = vecslice_vectile12_in_stream_valid_w;
assign vecslice_vectile12_vecunit48_in_stream_e = vecslice_vectile12_in_stream_e[7:0];
assign vecslice_vectile12_vecunit48_in_stream_valid_e = vecslice_vectile12_in_stream_valid_e;
assign vecslice_vectile12_vecunit49_state = vecslice_vectile12_state;
assign vecslice_vectile12_vecunit49_in_stream_w = vecslice_vectile12_in_stream_w[15:8];
assign vecslice_vectile12_vecunit49_in_stream_valid_w = vecslice_vectile12_in_stream_valid_w;
assign vecslice_vectile12_vecunit49_in_stream_e = vecslice_vectile12_in_stream_e[15:8];
assign vecslice_vectile12_vecunit49_in_stream_valid_e = vecslice_vectile12_in_stream_valid_e;
assign vecslice_vectile12_vecunit50_state = vecslice_vectile12_state;
assign vecslice_vectile12_vecunit50_in_stream_w = vecslice_vectile12_in_stream_w[23:16];
assign vecslice_vectile12_vecunit50_in_stream_valid_w = vecslice_vectile12_in_stream_valid_w;
assign vecslice_vectile12_vecunit50_in_stream_e = vecslice_vectile12_in_stream_e[23:16];
assign vecslice_vectile12_vecunit50_in_stream_valid_e = vecslice_vectile12_in_stream_valid_e;
assign vecslice_vectile12_vecunit51_state = vecslice_vectile12_state;
assign vecslice_vectile12_vecunit51_in_stream_w = vecslice_vectile12_in_stream_w[31:24];
assign vecslice_vectile12_vecunit51_in_stream_valid_w = vecslice_vectile12_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_26;
// synthesis translate_on
always @(*) begin
	vecslice_vectile12_out_stream_e <= 32'd0;
	vecslice_vectile12_out_stream_e[7:0] <= vecslice_vectile12_vecunit48_out_stream_e;
	vecslice_vectile12_out_stream_e[15:8] <= vecslice_vectile12_vecunit49_out_stream_e;
	vecslice_vectile12_out_stream_e[23:16] <= vecslice_vectile12_vecunit50_out_stream_e;
	vecslice_vectile12_out_stream_e[31:24] <= vecslice_vectile12_vecunit51_out_stream_e;
// synthesis translate_off
	dummy_d_26 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile12_vecunit51_in_stream_e = vecslice_vectile12_in_stream_e[31:24];
assign vecslice_vectile12_vecunit51_in_stream_valid_e = vecslice_vectile12_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_27;
// synthesis translate_on
always @(*) begin
	vecslice_vectile12_out_stream_w <= 32'd0;
	vecslice_vectile12_out_stream_w[7:0] <= vecslice_vectile12_vecunit48_out_stream_w;
	vecslice_vectile12_out_stream_w[15:8] <= vecslice_vectile12_vecunit49_out_stream_w;
	vecslice_vectile12_out_stream_w[23:16] <= vecslice_vectile12_vecunit50_out_stream_w;
	vecslice_vectile12_out_stream_w[31:24] <= vecslice_vectile12_vecunit51_out_stream_w;
// synthesis translate_off
	dummy_d_27 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile13_vecunit52_state = vecslice_vectile13_state;
assign vecslice_vectile13_vecunit52_in_stream_w = vecslice_vectile13_in_stream_w[7:0];
assign vecslice_vectile13_vecunit52_in_stream_valid_w = vecslice_vectile13_in_stream_valid_w;
assign vecslice_vectile13_vecunit52_in_stream_e = vecslice_vectile13_in_stream_e[7:0];
assign vecslice_vectile13_vecunit52_in_stream_valid_e = vecslice_vectile13_in_stream_valid_e;
assign vecslice_vectile13_vecunit53_state = vecslice_vectile13_state;
assign vecslice_vectile13_vecunit53_in_stream_w = vecslice_vectile13_in_stream_w[15:8];
assign vecslice_vectile13_vecunit53_in_stream_valid_w = vecslice_vectile13_in_stream_valid_w;
assign vecslice_vectile13_vecunit53_in_stream_e = vecslice_vectile13_in_stream_e[15:8];
assign vecslice_vectile13_vecunit53_in_stream_valid_e = vecslice_vectile13_in_stream_valid_e;
assign vecslice_vectile13_vecunit54_state = vecslice_vectile13_state;
assign vecslice_vectile13_vecunit54_in_stream_w = vecslice_vectile13_in_stream_w[23:16];
assign vecslice_vectile13_vecunit54_in_stream_valid_w = vecslice_vectile13_in_stream_valid_w;
assign vecslice_vectile13_vecunit54_in_stream_e = vecslice_vectile13_in_stream_e[23:16];
assign vecslice_vectile13_vecunit54_in_stream_valid_e = vecslice_vectile13_in_stream_valid_e;
assign vecslice_vectile13_vecunit55_state = vecslice_vectile13_state;
assign vecslice_vectile13_vecunit55_in_stream_w = vecslice_vectile13_in_stream_w[31:24];
assign vecslice_vectile13_vecunit55_in_stream_valid_w = vecslice_vectile13_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_28;
// synthesis translate_on
always @(*) begin
	vecslice_vectile13_out_stream_e <= 32'd0;
	vecslice_vectile13_out_stream_e[7:0] <= vecslice_vectile13_vecunit52_out_stream_e;
	vecslice_vectile13_out_stream_e[15:8] <= vecslice_vectile13_vecunit53_out_stream_e;
	vecslice_vectile13_out_stream_e[23:16] <= vecslice_vectile13_vecunit54_out_stream_e;
	vecslice_vectile13_out_stream_e[31:24] <= vecslice_vectile13_vecunit55_out_stream_e;
// synthesis translate_off
	dummy_d_28 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile13_vecunit55_in_stream_e = vecslice_vectile13_in_stream_e[31:24];
assign vecslice_vectile13_vecunit55_in_stream_valid_e = vecslice_vectile13_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_29;
// synthesis translate_on
always @(*) begin
	vecslice_vectile13_out_stream_w <= 32'd0;
	vecslice_vectile13_out_stream_w[7:0] <= vecslice_vectile13_vecunit52_out_stream_w;
	vecslice_vectile13_out_stream_w[15:8] <= vecslice_vectile13_vecunit53_out_stream_w;
	vecslice_vectile13_out_stream_w[23:16] <= vecslice_vectile13_vecunit54_out_stream_w;
	vecslice_vectile13_out_stream_w[31:24] <= vecslice_vectile13_vecunit55_out_stream_w;
// synthesis translate_off
	dummy_d_29 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile14_vecunit56_state = vecslice_vectile14_state;
assign vecslice_vectile14_vecunit56_in_stream_w = vecslice_vectile14_in_stream_w[7:0];
assign vecslice_vectile14_vecunit56_in_stream_valid_w = vecslice_vectile14_in_stream_valid_w;
assign vecslice_vectile14_vecunit56_in_stream_e = vecslice_vectile14_in_stream_e[7:0];
assign vecslice_vectile14_vecunit56_in_stream_valid_e = vecslice_vectile14_in_stream_valid_e;
assign vecslice_vectile14_vecunit57_state = vecslice_vectile14_state;
assign vecslice_vectile14_vecunit57_in_stream_w = vecslice_vectile14_in_stream_w[15:8];
assign vecslice_vectile14_vecunit57_in_stream_valid_w = vecslice_vectile14_in_stream_valid_w;
assign vecslice_vectile14_vecunit57_in_stream_e = vecslice_vectile14_in_stream_e[15:8];
assign vecslice_vectile14_vecunit57_in_stream_valid_e = vecslice_vectile14_in_stream_valid_e;
assign vecslice_vectile14_vecunit58_state = vecslice_vectile14_state;
assign vecslice_vectile14_vecunit58_in_stream_w = vecslice_vectile14_in_stream_w[23:16];
assign vecslice_vectile14_vecunit58_in_stream_valid_w = vecslice_vectile14_in_stream_valid_w;
assign vecslice_vectile14_vecunit58_in_stream_e = vecslice_vectile14_in_stream_e[23:16];
assign vecslice_vectile14_vecunit58_in_stream_valid_e = vecslice_vectile14_in_stream_valid_e;
assign vecslice_vectile14_vecunit59_state = vecslice_vectile14_state;
assign vecslice_vectile14_vecunit59_in_stream_w = vecslice_vectile14_in_stream_w[31:24];
assign vecslice_vectile14_vecunit59_in_stream_valid_w = vecslice_vectile14_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_30;
// synthesis translate_on
always @(*) begin
	vecslice_vectile14_out_stream_e <= 32'd0;
	vecslice_vectile14_out_stream_e[7:0] <= vecslice_vectile14_vecunit56_out_stream_e;
	vecslice_vectile14_out_stream_e[15:8] <= vecslice_vectile14_vecunit57_out_stream_e;
	vecslice_vectile14_out_stream_e[23:16] <= vecslice_vectile14_vecunit58_out_stream_e;
	vecslice_vectile14_out_stream_e[31:24] <= vecslice_vectile14_vecunit59_out_stream_e;
// synthesis translate_off
	dummy_d_30 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile14_vecunit59_in_stream_e = vecslice_vectile14_in_stream_e[31:24];
assign vecslice_vectile14_vecunit59_in_stream_valid_e = vecslice_vectile14_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_31;
// synthesis translate_on
always @(*) begin
	vecslice_vectile14_out_stream_w <= 32'd0;
	vecslice_vectile14_out_stream_w[7:0] <= vecslice_vectile14_vecunit56_out_stream_w;
	vecslice_vectile14_out_stream_w[15:8] <= vecslice_vectile14_vecunit57_out_stream_w;
	vecslice_vectile14_out_stream_w[23:16] <= vecslice_vectile14_vecunit58_out_stream_w;
	vecslice_vectile14_out_stream_w[31:24] <= vecslice_vectile14_vecunit59_out_stream_w;
// synthesis translate_off
	dummy_d_31 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile15_vecunit60_state = vecslice_vectile15_state;
assign vecslice_vectile15_vecunit60_in_stream_w = vecslice_vectile15_in_stream_w[7:0];
assign vecslice_vectile15_vecunit60_in_stream_valid_w = vecslice_vectile15_in_stream_valid_w;
assign vecslice_vectile15_vecunit60_in_stream_e = vecslice_vectile15_in_stream_e[7:0];
assign vecslice_vectile15_vecunit60_in_stream_valid_e = vecslice_vectile15_in_stream_valid_e;
assign vecslice_vectile15_vecunit61_state = vecslice_vectile15_state;
assign vecslice_vectile15_vecunit61_in_stream_w = vecslice_vectile15_in_stream_w[15:8];
assign vecslice_vectile15_vecunit61_in_stream_valid_w = vecslice_vectile15_in_stream_valid_w;
assign vecslice_vectile15_vecunit61_in_stream_e = vecslice_vectile15_in_stream_e[15:8];
assign vecslice_vectile15_vecunit61_in_stream_valid_e = vecslice_vectile15_in_stream_valid_e;
assign vecslice_vectile15_vecunit62_state = vecslice_vectile15_state;
assign vecslice_vectile15_vecunit62_in_stream_w = vecslice_vectile15_in_stream_w[23:16];
assign vecslice_vectile15_vecunit62_in_stream_valid_w = vecslice_vectile15_in_stream_valid_w;
assign vecslice_vectile15_vecunit62_in_stream_e = vecslice_vectile15_in_stream_e[23:16];
assign vecslice_vectile15_vecunit62_in_stream_valid_e = vecslice_vectile15_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_32;
// synthesis translate_on
always @(*) begin
	sys_clk <= 1'd0;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
	sys_clk <= sys_clk;
// synthesis translate_off
	dummy_d_32 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile15_vecunit63_state = vecslice_vectile15_state;
assign vecslice_vectile15_vecunit63_in_stream_w = vecslice_vectile15_in_stream_w[31:24];
assign vecslice_vectile15_vecunit63_in_stream_valid_w = vecslice_vectile15_in_stream_valid_w;

// synthesis translate_off
reg dummy_d_33;
// synthesis translate_on
always @(*) begin
	vecslice_vectile15_out_stream_e <= 32'd0;
	vecslice_vectile15_out_stream_e[7:0] <= vecslice_vectile15_vecunit60_out_stream_e;
	vecslice_vectile15_out_stream_e[15:8] <= vecslice_vectile15_vecunit61_out_stream_e;
	vecslice_vectile15_out_stream_e[23:16] <= vecslice_vectile15_vecunit62_out_stream_e;
	vecslice_vectile15_out_stream_e[31:24] <= vecslice_vectile15_vecunit63_out_stream_e;
// synthesis translate_off
	dummy_d_33 <= dummy_s;
// synthesis translate_on
end
assign vecslice_vectile15_vecunit63_in_stream_e = vecslice_vectile15_in_stream_e[31:24];
assign vecslice_vectile15_vecunit63_in_stream_valid_e = vecslice_vectile15_in_stream_valid_e;

// synthesis translate_off
reg dummy_d_34;
// synthesis translate_on
always @(*) begin
	vecslice_vectile15_out_stream_w <= 32'd0;
	vecslice_vectile15_out_stream_w[7:0] <= vecslice_vectile15_vecunit60_out_stream_w;
	vecslice_vectile15_out_stream_w[15:8] <= vecslice_vectile15_vecunit61_out_stream_w;
	vecslice_vectile15_out_stream_w[23:16] <= vecslice_vectile15_vecunit62_out_stream_w;
	vecslice_vectile15_out_stream_w[31:24] <= vecslice_vectile15_vecunit63_out_stream_w;
// synthesis translate_off
	dummy_d_34 <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	case (vecslice_vectile0_state)
		1'd0: begin
			vecslice_vectile0_out_stream_valid_w <= vecslice_vectile0_in_stream_valid_w;
			vecslice_vectile0_out_stream_valid_e <= vecslice_vectile0_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile0_out_stream_valid_w <= 1'd0;
			vecslice_vectile0_out_stream_valid_e <= vecslice_vectile0_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile0_out_stream_valid_w <= vecslice_vectile0_in_stream_valid_w;
			vecslice_vectile0_out_stream_valid_e <= vecslice_vectile0_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile0_out_stream_valid_w <= 1'd0;
			vecslice_vectile0_out_stream_valid_e <= vecslice_vectile0_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile0_in_ins_valid & (vecslice_vectile0_in_ins[7:15] == 1'd0))) begin
		case (vecslice_vectile0_in_ins[15:23])
			1'd0: begin
				vecslice_vectile0_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile0_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile0_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile0_state <= 2'd3;
			end
		endcase
		vecslice_vectile0_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile0_out_ins <= vecslice_vectile0_in_ins;
		vecslice_vectile0_out_ins_valid <= vecslice_vectile0_in_ins_valid;
	end
	case (vecslice_vectile0_vecunit0_state)
		1'd0: begin
			vecslice_vectile0_vecunit0_out_stream_w <= vecslice_vectile0_vecunit0_in_stream_w;
			vecslice_vectile0_vecunit0_out_stream_e <= vecslice_vectile0_vecunit0_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile0_vecunit0_in_stream_valid_w) begin
				vecslice_vectile0_vecunit0_const_b <= vecslice_vectile0_vecunit0_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile0_vecunit0_in_stream_valid_e) begin
				vecslice_vectile0_vecunit0_out_stream_e <= (vecslice_vectile0_vecunit0_in_stream_e + vecslice_vectile0_vecunit0_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile0_vecunit0_out_stream_e <= vecslice_vectile0_vecunit0_in_stream_w;
		end
	endcase
	case (vecslice_vectile0_vecunit1_state)
		1'd0: begin
			vecslice_vectile0_vecunit1_out_stream_w <= vecslice_vectile0_vecunit1_in_stream_w;
			vecslice_vectile0_vecunit1_out_stream_e <= vecslice_vectile0_vecunit1_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile0_vecunit1_in_stream_valid_w) begin
				vecslice_vectile0_vecunit1_const_b <= vecslice_vectile0_vecunit1_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile0_vecunit1_in_stream_valid_e) begin
				vecslice_vectile0_vecunit1_out_stream_e <= (vecslice_vectile0_vecunit1_in_stream_e + vecslice_vectile0_vecunit1_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile0_vecunit1_out_stream_e <= vecslice_vectile0_vecunit1_in_stream_w;
		end
	endcase
	case (vecslice_vectile0_vecunit2_state)
		1'd0: begin
			vecslice_vectile0_vecunit2_out_stream_w <= vecslice_vectile0_vecunit2_in_stream_w;
			vecslice_vectile0_vecunit2_out_stream_e <= vecslice_vectile0_vecunit2_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile0_vecunit2_in_stream_valid_w) begin
				vecslice_vectile0_vecunit2_const_b <= vecslice_vectile0_vecunit2_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile0_vecunit2_in_stream_valid_e) begin
				vecslice_vectile0_vecunit2_out_stream_e <= (vecslice_vectile0_vecunit2_in_stream_e + vecslice_vectile0_vecunit2_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile0_vecunit2_out_stream_e <= vecslice_vectile0_vecunit2_in_stream_w;
		end
	endcase
	case (vecslice_vectile0_vecunit3_state)
		1'd0: begin
			vecslice_vectile0_vecunit3_out_stream_w <= vecslice_vectile0_vecunit3_in_stream_w;
			vecslice_vectile0_vecunit3_out_stream_e <= vecslice_vectile0_vecunit3_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile0_vecunit3_in_stream_valid_w) begin
				vecslice_vectile0_vecunit3_const_b <= vecslice_vectile0_vecunit3_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile0_vecunit3_in_stream_valid_e) begin
				vecslice_vectile0_vecunit3_out_stream_e <= (vecslice_vectile0_vecunit3_in_stream_e + vecslice_vectile0_vecunit3_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile0_vecunit3_out_stream_e <= vecslice_vectile0_vecunit3_in_stream_w;
		end
	endcase
	case (vecslice_vectile1_state)
		1'd0: begin
			vecslice_vectile1_out_stream_valid_w <= vecslice_vectile1_in_stream_valid_w;
			vecslice_vectile1_out_stream_valid_e <= vecslice_vectile1_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile1_out_stream_valid_w <= 1'd0;
			vecslice_vectile1_out_stream_valid_e <= vecslice_vectile1_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile1_out_stream_valid_w <= vecslice_vectile1_in_stream_valid_w;
			vecslice_vectile1_out_stream_valid_e <= vecslice_vectile1_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile1_out_stream_valid_w <= 1'd0;
			vecslice_vectile1_out_stream_valid_e <= vecslice_vectile1_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile1_in_ins_valid & (vecslice_vectile1_in_ins[7:15] == 1'd1))) begin
		case (vecslice_vectile1_in_ins[15:23])
			1'd0: begin
				vecslice_vectile1_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile1_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile1_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile1_state <= 2'd3;
			end
		endcase
		vecslice_vectile1_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile1_out_ins <= vecslice_vectile1_in_ins;
		vecslice_vectile1_out_ins_valid <= vecslice_vectile1_in_ins_valid;
	end
	case (vecslice_vectile1_vecunit4_state)
		1'd0: begin
			vecslice_vectile1_vecunit4_out_stream_w <= vecslice_vectile1_vecunit4_in_stream_w;
			vecslice_vectile1_vecunit4_out_stream_e <= vecslice_vectile1_vecunit4_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile1_vecunit4_in_stream_valid_w) begin
				vecslice_vectile1_vecunit4_const_b <= vecslice_vectile1_vecunit4_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile1_vecunit4_in_stream_valid_e) begin
				vecslice_vectile1_vecunit4_out_stream_e <= (vecslice_vectile1_vecunit4_in_stream_e + vecslice_vectile1_vecunit4_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile1_vecunit4_out_stream_e <= vecslice_vectile1_vecunit4_in_stream_w;
		end
	endcase
	case (vecslice_vectile1_vecunit5_state)
		1'd0: begin
			vecslice_vectile1_vecunit5_out_stream_w <= vecslice_vectile1_vecunit5_in_stream_w;
			vecslice_vectile1_vecunit5_out_stream_e <= vecslice_vectile1_vecunit5_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile1_vecunit5_in_stream_valid_w) begin
				vecslice_vectile1_vecunit5_const_b <= vecslice_vectile1_vecunit5_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile1_vecunit5_in_stream_valid_e) begin
				vecslice_vectile1_vecunit5_out_stream_e <= (vecslice_vectile1_vecunit5_in_stream_e + vecslice_vectile1_vecunit5_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile1_vecunit5_out_stream_e <= vecslice_vectile1_vecunit5_in_stream_w;
		end
	endcase
	case (vecslice_vectile1_vecunit6_state)
		1'd0: begin
			vecslice_vectile1_vecunit6_out_stream_w <= vecslice_vectile1_vecunit6_in_stream_w;
			vecslice_vectile1_vecunit6_out_stream_e <= vecslice_vectile1_vecunit6_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile1_vecunit6_in_stream_valid_w) begin
				vecslice_vectile1_vecunit6_const_b <= vecslice_vectile1_vecunit6_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile1_vecunit6_in_stream_valid_e) begin
				vecslice_vectile1_vecunit6_out_stream_e <= (vecslice_vectile1_vecunit6_in_stream_e + vecslice_vectile1_vecunit6_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile1_vecunit6_out_stream_e <= vecslice_vectile1_vecunit6_in_stream_w;
		end
	endcase
	case (vecslice_vectile1_vecunit7_state)
		1'd0: begin
			vecslice_vectile1_vecunit7_out_stream_w <= vecslice_vectile1_vecunit7_in_stream_w;
			vecslice_vectile1_vecunit7_out_stream_e <= vecslice_vectile1_vecunit7_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile1_vecunit7_in_stream_valid_w) begin
				vecslice_vectile1_vecunit7_const_b <= vecslice_vectile1_vecunit7_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile1_vecunit7_in_stream_valid_e) begin
				vecslice_vectile1_vecunit7_out_stream_e <= (vecslice_vectile1_vecunit7_in_stream_e + vecslice_vectile1_vecunit7_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile1_vecunit7_out_stream_e <= vecslice_vectile1_vecunit7_in_stream_w;
		end
	endcase
	case (vecslice_vectile2_state)
		1'd0: begin
			vecslice_vectile2_out_stream_valid_w <= vecslice_vectile2_in_stream_valid_w;
			vecslice_vectile2_out_stream_valid_e <= vecslice_vectile2_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile2_out_stream_valid_w <= 1'd0;
			vecslice_vectile2_out_stream_valid_e <= vecslice_vectile2_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile2_out_stream_valid_w <= vecslice_vectile2_in_stream_valid_w;
			vecslice_vectile2_out_stream_valid_e <= vecslice_vectile2_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile2_out_stream_valid_w <= 1'd0;
			vecslice_vectile2_out_stream_valid_e <= vecslice_vectile2_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile2_in_ins_valid & (vecslice_vectile2_in_ins[7:15] == 2'd2))) begin
		case (vecslice_vectile2_in_ins[15:23])
			1'd0: begin
				vecslice_vectile2_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile2_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile2_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile2_state <= 2'd3;
			end
		endcase
		vecslice_vectile2_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile2_out_ins <= vecslice_vectile2_in_ins;
		vecslice_vectile2_out_ins_valid <= vecslice_vectile2_in_ins_valid;
	end
	case (vecslice_vectile2_vecunit8_state)
		1'd0: begin
			vecslice_vectile2_vecunit8_out_stream_w <= vecslice_vectile2_vecunit8_in_stream_w;
			vecslice_vectile2_vecunit8_out_stream_e <= vecslice_vectile2_vecunit8_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile2_vecunit8_in_stream_valid_w) begin
				vecslice_vectile2_vecunit8_const_b <= vecslice_vectile2_vecunit8_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile2_vecunit8_in_stream_valid_e) begin
				vecslice_vectile2_vecunit8_out_stream_e <= (vecslice_vectile2_vecunit8_in_stream_e + vecslice_vectile2_vecunit8_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile2_vecunit8_out_stream_e <= vecslice_vectile2_vecunit8_in_stream_w;
		end
	endcase
	case (vecslice_vectile2_vecunit9_state)
		1'd0: begin
			vecslice_vectile2_vecunit9_out_stream_w <= vecslice_vectile2_vecunit9_in_stream_w;
			vecslice_vectile2_vecunit9_out_stream_e <= vecslice_vectile2_vecunit9_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile2_vecunit9_in_stream_valid_w) begin
				vecslice_vectile2_vecunit9_const_b <= vecslice_vectile2_vecunit9_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile2_vecunit9_in_stream_valid_e) begin
				vecslice_vectile2_vecunit9_out_stream_e <= (vecslice_vectile2_vecunit9_in_stream_e + vecslice_vectile2_vecunit9_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile2_vecunit9_out_stream_e <= vecslice_vectile2_vecunit9_in_stream_w;
		end
	endcase
	case (vecslice_vectile2_vecunit10_state)
		1'd0: begin
			vecslice_vectile2_vecunit10_out_stream_w <= vecslice_vectile2_vecunit10_in_stream_w;
			vecslice_vectile2_vecunit10_out_stream_e <= vecslice_vectile2_vecunit10_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile2_vecunit10_in_stream_valid_w) begin
				vecslice_vectile2_vecunit10_const_b <= vecslice_vectile2_vecunit10_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile2_vecunit10_in_stream_valid_e) begin
				vecslice_vectile2_vecunit10_out_stream_e <= (vecslice_vectile2_vecunit10_in_stream_e + vecslice_vectile2_vecunit10_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile2_vecunit10_out_stream_e <= vecslice_vectile2_vecunit10_in_stream_w;
		end
	endcase
	case (vecslice_vectile2_vecunit11_state)
		1'd0: begin
			vecslice_vectile2_vecunit11_out_stream_w <= vecslice_vectile2_vecunit11_in_stream_w;
			vecslice_vectile2_vecunit11_out_stream_e <= vecslice_vectile2_vecunit11_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile2_vecunit11_in_stream_valid_w) begin
				vecslice_vectile2_vecunit11_const_b <= vecslice_vectile2_vecunit11_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile2_vecunit11_in_stream_valid_e) begin
				vecslice_vectile2_vecunit11_out_stream_e <= (vecslice_vectile2_vecunit11_in_stream_e + vecslice_vectile2_vecunit11_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile2_vecunit11_out_stream_e <= vecslice_vectile2_vecunit11_in_stream_w;
		end
	endcase
	case (vecslice_vectile3_state)
		1'd0: begin
			vecslice_vectile3_out_stream_valid_w <= vecslice_vectile3_in_stream_valid_w;
			vecslice_vectile3_out_stream_valid_e <= vecslice_vectile3_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile3_out_stream_valid_w <= 1'd0;
			vecslice_vectile3_out_stream_valid_e <= vecslice_vectile3_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile3_out_stream_valid_w <= vecslice_vectile3_in_stream_valid_w;
			vecslice_vectile3_out_stream_valid_e <= vecslice_vectile3_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile3_out_stream_valid_w <= 1'd0;
			vecslice_vectile3_out_stream_valid_e <= vecslice_vectile3_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile3_in_ins_valid & (vecslice_vectile3_in_ins[7:15] == 2'd3))) begin
		case (vecslice_vectile3_in_ins[15:23])
			1'd0: begin
				vecslice_vectile3_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile3_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile3_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile3_state <= 2'd3;
			end
		endcase
		vecslice_vectile3_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile3_out_ins <= vecslice_vectile3_in_ins;
		vecslice_vectile3_out_ins_valid <= vecslice_vectile3_in_ins_valid;
	end
	case (vecslice_vectile3_vecunit12_state)
		1'd0: begin
			vecslice_vectile3_vecunit12_out_stream_w <= vecslice_vectile3_vecunit12_in_stream_w;
			vecslice_vectile3_vecunit12_out_stream_e <= vecslice_vectile3_vecunit12_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile3_vecunit12_in_stream_valid_w) begin
				vecslice_vectile3_vecunit12_const_b <= vecslice_vectile3_vecunit12_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile3_vecunit12_in_stream_valid_e) begin
				vecslice_vectile3_vecunit12_out_stream_e <= (vecslice_vectile3_vecunit12_in_stream_e + vecslice_vectile3_vecunit12_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile3_vecunit12_out_stream_e <= vecslice_vectile3_vecunit12_in_stream_w;
		end
	endcase
	case (vecslice_vectile3_vecunit13_state)
		1'd0: begin
			vecslice_vectile3_vecunit13_out_stream_w <= vecslice_vectile3_vecunit13_in_stream_w;
			vecslice_vectile3_vecunit13_out_stream_e <= vecslice_vectile3_vecunit13_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile3_vecunit13_in_stream_valid_w) begin
				vecslice_vectile3_vecunit13_const_b <= vecslice_vectile3_vecunit13_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile3_vecunit13_in_stream_valid_e) begin
				vecslice_vectile3_vecunit13_out_stream_e <= (vecslice_vectile3_vecunit13_in_stream_e + vecslice_vectile3_vecunit13_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile3_vecunit13_out_stream_e <= vecslice_vectile3_vecunit13_in_stream_w;
		end
	endcase
	case (vecslice_vectile3_vecunit14_state)
		1'd0: begin
			vecslice_vectile3_vecunit14_out_stream_w <= vecslice_vectile3_vecunit14_in_stream_w;
			vecslice_vectile3_vecunit14_out_stream_e <= vecslice_vectile3_vecunit14_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile3_vecunit14_in_stream_valid_w) begin
				vecslice_vectile3_vecunit14_const_b <= vecslice_vectile3_vecunit14_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile3_vecunit14_in_stream_valid_e) begin
				vecslice_vectile3_vecunit14_out_stream_e <= (vecslice_vectile3_vecunit14_in_stream_e + vecslice_vectile3_vecunit14_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile3_vecunit14_out_stream_e <= vecslice_vectile3_vecunit14_in_stream_w;
		end
	endcase
	case (vecslice_vectile3_vecunit15_state)
		1'd0: begin
			vecslice_vectile3_vecunit15_out_stream_w <= vecslice_vectile3_vecunit15_in_stream_w;
			vecslice_vectile3_vecunit15_out_stream_e <= vecslice_vectile3_vecunit15_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile3_vecunit15_in_stream_valid_w) begin
				vecslice_vectile3_vecunit15_const_b <= vecslice_vectile3_vecunit15_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile3_vecunit15_in_stream_valid_e) begin
				vecslice_vectile3_vecunit15_out_stream_e <= (vecslice_vectile3_vecunit15_in_stream_e + vecslice_vectile3_vecunit15_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile3_vecunit15_out_stream_e <= vecslice_vectile3_vecunit15_in_stream_w;
		end
	endcase
	case (vecslice_vectile4_state)
		1'd0: begin
			vecslice_vectile4_out_stream_valid_w <= vecslice_vectile4_in_stream_valid_w;
			vecslice_vectile4_out_stream_valid_e <= vecslice_vectile4_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile4_out_stream_valid_w <= 1'd0;
			vecslice_vectile4_out_stream_valid_e <= vecslice_vectile4_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile4_out_stream_valid_w <= vecslice_vectile4_in_stream_valid_w;
			vecslice_vectile4_out_stream_valid_e <= vecslice_vectile4_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile4_out_stream_valid_w <= 1'd0;
			vecslice_vectile4_out_stream_valid_e <= vecslice_vectile4_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile4_in_ins_valid & (vecslice_vectile4_in_ins[7:15] == 3'd4))) begin
		case (vecslice_vectile4_in_ins[15:23])
			1'd0: begin
				vecslice_vectile4_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile4_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile4_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile4_state <= 2'd3;
			end
		endcase
		vecslice_vectile4_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile4_out_ins <= vecslice_vectile4_in_ins;
		vecslice_vectile4_out_ins_valid <= vecslice_vectile4_in_ins_valid;
	end
	case (vecslice_vectile4_vecunit16_state)
		1'd0: begin
			vecslice_vectile4_vecunit16_out_stream_w <= vecslice_vectile4_vecunit16_in_stream_w;
			vecslice_vectile4_vecunit16_out_stream_e <= vecslice_vectile4_vecunit16_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile4_vecunit16_in_stream_valid_w) begin
				vecslice_vectile4_vecunit16_const_b <= vecslice_vectile4_vecunit16_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile4_vecunit16_in_stream_valid_e) begin
				vecslice_vectile4_vecunit16_out_stream_e <= (vecslice_vectile4_vecunit16_in_stream_e + vecslice_vectile4_vecunit16_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile4_vecunit16_out_stream_e <= vecslice_vectile4_vecunit16_in_stream_w;
		end
	endcase
	case (vecslice_vectile4_vecunit17_state)
		1'd0: begin
			vecslice_vectile4_vecunit17_out_stream_w <= vecslice_vectile4_vecunit17_in_stream_w;
			vecslice_vectile4_vecunit17_out_stream_e <= vecslice_vectile4_vecunit17_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile4_vecunit17_in_stream_valid_w) begin
				vecslice_vectile4_vecunit17_const_b <= vecslice_vectile4_vecunit17_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile4_vecunit17_in_stream_valid_e) begin
				vecslice_vectile4_vecunit17_out_stream_e <= (vecslice_vectile4_vecunit17_in_stream_e + vecslice_vectile4_vecunit17_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile4_vecunit17_out_stream_e <= vecslice_vectile4_vecunit17_in_stream_w;
		end
	endcase
	case (vecslice_vectile4_vecunit18_state)
		1'd0: begin
			vecslice_vectile4_vecunit18_out_stream_w <= vecslice_vectile4_vecunit18_in_stream_w;
			vecslice_vectile4_vecunit18_out_stream_e <= vecslice_vectile4_vecunit18_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile4_vecunit18_in_stream_valid_w) begin
				vecslice_vectile4_vecunit18_const_b <= vecslice_vectile4_vecunit18_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile4_vecunit18_in_stream_valid_e) begin
				vecslice_vectile4_vecunit18_out_stream_e <= (vecslice_vectile4_vecunit18_in_stream_e + vecslice_vectile4_vecunit18_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile4_vecunit18_out_stream_e <= vecslice_vectile4_vecunit18_in_stream_w;
		end
	endcase
	case (vecslice_vectile4_vecunit19_state)
		1'd0: begin
			vecslice_vectile4_vecunit19_out_stream_w <= vecslice_vectile4_vecunit19_in_stream_w;
			vecslice_vectile4_vecunit19_out_stream_e <= vecslice_vectile4_vecunit19_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile4_vecunit19_in_stream_valid_w) begin
				vecslice_vectile4_vecunit19_const_b <= vecslice_vectile4_vecunit19_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile4_vecunit19_in_stream_valid_e) begin
				vecslice_vectile4_vecunit19_out_stream_e <= (vecslice_vectile4_vecunit19_in_stream_e + vecslice_vectile4_vecunit19_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile4_vecunit19_out_stream_e <= vecslice_vectile4_vecunit19_in_stream_w;
		end
	endcase
	case (vecslice_vectile5_state)
		1'd0: begin
			vecslice_vectile5_out_stream_valid_w <= vecslice_vectile5_in_stream_valid_w;
			vecslice_vectile5_out_stream_valid_e <= vecslice_vectile5_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile5_out_stream_valid_w <= 1'd0;
			vecslice_vectile5_out_stream_valid_e <= vecslice_vectile5_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile5_out_stream_valid_w <= vecslice_vectile5_in_stream_valid_w;
			vecslice_vectile5_out_stream_valid_e <= vecslice_vectile5_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile5_out_stream_valid_w <= 1'd0;
			vecslice_vectile5_out_stream_valid_e <= vecslice_vectile5_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile5_in_ins_valid & (vecslice_vectile5_in_ins[7:15] == 3'd5))) begin
		case (vecslice_vectile5_in_ins[15:23])
			1'd0: begin
				vecslice_vectile5_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile5_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile5_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile5_state <= 2'd3;
			end
		endcase
		vecslice_vectile5_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile5_out_ins <= vecslice_vectile5_in_ins;
		vecslice_vectile5_out_ins_valid <= vecslice_vectile5_in_ins_valid;
	end
	case (vecslice_vectile5_vecunit20_state)
		1'd0: begin
			vecslice_vectile5_vecunit20_out_stream_w <= vecslice_vectile5_vecunit20_in_stream_w;
			vecslice_vectile5_vecunit20_out_stream_e <= vecslice_vectile5_vecunit20_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile5_vecunit20_in_stream_valid_w) begin
				vecslice_vectile5_vecunit20_const_b <= vecslice_vectile5_vecunit20_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile5_vecunit20_in_stream_valid_e) begin
				vecslice_vectile5_vecunit20_out_stream_e <= (vecslice_vectile5_vecunit20_in_stream_e + vecslice_vectile5_vecunit20_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile5_vecunit20_out_stream_e <= vecslice_vectile5_vecunit20_in_stream_w;
		end
	endcase
	case (vecslice_vectile5_vecunit21_state)
		1'd0: begin
			vecslice_vectile5_vecunit21_out_stream_w <= vecslice_vectile5_vecunit21_in_stream_w;
			vecslice_vectile5_vecunit21_out_stream_e <= vecslice_vectile5_vecunit21_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile5_vecunit21_in_stream_valid_w) begin
				vecslice_vectile5_vecunit21_const_b <= vecslice_vectile5_vecunit21_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile5_vecunit21_in_stream_valid_e) begin
				vecslice_vectile5_vecunit21_out_stream_e <= (vecslice_vectile5_vecunit21_in_stream_e + vecslice_vectile5_vecunit21_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile5_vecunit21_out_stream_e <= vecslice_vectile5_vecunit21_in_stream_w;
		end
	endcase
	case (vecslice_vectile5_vecunit22_state)
		1'd0: begin
			vecslice_vectile5_vecunit22_out_stream_w <= vecslice_vectile5_vecunit22_in_stream_w;
			vecslice_vectile5_vecunit22_out_stream_e <= vecslice_vectile5_vecunit22_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile5_vecunit22_in_stream_valid_w) begin
				vecslice_vectile5_vecunit22_const_b <= vecslice_vectile5_vecunit22_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile5_vecunit22_in_stream_valid_e) begin
				vecslice_vectile5_vecunit22_out_stream_e <= (vecslice_vectile5_vecunit22_in_stream_e + vecslice_vectile5_vecunit22_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile5_vecunit22_out_stream_e <= vecslice_vectile5_vecunit22_in_stream_w;
		end
	endcase
	case (vecslice_vectile5_vecunit23_state)
		1'd0: begin
			vecslice_vectile5_vecunit23_out_stream_w <= vecslice_vectile5_vecunit23_in_stream_w;
			vecslice_vectile5_vecunit23_out_stream_e <= vecslice_vectile5_vecunit23_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile5_vecunit23_in_stream_valid_w) begin
				vecslice_vectile5_vecunit23_const_b <= vecslice_vectile5_vecunit23_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile5_vecunit23_in_stream_valid_e) begin
				vecslice_vectile5_vecunit23_out_stream_e <= (vecslice_vectile5_vecunit23_in_stream_e + vecslice_vectile5_vecunit23_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile5_vecunit23_out_stream_e <= vecslice_vectile5_vecunit23_in_stream_w;
		end
	endcase
	case (vecslice_vectile6_state)
		1'd0: begin
			vecslice_vectile6_out_stream_valid_w <= vecslice_vectile6_in_stream_valid_w;
			vecslice_vectile6_out_stream_valid_e <= vecslice_vectile6_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile6_out_stream_valid_w <= 1'd0;
			vecslice_vectile6_out_stream_valid_e <= vecslice_vectile6_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile6_out_stream_valid_w <= vecslice_vectile6_in_stream_valid_w;
			vecslice_vectile6_out_stream_valid_e <= vecslice_vectile6_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile6_out_stream_valid_w <= 1'd0;
			vecslice_vectile6_out_stream_valid_e <= vecslice_vectile6_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile6_in_ins_valid & (vecslice_vectile6_in_ins[7:15] == 3'd6))) begin
		case (vecslice_vectile6_in_ins[15:23])
			1'd0: begin
				vecslice_vectile6_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile6_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile6_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile6_state <= 2'd3;
			end
		endcase
		vecslice_vectile6_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile6_out_ins <= vecslice_vectile6_in_ins;
		vecslice_vectile6_out_ins_valid <= vecslice_vectile6_in_ins_valid;
	end
	case (vecslice_vectile6_vecunit24_state)
		1'd0: begin
			vecslice_vectile6_vecunit24_out_stream_w <= vecslice_vectile6_vecunit24_in_stream_w;
			vecslice_vectile6_vecunit24_out_stream_e <= vecslice_vectile6_vecunit24_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile6_vecunit24_in_stream_valid_w) begin
				vecslice_vectile6_vecunit24_const_b <= vecslice_vectile6_vecunit24_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile6_vecunit24_in_stream_valid_e) begin
				vecslice_vectile6_vecunit24_out_stream_e <= (vecslice_vectile6_vecunit24_in_stream_e + vecslice_vectile6_vecunit24_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile6_vecunit24_out_stream_e <= vecslice_vectile6_vecunit24_in_stream_w;
		end
	endcase
	case (vecslice_vectile6_vecunit25_state)
		1'd0: begin
			vecslice_vectile6_vecunit25_out_stream_w <= vecslice_vectile6_vecunit25_in_stream_w;
			vecslice_vectile6_vecunit25_out_stream_e <= vecslice_vectile6_vecunit25_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile6_vecunit25_in_stream_valid_w) begin
				vecslice_vectile6_vecunit25_const_b <= vecslice_vectile6_vecunit25_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile6_vecunit25_in_stream_valid_e) begin
				vecslice_vectile6_vecunit25_out_stream_e <= (vecslice_vectile6_vecunit25_in_stream_e + vecslice_vectile6_vecunit25_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile6_vecunit25_out_stream_e <= vecslice_vectile6_vecunit25_in_stream_w;
		end
	endcase
	case (vecslice_vectile6_vecunit26_state)
		1'd0: begin
			vecslice_vectile6_vecunit26_out_stream_w <= vecslice_vectile6_vecunit26_in_stream_w;
			vecslice_vectile6_vecunit26_out_stream_e <= vecslice_vectile6_vecunit26_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile6_vecunit26_in_stream_valid_w) begin
				vecslice_vectile6_vecunit26_const_b <= vecslice_vectile6_vecunit26_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile6_vecunit26_in_stream_valid_e) begin
				vecslice_vectile6_vecunit26_out_stream_e <= (vecslice_vectile6_vecunit26_in_stream_e + vecslice_vectile6_vecunit26_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile6_vecunit26_out_stream_e <= vecslice_vectile6_vecunit26_in_stream_w;
		end
	endcase
	case (vecslice_vectile6_vecunit27_state)
		1'd0: begin
			vecslice_vectile6_vecunit27_out_stream_w <= vecslice_vectile6_vecunit27_in_stream_w;
			vecslice_vectile6_vecunit27_out_stream_e <= vecslice_vectile6_vecunit27_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile6_vecunit27_in_stream_valid_w) begin
				vecslice_vectile6_vecunit27_const_b <= vecslice_vectile6_vecunit27_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile6_vecunit27_in_stream_valid_e) begin
				vecslice_vectile6_vecunit27_out_stream_e <= (vecslice_vectile6_vecunit27_in_stream_e + vecslice_vectile6_vecunit27_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile6_vecunit27_out_stream_e <= vecslice_vectile6_vecunit27_in_stream_w;
		end
	endcase
	case (vecslice_vectile7_state)
		1'd0: begin
			vecslice_vectile7_out_stream_valid_w <= vecslice_vectile7_in_stream_valid_w;
			vecslice_vectile7_out_stream_valid_e <= vecslice_vectile7_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile7_out_stream_valid_w <= 1'd0;
			vecslice_vectile7_out_stream_valid_e <= vecslice_vectile7_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile7_out_stream_valid_w <= vecslice_vectile7_in_stream_valid_w;
			vecslice_vectile7_out_stream_valid_e <= vecslice_vectile7_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile7_out_stream_valid_w <= 1'd0;
			vecslice_vectile7_out_stream_valid_e <= vecslice_vectile7_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile7_in_ins_valid & (vecslice_vectile7_in_ins[7:15] == 3'd7))) begin
		case (vecslice_vectile7_in_ins[15:23])
			1'd0: begin
				vecslice_vectile7_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile7_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile7_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile7_state <= 2'd3;
			end
		endcase
		vecslice_vectile7_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile7_out_ins <= vecslice_vectile7_in_ins;
		vecslice_vectile7_out_ins_valid <= vecslice_vectile7_in_ins_valid;
	end
	case (vecslice_vectile7_vecunit28_state)
		1'd0: begin
			vecslice_vectile7_vecunit28_out_stream_w <= vecslice_vectile7_vecunit28_in_stream_w;
			vecslice_vectile7_vecunit28_out_stream_e <= vecslice_vectile7_vecunit28_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile7_vecunit28_in_stream_valid_w) begin
				vecslice_vectile7_vecunit28_const_b <= vecslice_vectile7_vecunit28_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile7_vecunit28_in_stream_valid_e) begin
				vecslice_vectile7_vecunit28_out_stream_e <= (vecslice_vectile7_vecunit28_in_stream_e + vecslice_vectile7_vecunit28_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile7_vecunit28_out_stream_e <= vecslice_vectile7_vecunit28_in_stream_w;
		end
	endcase
	case (vecslice_vectile7_vecunit29_state)
		1'd0: begin
			vecslice_vectile7_vecunit29_out_stream_w <= vecslice_vectile7_vecunit29_in_stream_w;
			vecslice_vectile7_vecunit29_out_stream_e <= vecslice_vectile7_vecunit29_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile7_vecunit29_in_stream_valid_w) begin
				vecslice_vectile7_vecunit29_const_b <= vecslice_vectile7_vecunit29_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile7_vecunit29_in_stream_valid_e) begin
				vecslice_vectile7_vecunit29_out_stream_e <= (vecslice_vectile7_vecunit29_in_stream_e + vecslice_vectile7_vecunit29_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile7_vecunit29_out_stream_e <= vecslice_vectile7_vecunit29_in_stream_w;
		end
	endcase
	case (vecslice_vectile7_vecunit30_state)
		1'd0: begin
			vecslice_vectile7_vecunit30_out_stream_w <= vecslice_vectile7_vecunit30_in_stream_w;
			vecslice_vectile7_vecunit30_out_stream_e <= vecslice_vectile7_vecunit30_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile7_vecunit30_in_stream_valid_w) begin
				vecslice_vectile7_vecunit30_const_b <= vecslice_vectile7_vecunit30_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile7_vecunit30_in_stream_valid_e) begin
				vecslice_vectile7_vecunit30_out_stream_e <= (vecslice_vectile7_vecunit30_in_stream_e + vecslice_vectile7_vecunit30_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile7_vecunit30_out_stream_e <= vecslice_vectile7_vecunit30_in_stream_w;
		end
	endcase
	case (vecslice_vectile7_vecunit31_state)
		1'd0: begin
			vecslice_vectile7_vecunit31_out_stream_w <= vecslice_vectile7_vecunit31_in_stream_w;
			vecslice_vectile7_vecunit31_out_stream_e <= vecslice_vectile7_vecunit31_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile7_vecunit31_in_stream_valid_w) begin
				vecslice_vectile7_vecunit31_const_b <= vecslice_vectile7_vecunit31_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile7_vecunit31_in_stream_valid_e) begin
				vecslice_vectile7_vecunit31_out_stream_e <= (vecslice_vectile7_vecunit31_in_stream_e + vecslice_vectile7_vecunit31_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile7_vecunit31_out_stream_e <= vecslice_vectile7_vecunit31_in_stream_w;
		end
	endcase
	case (vecslice_vectile8_state)
		1'd0: begin
			vecslice_vectile8_out_stream_valid_w <= vecslice_vectile8_in_stream_valid_w;
			vecslice_vectile8_out_stream_valid_e <= vecslice_vectile8_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile8_out_stream_valid_w <= 1'd0;
			vecslice_vectile8_out_stream_valid_e <= vecslice_vectile8_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile8_out_stream_valid_w <= vecslice_vectile8_in_stream_valid_w;
			vecslice_vectile8_out_stream_valid_e <= vecslice_vectile8_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile8_out_stream_valid_w <= 1'd0;
			vecslice_vectile8_out_stream_valid_e <= vecslice_vectile8_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile8_in_ins_valid & (vecslice_vectile8_in_ins[7:15] == 4'd8))) begin
		case (vecslice_vectile8_in_ins[15:23])
			1'd0: begin
				vecslice_vectile8_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile8_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile8_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile8_state <= 2'd3;
			end
		endcase
		vecslice_vectile8_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile8_out_ins <= vecslice_vectile8_in_ins;
		vecslice_vectile8_out_ins_valid <= vecslice_vectile8_in_ins_valid;
	end
	case (vecslice_vectile8_vecunit32_state)
		1'd0: begin
			vecslice_vectile8_vecunit32_out_stream_w <= vecslice_vectile8_vecunit32_in_stream_w;
			vecslice_vectile8_vecunit32_out_stream_e <= vecslice_vectile8_vecunit32_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile8_vecunit32_in_stream_valid_w) begin
				vecslice_vectile8_vecunit32_const_b <= vecslice_vectile8_vecunit32_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile8_vecunit32_in_stream_valid_e) begin
				vecslice_vectile8_vecunit32_out_stream_e <= (vecslice_vectile8_vecunit32_in_stream_e + vecslice_vectile8_vecunit32_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile8_vecunit32_out_stream_e <= vecslice_vectile8_vecunit32_in_stream_w;
		end
	endcase
	case (vecslice_vectile8_vecunit33_state)
		1'd0: begin
			vecslice_vectile8_vecunit33_out_stream_w <= vecslice_vectile8_vecunit33_in_stream_w;
			vecslice_vectile8_vecunit33_out_stream_e <= vecslice_vectile8_vecunit33_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile8_vecunit33_in_stream_valid_w) begin
				vecslice_vectile8_vecunit33_const_b <= vecslice_vectile8_vecunit33_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile8_vecunit33_in_stream_valid_e) begin
				vecslice_vectile8_vecunit33_out_stream_e <= (vecslice_vectile8_vecunit33_in_stream_e + vecslice_vectile8_vecunit33_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile8_vecunit33_out_stream_e <= vecslice_vectile8_vecunit33_in_stream_w;
		end
	endcase
	case (vecslice_vectile8_vecunit34_state)
		1'd0: begin
			vecslice_vectile8_vecunit34_out_stream_w <= vecslice_vectile8_vecunit34_in_stream_w;
			vecslice_vectile8_vecunit34_out_stream_e <= vecslice_vectile8_vecunit34_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile8_vecunit34_in_stream_valid_w) begin
				vecslice_vectile8_vecunit34_const_b <= vecslice_vectile8_vecunit34_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile8_vecunit34_in_stream_valid_e) begin
				vecslice_vectile8_vecunit34_out_stream_e <= (vecslice_vectile8_vecunit34_in_stream_e + vecslice_vectile8_vecunit34_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile8_vecunit34_out_stream_e <= vecslice_vectile8_vecunit34_in_stream_w;
		end
	endcase
	case (vecslice_vectile8_vecunit35_state)
		1'd0: begin
			vecslice_vectile8_vecunit35_out_stream_w <= vecslice_vectile8_vecunit35_in_stream_w;
			vecslice_vectile8_vecunit35_out_stream_e <= vecslice_vectile8_vecunit35_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile8_vecunit35_in_stream_valid_w) begin
				vecslice_vectile8_vecunit35_const_b <= vecslice_vectile8_vecunit35_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile8_vecunit35_in_stream_valid_e) begin
				vecslice_vectile8_vecunit35_out_stream_e <= (vecslice_vectile8_vecunit35_in_stream_e + vecslice_vectile8_vecunit35_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile8_vecunit35_out_stream_e <= vecslice_vectile8_vecunit35_in_stream_w;
		end
	endcase
	case (vecslice_vectile9_state)
		1'd0: begin
			vecslice_vectile9_out_stream_valid_w <= vecslice_vectile9_in_stream_valid_w;
			vecslice_vectile9_out_stream_valid_e <= vecslice_vectile9_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile9_out_stream_valid_w <= 1'd0;
			vecslice_vectile9_out_stream_valid_e <= vecslice_vectile9_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile9_out_stream_valid_w <= vecslice_vectile9_in_stream_valid_w;
			vecslice_vectile9_out_stream_valid_e <= vecslice_vectile9_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile9_out_stream_valid_w <= 1'd0;
			vecslice_vectile9_out_stream_valid_e <= vecslice_vectile9_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile9_in_ins_valid & (vecslice_vectile9_in_ins[7:15] == 4'd9))) begin
		case (vecslice_vectile9_in_ins[15:23])
			1'd0: begin
				vecslice_vectile9_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile9_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile9_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile9_state <= 2'd3;
			end
		endcase
		vecslice_vectile9_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile9_out_ins <= vecslice_vectile9_in_ins;
		vecslice_vectile9_out_ins_valid <= vecslice_vectile9_in_ins_valid;
	end
	case (vecslice_vectile9_vecunit36_state)
		1'd0: begin
			vecslice_vectile9_vecunit36_out_stream_w <= vecslice_vectile9_vecunit36_in_stream_w;
			vecslice_vectile9_vecunit36_out_stream_e <= vecslice_vectile9_vecunit36_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile9_vecunit36_in_stream_valid_w) begin
				vecslice_vectile9_vecunit36_const_b <= vecslice_vectile9_vecunit36_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile9_vecunit36_in_stream_valid_e) begin
				vecslice_vectile9_vecunit36_out_stream_e <= (vecslice_vectile9_vecunit36_in_stream_e + vecslice_vectile9_vecunit36_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile9_vecunit36_out_stream_e <= vecslice_vectile9_vecunit36_in_stream_w;
		end
	endcase
	case (vecslice_vectile9_vecunit37_state)
		1'd0: begin
			vecslice_vectile9_vecunit37_out_stream_w <= vecslice_vectile9_vecunit37_in_stream_w;
			vecslice_vectile9_vecunit37_out_stream_e <= vecslice_vectile9_vecunit37_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile9_vecunit37_in_stream_valid_w) begin
				vecslice_vectile9_vecunit37_const_b <= vecslice_vectile9_vecunit37_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile9_vecunit37_in_stream_valid_e) begin
				vecslice_vectile9_vecunit37_out_stream_e <= (vecslice_vectile9_vecunit37_in_stream_e + vecslice_vectile9_vecunit37_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile9_vecunit37_out_stream_e <= vecslice_vectile9_vecunit37_in_stream_w;
		end
	endcase
	case (vecslice_vectile9_vecunit38_state)
		1'd0: begin
			vecslice_vectile9_vecunit38_out_stream_w <= vecslice_vectile9_vecunit38_in_stream_w;
			vecslice_vectile9_vecunit38_out_stream_e <= vecslice_vectile9_vecunit38_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile9_vecunit38_in_stream_valid_w) begin
				vecslice_vectile9_vecunit38_const_b <= vecslice_vectile9_vecunit38_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile9_vecunit38_in_stream_valid_e) begin
				vecslice_vectile9_vecunit38_out_stream_e <= (vecslice_vectile9_vecunit38_in_stream_e + vecslice_vectile9_vecunit38_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile9_vecunit38_out_stream_e <= vecslice_vectile9_vecunit38_in_stream_w;
		end
	endcase
	case (vecslice_vectile9_vecunit39_state)
		1'd0: begin
			vecslice_vectile9_vecunit39_out_stream_w <= vecslice_vectile9_vecunit39_in_stream_w;
			vecslice_vectile9_vecunit39_out_stream_e <= vecslice_vectile9_vecunit39_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile9_vecunit39_in_stream_valid_w) begin
				vecslice_vectile9_vecunit39_const_b <= vecslice_vectile9_vecunit39_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile9_vecunit39_in_stream_valid_e) begin
				vecslice_vectile9_vecunit39_out_stream_e <= (vecslice_vectile9_vecunit39_in_stream_e + vecslice_vectile9_vecunit39_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile9_vecunit39_out_stream_e <= vecslice_vectile9_vecunit39_in_stream_w;
		end
	endcase
	case (vecslice_vectile10_state)
		1'd0: begin
			vecslice_vectile10_out_stream_valid_w <= vecslice_vectile10_in_stream_valid_w;
			vecslice_vectile10_out_stream_valid_e <= vecslice_vectile10_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile10_out_stream_valid_w <= 1'd0;
			vecslice_vectile10_out_stream_valid_e <= vecslice_vectile10_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile10_out_stream_valid_w <= vecslice_vectile10_in_stream_valid_w;
			vecslice_vectile10_out_stream_valid_e <= vecslice_vectile10_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile10_out_stream_valid_w <= 1'd0;
			vecslice_vectile10_out_stream_valid_e <= vecslice_vectile10_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile10_in_ins_valid & (vecslice_vectile10_in_ins[7:15] == 4'd10))) begin
		case (vecslice_vectile10_in_ins[15:23])
			1'd0: begin
				vecslice_vectile10_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile10_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile10_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile10_state <= 2'd3;
			end
		endcase
		vecslice_vectile10_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile10_out_ins <= vecslice_vectile10_in_ins;
		vecslice_vectile10_out_ins_valid <= vecslice_vectile10_in_ins_valid;
	end
	case (vecslice_vectile10_vecunit40_state)
		1'd0: begin
			vecslice_vectile10_vecunit40_out_stream_w <= vecslice_vectile10_vecunit40_in_stream_w;
			vecslice_vectile10_vecunit40_out_stream_e <= vecslice_vectile10_vecunit40_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile10_vecunit40_in_stream_valid_w) begin
				vecslice_vectile10_vecunit40_const_b <= vecslice_vectile10_vecunit40_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile10_vecunit40_in_stream_valid_e) begin
				vecslice_vectile10_vecunit40_out_stream_e <= (vecslice_vectile10_vecunit40_in_stream_e + vecslice_vectile10_vecunit40_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile10_vecunit40_out_stream_e <= vecslice_vectile10_vecunit40_in_stream_w;
		end
	endcase
	case (vecslice_vectile10_vecunit41_state)
		1'd0: begin
			vecslice_vectile10_vecunit41_out_stream_w <= vecslice_vectile10_vecunit41_in_stream_w;
			vecslice_vectile10_vecunit41_out_stream_e <= vecslice_vectile10_vecunit41_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile10_vecunit41_in_stream_valid_w) begin
				vecslice_vectile10_vecunit41_const_b <= vecslice_vectile10_vecunit41_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile10_vecunit41_in_stream_valid_e) begin
				vecslice_vectile10_vecunit41_out_stream_e <= (vecslice_vectile10_vecunit41_in_stream_e + vecslice_vectile10_vecunit41_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile10_vecunit41_out_stream_e <= vecslice_vectile10_vecunit41_in_stream_w;
		end
	endcase
	case (vecslice_vectile10_vecunit42_state)
		1'd0: begin
			vecslice_vectile10_vecunit42_out_stream_w <= vecslice_vectile10_vecunit42_in_stream_w;
			vecslice_vectile10_vecunit42_out_stream_e <= vecslice_vectile10_vecunit42_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile10_vecunit42_in_stream_valid_w) begin
				vecslice_vectile10_vecunit42_const_b <= vecslice_vectile10_vecunit42_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile10_vecunit42_in_stream_valid_e) begin
				vecslice_vectile10_vecunit42_out_stream_e <= (vecslice_vectile10_vecunit42_in_stream_e + vecslice_vectile10_vecunit42_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile10_vecunit42_out_stream_e <= vecslice_vectile10_vecunit42_in_stream_w;
		end
	endcase
	case (vecslice_vectile10_vecunit43_state)
		1'd0: begin
			vecslice_vectile10_vecunit43_out_stream_w <= vecslice_vectile10_vecunit43_in_stream_w;
			vecslice_vectile10_vecunit43_out_stream_e <= vecslice_vectile10_vecunit43_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile10_vecunit43_in_stream_valid_w) begin
				vecslice_vectile10_vecunit43_const_b <= vecslice_vectile10_vecunit43_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile10_vecunit43_in_stream_valid_e) begin
				vecslice_vectile10_vecunit43_out_stream_e <= (vecslice_vectile10_vecunit43_in_stream_e + vecslice_vectile10_vecunit43_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile10_vecunit43_out_stream_e <= vecslice_vectile10_vecunit43_in_stream_w;
		end
	endcase
	case (vecslice_vectile11_state)
		1'd0: begin
			vecslice_vectile11_out_stream_valid_w <= vecslice_vectile11_in_stream_valid_w;
			vecslice_vectile11_out_stream_valid_e <= vecslice_vectile11_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile11_out_stream_valid_w <= 1'd0;
			vecslice_vectile11_out_stream_valid_e <= vecslice_vectile11_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile11_out_stream_valid_w <= vecslice_vectile11_in_stream_valid_w;
			vecslice_vectile11_out_stream_valid_e <= vecslice_vectile11_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile11_out_stream_valid_w <= 1'd0;
			vecslice_vectile11_out_stream_valid_e <= vecslice_vectile11_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile11_in_ins_valid & (vecslice_vectile11_in_ins[7:15] == 4'd11))) begin
		case (vecslice_vectile11_in_ins[15:23])
			1'd0: begin
				vecslice_vectile11_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile11_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile11_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile11_state <= 2'd3;
			end
		endcase
		vecslice_vectile11_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile11_out_ins <= vecslice_vectile11_in_ins;
		vecslice_vectile11_out_ins_valid <= vecslice_vectile11_in_ins_valid;
	end
	case (vecslice_vectile11_vecunit44_state)
		1'd0: begin
			vecslice_vectile11_vecunit44_out_stream_w <= vecslice_vectile11_vecunit44_in_stream_w;
			vecslice_vectile11_vecunit44_out_stream_e <= vecslice_vectile11_vecunit44_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile11_vecunit44_in_stream_valid_w) begin
				vecslice_vectile11_vecunit44_const_b <= vecslice_vectile11_vecunit44_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile11_vecunit44_in_stream_valid_e) begin
				vecslice_vectile11_vecunit44_out_stream_e <= (vecslice_vectile11_vecunit44_in_stream_e + vecslice_vectile11_vecunit44_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile11_vecunit44_out_stream_e <= vecslice_vectile11_vecunit44_in_stream_w;
		end
	endcase
	case (vecslice_vectile11_vecunit45_state)
		1'd0: begin
			vecslice_vectile11_vecunit45_out_stream_w <= vecslice_vectile11_vecunit45_in_stream_w;
			vecslice_vectile11_vecunit45_out_stream_e <= vecslice_vectile11_vecunit45_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile11_vecunit45_in_stream_valid_w) begin
				vecslice_vectile11_vecunit45_const_b <= vecslice_vectile11_vecunit45_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile11_vecunit45_in_stream_valid_e) begin
				vecslice_vectile11_vecunit45_out_stream_e <= (vecslice_vectile11_vecunit45_in_stream_e + vecslice_vectile11_vecunit45_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile11_vecunit45_out_stream_e <= vecslice_vectile11_vecunit45_in_stream_w;
		end
	endcase
	case (vecslice_vectile11_vecunit46_state)
		1'd0: begin
			vecslice_vectile11_vecunit46_out_stream_w <= vecslice_vectile11_vecunit46_in_stream_w;
			vecslice_vectile11_vecunit46_out_stream_e <= vecslice_vectile11_vecunit46_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile11_vecunit46_in_stream_valid_w) begin
				vecslice_vectile11_vecunit46_const_b <= vecslice_vectile11_vecunit46_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile11_vecunit46_in_stream_valid_e) begin
				vecslice_vectile11_vecunit46_out_stream_e <= (vecslice_vectile11_vecunit46_in_stream_e + vecslice_vectile11_vecunit46_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile11_vecunit46_out_stream_e <= vecslice_vectile11_vecunit46_in_stream_w;
		end
	endcase
	case (vecslice_vectile11_vecunit47_state)
		1'd0: begin
			vecslice_vectile11_vecunit47_out_stream_w <= vecslice_vectile11_vecunit47_in_stream_w;
			vecslice_vectile11_vecunit47_out_stream_e <= vecslice_vectile11_vecunit47_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile11_vecunit47_in_stream_valid_w) begin
				vecslice_vectile11_vecunit47_const_b <= vecslice_vectile11_vecunit47_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile11_vecunit47_in_stream_valid_e) begin
				vecslice_vectile11_vecunit47_out_stream_e <= (vecslice_vectile11_vecunit47_in_stream_e + vecslice_vectile11_vecunit47_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile11_vecunit47_out_stream_e <= vecslice_vectile11_vecunit47_in_stream_w;
		end
	endcase
	case (vecslice_vectile12_state)
		1'd0: begin
			vecslice_vectile12_out_stream_valid_w <= vecslice_vectile12_in_stream_valid_w;
			vecslice_vectile12_out_stream_valid_e <= vecslice_vectile12_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile12_out_stream_valid_w <= 1'd0;
			vecslice_vectile12_out_stream_valid_e <= vecslice_vectile12_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile12_out_stream_valid_w <= vecslice_vectile12_in_stream_valid_w;
			vecslice_vectile12_out_stream_valid_e <= vecslice_vectile12_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile12_out_stream_valid_w <= 1'd0;
			vecslice_vectile12_out_stream_valid_e <= vecslice_vectile12_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile12_in_ins_valid & (vecslice_vectile12_in_ins[7:15] == 4'd12))) begin
		case (vecslice_vectile12_in_ins[15:23])
			1'd0: begin
				vecslice_vectile12_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile12_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile12_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile12_state <= 2'd3;
			end
		endcase
		vecslice_vectile12_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile12_out_ins <= vecslice_vectile12_in_ins;
		vecslice_vectile12_out_ins_valid <= vecslice_vectile12_in_ins_valid;
	end
	case (vecslice_vectile12_vecunit48_state)
		1'd0: begin
			vecslice_vectile12_vecunit48_out_stream_w <= vecslice_vectile12_vecunit48_in_stream_w;
			vecslice_vectile12_vecunit48_out_stream_e <= vecslice_vectile12_vecunit48_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile12_vecunit48_in_stream_valid_w) begin
				vecslice_vectile12_vecunit48_const_b <= vecslice_vectile12_vecunit48_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile12_vecunit48_in_stream_valid_e) begin
				vecslice_vectile12_vecunit48_out_stream_e <= (vecslice_vectile12_vecunit48_in_stream_e + vecslice_vectile12_vecunit48_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile12_vecunit48_out_stream_e <= vecslice_vectile12_vecunit48_in_stream_w;
		end
	endcase
	case (vecslice_vectile12_vecunit49_state)
		1'd0: begin
			vecslice_vectile12_vecunit49_out_stream_w <= vecslice_vectile12_vecunit49_in_stream_w;
			vecslice_vectile12_vecunit49_out_stream_e <= vecslice_vectile12_vecunit49_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile12_vecunit49_in_stream_valid_w) begin
				vecslice_vectile12_vecunit49_const_b <= vecslice_vectile12_vecunit49_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile12_vecunit49_in_stream_valid_e) begin
				vecslice_vectile12_vecunit49_out_stream_e <= (vecslice_vectile12_vecunit49_in_stream_e + vecslice_vectile12_vecunit49_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile12_vecunit49_out_stream_e <= vecslice_vectile12_vecunit49_in_stream_w;
		end
	endcase
	case (vecslice_vectile12_vecunit50_state)
		1'd0: begin
			vecslice_vectile12_vecunit50_out_stream_w <= vecslice_vectile12_vecunit50_in_stream_w;
			vecslice_vectile12_vecunit50_out_stream_e <= vecslice_vectile12_vecunit50_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile12_vecunit50_in_stream_valid_w) begin
				vecslice_vectile12_vecunit50_const_b <= vecslice_vectile12_vecunit50_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile12_vecunit50_in_stream_valid_e) begin
				vecslice_vectile12_vecunit50_out_stream_e <= (vecslice_vectile12_vecunit50_in_stream_e + vecslice_vectile12_vecunit50_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile12_vecunit50_out_stream_e <= vecslice_vectile12_vecunit50_in_stream_w;
		end
	endcase
	case (vecslice_vectile12_vecunit51_state)
		1'd0: begin
			vecslice_vectile12_vecunit51_out_stream_w <= vecslice_vectile12_vecunit51_in_stream_w;
			vecslice_vectile12_vecunit51_out_stream_e <= vecslice_vectile12_vecunit51_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile12_vecunit51_in_stream_valid_w) begin
				vecslice_vectile12_vecunit51_const_b <= vecslice_vectile12_vecunit51_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile12_vecunit51_in_stream_valid_e) begin
				vecslice_vectile12_vecunit51_out_stream_e <= (vecslice_vectile12_vecunit51_in_stream_e + vecslice_vectile12_vecunit51_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile12_vecunit51_out_stream_e <= vecslice_vectile12_vecunit51_in_stream_w;
		end
	endcase
	case (vecslice_vectile13_state)
		1'd0: begin
			vecslice_vectile13_out_stream_valid_w <= vecslice_vectile13_in_stream_valid_w;
			vecslice_vectile13_out_stream_valid_e <= vecslice_vectile13_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile13_out_stream_valid_w <= 1'd0;
			vecslice_vectile13_out_stream_valid_e <= vecslice_vectile13_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile13_out_stream_valid_w <= vecslice_vectile13_in_stream_valid_w;
			vecslice_vectile13_out_stream_valid_e <= vecslice_vectile13_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile13_out_stream_valid_w <= 1'd0;
			vecslice_vectile13_out_stream_valid_e <= vecslice_vectile13_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile13_in_ins_valid & (vecslice_vectile13_in_ins[7:15] == 4'd13))) begin
		case (vecslice_vectile13_in_ins[15:23])
			1'd0: begin
				vecslice_vectile13_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile13_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile13_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile13_state <= 2'd3;
			end
		endcase
		vecslice_vectile13_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile13_out_ins <= vecslice_vectile13_in_ins;
		vecslice_vectile13_out_ins_valid <= vecslice_vectile13_in_ins_valid;
	end
	case (vecslice_vectile13_vecunit52_state)
		1'd0: begin
			vecslice_vectile13_vecunit52_out_stream_w <= vecslice_vectile13_vecunit52_in_stream_w;
			vecslice_vectile13_vecunit52_out_stream_e <= vecslice_vectile13_vecunit52_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile13_vecunit52_in_stream_valid_w) begin
				vecslice_vectile13_vecunit52_const_b <= vecslice_vectile13_vecunit52_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile13_vecunit52_in_stream_valid_e) begin
				vecslice_vectile13_vecunit52_out_stream_e <= (vecslice_vectile13_vecunit52_in_stream_e + vecslice_vectile13_vecunit52_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile13_vecunit52_out_stream_e <= vecslice_vectile13_vecunit52_in_stream_w;
		end
	endcase
	case (vecslice_vectile13_vecunit53_state)
		1'd0: begin
			vecslice_vectile13_vecunit53_out_stream_w <= vecslice_vectile13_vecunit53_in_stream_w;
			vecslice_vectile13_vecunit53_out_stream_e <= vecslice_vectile13_vecunit53_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile13_vecunit53_in_stream_valid_w) begin
				vecslice_vectile13_vecunit53_const_b <= vecslice_vectile13_vecunit53_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile13_vecunit53_in_stream_valid_e) begin
				vecslice_vectile13_vecunit53_out_stream_e <= (vecslice_vectile13_vecunit53_in_stream_e + vecslice_vectile13_vecunit53_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile13_vecunit53_out_stream_e <= vecslice_vectile13_vecunit53_in_stream_w;
		end
	endcase
	case (vecslice_vectile13_vecunit54_state)
		1'd0: begin
			vecslice_vectile13_vecunit54_out_stream_w <= vecslice_vectile13_vecunit54_in_stream_w;
			vecslice_vectile13_vecunit54_out_stream_e <= vecslice_vectile13_vecunit54_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile13_vecunit54_in_stream_valid_w) begin
				vecslice_vectile13_vecunit54_const_b <= vecslice_vectile13_vecunit54_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile13_vecunit54_in_stream_valid_e) begin
				vecslice_vectile13_vecunit54_out_stream_e <= (vecslice_vectile13_vecunit54_in_stream_e + vecslice_vectile13_vecunit54_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile13_vecunit54_out_stream_e <= vecslice_vectile13_vecunit54_in_stream_w;
		end
	endcase
	case (vecslice_vectile13_vecunit55_state)
		1'd0: begin
			vecslice_vectile13_vecunit55_out_stream_w <= vecslice_vectile13_vecunit55_in_stream_w;
			vecslice_vectile13_vecunit55_out_stream_e <= vecslice_vectile13_vecunit55_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile13_vecunit55_in_stream_valid_w) begin
				vecslice_vectile13_vecunit55_const_b <= vecslice_vectile13_vecunit55_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile13_vecunit55_in_stream_valid_e) begin
				vecslice_vectile13_vecunit55_out_stream_e <= (vecslice_vectile13_vecunit55_in_stream_e + vecslice_vectile13_vecunit55_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile13_vecunit55_out_stream_e <= vecslice_vectile13_vecunit55_in_stream_w;
		end
	endcase
	case (vecslice_vectile14_state)
		1'd0: begin
			vecslice_vectile14_out_stream_valid_w <= vecslice_vectile14_in_stream_valid_w;
			vecslice_vectile14_out_stream_valid_e <= vecslice_vectile14_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile14_out_stream_valid_w <= 1'd0;
			vecslice_vectile14_out_stream_valid_e <= vecslice_vectile14_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile14_out_stream_valid_w <= vecslice_vectile14_in_stream_valid_w;
			vecslice_vectile14_out_stream_valid_e <= vecslice_vectile14_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile14_out_stream_valid_w <= 1'd0;
			vecslice_vectile14_out_stream_valid_e <= vecslice_vectile14_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile14_in_ins_valid & (vecslice_vectile14_in_ins[7:15] == 4'd14))) begin
		case (vecslice_vectile14_in_ins[15:23])
			1'd0: begin
				vecslice_vectile14_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile14_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile14_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile14_state <= 2'd3;
			end
		endcase
		vecslice_vectile14_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile14_out_ins <= vecslice_vectile14_in_ins;
		vecslice_vectile14_out_ins_valid <= vecslice_vectile14_in_ins_valid;
	end
	case (vecslice_vectile14_vecunit56_state)
		1'd0: begin
			vecslice_vectile14_vecunit56_out_stream_w <= vecslice_vectile14_vecunit56_in_stream_w;
			vecslice_vectile14_vecunit56_out_stream_e <= vecslice_vectile14_vecunit56_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile14_vecunit56_in_stream_valid_w) begin
				vecslice_vectile14_vecunit56_const_b <= vecslice_vectile14_vecunit56_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile14_vecunit56_in_stream_valid_e) begin
				vecslice_vectile14_vecunit56_out_stream_e <= (vecslice_vectile14_vecunit56_in_stream_e + vecslice_vectile14_vecunit56_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile14_vecunit56_out_stream_e <= vecslice_vectile14_vecunit56_in_stream_w;
		end
	endcase
	case (vecslice_vectile14_vecunit57_state)
		1'd0: begin
			vecslice_vectile14_vecunit57_out_stream_w <= vecslice_vectile14_vecunit57_in_stream_w;
			vecslice_vectile14_vecunit57_out_stream_e <= vecslice_vectile14_vecunit57_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile14_vecunit57_in_stream_valid_w) begin
				vecslice_vectile14_vecunit57_const_b <= vecslice_vectile14_vecunit57_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile14_vecunit57_in_stream_valid_e) begin
				vecslice_vectile14_vecunit57_out_stream_e <= (vecslice_vectile14_vecunit57_in_stream_e + vecslice_vectile14_vecunit57_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile14_vecunit57_out_stream_e <= vecslice_vectile14_vecunit57_in_stream_w;
		end
	endcase
	case (vecslice_vectile14_vecunit58_state)
		1'd0: begin
			vecslice_vectile14_vecunit58_out_stream_w <= vecslice_vectile14_vecunit58_in_stream_w;
			vecslice_vectile14_vecunit58_out_stream_e <= vecslice_vectile14_vecunit58_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile14_vecunit58_in_stream_valid_w) begin
				vecslice_vectile14_vecunit58_const_b <= vecslice_vectile14_vecunit58_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile14_vecunit58_in_stream_valid_e) begin
				vecslice_vectile14_vecunit58_out_stream_e <= (vecslice_vectile14_vecunit58_in_stream_e + vecslice_vectile14_vecunit58_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile14_vecunit58_out_stream_e <= vecslice_vectile14_vecunit58_in_stream_w;
		end
	endcase
	case (vecslice_vectile14_vecunit59_state)
		1'd0: begin
			vecslice_vectile14_vecunit59_out_stream_w <= vecslice_vectile14_vecunit59_in_stream_w;
			vecslice_vectile14_vecunit59_out_stream_e <= vecslice_vectile14_vecunit59_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile14_vecunit59_in_stream_valid_w) begin
				vecslice_vectile14_vecunit59_const_b <= vecslice_vectile14_vecunit59_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile14_vecunit59_in_stream_valid_e) begin
				vecslice_vectile14_vecunit59_out_stream_e <= (vecslice_vectile14_vecunit59_in_stream_e + vecslice_vectile14_vecunit59_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile14_vecunit59_out_stream_e <= vecslice_vectile14_vecunit59_in_stream_w;
		end
	endcase
	case (vecslice_vectile15_state)
		1'd0: begin
			vecslice_vectile15_out_stream_valid_w <= vecslice_vectile15_in_stream_valid_w;
			vecslice_vectile15_out_stream_valid_e <= vecslice_vectile15_in_stream_valid_e;
		end
		1'd1: begin
			vecslice_vectile15_out_stream_valid_w <= 1'd0;
			vecslice_vectile15_out_stream_valid_e <= vecslice_vectile15_in_stream_valid_e;
		end
		2'd2: begin
			vecslice_vectile15_out_stream_valid_w <= vecslice_vectile15_in_stream_valid_w;
			vecslice_vectile15_out_stream_valid_e <= vecslice_vectile15_in_stream_valid_e;
		end
		2'd3: begin
			vecslice_vectile15_out_stream_valid_w <= 1'd0;
			vecslice_vectile15_out_stream_valid_e <= vecslice_vectile15_in_stream_valid_w;
		end
	endcase
	if ((vecslice_vectile15_in_ins_valid & (vecslice_vectile15_in_ins[7:15] == 4'd15))) begin
		case (vecslice_vectile15_in_ins[15:23])
			1'd0: begin
				vecslice_vectile15_state <= 1'd0;
			end
			1'd1: begin
				vecslice_vectile15_state <= 1'd1;
			end
			2'd2: begin
				vecslice_vectile15_state <= 2'd2;
			end
			2'd3: begin
				vecslice_vectile15_state <= 2'd3;
			end
		endcase
		vecslice_vectile15_out_ins_valid <= 1'd0;
	end else begin
		vecslice_vectile15_out_ins <= vecslice_vectile15_in_ins;
		vecslice_vectile15_out_ins_valid <= vecslice_vectile15_in_ins_valid;
	end
	case (vecslice_vectile15_vecunit60_state)
		1'd0: begin
			vecslice_vectile15_vecunit60_out_stream_w <= vecslice_vectile15_vecunit60_in_stream_w;
			vecslice_vectile15_vecunit60_out_stream_e <= vecslice_vectile15_vecunit60_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile15_vecunit60_in_stream_valid_w) begin
				vecslice_vectile15_vecunit60_const_b <= vecslice_vectile15_vecunit60_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile15_vecunit60_in_stream_valid_e) begin
				vecslice_vectile15_vecunit60_out_stream_e <= (vecslice_vectile15_vecunit60_in_stream_e + vecslice_vectile15_vecunit60_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile15_vecunit60_out_stream_e <= vecslice_vectile15_vecunit60_in_stream_w;
		end
	endcase
	case (vecslice_vectile15_vecunit61_state)
		1'd0: begin
			vecslice_vectile15_vecunit61_out_stream_w <= vecslice_vectile15_vecunit61_in_stream_w;
			vecslice_vectile15_vecunit61_out_stream_e <= vecslice_vectile15_vecunit61_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile15_vecunit61_in_stream_valid_w) begin
				vecslice_vectile15_vecunit61_const_b <= vecslice_vectile15_vecunit61_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile15_vecunit61_in_stream_valid_e) begin
				vecslice_vectile15_vecunit61_out_stream_e <= (vecslice_vectile15_vecunit61_in_stream_e + vecslice_vectile15_vecunit61_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile15_vecunit61_out_stream_e <= vecslice_vectile15_vecunit61_in_stream_w;
		end
	endcase
	case (vecslice_vectile15_vecunit62_state)
		1'd0: begin
			vecslice_vectile15_vecunit62_out_stream_w <= vecslice_vectile15_vecunit62_in_stream_w;
			vecslice_vectile15_vecunit62_out_stream_e <= vecslice_vectile15_vecunit62_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile15_vecunit62_in_stream_valid_w) begin
				vecslice_vectile15_vecunit62_const_b <= vecslice_vectile15_vecunit62_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile15_vecunit62_in_stream_valid_e) begin
				vecslice_vectile15_vecunit62_out_stream_e <= (vecslice_vectile15_vecunit62_in_stream_e + vecslice_vectile15_vecunit62_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile15_vecunit62_out_stream_e <= vecslice_vectile15_vecunit62_in_stream_w;
		end
	endcase
	case (vecslice_vectile15_vecunit63_state)
		1'd0: begin
			vecslice_vectile15_vecunit63_out_stream_w <= vecslice_vectile15_vecunit63_in_stream_w;
			vecslice_vectile15_vecunit63_out_stream_e <= vecslice_vectile15_vecunit63_in_stream_e;
		end
		1'd1: begin
			if (vecslice_vectile15_vecunit63_in_stream_valid_w) begin
				vecslice_vectile15_vecunit63_const_b <= vecslice_vectile15_vecunit63_in_stream_w;
			end
		end
		2'd2: begin
			if (vecslice_vectile15_vecunit63_in_stream_valid_e) begin
				vecslice_vectile15_vecunit63_out_stream_e <= (vecslice_vectile15_vecunit63_in_stream_e + vecslice_vectile15_vecunit63_const_b);
			end
		end
		2'd3: begin
			vecslice_vectile15_vecunit63_out_stream_e <= vecslice_vectile15_vecunit63_in_stream_w;
		end
	endcase
	if (sys_rst) begin
		vecslice_vectile0_out_stream_valid_e <= 1'd0;
		vecslice_vectile0_out_stream_valid_w <= 1'd0;
		vecslice_vectile0_out_ins <= 64'd0;
		vecslice_vectile0_out_ins_valid <= 1'd0;
		vecslice_vectile0_state <= 2'd0;
		vecslice_vectile0_vecunit0_out_stream_e <= 8'd0;
		vecslice_vectile0_vecunit0_out_stream_w <= 8'd0;
		vecslice_vectile0_vecunit0_const_b <= 8'd0;
		vecslice_vectile0_vecunit1_out_stream_e <= 8'd0;
		vecslice_vectile0_vecunit1_out_stream_w <= 8'd0;
		vecslice_vectile0_vecunit1_const_b <= 8'd0;
		vecslice_vectile0_vecunit2_out_stream_e <= 8'd0;
		vecslice_vectile0_vecunit2_out_stream_w <= 8'd0;
		vecslice_vectile0_vecunit2_const_b <= 8'd0;
		vecslice_vectile0_vecunit3_out_stream_e <= 8'd0;
		vecslice_vectile0_vecunit3_out_stream_w <= 8'd0;
		vecslice_vectile0_vecunit3_const_b <= 8'd0;
		vecslice_vectile1_out_stream_valid_e <= 1'd0;
		vecslice_vectile1_out_stream_valid_w <= 1'd0;
		vecslice_vectile1_out_ins <= 64'd0;
		vecslice_vectile1_out_ins_valid <= 1'd0;
		vecslice_vectile1_state <= 2'd0;
		vecslice_vectile1_vecunit4_out_stream_e <= 8'd0;
		vecslice_vectile1_vecunit4_out_stream_w <= 8'd0;
		vecslice_vectile1_vecunit4_const_b <= 8'd0;
		vecslice_vectile1_vecunit5_out_stream_e <= 8'd0;
		vecslice_vectile1_vecunit5_out_stream_w <= 8'd0;
		vecslice_vectile1_vecunit5_const_b <= 8'd0;
		vecslice_vectile1_vecunit6_out_stream_e <= 8'd0;
		vecslice_vectile1_vecunit6_out_stream_w <= 8'd0;
		vecslice_vectile1_vecunit6_const_b <= 8'd0;
		vecslice_vectile1_vecunit7_out_stream_e <= 8'd0;
		vecslice_vectile1_vecunit7_out_stream_w <= 8'd0;
		vecslice_vectile1_vecunit7_const_b <= 8'd0;
		vecslice_vectile2_out_stream_valid_e <= 1'd0;
		vecslice_vectile2_out_stream_valid_w <= 1'd0;
		vecslice_vectile2_out_ins <= 64'd0;
		vecslice_vectile2_out_ins_valid <= 1'd0;
		vecslice_vectile2_state <= 2'd0;
		vecslice_vectile2_vecunit8_out_stream_e <= 8'd0;
		vecslice_vectile2_vecunit8_out_stream_w <= 8'd0;
		vecslice_vectile2_vecunit8_const_b <= 8'd0;
		vecslice_vectile2_vecunit9_out_stream_e <= 8'd0;
		vecslice_vectile2_vecunit9_out_stream_w <= 8'd0;
		vecslice_vectile2_vecunit9_const_b <= 8'd0;
		vecslice_vectile2_vecunit10_out_stream_e <= 8'd0;
		vecslice_vectile2_vecunit10_out_stream_w <= 8'd0;
		vecslice_vectile2_vecunit10_const_b <= 8'd0;
		vecslice_vectile2_vecunit11_out_stream_e <= 8'd0;
		vecslice_vectile2_vecunit11_out_stream_w <= 8'd0;
		vecslice_vectile2_vecunit11_const_b <= 8'd0;
		vecslice_vectile3_out_stream_valid_e <= 1'd0;
		vecslice_vectile3_out_stream_valid_w <= 1'd0;
		vecslice_vectile3_out_ins <= 64'd0;
		vecslice_vectile3_out_ins_valid <= 1'd0;
		vecslice_vectile3_state <= 2'd0;
		vecslice_vectile3_vecunit12_out_stream_e <= 8'd0;
		vecslice_vectile3_vecunit12_out_stream_w <= 8'd0;
		vecslice_vectile3_vecunit12_const_b <= 8'd0;
		vecslice_vectile3_vecunit13_out_stream_e <= 8'd0;
		vecslice_vectile3_vecunit13_out_stream_w <= 8'd0;
		vecslice_vectile3_vecunit13_const_b <= 8'd0;
		vecslice_vectile3_vecunit14_out_stream_e <= 8'd0;
		vecslice_vectile3_vecunit14_out_stream_w <= 8'd0;
		vecslice_vectile3_vecunit14_const_b <= 8'd0;
		vecslice_vectile3_vecunit15_out_stream_e <= 8'd0;
		vecslice_vectile3_vecunit15_out_stream_w <= 8'd0;
		vecslice_vectile3_vecunit15_const_b <= 8'd0;
		vecslice_vectile4_out_stream_valid_e <= 1'd0;
		vecslice_vectile4_out_stream_valid_w <= 1'd0;
		vecslice_vectile4_out_ins <= 64'd0;
		vecslice_vectile4_out_ins_valid <= 1'd0;
		vecslice_vectile4_state <= 2'd0;
		vecslice_vectile4_vecunit16_out_stream_e <= 8'd0;
		vecslice_vectile4_vecunit16_out_stream_w <= 8'd0;
		vecslice_vectile4_vecunit16_const_b <= 8'd0;
		vecslice_vectile4_vecunit17_out_stream_e <= 8'd0;
		vecslice_vectile4_vecunit17_out_stream_w <= 8'd0;
		vecslice_vectile4_vecunit17_const_b <= 8'd0;
		vecslice_vectile4_vecunit18_out_stream_e <= 8'd0;
		vecslice_vectile4_vecunit18_out_stream_w <= 8'd0;
		vecslice_vectile4_vecunit18_const_b <= 8'd0;
		vecslice_vectile4_vecunit19_out_stream_e <= 8'd0;
		vecslice_vectile4_vecunit19_out_stream_w <= 8'd0;
		vecslice_vectile4_vecunit19_const_b <= 8'd0;
		vecslice_vectile5_out_stream_valid_e <= 1'd0;
		vecslice_vectile5_out_stream_valid_w <= 1'd0;
		vecslice_vectile5_out_ins <= 64'd0;
		vecslice_vectile5_out_ins_valid <= 1'd0;
		vecslice_vectile5_state <= 2'd0;
		vecslice_vectile5_vecunit20_out_stream_e <= 8'd0;
		vecslice_vectile5_vecunit20_out_stream_w <= 8'd0;
		vecslice_vectile5_vecunit20_const_b <= 8'd0;
		vecslice_vectile5_vecunit21_out_stream_e <= 8'd0;
		vecslice_vectile5_vecunit21_out_stream_w <= 8'd0;
		vecslice_vectile5_vecunit21_const_b <= 8'd0;
		vecslice_vectile5_vecunit22_out_stream_e <= 8'd0;
		vecslice_vectile5_vecunit22_out_stream_w <= 8'd0;
		vecslice_vectile5_vecunit22_const_b <= 8'd0;
		vecslice_vectile5_vecunit23_out_stream_e <= 8'd0;
		vecslice_vectile5_vecunit23_out_stream_w <= 8'd0;
		vecslice_vectile5_vecunit23_const_b <= 8'd0;
		vecslice_vectile6_out_stream_valid_e <= 1'd0;
		vecslice_vectile6_out_stream_valid_w <= 1'd0;
		vecslice_vectile6_out_ins <= 64'd0;
		vecslice_vectile6_out_ins_valid <= 1'd0;
		vecslice_vectile6_state <= 2'd0;
		vecslice_vectile6_vecunit24_out_stream_e <= 8'd0;
		vecslice_vectile6_vecunit24_out_stream_w <= 8'd0;
		vecslice_vectile6_vecunit24_const_b <= 8'd0;
		vecslice_vectile6_vecunit25_out_stream_e <= 8'd0;
		vecslice_vectile6_vecunit25_out_stream_w <= 8'd0;
		vecslice_vectile6_vecunit25_const_b <= 8'd0;
		vecslice_vectile6_vecunit26_out_stream_e <= 8'd0;
		vecslice_vectile6_vecunit26_out_stream_w <= 8'd0;
		vecslice_vectile6_vecunit26_const_b <= 8'd0;
		vecslice_vectile6_vecunit27_out_stream_e <= 8'd0;
		vecslice_vectile6_vecunit27_out_stream_w <= 8'd0;
		vecslice_vectile6_vecunit27_const_b <= 8'd0;
		vecslice_vectile7_out_stream_valid_e <= 1'd0;
		vecslice_vectile7_out_stream_valid_w <= 1'd0;
		vecslice_vectile7_out_ins <= 64'd0;
		vecslice_vectile7_out_ins_valid <= 1'd0;
		vecslice_vectile7_state <= 2'd0;
		vecslice_vectile7_vecunit28_out_stream_e <= 8'd0;
		vecslice_vectile7_vecunit28_out_stream_w <= 8'd0;
		vecslice_vectile7_vecunit28_const_b <= 8'd0;
		vecslice_vectile7_vecunit29_out_stream_e <= 8'd0;
		vecslice_vectile7_vecunit29_out_stream_w <= 8'd0;
		vecslice_vectile7_vecunit29_const_b <= 8'd0;
		vecslice_vectile7_vecunit30_out_stream_e <= 8'd0;
		vecslice_vectile7_vecunit30_out_stream_w <= 8'd0;
		vecslice_vectile7_vecunit30_const_b <= 8'd0;
		vecslice_vectile7_vecunit31_out_stream_e <= 8'd0;
		vecslice_vectile7_vecunit31_out_stream_w <= 8'd0;
		vecslice_vectile7_vecunit31_const_b <= 8'd0;
		vecslice_vectile8_out_stream_valid_e <= 1'd0;
		vecslice_vectile8_out_stream_valid_w <= 1'd0;
		vecslice_vectile8_out_ins <= 64'd0;
		vecslice_vectile8_out_ins_valid <= 1'd0;
		vecslice_vectile8_state <= 2'd0;
		vecslice_vectile8_vecunit32_out_stream_e <= 8'd0;
		vecslice_vectile8_vecunit32_out_stream_w <= 8'd0;
		vecslice_vectile8_vecunit32_const_b <= 8'd0;
		vecslice_vectile8_vecunit33_out_stream_e <= 8'd0;
		vecslice_vectile8_vecunit33_out_stream_w <= 8'd0;
		vecslice_vectile8_vecunit33_const_b <= 8'd0;
		vecslice_vectile8_vecunit34_out_stream_e <= 8'd0;
		vecslice_vectile8_vecunit34_out_stream_w <= 8'd0;
		vecslice_vectile8_vecunit34_const_b <= 8'd0;
		vecslice_vectile8_vecunit35_out_stream_e <= 8'd0;
		vecslice_vectile8_vecunit35_out_stream_w <= 8'd0;
		vecslice_vectile8_vecunit35_const_b <= 8'd0;
		vecslice_vectile9_out_stream_valid_e <= 1'd0;
		vecslice_vectile9_out_stream_valid_w <= 1'd0;
		vecslice_vectile9_out_ins <= 64'd0;
		vecslice_vectile9_out_ins_valid <= 1'd0;
		vecslice_vectile9_state <= 2'd0;
		vecslice_vectile9_vecunit36_out_stream_e <= 8'd0;
		vecslice_vectile9_vecunit36_out_stream_w <= 8'd0;
		vecslice_vectile9_vecunit36_const_b <= 8'd0;
		vecslice_vectile9_vecunit37_out_stream_e <= 8'd0;
		vecslice_vectile9_vecunit37_out_stream_w <= 8'd0;
		vecslice_vectile9_vecunit37_const_b <= 8'd0;
		vecslice_vectile9_vecunit38_out_stream_e <= 8'd0;
		vecslice_vectile9_vecunit38_out_stream_w <= 8'd0;
		vecslice_vectile9_vecunit38_const_b <= 8'd0;
		vecslice_vectile9_vecunit39_out_stream_e <= 8'd0;
		vecslice_vectile9_vecunit39_out_stream_w <= 8'd0;
		vecslice_vectile9_vecunit39_const_b <= 8'd0;
		vecslice_vectile10_out_stream_valid_e <= 1'd0;
		vecslice_vectile10_out_stream_valid_w <= 1'd0;
		vecslice_vectile10_out_ins <= 64'd0;
		vecslice_vectile10_out_ins_valid <= 1'd0;
		vecslice_vectile10_state <= 2'd0;
		vecslice_vectile10_vecunit40_out_stream_e <= 8'd0;
		vecslice_vectile10_vecunit40_out_stream_w <= 8'd0;
		vecslice_vectile10_vecunit40_const_b <= 8'd0;
		vecslice_vectile10_vecunit41_out_stream_e <= 8'd0;
		vecslice_vectile10_vecunit41_out_stream_w <= 8'd0;
		vecslice_vectile10_vecunit41_const_b <= 8'd0;
		vecslice_vectile10_vecunit42_out_stream_e <= 8'd0;
		vecslice_vectile10_vecunit42_out_stream_w <= 8'd0;
		vecslice_vectile10_vecunit42_const_b <= 8'd0;
		vecslice_vectile10_vecunit43_out_stream_e <= 8'd0;
		vecslice_vectile10_vecunit43_out_stream_w <= 8'd0;
		vecslice_vectile10_vecunit43_const_b <= 8'd0;
		vecslice_vectile11_out_stream_valid_e <= 1'd0;
		vecslice_vectile11_out_stream_valid_w <= 1'd0;
		vecslice_vectile11_out_ins <= 64'd0;
		vecslice_vectile11_out_ins_valid <= 1'd0;
		vecslice_vectile11_state <= 2'd0;
		vecslice_vectile11_vecunit44_out_stream_e <= 8'd0;
		vecslice_vectile11_vecunit44_out_stream_w <= 8'd0;
		vecslice_vectile11_vecunit44_const_b <= 8'd0;
		vecslice_vectile11_vecunit45_out_stream_e <= 8'd0;
		vecslice_vectile11_vecunit45_out_stream_w <= 8'd0;
		vecslice_vectile11_vecunit45_const_b <= 8'd0;
		vecslice_vectile11_vecunit46_out_stream_e <= 8'd0;
		vecslice_vectile11_vecunit46_out_stream_w <= 8'd0;
		vecslice_vectile11_vecunit46_const_b <= 8'd0;
		vecslice_vectile11_vecunit47_out_stream_e <= 8'd0;
		vecslice_vectile11_vecunit47_out_stream_w <= 8'd0;
		vecslice_vectile11_vecunit47_const_b <= 8'd0;
		vecslice_vectile12_out_stream_valid_e <= 1'd0;
		vecslice_vectile12_out_stream_valid_w <= 1'd0;
		vecslice_vectile12_out_ins <= 64'd0;
		vecslice_vectile12_out_ins_valid <= 1'd0;
		vecslice_vectile12_state <= 2'd0;
		vecslice_vectile12_vecunit48_out_stream_e <= 8'd0;
		vecslice_vectile12_vecunit48_out_stream_w <= 8'd0;
		vecslice_vectile12_vecunit48_const_b <= 8'd0;
		vecslice_vectile12_vecunit49_out_stream_e <= 8'd0;
		vecslice_vectile12_vecunit49_out_stream_w <= 8'd0;
		vecslice_vectile12_vecunit49_const_b <= 8'd0;
		vecslice_vectile12_vecunit50_out_stream_e <= 8'd0;
		vecslice_vectile12_vecunit50_out_stream_w <= 8'd0;
		vecslice_vectile12_vecunit50_const_b <= 8'd0;
		vecslice_vectile12_vecunit51_out_stream_e <= 8'd0;
		vecslice_vectile12_vecunit51_out_stream_w <= 8'd0;
		vecslice_vectile12_vecunit51_const_b <= 8'd0;
		vecslice_vectile13_out_stream_valid_e <= 1'd0;
		vecslice_vectile13_out_stream_valid_w <= 1'd0;
		vecslice_vectile13_out_ins <= 64'd0;
		vecslice_vectile13_out_ins_valid <= 1'd0;
		vecslice_vectile13_state <= 2'd0;
		vecslice_vectile13_vecunit52_out_stream_e <= 8'd0;
		vecslice_vectile13_vecunit52_out_stream_w <= 8'd0;
		vecslice_vectile13_vecunit52_const_b <= 8'd0;
		vecslice_vectile13_vecunit53_out_stream_e <= 8'd0;
		vecslice_vectile13_vecunit53_out_stream_w <= 8'd0;
		vecslice_vectile13_vecunit53_const_b <= 8'd0;
		vecslice_vectile13_vecunit54_out_stream_e <= 8'd0;
		vecslice_vectile13_vecunit54_out_stream_w <= 8'd0;
		vecslice_vectile13_vecunit54_const_b <= 8'd0;
		vecslice_vectile13_vecunit55_out_stream_e <= 8'd0;
		vecslice_vectile13_vecunit55_out_stream_w <= 8'd0;
		vecslice_vectile13_vecunit55_const_b <= 8'd0;
		vecslice_vectile14_out_stream_valid_e <= 1'd0;
		vecslice_vectile14_out_stream_valid_w <= 1'd0;
		vecslice_vectile14_out_ins <= 64'd0;
		vecslice_vectile14_out_ins_valid <= 1'd0;
		vecslice_vectile14_state <= 2'd0;
		vecslice_vectile14_vecunit56_out_stream_e <= 8'd0;
		vecslice_vectile14_vecunit56_out_stream_w <= 8'd0;
		vecslice_vectile14_vecunit56_const_b <= 8'd0;
		vecslice_vectile14_vecunit57_out_stream_e <= 8'd0;
		vecslice_vectile14_vecunit57_out_stream_w <= 8'd0;
		vecslice_vectile14_vecunit57_const_b <= 8'd0;
		vecslice_vectile14_vecunit58_out_stream_e <= 8'd0;
		vecslice_vectile14_vecunit58_out_stream_w <= 8'd0;
		vecslice_vectile14_vecunit58_const_b <= 8'd0;
		vecslice_vectile14_vecunit59_out_stream_e <= 8'd0;
		vecslice_vectile14_vecunit59_out_stream_w <= 8'd0;
		vecslice_vectile14_vecunit59_const_b <= 8'd0;
		vecslice_vectile15_out_stream_valid_e <= 1'd0;
		vecslice_vectile15_out_stream_valid_w <= 1'd0;
		vecslice_vectile15_out_ins <= 64'd0;
		vecslice_vectile15_out_ins_valid <= 1'd0;
		vecslice_vectile15_state <= 2'd0;
		vecslice_vectile15_vecunit60_out_stream_e <= 8'd0;
		vecslice_vectile15_vecunit60_out_stream_w <= 8'd0;
		vecslice_vectile15_vecunit60_const_b <= 8'd0;
		vecslice_vectile15_vecunit61_out_stream_e <= 8'd0;
		vecslice_vectile15_vecunit61_out_stream_w <= 8'd0;
		vecslice_vectile15_vecunit61_const_b <= 8'd0;
		vecslice_vectile15_vecunit62_out_stream_e <= 8'd0;
		vecslice_vectile15_vecunit62_out_stream_w <= 8'd0;
		vecslice_vectile15_vecunit62_const_b <= 8'd0;
		vecslice_vectile15_vecunit63_out_stream_e <= 8'd0;
		vecslice_vectile15_vecunit63_out_stream_w <= 8'd0;
		vecslice_vectile15_vecunit63_const_b <= 8'd0;
	end
end

endmodule
