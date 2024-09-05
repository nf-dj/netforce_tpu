/* Machine-generated using Migen */
module top(
	input [511:0] in_stream_w,
	input [15:0] in_stream_w_valid,
	input [511:0] in_stream_e,
	input [15:0] in_stream_e_valid,
	input [63:0] in_ins,
	input in_ins_valid,
	output reg [511:0] out_stream_e,
	output reg [15:0] out_stream_e_valid,
	output reg [511:0] out_stream_w,
	output reg [15:0] out_stream_w_valid,
	output reg sys_clk,
	input sys_rst
);

wire [63:0] dotslice0;
wire [63:0] dotslice1;
wire [63:0] dotslice2;
wire [63:0] dotslice3;
wire [63:0] dotslice4;
wire [63:0] dotslice5;
wire [63:0] dotslice6;
wire [63:0] dotslice7;
wire [63:0] dotslice8;
wire [63:0] dotslice9;
wire [63:0] dotslice10;
wire [63:0] dotslice11;
wire [63:0] dotslice12;
wire [63:0] dotslice13;
wire [63:0] dotslice14;
wire [63:0] dotslice15;
wire dotslice16;
wire dotslice17;
wire dotslice18;
wire dotslice19;
wire dotslice20;
wire dotslice21;
wire dotslice22;
wire dotslice23;
wire dotslice24;
wire dotslice25;
wire dotslice26;
wire dotslice27;
wire dotslice28;
wire dotslice29;
wire dotslice30;
wire dotslice31;
wire [31:0] dotslice_dottile0_in_stream_w;
wire dotslice_dottile0_in_stream_w_valid;
wire [31:0] dotslice_dottile0_in_stream_e;
wire dotslice_dottile0_in_stream_e_valid;
reg [63:0] dotslice_dottile0_in_ins;
reg dotslice_dottile0_in_ins_valid;
reg [31:0] dotslice_dottile0_out_stream_e;
reg dotslice_dottile0_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile0_out_stream_w;
reg dotslice_dottile0_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile0_out_ins = 64'd0;
reg dotslice_dottile0_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile0_state = 2'd0;
wire [7:0] dotslice_dottile00;
wire [7:0] dotslice_dottile01;
wire [7:0] dotslice_dottile02;
wire [7:0] dotslice_dottile03;
reg [7:0] dotslice_dottile0_in_weight = 8'd0;
wire [7:0] dotslice_dottile0_dotunit0_in_stream_w;
wire dotslice_dottile0_dotunit0_in_stream_w_valid;
wire [7:0] dotslice_dottile0_dotunit0_in_stream_e;
wire dotslice_dottile0_dotunit0_in_stream_e_valid;
wire [7:0] dotslice_dottile0_dotunit0_in_weight;
reg [7:0] dotslice_dottile0_dotunit0_out_stream_e;
reg [7:0] dotslice_dottile0_dotunit0_out_stream_w;
reg [7:0] dotslice_dottile0_dotunit0_out_weight = 8'd0;
reg [7:0] dotslice_dottile0_dotunit0_weight = 8'd0;
reg [15:0] dotslice_dottile0_dotunit0_sum = 16'd0;
wire [7:0] dotslice_dottile0_dotunit1_in_stream_w;
wire dotslice_dottile0_dotunit1_in_stream_w_valid;
wire [7:0] dotslice_dottile0_dotunit1_in_stream_e;
wire dotslice_dottile0_dotunit1_in_stream_e_valid;
wire [7:0] dotslice_dottile0_dotunit1_in_weight;
reg [7:0] dotslice_dottile0_dotunit1_out_stream_e;
reg [7:0] dotslice_dottile0_dotunit1_out_stream_w;
reg [7:0] dotslice_dottile0_dotunit1_out_weight = 8'd0;
reg [7:0] dotslice_dottile0_dotunit1_weight = 8'd0;
reg [15:0] dotslice_dottile0_dotunit1_sum = 16'd0;
wire [7:0] dotslice_dottile0_dotunit2_in_stream_w;
wire dotslice_dottile0_dotunit2_in_stream_w_valid;
wire [7:0] dotslice_dottile0_dotunit2_in_stream_e;
wire dotslice_dottile0_dotunit2_in_stream_e_valid;
wire [7:0] dotslice_dottile0_dotunit2_in_weight;
reg [7:0] dotslice_dottile0_dotunit2_out_stream_e;
reg [7:0] dotslice_dottile0_dotunit2_out_stream_w;
reg [7:0] dotslice_dottile0_dotunit2_out_weight = 8'd0;
reg [7:0] dotslice_dottile0_dotunit2_weight = 8'd0;
reg [15:0] dotslice_dottile0_dotunit2_sum = 16'd0;
wire [7:0] dotslice_dottile0_dotunit3_in_stream_w;
wire dotslice_dottile0_dotunit3_in_stream_w_valid;
wire [7:0] dotslice_dottile0_dotunit3_in_stream_e;
wire dotslice_dottile0_dotunit3_in_stream_e_valid;
wire [7:0] dotslice_dottile0_dotunit3_in_weight;
reg [7:0] dotslice_dottile0_dotunit3_out_stream_e;
reg [7:0] dotslice_dottile0_dotunit3_out_stream_w;
reg [7:0] dotslice_dottile0_dotunit3_out_weight = 8'd0;
reg [7:0] dotslice_dottile0_dotunit3_weight = 8'd0;
reg [15:0] dotslice_dottile0_dotunit3_sum = 16'd0;
wire [31:0] dotslice_dottile1_in_stream_w;
wire dotslice_dottile1_in_stream_w_valid;
wire [31:0] dotslice_dottile1_in_stream_e;
wire dotslice_dottile1_in_stream_e_valid;
reg [63:0] dotslice_dottile1_in_ins;
reg dotslice_dottile1_in_ins_valid;
reg [31:0] dotslice_dottile1_out_stream_e;
reg dotslice_dottile1_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile1_out_stream_w;
reg dotslice_dottile1_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile1_out_ins = 64'd0;
reg dotslice_dottile1_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile1_state = 2'd0;
wire [7:0] dotslice_dottile10;
wire [7:0] dotslice_dottile11;
wire [7:0] dotslice_dottile12;
wire [7:0] dotslice_dottile13;
reg [7:0] dotslice_dottile1_in_weight = 8'd0;
wire [7:0] dotslice_dottile1_dotunit4_in_stream_w;
wire dotslice_dottile1_dotunit4_in_stream_w_valid;
wire [7:0] dotslice_dottile1_dotunit4_in_stream_e;
wire dotslice_dottile1_dotunit4_in_stream_e_valid;
wire [7:0] dotslice_dottile1_dotunit4_in_weight;
reg [7:0] dotslice_dottile1_dotunit4_out_stream_e;
reg [7:0] dotslice_dottile1_dotunit4_out_stream_w;
reg [7:0] dotslice_dottile1_dotunit4_out_weight = 8'd0;
reg [7:0] dotslice_dottile1_dotunit4_weight = 8'd0;
reg [15:0] dotslice_dottile1_dotunit4_sum = 16'd0;
wire [7:0] dotslice_dottile1_dotunit5_in_stream_w;
wire dotslice_dottile1_dotunit5_in_stream_w_valid;
wire [7:0] dotslice_dottile1_dotunit5_in_stream_e;
wire dotslice_dottile1_dotunit5_in_stream_e_valid;
wire [7:0] dotslice_dottile1_dotunit5_in_weight;
reg [7:0] dotslice_dottile1_dotunit5_out_stream_e;
reg [7:0] dotslice_dottile1_dotunit5_out_stream_w;
reg [7:0] dotslice_dottile1_dotunit5_out_weight = 8'd0;
reg [7:0] dotslice_dottile1_dotunit5_weight = 8'd0;
reg [15:0] dotslice_dottile1_dotunit5_sum = 16'd0;
wire [7:0] dotslice_dottile1_dotunit6_in_stream_w;
wire dotslice_dottile1_dotunit6_in_stream_w_valid;
wire [7:0] dotslice_dottile1_dotunit6_in_stream_e;
wire dotslice_dottile1_dotunit6_in_stream_e_valid;
wire [7:0] dotslice_dottile1_dotunit6_in_weight;
reg [7:0] dotslice_dottile1_dotunit6_out_stream_e;
reg [7:0] dotslice_dottile1_dotunit6_out_stream_w;
reg [7:0] dotslice_dottile1_dotunit6_out_weight = 8'd0;
reg [7:0] dotslice_dottile1_dotunit6_weight = 8'd0;
reg [15:0] dotslice_dottile1_dotunit6_sum = 16'd0;
wire [7:0] dotslice_dottile1_dotunit7_in_stream_w;
wire dotslice_dottile1_dotunit7_in_stream_w_valid;
wire [7:0] dotslice_dottile1_dotunit7_in_stream_e;
wire dotslice_dottile1_dotunit7_in_stream_e_valid;
wire [7:0] dotslice_dottile1_dotunit7_in_weight;
reg [7:0] dotslice_dottile1_dotunit7_out_stream_e;
reg [7:0] dotslice_dottile1_dotunit7_out_stream_w;
reg [7:0] dotslice_dottile1_dotunit7_out_weight = 8'd0;
reg [7:0] dotslice_dottile1_dotunit7_weight = 8'd0;
reg [15:0] dotslice_dottile1_dotunit7_sum = 16'd0;
wire [31:0] dotslice_dottile2_in_stream_w;
wire dotslice_dottile2_in_stream_w_valid;
wire [31:0] dotslice_dottile2_in_stream_e;
wire dotslice_dottile2_in_stream_e_valid;
reg [63:0] dotslice_dottile2_in_ins;
reg dotslice_dottile2_in_ins_valid;
reg [31:0] dotslice_dottile2_out_stream_e;
reg dotslice_dottile2_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile2_out_stream_w;
reg dotslice_dottile2_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile2_out_ins = 64'd0;
reg dotslice_dottile2_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile2_state = 2'd0;
wire [7:0] dotslice_dottile20;
wire [7:0] dotslice_dottile21;
wire [7:0] dotslice_dottile22;
wire [7:0] dotslice_dottile23;
reg [7:0] dotslice_dottile2_in_weight = 8'd0;
wire [7:0] dotslice_dottile2_dotunit8_in_stream_w;
wire dotslice_dottile2_dotunit8_in_stream_w_valid;
wire [7:0] dotslice_dottile2_dotunit8_in_stream_e;
wire dotslice_dottile2_dotunit8_in_stream_e_valid;
wire [7:0] dotslice_dottile2_dotunit8_in_weight;
reg [7:0] dotslice_dottile2_dotunit8_out_stream_e;
reg [7:0] dotslice_dottile2_dotunit8_out_stream_w;
reg [7:0] dotslice_dottile2_dotunit8_out_weight = 8'd0;
reg [7:0] dotslice_dottile2_dotunit8_weight = 8'd0;
reg [15:0] dotslice_dottile2_dotunit8_sum = 16'd0;
wire [7:0] dotslice_dottile2_dotunit9_in_stream_w;
wire dotslice_dottile2_dotunit9_in_stream_w_valid;
wire [7:0] dotslice_dottile2_dotunit9_in_stream_e;
wire dotslice_dottile2_dotunit9_in_stream_e_valid;
wire [7:0] dotslice_dottile2_dotunit9_in_weight;
reg [7:0] dotslice_dottile2_dotunit9_out_stream_e;
reg [7:0] dotslice_dottile2_dotunit9_out_stream_w;
reg [7:0] dotslice_dottile2_dotunit9_out_weight = 8'd0;
reg [7:0] dotslice_dottile2_dotunit9_weight = 8'd0;
reg [15:0] dotslice_dottile2_dotunit9_sum = 16'd0;
wire [7:0] dotslice_dottile2_dotunit10_in_stream_w;
wire dotslice_dottile2_dotunit10_in_stream_w_valid;
wire [7:0] dotslice_dottile2_dotunit10_in_stream_e;
wire dotslice_dottile2_dotunit10_in_stream_e_valid;
wire [7:0] dotslice_dottile2_dotunit10_in_weight;
reg [7:0] dotslice_dottile2_dotunit10_out_stream_e;
reg [7:0] dotslice_dottile2_dotunit10_out_stream_w;
reg [7:0] dotslice_dottile2_dotunit10_out_weight = 8'd0;
reg [7:0] dotslice_dottile2_dotunit10_weight = 8'd0;
reg [15:0] dotslice_dottile2_dotunit10_sum = 16'd0;
wire [7:0] dotslice_dottile2_dotunit11_in_stream_w;
wire dotslice_dottile2_dotunit11_in_stream_w_valid;
wire [7:0] dotslice_dottile2_dotunit11_in_stream_e;
wire dotslice_dottile2_dotunit11_in_stream_e_valid;
wire [7:0] dotslice_dottile2_dotunit11_in_weight;
reg [7:0] dotslice_dottile2_dotunit11_out_stream_e;
reg [7:0] dotslice_dottile2_dotunit11_out_stream_w;
reg [7:0] dotslice_dottile2_dotunit11_out_weight = 8'd0;
reg [7:0] dotslice_dottile2_dotunit11_weight = 8'd0;
reg [15:0] dotslice_dottile2_dotunit11_sum = 16'd0;
wire [31:0] dotslice_dottile3_in_stream_w;
wire dotslice_dottile3_in_stream_w_valid;
wire [31:0] dotslice_dottile3_in_stream_e;
wire dotslice_dottile3_in_stream_e_valid;
reg [63:0] dotslice_dottile3_in_ins;
reg dotslice_dottile3_in_ins_valid;
reg [31:0] dotslice_dottile3_out_stream_e;
reg dotslice_dottile3_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile3_out_stream_w;
reg dotslice_dottile3_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile3_out_ins = 64'd0;
reg dotslice_dottile3_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile3_state = 2'd0;
wire [7:0] dotslice_dottile30;
wire [7:0] dotslice_dottile31;
wire [7:0] dotslice_dottile32;
wire [7:0] dotslice_dottile33;
reg [7:0] dotslice_dottile3_in_weight = 8'd0;
wire [7:0] dotslice_dottile3_dotunit12_in_stream_w;
wire dotslice_dottile3_dotunit12_in_stream_w_valid;
wire [7:0] dotslice_dottile3_dotunit12_in_stream_e;
wire dotslice_dottile3_dotunit12_in_stream_e_valid;
wire [7:0] dotslice_dottile3_dotunit12_in_weight;
reg [7:0] dotslice_dottile3_dotunit12_out_stream_e;
reg [7:0] dotslice_dottile3_dotunit12_out_stream_w;
reg [7:0] dotslice_dottile3_dotunit12_out_weight = 8'd0;
reg [7:0] dotslice_dottile3_dotunit12_weight = 8'd0;
reg [15:0] dotslice_dottile3_dotunit12_sum = 16'd0;
wire [7:0] dotslice_dottile3_dotunit13_in_stream_w;
wire dotslice_dottile3_dotunit13_in_stream_w_valid;
wire [7:0] dotslice_dottile3_dotunit13_in_stream_e;
wire dotslice_dottile3_dotunit13_in_stream_e_valid;
wire [7:0] dotslice_dottile3_dotunit13_in_weight;
reg [7:0] dotslice_dottile3_dotunit13_out_stream_e;
reg [7:0] dotslice_dottile3_dotunit13_out_stream_w;
reg [7:0] dotslice_dottile3_dotunit13_out_weight = 8'd0;
reg [7:0] dotslice_dottile3_dotunit13_weight = 8'd0;
reg [15:0] dotslice_dottile3_dotunit13_sum = 16'd0;
wire [7:0] dotslice_dottile3_dotunit14_in_stream_w;
wire dotslice_dottile3_dotunit14_in_stream_w_valid;
wire [7:0] dotslice_dottile3_dotunit14_in_stream_e;
wire dotslice_dottile3_dotunit14_in_stream_e_valid;
wire [7:0] dotslice_dottile3_dotunit14_in_weight;
reg [7:0] dotslice_dottile3_dotunit14_out_stream_e;
reg [7:0] dotslice_dottile3_dotunit14_out_stream_w;
reg [7:0] dotslice_dottile3_dotunit14_out_weight = 8'd0;
reg [7:0] dotslice_dottile3_dotunit14_weight = 8'd0;
reg [15:0] dotslice_dottile3_dotunit14_sum = 16'd0;
wire [7:0] dotslice_dottile3_dotunit15_in_stream_w;
wire dotslice_dottile3_dotunit15_in_stream_w_valid;
wire [7:0] dotslice_dottile3_dotunit15_in_stream_e;
wire dotslice_dottile3_dotunit15_in_stream_e_valid;
wire [7:0] dotslice_dottile3_dotunit15_in_weight;
reg [7:0] dotslice_dottile3_dotunit15_out_stream_e;
reg [7:0] dotslice_dottile3_dotunit15_out_stream_w;
reg [7:0] dotslice_dottile3_dotunit15_out_weight = 8'd0;
reg [7:0] dotslice_dottile3_dotunit15_weight = 8'd0;
reg [15:0] dotslice_dottile3_dotunit15_sum = 16'd0;
wire [31:0] dotslice_dottile4_in_stream_w;
wire dotslice_dottile4_in_stream_w_valid;
wire [31:0] dotslice_dottile4_in_stream_e;
wire dotslice_dottile4_in_stream_e_valid;
reg [63:0] dotslice_dottile4_in_ins;
reg dotslice_dottile4_in_ins_valid;
reg [31:0] dotslice_dottile4_out_stream_e;
reg dotslice_dottile4_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile4_out_stream_w;
reg dotslice_dottile4_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile4_out_ins = 64'd0;
reg dotslice_dottile4_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile4_state = 2'd0;
wire [7:0] dotslice_dottile40;
wire [7:0] dotslice_dottile41;
wire [7:0] dotslice_dottile42;
wire [7:0] dotslice_dottile43;
reg [7:0] dotslice_dottile4_in_weight = 8'd0;
wire [7:0] dotslice_dottile4_dotunit16_in_stream_w;
wire dotslice_dottile4_dotunit16_in_stream_w_valid;
wire [7:0] dotslice_dottile4_dotunit16_in_stream_e;
wire dotslice_dottile4_dotunit16_in_stream_e_valid;
wire [7:0] dotslice_dottile4_dotunit16_in_weight;
reg [7:0] dotslice_dottile4_dotunit16_out_stream_e;
reg [7:0] dotslice_dottile4_dotunit16_out_stream_w;
reg [7:0] dotslice_dottile4_dotunit16_out_weight = 8'd0;
reg [7:0] dotslice_dottile4_dotunit16_weight = 8'd0;
reg [15:0] dotslice_dottile4_dotunit16_sum = 16'd0;
wire [7:0] dotslice_dottile4_dotunit17_in_stream_w;
wire dotslice_dottile4_dotunit17_in_stream_w_valid;
wire [7:0] dotslice_dottile4_dotunit17_in_stream_e;
wire dotslice_dottile4_dotunit17_in_stream_e_valid;
wire [7:0] dotslice_dottile4_dotunit17_in_weight;
reg [7:0] dotslice_dottile4_dotunit17_out_stream_e;
reg [7:0] dotslice_dottile4_dotunit17_out_stream_w;
reg [7:0] dotslice_dottile4_dotunit17_out_weight = 8'd0;
reg [7:0] dotslice_dottile4_dotunit17_weight = 8'd0;
reg [15:0] dotslice_dottile4_dotunit17_sum = 16'd0;
wire [7:0] dotslice_dottile4_dotunit18_in_stream_w;
wire dotslice_dottile4_dotunit18_in_stream_w_valid;
wire [7:0] dotslice_dottile4_dotunit18_in_stream_e;
wire dotslice_dottile4_dotunit18_in_stream_e_valid;
wire [7:0] dotslice_dottile4_dotunit18_in_weight;
reg [7:0] dotslice_dottile4_dotunit18_out_stream_e;
reg [7:0] dotslice_dottile4_dotunit18_out_stream_w;
reg [7:0] dotslice_dottile4_dotunit18_out_weight = 8'd0;
reg [7:0] dotslice_dottile4_dotunit18_weight = 8'd0;
reg [15:0] dotslice_dottile4_dotunit18_sum = 16'd0;
wire [7:0] dotslice_dottile4_dotunit19_in_stream_w;
wire dotslice_dottile4_dotunit19_in_stream_w_valid;
wire [7:0] dotslice_dottile4_dotunit19_in_stream_e;
wire dotslice_dottile4_dotunit19_in_stream_e_valid;
wire [7:0] dotslice_dottile4_dotunit19_in_weight;
reg [7:0] dotslice_dottile4_dotunit19_out_stream_e;
reg [7:0] dotslice_dottile4_dotunit19_out_stream_w;
reg [7:0] dotslice_dottile4_dotunit19_out_weight = 8'd0;
reg [7:0] dotslice_dottile4_dotunit19_weight = 8'd0;
reg [15:0] dotslice_dottile4_dotunit19_sum = 16'd0;
wire [31:0] dotslice_dottile5_in_stream_w;
wire dotslice_dottile5_in_stream_w_valid;
wire [31:0] dotslice_dottile5_in_stream_e;
wire dotslice_dottile5_in_stream_e_valid;
reg [63:0] dotslice_dottile5_in_ins;
reg dotslice_dottile5_in_ins_valid;
reg [31:0] dotslice_dottile5_out_stream_e;
reg dotslice_dottile5_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile5_out_stream_w;
reg dotslice_dottile5_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile5_out_ins = 64'd0;
reg dotslice_dottile5_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile5_state = 2'd0;
wire [7:0] dotslice_dottile50;
wire [7:0] dotslice_dottile51;
wire [7:0] dotslice_dottile52;
wire [7:0] dotslice_dottile53;
reg [7:0] dotslice_dottile5_in_weight = 8'd0;
wire [7:0] dotslice_dottile5_dotunit20_in_stream_w;
wire dotslice_dottile5_dotunit20_in_stream_w_valid;
wire [7:0] dotslice_dottile5_dotunit20_in_stream_e;
wire dotslice_dottile5_dotunit20_in_stream_e_valid;
wire [7:0] dotslice_dottile5_dotunit20_in_weight;
reg [7:0] dotslice_dottile5_dotunit20_out_stream_e;
reg [7:0] dotslice_dottile5_dotunit20_out_stream_w;
reg [7:0] dotslice_dottile5_dotunit20_out_weight = 8'd0;
reg [7:0] dotslice_dottile5_dotunit20_weight = 8'd0;
reg [15:0] dotslice_dottile5_dotunit20_sum = 16'd0;
wire [7:0] dotslice_dottile5_dotunit21_in_stream_w;
wire dotslice_dottile5_dotunit21_in_stream_w_valid;
wire [7:0] dotslice_dottile5_dotunit21_in_stream_e;
wire dotslice_dottile5_dotunit21_in_stream_e_valid;
wire [7:0] dotslice_dottile5_dotunit21_in_weight;
reg [7:0] dotslice_dottile5_dotunit21_out_stream_e;
reg [7:0] dotslice_dottile5_dotunit21_out_stream_w;
reg [7:0] dotslice_dottile5_dotunit21_out_weight = 8'd0;
reg [7:0] dotslice_dottile5_dotunit21_weight = 8'd0;
reg [15:0] dotslice_dottile5_dotunit21_sum = 16'd0;
wire [7:0] dotslice_dottile5_dotunit22_in_stream_w;
wire dotslice_dottile5_dotunit22_in_stream_w_valid;
wire [7:0] dotslice_dottile5_dotunit22_in_stream_e;
wire dotslice_dottile5_dotunit22_in_stream_e_valid;
wire [7:0] dotslice_dottile5_dotunit22_in_weight;
reg [7:0] dotslice_dottile5_dotunit22_out_stream_e;
reg [7:0] dotslice_dottile5_dotunit22_out_stream_w;
reg [7:0] dotslice_dottile5_dotunit22_out_weight = 8'd0;
reg [7:0] dotslice_dottile5_dotunit22_weight = 8'd0;
reg [15:0] dotslice_dottile5_dotunit22_sum = 16'd0;
wire [7:0] dotslice_dottile5_dotunit23_in_stream_w;
wire dotslice_dottile5_dotunit23_in_stream_w_valid;
wire [7:0] dotslice_dottile5_dotunit23_in_stream_e;
wire dotslice_dottile5_dotunit23_in_stream_e_valid;
wire [7:0] dotslice_dottile5_dotunit23_in_weight;
reg [7:0] dotslice_dottile5_dotunit23_out_stream_e;
reg [7:0] dotslice_dottile5_dotunit23_out_stream_w;
reg [7:0] dotslice_dottile5_dotunit23_out_weight = 8'd0;
reg [7:0] dotslice_dottile5_dotunit23_weight = 8'd0;
reg [15:0] dotslice_dottile5_dotunit23_sum = 16'd0;
wire [31:0] dotslice_dottile6_in_stream_w;
wire dotslice_dottile6_in_stream_w_valid;
wire [31:0] dotslice_dottile6_in_stream_e;
wire dotslice_dottile6_in_stream_e_valid;
reg [63:0] dotslice_dottile6_in_ins;
reg dotslice_dottile6_in_ins_valid;
reg [31:0] dotslice_dottile6_out_stream_e;
reg dotslice_dottile6_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile6_out_stream_w;
reg dotslice_dottile6_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile6_out_ins = 64'd0;
reg dotslice_dottile6_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile6_state = 2'd0;
wire [7:0] dotslice_dottile60;
wire [7:0] dotslice_dottile61;
wire [7:0] dotslice_dottile62;
wire [7:0] dotslice_dottile63;
reg [7:0] dotslice_dottile6_in_weight = 8'd0;
wire [7:0] dotslice_dottile6_dotunit24_in_stream_w;
wire dotslice_dottile6_dotunit24_in_stream_w_valid;
wire [7:0] dotslice_dottile6_dotunit24_in_stream_e;
wire dotslice_dottile6_dotunit24_in_stream_e_valid;
wire [7:0] dotslice_dottile6_dotunit24_in_weight;
reg [7:0] dotslice_dottile6_dotunit24_out_stream_e;
reg [7:0] dotslice_dottile6_dotunit24_out_stream_w;
reg [7:0] dotslice_dottile6_dotunit24_out_weight = 8'd0;
reg [7:0] dotslice_dottile6_dotunit24_weight = 8'd0;
reg [15:0] dotslice_dottile6_dotunit24_sum = 16'd0;
wire [7:0] dotslice_dottile6_dotunit25_in_stream_w;
wire dotslice_dottile6_dotunit25_in_stream_w_valid;
wire [7:0] dotslice_dottile6_dotunit25_in_stream_e;
wire dotslice_dottile6_dotunit25_in_stream_e_valid;
wire [7:0] dotslice_dottile6_dotunit25_in_weight;
reg [7:0] dotslice_dottile6_dotunit25_out_stream_e;
reg [7:0] dotslice_dottile6_dotunit25_out_stream_w;
reg [7:0] dotslice_dottile6_dotunit25_out_weight = 8'd0;
reg [7:0] dotslice_dottile6_dotunit25_weight = 8'd0;
reg [15:0] dotslice_dottile6_dotunit25_sum = 16'd0;
wire [7:0] dotslice_dottile6_dotunit26_in_stream_w;
wire dotslice_dottile6_dotunit26_in_stream_w_valid;
wire [7:0] dotslice_dottile6_dotunit26_in_stream_e;
wire dotslice_dottile6_dotunit26_in_stream_e_valid;
wire [7:0] dotslice_dottile6_dotunit26_in_weight;
reg [7:0] dotslice_dottile6_dotunit26_out_stream_e;
reg [7:0] dotslice_dottile6_dotunit26_out_stream_w;
reg [7:0] dotslice_dottile6_dotunit26_out_weight = 8'd0;
reg [7:0] dotslice_dottile6_dotunit26_weight = 8'd0;
reg [15:0] dotslice_dottile6_dotunit26_sum = 16'd0;
wire [7:0] dotslice_dottile6_dotunit27_in_stream_w;
wire dotslice_dottile6_dotunit27_in_stream_w_valid;
wire [7:0] dotslice_dottile6_dotunit27_in_stream_e;
wire dotslice_dottile6_dotunit27_in_stream_e_valid;
wire [7:0] dotslice_dottile6_dotunit27_in_weight;
reg [7:0] dotslice_dottile6_dotunit27_out_stream_e;
reg [7:0] dotslice_dottile6_dotunit27_out_stream_w;
reg [7:0] dotslice_dottile6_dotunit27_out_weight = 8'd0;
reg [7:0] dotslice_dottile6_dotunit27_weight = 8'd0;
reg [15:0] dotslice_dottile6_dotunit27_sum = 16'd0;
wire [31:0] dotslice_dottile7_in_stream_w;
wire dotslice_dottile7_in_stream_w_valid;
wire [31:0] dotslice_dottile7_in_stream_e;
wire dotslice_dottile7_in_stream_e_valid;
reg [63:0] dotslice_dottile7_in_ins;
reg dotslice_dottile7_in_ins_valid;
reg [31:0] dotslice_dottile7_out_stream_e;
reg dotslice_dottile7_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile7_out_stream_w;
reg dotslice_dottile7_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile7_out_ins = 64'd0;
reg dotslice_dottile7_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile7_state = 2'd0;
wire [7:0] dotslice_dottile70;
wire [7:0] dotslice_dottile71;
wire [7:0] dotslice_dottile72;
wire [7:0] dotslice_dottile73;
reg [7:0] dotslice_dottile7_in_weight = 8'd0;
wire [7:0] dotslice_dottile7_dotunit28_in_stream_w;
wire dotslice_dottile7_dotunit28_in_stream_w_valid;
wire [7:0] dotslice_dottile7_dotunit28_in_stream_e;
wire dotslice_dottile7_dotunit28_in_stream_e_valid;
wire [7:0] dotslice_dottile7_dotunit28_in_weight;
reg [7:0] dotslice_dottile7_dotunit28_out_stream_e;
reg [7:0] dotslice_dottile7_dotunit28_out_stream_w;
reg [7:0] dotslice_dottile7_dotunit28_out_weight = 8'd0;
reg [7:0] dotslice_dottile7_dotunit28_weight = 8'd0;
reg [15:0] dotslice_dottile7_dotunit28_sum = 16'd0;
wire [7:0] dotslice_dottile7_dotunit29_in_stream_w;
wire dotslice_dottile7_dotunit29_in_stream_w_valid;
wire [7:0] dotslice_dottile7_dotunit29_in_stream_e;
wire dotslice_dottile7_dotunit29_in_stream_e_valid;
wire [7:0] dotslice_dottile7_dotunit29_in_weight;
reg [7:0] dotslice_dottile7_dotunit29_out_stream_e;
reg [7:0] dotslice_dottile7_dotunit29_out_stream_w;
reg [7:0] dotslice_dottile7_dotunit29_out_weight = 8'd0;
reg [7:0] dotslice_dottile7_dotunit29_weight = 8'd0;
reg [15:0] dotslice_dottile7_dotunit29_sum = 16'd0;
wire [7:0] dotslice_dottile7_dotunit30_in_stream_w;
wire dotslice_dottile7_dotunit30_in_stream_w_valid;
wire [7:0] dotslice_dottile7_dotunit30_in_stream_e;
wire dotslice_dottile7_dotunit30_in_stream_e_valid;
wire [7:0] dotslice_dottile7_dotunit30_in_weight;
reg [7:0] dotslice_dottile7_dotunit30_out_stream_e;
reg [7:0] dotslice_dottile7_dotunit30_out_stream_w;
reg [7:0] dotslice_dottile7_dotunit30_out_weight = 8'd0;
reg [7:0] dotslice_dottile7_dotunit30_weight = 8'd0;
reg [15:0] dotslice_dottile7_dotunit30_sum = 16'd0;
wire [7:0] dotslice_dottile7_dotunit31_in_stream_w;
wire dotslice_dottile7_dotunit31_in_stream_w_valid;
wire [7:0] dotslice_dottile7_dotunit31_in_stream_e;
wire dotslice_dottile7_dotunit31_in_stream_e_valid;
wire [7:0] dotslice_dottile7_dotunit31_in_weight;
reg [7:0] dotslice_dottile7_dotunit31_out_stream_e;
reg [7:0] dotslice_dottile7_dotunit31_out_stream_w;
reg [7:0] dotslice_dottile7_dotunit31_out_weight = 8'd0;
reg [7:0] dotslice_dottile7_dotunit31_weight = 8'd0;
reg [15:0] dotslice_dottile7_dotunit31_sum = 16'd0;
wire [31:0] dotslice_dottile8_in_stream_w;
wire dotslice_dottile8_in_stream_w_valid;
wire [31:0] dotslice_dottile8_in_stream_e;
wire dotslice_dottile8_in_stream_e_valid;
reg [63:0] dotslice_dottile8_in_ins;
reg dotslice_dottile8_in_ins_valid;
reg [31:0] dotslice_dottile8_out_stream_e;
reg dotslice_dottile8_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile8_out_stream_w;
reg dotslice_dottile8_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile8_out_ins = 64'd0;
reg dotslice_dottile8_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile8_state = 2'd0;
wire [7:0] dotslice_dottile80;
wire [7:0] dotslice_dottile81;
wire [7:0] dotslice_dottile82;
wire [7:0] dotslice_dottile83;
reg [7:0] dotslice_dottile8_in_weight = 8'd0;
wire [7:0] dotslice_dottile8_dotunit32_in_stream_w;
wire dotslice_dottile8_dotunit32_in_stream_w_valid;
wire [7:0] dotslice_dottile8_dotunit32_in_stream_e;
wire dotslice_dottile8_dotunit32_in_stream_e_valid;
wire [7:0] dotslice_dottile8_dotunit32_in_weight;
reg [7:0] dotslice_dottile8_dotunit32_out_stream_e;
reg [7:0] dotslice_dottile8_dotunit32_out_stream_w;
reg [7:0] dotslice_dottile8_dotunit32_out_weight = 8'd0;
reg [7:0] dotslice_dottile8_dotunit32_weight = 8'd0;
reg [15:0] dotslice_dottile8_dotunit32_sum = 16'd0;
wire [7:0] dotslice_dottile8_dotunit33_in_stream_w;
wire dotslice_dottile8_dotunit33_in_stream_w_valid;
wire [7:0] dotslice_dottile8_dotunit33_in_stream_e;
wire dotslice_dottile8_dotunit33_in_stream_e_valid;
wire [7:0] dotslice_dottile8_dotunit33_in_weight;
reg [7:0] dotslice_dottile8_dotunit33_out_stream_e;
reg [7:0] dotslice_dottile8_dotunit33_out_stream_w;
reg [7:0] dotslice_dottile8_dotunit33_out_weight = 8'd0;
reg [7:0] dotslice_dottile8_dotunit33_weight = 8'd0;
reg [15:0] dotslice_dottile8_dotunit33_sum = 16'd0;
wire [7:0] dotslice_dottile8_dotunit34_in_stream_w;
wire dotslice_dottile8_dotunit34_in_stream_w_valid;
wire [7:0] dotslice_dottile8_dotunit34_in_stream_e;
wire dotslice_dottile8_dotunit34_in_stream_e_valid;
wire [7:0] dotslice_dottile8_dotunit34_in_weight;
reg [7:0] dotslice_dottile8_dotunit34_out_stream_e;
reg [7:0] dotslice_dottile8_dotunit34_out_stream_w;
reg [7:0] dotslice_dottile8_dotunit34_out_weight = 8'd0;
reg [7:0] dotslice_dottile8_dotunit34_weight = 8'd0;
reg [15:0] dotslice_dottile8_dotunit34_sum = 16'd0;
wire [7:0] dotslice_dottile8_dotunit35_in_stream_w;
wire dotslice_dottile8_dotunit35_in_stream_w_valid;
wire [7:0] dotslice_dottile8_dotunit35_in_stream_e;
wire dotslice_dottile8_dotunit35_in_stream_e_valid;
wire [7:0] dotslice_dottile8_dotunit35_in_weight;
reg [7:0] dotslice_dottile8_dotunit35_out_stream_e;
reg [7:0] dotslice_dottile8_dotunit35_out_stream_w;
reg [7:0] dotslice_dottile8_dotunit35_out_weight = 8'd0;
reg [7:0] dotslice_dottile8_dotunit35_weight = 8'd0;
reg [15:0] dotslice_dottile8_dotunit35_sum = 16'd0;
wire [31:0] dotslice_dottile9_in_stream_w;
wire dotslice_dottile9_in_stream_w_valid;
wire [31:0] dotslice_dottile9_in_stream_e;
wire dotslice_dottile9_in_stream_e_valid;
reg [63:0] dotslice_dottile9_in_ins;
reg dotslice_dottile9_in_ins_valid;
reg [31:0] dotslice_dottile9_out_stream_e;
reg dotslice_dottile9_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile9_out_stream_w;
reg dotslice_dottile9_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile9_out_ins = 64'd0;
reg dotslice_dottile9_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile9_state = 2'd0;
wire [7:0] dotslice_dottile90;
wire [7:0] dotslice_dottile91;
wire [7:0] dotslice_dottile92;
wire [7:0] dotslice_dottile93;
reg [7:0] dotslice_dottile9_in_weight = 8'd0;
wire [7:0] dotslice_dottile9_dotunit36_in_stream_w;
wire dotslice_dottile9_dotunit36_in_stream_w_valid;
wire [7:0] dotslice_dottile9_dotunit36_in_stream_e;
wire dotslice_dottile9_dotunit36_in_stream_e_valid;
wire [7:0] dotslice_dottile9_dotunit36_in_weight;
reg [7:0] dotslice_dottile9_dotunit36_out_stream_e;
reg [7:0] dotslice_dottile9_dotunit36_out_stream_w;
reg [7:0] dotslice_dottile9_dotunit36_out_weight = 8'd0;
reg [7:0] dotslice_dottile9_dotunit36_weight = 8'd0;
reg [15:0] dotslice_dottile9_dotunit36_sum = 16'd0;
wire [7:0] dotslice_dottile9_dotunit37_in_stream_w;
wire dotslice_dottile9_dotunit37_in_stream_w_valid;
wire [7:0] dotslice_dottile9_dotunit37_in_stream_e;
wire dotslice_dottile9_dotunit37_in_stream_e_valid;
wire [7:0] dotslice_dottile9_dotunit37_in_weight;
reg [7:0] dotslice_dottile9_dotunit37_out_stream_e;
reg [7:0] dotslice_dottile9_dotunit37_out_stream_w;
reg [7:0] dotslice_dottile9_dotunit37_out_weight = 8'd0;
reg [7:0] dotslice_dottile9_dotunit37_weight = 8'd0;
reg [15:0] dotslice_dottile9_dotunit37_sum = 16'd0;
wire [7:0] dotslice_dottile9_dotunit38_in_stream_w;
wire dotslice_dottile9_dotunit38_in_stream_w_valid;
wire [7:0] dotslice_dottile9_dotunit38_in_stream_e;
wire dotslice_dottile9_dotunit38_in_stream_e_valid;
wire [7:0] dotslice_dottile9_dotunit38_in_weight;
reg [7:0] dotslice_dottile9_dotunit38_out_stream_e;
reg [7:0] dotslice_dottile9_dotunit38_out_stream_w;
reg [7:0] dotslice_dottile9_dotunit38_out_weight = 8'd0;
reg [7:0] dotslice_dottile9_dotunit38_weight = 8'd0;
reg [15:0] dotslice_dottile9_dotunit38_sum = 16'd0;
wire [7:0] dotslice_dottile9_dotunit39_in_stream_w;
wire dotslice_dottile9_dotunit39_in_stream_w_valid;
wire [7:0] dotslice_dottile9_dotunit39_in_stream_e;
wire dotslice_dottile9_dotunit39_in_stream_e_valid;
wire [7:0] dotslice_dottile9_dotunit39_in_weight;
reg [7:0] dotslice_dottile9_dotunit39_out_stream_e;
reg [7:0] dotslice_dottile9_dotunit39_out_stream_w;
reg [7:0] dotslice_dottile9_dotunit39_out_weight = 8'd0;
reg [7:0] dotslice_dottile9_dotunit39_weight = 8'd0;
reg [15:0] dotslice_dottile9_dotunit39_sum = 16'd0;
wire [31:0] dotslice_dottile10_in_stream_w;
wire dotslice_dottile10_in_stream_w_valid;
wire [31:0] dotslice_dottile10_in_stream_e;
wire dotslice_dottile10_in_stream_e_valid;
reg [63:0] dotslice_dottile10_in_ins;
reg dotslice_dottile10_in_ins_valid;
reg [31:0] dotslice_dottile10_out_stream_e;
reg dotslice_dottile10_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile10_out_stream_w;
reg dotslice_dottile10_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile10_out_ins = 64'd0;
reg dotslice_dottile10_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile10_state = 2'd0;
wire [7:0] dotslice_dottile100;
wire [7:0] dotslice_dottile101;
wire [7:0] dotslice_dottile102;
wire [7:0] dotslice_dottile103;
reg [7:0] dotslice_dottile10_in_weight = 8'd0;
wire [7:0] dotslice_dottile10_dotunit40_in_stream_w;
wire dotslice_dottile10_dotunit40_in_stream_w_valid;
wire [7:0] dotslice_dottile10_dotunit40_in_stream_e;
wire dotslice_dottile10_dotunit40_in_stream_e_valid;
wire [7:0] dotslice_dottile10_dotunit40_in_weight;
reg [7:0] dotslice_dottile10_dotunit40_out_stream_e;
reg [7:0] dotslice_dottile10_dotunit40_out_stream_w;
reg [7:0] dotslice_dottile10_dotunit40_out_weight = 8'd0;
reg [7:0] dotslice_dottile10_dotunit40_weight = 8'd0;
reg [15:0] dotslice_dottile10_dotunit40_sum = 16'd0;
wire [7:0] dotslice_dottile10_dotunit41_in_stream_w;
wire dotslice_dottile10_dotunit41_in_stream_w_valid;
wire [7:0] dotslice_dottile10_dotunit41_in_stream_e;
wire dotslice_dottile10_dotunit41_in_stream_e_valid;
wire [7:0] dotslice_dottile10_dotunit41_in_weight;
reg [7:0] dotslice_dottile10_dotunit41_out_stream_e;
reg [7:0] dotslice_dottile10_dotunit41_out_stream_w;
reg [7:0] dotslice_dottile10_dotunit41_out_weight = 8'd0;
reg [7:0] dotslice_dottile10_dotunit41_weight = 8'd0;
reg [15:0] dotslice_dottile10_dotunit41_sum = 16'd0;
wire [7:0] dotslice_dottile10_dotunit42_in_stream_w;
wire dotslice_dottile10_dotunit42_in_stream_w_valid;
wire [7:0] dotslice_dottile10_dotunit42_in_stream_e;
wire dotslice_dottile10_dotunit42_in_stream_e_valid;
wire [7:0] dotslice_dottile10_dotunit42_in_weight;
reg [7:0] dotslice_dottile10_dotunit42_out_stream_e;
reg [7:0] dotslice_dottile10_dotunit42_out_stream_w;
reg [7:0] dotslice_dottile10_dotunit42_out_weight = 8'd0;
reg [7:0] dotslice_dottile10_dotunit42_weight = 8'd0;
reg [15:0] dotslice_dottile10_dotunit42_sum = 16'd0;
wire [7:0] dotslice_dottile10_dotunit43_in_stream_w;
wire dotslice_dottile10_dotunit43_in_stream_w_valid;
wire [7:0] dotslice_dottile10_dotunit43_in_stream_e;
wire dotslice_dottile10_dotunit43_in_stream_e_valid;
wire [7:0] dotslice_dottile10_dotunit43_in_weight;
reg [7:0] dotslice_dottile10_dotunit43_out_stream_e;
reg [7:0] dotslice_dottile10_dotunit43_out_stream_w;
reg [7:0] dotslice_dottile10_dotunit43_out_weight = 8'd0;
reg [7:0] dotslice_dottile10_dotunit43_weight = 8'd0;
reg [15:0] dotslice_dottile10_dotunit43_sum = 16'd0;
wire [31:0] dotslice_dottile11_in_stream_w;
wire dotslice_dottile11_in_stream_w_valid;
wire [31:0] dotslice_dottile11_in_stream_e;
wire dotslice_dottile11_in_stream_e_valid;
reg [63:0] dotslice_dottile11_in_ins;
reg dotslice_dottile11_in_ins_valid;
reg [31:0] dotslice_dottile11_out_stream_e;
reg dotslice_dottile11_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile11_out_stream_w;
reg dotslice_dottile11_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile11_out_ins = 64'd0;
reg dotslice_dottile11_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile11_state = 2'd0;
wire [7:0] dotslice_dottile110;
wire [7:0] dotslice_dottile111;
wire [7:0] dotslice_dottile112;
wire [7:0] dotslice_dottile113;
reg [7:0] dotslice_dottile11_in_weight = 8'd0;
wire [7:0] dotslice_dottile11_dotunit44_in_stream_w;
wire dotslice_dottile11_dotunit44_in_stream_w_valid;
wire [7:0] dotslice_dottile11_dotunit44_in_stream_e;
wire dotslice_dottile11_dotunit44_in_stream_e_valid;
wire [7:0] dotslice_dottile11_dotunit44_in_weight;
reg [7:0] dotslice_dottile11_dotunit44_out_stream_e;
reg [7:0] dotslice_dottile11_dotunit44_out_stream_w;
reg [7:0] dotslice_dottile11_dotunit44_out_weight = 8'd0;
reg [7:0] dotslice_dottile11_dotunit44_weight = 8'd0;
reg [15:0] dotslice_dottile11_dotunit44_sum = 16'd0;
wire [7:0] dotslice_dottile11_dotunit45_in_stream_w;
wire dotslice_dottile11_dotunit45_in_stream_w_valid;
wire [7:0] dotslice_dottile11_dotunit45_in_stream_e;
wire dotslice_dottile11_dotunit45_in_stream_e_valid;
wire [7:0] dotslice_dottile11_dotunit45_in_weight;
reg [7:0] dotslice_dottile11_dotunit45_out_stream_e;
reg [7:0] dotslice_dottile11_dotunit45_out_stream_w;
reg [7:0] dotslice_dottile11_dotunit45_out_weight = 8'd0;
reg [7:0] dotslice_dottile11_dotunit45_weight = 8'd0;
reg [15:0] dotslice_dottile11_dotunit45_sum = 16'd0;
wire [7:0] dotslice_dottile11_dotunit46_in_stream_w;
wire dotslice_dottile11_dotunit46_in_stream_w_valid;
wire [7:0] dotslice_dottile11_dotunit46_in_stream_e;
wire dotslice_dottile11_dotunit46_in_stream_e_valid;
wire [7:0] dotslice_dottile11_dotunit46_in_weight;
reg [7:0] dotslice_dottile11_dotunit46_out_stream_e;
reg [7:0] dotslice_dottile11_dotunit46_out_stream_w;
reg [7:0] dotslice_dottile11_dotunit46_out_weight = 8'd0;
reg [7:0] dotslice_dottile11_dotunit46_weight = 8'd0;
reg [15:0] dotslice_dottile11_dotunit46_sum = 16'd0;
wire [7:0] dotslice_dottile11_dotunit47_in_stream_w;
wire dotslice_dottile11_dotunit47_in_stream_w_valid;
wire [7:0] dotslice_dottile11_dotunit47_in_stream_e;
wire dotslice_dottile11_dotunit47_in_stream_e_valid;
wire [7:0] dotslice_dottile11_dotunit47_in_weight;
reg [7:0] dotslice_dottile11_dotunit47_out_stream_e;
reg [7:0] dotslice_dottile11_dotunit47_out_stream_w;
reg [7:0] dotslice_dottile11_dotunit47_out_weight = 8'd0;
reg [7:0] dotslice_dottile11_dotunit47_weight = 8'd0;
reg [15:0] dotslice_dottile11_dotunit47_sum = 16'd0;
wire [31:0] dotslice_dottile12_in_stream_w;
wire dotslice_dottile12_in_stream_w_valid;
wire [31:0] dotslice_dottile12_in_stream_e;
wire dotslice_dottile12_in_stream_e_valid;
reg [63:0] dotslice_dottile12_in_ins;
reg dotslice_dottile12_in_ins_valid;
reg [31:0] dotslice_dottile12_out_stream_e;
reg dotslice_dottile12_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile12_out_stream_w;
reg dotslice_dottile12_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile12_out_ins = 64'd0;
reg dotslice_dottile12_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile12_state = 2'd0;
wire [7:0] dotslice_dottile120;
wire [7:0] dotslice_dottile121;
wire [7:0] dotslice_dottile122;
wire [7:0] dotslice_dottile123;
reg [7:0] dotslice_dottile12_in_weight = 8'd0;
wire [7:0] dotslice_dottile12_dotunit48_in_stream_w;
wire dotslice_dottile12_dotunit48_in_stream_w_valid;
wire [7:0] dotslice_dottile12_dotunit48_in_stream_e;
wire dotslice_dottile12_dotunit48_in_stream_e_valid;
wire [7:0] dotslice_dottile12_dotunit48_in_weight;
reg [7:0] dotslice_dottile12_dotunit48_out_stream_e;
reg [7:0] dotslice_dottile12_dotunit48_out_stream_w;
reg [7:0] dotslice_dottile12_dotunit48_out_weight = 8'd0;
reg [7:0] dotslice_dottile12_dotunit48_weight = 8'd0;
reg [15:0] dotslice_dottile12_dotunit48_sum = 16'd0;
wire [7:0] dotslice_dottile12_dotunit49_in_stream_w;
wire dotslice_dottile12_dotunit49_in_stream_w_valid;
wire [7:0] dotslice_dottile12_dotunit49_in_stream_e;
wire dotslice_dottile12_dotunit49_in_stream_e_valid;
wire [7:0] dotslice_dottile12_dotunit49_in_weight;
reg [7:0] dotslice_dottile12_dotunit49_out_stream_e;
reg [7:0] dotslice_dottile12_dotunit49_out_stream_w;
reg [7:0] dotslice_dottile12_dotunit49_out_weight = 8'd0;
reg [7:0] dotslice_dottile12_dotunit49_weight = 8'd0;
reg [15:0] dotslice_dottile12_dotunit49_sum = 16'd0;
wire [7:0] dotslice_dottile12_dotunit50_in_stream_w;
wire dotslice_dottile12_dotunit50_in_stream_w_valid;
wire [7:0] dotslice_dottile12_dotunit50_in_stream_e;
wire dotslice_dottile12_dotunit50_in_stream_e_valid;
wire [7:0] dotslice_dottile12_dotunit50_in_weight;
reg [7:0] dotslice_dottile12_dotunit50_out_stream_e;
reg [7:0] dotslice_dottile12_dotunit50_out_stream_w;
reg [7:0] dotslice_dottile12_dotunit50_out_weight = 8'd0;
reg [7:0] dotslice_dottile12_dotunit50_weight = 8'd0;
reg [15:0] dotslice_dottile12_dotunit50_sum = 16'd0;
wire [7:0] dotslice_dottile12_dotunit51_in_stream_w;
wire dotslice_dottile12_dotunit51_in_stream_w_valid;
wire [7:0] dotslice_dottile12_dotunit51_in_stream_e;
wire dotslice_dottile12_dotunit51_in_stream_e_valid;
wire [7:0] dotslice_dottile12_dotunit51_in_weight;
reg [7:0] dotslice_dottile12_dotunit51_out_stream_e;
reg [7:0] dotslice_dottile12_dotunit51_out_stream_w;
reg [7:0] dotslice_dottile12_dotunit51_out_weight = 8'd0;
reg [7:0] dotslice_dottile12_dotunit51_weight = 8'd0;
reg [15:0] dotslice_dottile12_dotunit51_sum = 16'd0;
wire [31:0] dotslice_dottile13_in_stream_w;
wire dotslice_dottile13_in_stream_w_valid;
wire [31:0] dotslice_dottile13_in_stream_e;
wire dotslice_dottile13_in_stream_e_valid;
reg [63:0] dotslice_dottile13_in_ins;
reg dotslice_dottile13_in_ins_valid;
reg [31:0] dotslice_dottile13_out_stream_e;
reg dotslice_dottile13_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile13_out_stream_w;
reg dotslice_dottile13_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile13_out_ins = 64'd0;
reg dotslice_dottile13_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile13_state = 2'd0;
wire [7:0] dotslice_dottile130;
wire [7:0] dotslice_dottile131;
wire [7:0] dotslice_dottile132;
wire [7:0] dotslice_dottile133;
reg [7:0] dotslice_dottile13_in_weight = 8'd0;
wire [7:0] dotslice_dottile13_dotunit52_in_stream_w;
wire dotslice_dottile13_dotunit52_in_stream_w_valid;
wire [7:0] dotslice_dottile13_dotunit52_in_stream_e;
wire dotslice_dottile13_dotunit52_in_stream_e_valid;
wire [7:0] dotslice_dottile13_dotunit52_in_weight;
reg [7:0] dotslice_dottile13_dotunit52_out_stream_e;
reg [7:0] dotslice_dottile13_dotunit52_out_stream_w;
reg [7:0] dotslice_dottile13_dotunit52_out_weight = 8'd0;
reg [7:0] dotslice_dottile13_dotunit52_weight = 8'd0;
reg [15:0] dotslice_dottile13_dotunit52_sum = 16'd0;
wire [7:0] dotslice_dottile13_dotunit53_in_stream_w;
wire dotslice_dottile13_dotunit53_in_stream_w_valid;
wire [7:0] dotslice_dottile13_dotunit53_in_stream_e;
wire dotslice_dottile13_dotunit53_in_stream_e_valid;
wire [7:0] dotslice_dottile13_dotunit53_in_weight;
reg [7:0] dotslice_dottile13_dotunit53_out_stream_e;
reg [7:0] dotslice_dottile13_dotunit53_out_stream_w;
reg [7:0] dotslice_dottile13_dotunit53_out_weight = 8'd0;
reg [7:0] dotslice_dottile13_dotunit53_weight = 8'd0;
reg [15:0] dotslice_dottile13_dotunit53_sum = 16'd0;
wire [7:0] dotslice_dottile13_dotunit54_in_stream_w;
wire dotslice_dottile13_dotunit54_in_stream_w_valid;
wire [7:0] dotslice_dottile13_dotunit54_in_stream_e;
wire dotslice_dottile13_dotunit54_in_stream_e_valid;
wire [7:0] dotslice_dottile13_dotunit54_in_weight;
reg [7:0] dotslice_dottile13_dotunit54_out_stream_e;
reg [7:0] dotslice_dottile13_dotunit54_out_stream_w;
reg [7:0] dotslice_dottile13_dotunit54_out_weight = 8'd0;
reg [7:0] dotslice_dottile13_dotunit54_weight = 8'd0;
reg [15:0] dotslice_dottile13_dotunit54_sum = 16'd0;
wire [7:0] dotslice_dottile13_dotunit55_in_stream_w;
wire dotslice_dottile13_dotunit55_in_stream_w_valid;
wire [7:0] dotslice_dottile13_dotunit55_in_stream_e;
wire dotslice_dottile13_dotunit55_in_stream_e_valid;
wire [7:0] dotslice_dottile13_dotunit55_in_weight;
reg [7:0] dotslice_dottile13_dotunit55_out_stream_e;
reg [7:0] dotslice_dottile13_dotunit55_out_stream_w;
reg [7:0] dotslice_dottile13_dotunit55_out_weight = 8'd0;
reg [7:0] dotslice_dottile13_dotunit55_weight = 8'd0;
reg [15:0] dotslice_dottile13_dotunit55_sum = 16'd0;
wire [31:0] dotslice_dottile14_in_stream_w;
wire dotslice_dottile14_in_stream_w_valid;
wire [31:0] dotslice_dottile14_in_stream_e;
wire dotslice_dottile14_in_stream_e_valid;
reg [63:0] dotslice_dottile14_in_ins;
reg dotslice_dottile14_in_ins_valid;
reg [31:0] dotslice_dottile14_out_stream_e;
reg dotslice_dottile14_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile14_out_stream_w;
reg dotslice_dottile14_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile14_out_ins = 64'd0;
reg dotslice_dottile14_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile14_state = 2'd0;
wire [7:0] dotslice_dottile140;
wire [7:0] dotslice_dottile141;
wire [7:0] dotslice_dottile142;
wire [7:0] dotslice_dottile143;
reg [7:0] dotslice_dottile14_in_weight = 8'd0;
wire [7:0] dotslice_dottile14_dotunit56_in_stream_w;
wire dotslice_dottile14_dotunit56_in_stream_w_valid;
wire [7:0] dotslice_dottile14_dotunit56_in_stream_e;
wire dotslice_dottile14_dotunit56_in_stream_e_valid;
wire [7:0] dotslice_dottile14_dotunit56_in_weight;
reg [7:0] dotslice_dottile14_dotunit56_out_stream_e;
reg [7:0] dotslice_dottile14_dotunit56_out_stream_w;
reg [7:0] dotslice_dottile14_dotunit56_out_weight = 8'd0;
reg [7:0] dotslice_dottile14_dotunit56_weight = 8'd0;
reg [15:0] dotslice_dottile14_dotunit56_sum = 16'd0;
wire [7:0] dotslice_dottile14_dotunit57_in_stream_w;
wire dotslice_dottile14_dotunit57_in_stream_w_valid;
wire [7:0] dotslice_dottile14_dotunit57_in_stream_e;
wire dotslice_dottile14_dotunit57_in_stream_e_valid;
wire [7:0] dotslice_dottile14_dotunit57_in_weight;
reg [7:0] dotslice_dottile14_dotunit57_out_stream_e;
reg [7:0] dotslice_dottile14_dotunit57_out_stream_w;
reg [7:0] dotslice_dottile14_dotunit57_out_weight = 8'd0;
reg [7:0] dotslice_dottile14_dotunit57_weight = 8'd0;
reg [15:0] dotslice_dottile14_dotunit57_sum = 16'd0;
wire [7:0] dotslice_dottile14_dotunit58_in_stream_w;
wire dotslice_dottile14_dotunit58_in_stream_w_valid;
wire [7:0] dotslice_dottile14_dotunit58_in_stream_e;
wire dotslice_dottile14_dotunit58_in_stream_e_valid;
wire [7:0] dotslice_dottile14_dotunit58_in_weight;
reg [7:0] dotslice_dottile14_dotunit58_out_stream_e;
reg [7:0] dotslice_dottile14_dotunit58_out_stream_w;
reg [7:0] dotslice_dottile14_dotunit58_out_weight = 8'd0;
reg [7:0] dotslice_dottile14_dotunit58_weight = 8'd0;
reg [15:0] dotslice_dottile14_dotunit58_sum = 16'd0;
wire [7:0] dotslice_dottile14_dotunit59_in_stream_w;
wire dotslice_dottile14_dotunit59_in_stream_w_valid;
wire [7:0] dotslice_dottile14_dotunit59_in_stream_e;
wire dotslice_dottile14_dotunit59_in_stream_e_valid;
wire [7:0] dotslice_dottile14_dotunit59_in_weight;
reg [7:0] dotslice_dottile14_dotunit59_out_stream_e;
reg [7:0] dotslice_dottile14_dotunit59_out_stream_w;
reg [7:0] dotslice_dottile14_dotunit59_out_weight = 8'd0;
reg [7:0] dotslice_dottile14_dotunit59_weight = 8'd0;
reg [15:0] dotslice_dottile14_dotunit59_sum = 16'd0;
wire [31:0] dotslice_dottile15_in_stream_w;
wire dotslice_dottile15_in_stream_w_valid;
wire [31:0] dotslice_dottile15_in_stream_e;
wire dotslice_dottile15_in_stream_e_valid;
reg [63:0] dotslice_dottile15_in_ins;
reg dotslice_dottile15_in_ins_valid;
reg [31:0] dotslice_dottile15_out_stream_e;
reg dotslice_dottile15_out_stream_e_valid = 1'd0;
reg [31:0] dotslice_dottile15_out_stream_w;
reg dotslice_dottile15_out_stream_w_valid = 1'd0;
reg [63:0] dotslice_dottile15_out_ins = 64'd0;
reg dotslice_dottile15_out_ins_valid = 1'd0;
reg [1:0] dotslice_dottile15_state = 2'd0;
wire [7:0] dotslice_dottile150;
wire [7:0] dotslice_dottile151;
wire [7:0] dotslice_dottile152;
wire [7:0] dotslice_dottile153;
reg [7:0] dotslice_dottile15_in_weight = 8'd0;
wire [7:0] dotslice_dottile15_dotunit60_in_stream_w;
wire dotslice_dottile15_dotunit60_in_stream_w_valid;
wire [7:0] dotslice_dottile15_dotunit60_in_stream_e;
wire dotslice_dottile15_dotunit60_in_stream_e_valid;
wire [7:0] dotslice_dottile15_dotunit60_in_weight;
reg [7:0] dotslice_dottile15_dotunit60_out_stream_e;
reg [7:0] dotslice_dottile15_dotunit60_out_stream_w;
reg [7:0] dotslice_dottile15_dotunit60_out_weight = 8'd0;
reg [7:0] dotslice_dottile15_dotunit60_weight = 8'd0;
reg [15:0] dotslice_dottile15_dotunit60_sum = 16'd0;
wire [7:0] dotslice_dottile15_dotunit61_in_stream_w;
wire dotslice_dottile15_dotunit61_in_stream_w_valid;
wire [7:0] dotslice_dottile15_dotunit61_in_stream_e;
wire dotslice_dottile15_dotunit61_in_stream_e_valid;
wire [7:0] dotslice_dottile15_dotunit61_in_weight;
reg [7:0] dotslice_dottile15_dotunit61_out_stream_e;
reg [7:0] dotslice_dottile15_dotunit61_out_stream_w;
reg [7:0] dotslice_dottile15_dotunit61_out_weight = 8'd0;
reg [7:0] dotslice_dottile15_dotunit61_weight = 8'd0;
reg [15:0] dotslice_dottile15_dotunit61_sum = 16'd0;
wire [7:0] dotslice_dottile15_dotunit62_in_stream_w;
wire dotslice_dottile15_dotunit62_in_stream_w_valid;
wire [7:0] dotslice_dottile15_dotunit62_in_stream_e;
wire dotslice_dottile15_dotunit62_in_stream_e_valid;
wire [7:0] dotslice_dottile15_dotunit62_in_weight;
reg [7:0] dotslice_dottile15_dotunit62_out_stream_e;
reg [7:0] dotslice_dottile15_dotunit62_out_stream_w;
reg [7:0] dotslice_dottile15_dotunit62_out_weight = 8'd0;
reg [7:0] dotslice_dottile15_dotunit62_weight = 8'd0;
reg [15:0] dotslice_dottile15_dotunit62_sum = 16'd0;
wire [7:0] dotslice_dottile15_dotunit63_in_stream_w;
wire dotslice_dottile15_dotunit63_in_stream_w_valid;
wire [7:0] dotslice_dottile15_dotunit63_in_stream_e;
wire dotslice_dottile15_dotunit63_in_stream_e_valid;
wire [7:0] dotslice_dottile15_dotunit63_in_weight;
reg [7:0] dotslice_dottile15_dotunit63_out_stream_e;
reg [7:0] dotslice_dottile15_dotunit63_out_stream_w;
reg [7:0] dotslice_dottile15_dotunit63_out_weight = 8'd0;
reg [7:0] dotslice_dottile15_dotunit63_weight = 8'd0;
reg [15:0] dotslice_dottile15_dotunit63_sum = 16'd0;
reg [1:0] dotunit0_state = 2'd0;
reg [1:0] dotunit0_next_state;
reg [7:0] dotslice_dottile0_dotunit0_weight_dotunit0_next_value0;
reg dotslice_dottile0_dotunit0_weight_dotunit0_next_value_ce0;
reg [15:0] dotslice_dottile0_dotunit0_sum_dotunit0_next_value1;
reg dotslice_dottile0_dotunit0_sum_dotunit0_next_value_ce1;
reg [1:0] dotunit1_state = 2'd0;
reg [1:0] dotunit1_next_state;
reg [7:0] dotslice_dottile0_dotunit1_weight_dotunit1_next_value0;
reg dotslice_dottile0_dotunit1_weight_dotunit1_next_value_ce0;
reg [15:0] dotslice_dottile0_dotunit1_sum_dotunit1_next_value1;
reg dotslice_dottile0_dotunit1_sum_dotunit1_next_value_ce1;
reg [1:0] dotunit2_state = 2'd0;
reg [1:0] dotunit2_next_state;
reg [7:0] dotslice_dottile0_dotunit2_weight_dotunit2_next_value0;
reg dotslice_dottile0_dotunit2_weight_dotunit2_next_value_ce0;
reg [15:0] dotslice_dottile0_dotunit2_sum_dotunit2_next_value1;
reg dotslice_dottile0_dotunit2_sum_dotunit2_next_value_ce1;
reg [1:0] dotunit3_state = 2'd0;
reg [1:0] dotunit3_next_state;
reg [7:0] dotslice_dottile0_dotunit3_weight_dotunit3_next_value0;
reg dotslice_dottile0_dotunit3_weight_dotunit3_next_value_ce0;
reg [15:0] dotslice_dottile0_dotunit3_sum_dotunit3_next_value1;
reg dotslice_dottile0_dotunit3_sum_dotunit3_next_value_ce1;
reg [1:0] fsm0_state = 2'd0;
reg [1:0] fsm0_next_state;
reg dotslice_dottile0_out_stream_w_valid_fsm0_next_value0;
reg dotslice_dottile0_out_stream_w_valid_fsm0_next_value_ce0;
reg dotslice_dottile0_out_stream_e_valid_fsm0_next_value1;
reg dotslice_dottile0_out_stream_e_valid_fsm0_next_value_ce1;
reg [1:0] dotunit4_state = 2'd0;
reg [1:0] dotunit4_next_state;
reg [7:0] dotslice_dottile1_dotunit4_weight_dotunit4_next_value0;
reg dotslice_dottile1_dotunit4_weight_dotunit4_next_value_ce0;
reg [15:0] dotslice_dottile1_dotunit4_sum_dotunit4_next_value1;
reg dotslice_dottile1_dotunit4_sum_dotunit4_next_value_ce1;
reg [1:0] dotunit5_state = 2'd0;
reg [1:0] dotunit5_next_state;
reg [7:0] dotslice_dottile1_dotunit5_weight_dotunit5_next_value0;
reg dotslice_dottile1_dotunit5_weight_dotunit5_next_value_ce0;
reg [15:0] dotslice_dottile1_dotunit5_sum_dotunit5_next_value1;
reg dotslice_dottile1_dotunit5_sum_dotunit5_next_value_ce1;
reg [1:0] dotunit6_state = 2'd0;
reg [1:0] dotunit6_next_state;
reg [7:0] dotslice_dottile1_dotunit6_weight_dotunit6_next_value0;
reg dotslice_dottile1_dotunit6_weight_dotunit6_next_value_ce0;
reg [15:0] dotslice_dottile1_dotunit6_sum_dotunit6_next_value1;
reg dotslice_dottile1_dotunit6_sum_dotunit6_next_value_ce1;
reg [1:0] dotunit7_state = 2'd0;
reg [1:0] dotunit7_next_state;
reg [7:0] dotslice_dottile1_dotunit7_weight_dotunit7_next_value0;
reg dotslice_dottile1_dotunit7_weight_dotunit7_next_value_ce0;
reg [15:0] dotslice_dottile1_dotunit7_sum_dotunit7_next_value1;
reg dotslice_dottile1_dotunit7_sum_dotunit7_next_value_ce1;
reg [1:0] fsm1_state = 2'd0;
reg [1:0] fsm1_next_state;
reg dotslice_dottile1_out_stream_w_valid_fsm1_next_value0;
reg dotslice_dottile1_out_stream_w_valid_fsm1_next_value_ce0;
reg dotslice_dottile1_out_stream_e_valid_fsm1_next_value1;
reg dotslice_dottile1_out_stream_e_valid_fsm1_next_value_ce1;
reg [1:0] dotunit8_state = 2'd0;
reg [1:0] dotunit8_next_state;
reg [7:0] dotslice_dottile2_dotunit8_weight_dotunit8_next_value0;
reg dotslice_dottile2_dotunit8_weight_dotunit8_next_value_ce0;
reg [15:0] dotslice_dottile2_dotunit8_sum_dotunit8_next_value1;
reg dotslice_dottile2_dotunit8_sum_dotunit8_next_value_ce1;
reg [1:0] dotunit9_state = 2'd0;
reg [1:0] dotunit9_next_state;
reg [7:0] dotslice_dottile2_dotunit9_weight_dotunit9_next_value0;
reg dotslice_dottile2_dotunit9_weight_dotunit9_next_value_ce0;
reg [15:0] dotslice_dottile2_dotunit9_sum_dotunit9_next_value1;
reg dotslice_dottile2_dotunit9_sum_dotunit9_next_value_ce1;
reg [1:0] dotunit10_state = 2'd0;
reg [1:0] dotunit10_next_state;
reg [7:0] dotslice_dottile2_dotunit10_weight_dotunit10_next_value0;
reg dotslice_dottile2_dotunit10_weight_dotunit10_next_value_ce0;
reg [15:0] dotslice_dottile2_dotunit10_sum_dotunit10_next_value1;
reg dotslice_dottile2_dotunit10_sum_dotunit10_next_value_ce1;
reg [1:0] dotunit11_state = 2'd0;
reg [1:0] dotunit11_next_state;
reg [7:0] dotslice_dottile2_dotunit11_weight_dotunit11_next_value0;
reg dotslice_dottile2_dotunit11_weight_dotunit11_next_value_ce0;
reg [15:0] dotslice_dottile2_dotunit11_sum_dotunit11_next_value1;
reg dotslice_dottile2_dotunit11_sum_dotunit11_next_value_ce1;
reg [1:0] fsm2_state = 2'd0;
reg [1:0] fsm2_next_state;
reg dotslice_dottile2_out_stream_w_valid_fsm2_next_value0;
reg dotslice_dottile2_out_stream_w_valid_fsm2_next_value_ce0;
reg dotslice_dottile2_out_stream_e_valid_fsm2_next_value1;
reg dotslice_dottile2_out_stream_e_valid_fsm2_next_value_ce1;
reg [1:0] dotunit12_state = 2'd0;
reg [1:0] dotunit12_next_state;
reg [7:0] dotslice_dottile3_dotunit12_weight_dotunit12_next_value0;
reg dotslice_dottile3_dotunit12_weight_dotunit12_next_value_ce0;
reg [15:0] dotslice_dottile3_dotunit12_sum_dotunit12_next_value1;
reg dotslice_dottile3_dotunit12_sum_dotunit12_next_value_ce1;
reg [1:0] dotunit13_state = 2'd0;
reg [1:0] dotunit13_next_state;
reg [7:0] dotslice_dottile3_dotunit13_weight_dotunit13_next_value0;
reg dotslice_dottile3_dotunit13_weight_dotunit13_next_value_ce0;
reg [15:0] dotslice_dottile3_dotunit13_sum_dotunit13_next_value1;
reg dotslice_dottile3_dotunit13_sum_dotunit13_next_value_ce1;
reg [1:0] dotunit14_state = 2'd0;
reg [1:0] dotunit14_next_state;
reg [7:0] dotslice_dottile3_dotunit14_weight_dotunit14_next_value0;
reg dotslice_dottile3_dotunit14_weight_dotunit14_next_value_ce0;
reg [15:0] dotslice_dottile3_dotunit14_sum_dotunit14_next_value1;
reg dotslice_dottile3_dotunit14_sum_dotunit14_next_value_ce1;
reg [1:0] dotunit15_state = 2'd0;
reg [1:0] dotunit15_next_state;
reg [7:0] dotslice_dottile3_dotunit15_weight_dotunit15_next_value0;
reg dotslice_dottile3_dotunit15_weight_dotunit15_next_value_ce0;
reg [15:0] dotslice_dottile3_dotunit15_sum_dotunit15_next_value1;
reg dotslice_dottile3_dotunit15_sum_dotunit15_next_value_ce1;
reg [1:0] fsm3_state = 2'd0;
reg [1:0] fsm3_next_state;
reg dotslice_dottile3_out_stream_w_valid_fsm3_next_value0;
reg dotslice_dottile3_out_stream_w_valid_fsm3_next_value_ce0;
reg dotslice_dottile3_out_stream_e_valid_fsm3_next_value1;
reg dotslice_dottile3_out_stream_e_valid_fsm3_next_value_ce1;
reg [1:0] dotunit16_state = 2'd0;
reg [1:0] dotunit16_next_state;
reg [7:0] dotslice_dottile4_dotunit16_weight_dotunit16_next_value0;
reg dotslice_dottile4_dotunit16_weight_dotunit16_next_value_ce0;
reg [15:0] dotslice_dottile4_dotunit16_sum_dotunit16_next_value1;
reg dotslice_dottile4_dotunit16_sum_dotunit16_next_value_ce1;
reg [1:0] dotunit17_state = 2'd0;
reg [1:0] dotunit17_next_state;
reg [7:0] dotslice_dottile4_dotunit17_weight_dotunit17_next_value0;
reg dotslice_dottile4_dotunit17_weight_dotunit17_next_value_ce0;
reg [15:0] dotslice_dottile4_dotunit17_sum_dotunit17_next_value1;
reg dotslice_dottile4_dotunit17_sum_dotunit17_next_value_ce1;
reg [1:0] dotunit18_state = 2'd0;
reg [1:0] dotunit18_next_state;
reg [7:0] dotslice_dottile4_dotunit18_weight_dotunit18_next_value0;
reg dotslice_dottile4_dotunit18_weight_dotunit18_next_value_ce0;
reg [15:0] dotslice_dottile4_dotunit18_sum_dotunit18_next_value1;
reg dotslice_dottile4_dotunit18_sum_dotunit18_next_value_ce1;
reg [1:0] dotunit19_state = 2'd0;
reg [1:0] dotunit19_next_state;
reg [7:0] dotslice_dottile4_dotunit19_weight_dotunit19_next_value0;
reg dotslice_dottile4_dotunit19_weight_dotunit19_next_value_ce0;
reg [15:0] dotslice_dottile4_dotunit19_sum_dotunit19_next_value1;
reg dotslice_dottile4_dotunit19_sum_dotunit19_next_value_ce1;
reg [1:0] fsm4_state = 2'd0;
reg [1:0] fsm4_next_state;
reg dotslice_dottile4_out_stream_w_valid_fsm4_next_value0;
reg dotslice_dottile4_out_stream_w_valid_fsm4_next_value_ce0;
reg dotslice_dottile4_out_stream_e_valid_fsm4_next_value1;
reg dotslice_dottile4_out_stream_e_valid_fsm4_next_value_ce1;
reg [1:0] dotunit20_state = 2'd0;
reg [1:0] dotunit20_next_state;
reg [7:0] dotslice_dottile5_dotunit20_weight_dotunit20_next_value0;
reg dotslice_dottile5_dotunit20_weight_dotunit20_next_value_ce0;
reg [15:0] dotslice_dottile5_dotunit20_sum_dotunit20_next_value1;
reg dotslice_dottile5_dotunit20_sum_dotunit20_next_value_ce1;
reg [1:0] dotunit21_state = 2'd0;
reg [1:0] dotunit21_next_state;
reg [7:0] dotslice_dottile5_dotunit21_weight_dotunit21_next_value0;
reg dotslice_dottile5_dotunit21_weight_dotunit21_next_value_ce0;
reg [15:0] dotslice_dottile5_dotunit21_sum_dotunit21_next_value1;
reg dotslice_dottile5_dotunit21_sum_dotunit21_next_value_ce1;
reg [1:0] dotunit22_state = 2'd0;
reg [1:0] dotunit22_next_state;
reg [7:0] dotslice_dottile5_dotunit22_weight_dotunit22_next_value0;
reg dotslice_dottile5_dotunit22_weight_dotunit22_next_value_ce0;
reg [15:0] dotslice_dottile5_dotunit22_sum_dotunit22_next_value1;
reg dotslice_dottile5_dotunit22_sum_dotunit22_next_value_ce1;
reg [1:0] dotunit23_state = 2'd0;
reg [1:0] dotunit23_next_state;
reg [7:0] dotslice_dottile5_dotunit23_weight_dotunit23_next_value0;
reg dotslice_dottile5_dotunit23_weight_dotunit23_next_value_ce0;
reg [15:0] dotslice_dottile5_dotunit23_sum_dotunit23_next_value1;
reg dotslice_dottile5_dotunit23_sum_dotunit23_next_value_ce1;
reg [1:0] fsm5_state = 2'd0;
reg [1:0] fsm5_next_state;
reg dotslice_dottile5_out_stream_w_valid_fsm5_next_value0;
reg dotslice_dottile5_out_stream_w_valid_fsm5_next_value_ce0;
reg dotslice_dottile5_out_stream_e_valid_fsm5_next_value1;
reg dotslice_dottile5_out_stream_e_valid_fsm5_next_value_ce1;
reg [1:0] dotunit24_state = 2'd0;
reg [1:0] dotunit24_next_state;
reg [7:0] dotslice_dottile6_dotunit24_weight_dotunit24_next_value0;
reg dotslice_dottile6_dotunit24_weight_dotunit24_next_value_ce0;
reg [15:0] dotslice_dottile6_dotunit24_sum_dotunit24_next_value1;
reg dotslice_dottile6_dotunit24_sum_dotunit24_next_value_ce1;
reg [1:0] dotunit25_state = 2'd0;
reg [1:0] dotunit25_next_state;
reg [7:0] dotslice_dottile6_dotunit25_weight_dotunit25_next_value0;
reg dotslice_dottile6_dotunit25_weight_dotunit25_next_value_ce0;
reg [15:0] dotslice_dottile6_dotunit25_sum_dotunit25_next_value1;
reg dotslice_dottile6_dotunit25_sum_dotunit25_next_value_ce1;
reg [1:0] dotunit26_state = 2'd0;
reg [1:0] dotunit26_next_state;
reg [7:0] dotslice_dottile6_dotunit26_weight_dotunit26_next_value0;
reg dotslice_dottile6_dotunit26_weight_dotunit26_next_value_ce0;
reg [15:0] dotslice_dottile6_dotunit26_sum_dotunit26_next_value1;
reg dotslice_dottile6_dotunit26_sum_dotunit26_next_value_ce1;
reg [1:0] dotunit27_state = 2'd0;
reg [1:0] dotunit27_next_state;
reg [7:0] dotslice_dottile6_dotunit27_weight_dotunit27_next_value0;
reg dotslice_dottile6_dotunit27_weight_dotunit27_next_value_ce0;
reg [15:0] dotslice_dottile6_dotunit27_sum_dotunit27_next_value1;
reg dotslice_dottile6_dotunit27_sum_dotunit27_next_value_ce1;
reg [1:0] fsm6_state = 2'd0;
reg [1:0] fsm6_next_state;
reg dotslice_dottile6_out_stream_w_valid_fsm6_next_value0;
reg dotslice_dottile6_out_stream_w_valid_fsm6_next_value_ce0;
reg dotslice_dottile6_out_stream_e_valid_fsm6_next_value1;
reg dotslice_dottile6_out_stream_e_valid_fsm6_next_value_ce1;
reg [1:0] dotunit28_state = 2'd0;
reg [1:0] dotunit28_next_state;
reg [7:0] dotslice_dottile7_dotunit28_weight_dotunit28_next_value0;
reg dotslice_dottile7_dotunit28_weight_dotunit28_next_value_ce0;
reg [15:0] dotslice_dottile7_dotunit28_sum_dotunit28_next_value1;
reg dotslice_dottile7_dotunit28_sum_dotunit28_next_value_ce1;
reg [1:0] dotunit29_state = 2'd0;
reg [1:0] dotunit29_next_state;
reg [7:0] dotslice_dottile7_dotunit29_weight_dotunit29_next_value0;
reg dotslice_dottile7_dotunit29_weight_dotunit29_next_value_ce0;
reg [15:0] dotslice_dottile7_dotunit29_sum_dotunit29_next_value1;
reg dotslice_dottile7_dotunit29_sum_dotunit29_next_value_ce1;
reg [1:0] dotunit30_state = 2'd0;
reg [1:0] dotunit30_next_state;
reg [7:0] dotslice_dottile7_dotunit30_weight_dotunit30_next_value0;
reg dotslice_dottile7_dotunit30_weight_dotunit30_next_value_ce0;
reg [15:0] dotslice_dottile7_dotunit30_sum_dotunit30_next_value1;
reg dotslice_dottile7_dotunit30_sum_dotunit30_next_value_ce1;
reg [1:0] dotunit31_state = 2'd0;
reg [1:0] dotunit31_next_state;
reg [7:0] dotslice_dottile7_dotunit31_weight_dotunit31_next_value0;
reg dotslice_dottile7_dotunit31_weight_dotunit31_next_value_ce0;
reg [15:0] dotslice_dottile7_dotunit31_sum_dotunit31_next_value1;
reg dotslice_dottile7_dotunit31_sum_dotunit31_next_value_ce1;
reg [1:0] fsm7_state = 2'd0;
reg [1:0] fsm7_next_state;
reg dotslice_dottile7_out_stream_w_valid_fsm7_next_value0;
reg dotslice_dottile7_out_stream_w_valid_fsm7_next_value_ce0;
reg dotslice_dottile7_out_stream_e_valid_fsm7_next_value1;
reg dotslice_dottile7_out_stream_e_valid_fsm7_next_value_ce1;
reg [1:0] dotunit32_state = 2'd0;
reg [1:0] dotunit32_next_state;
reg [7:0] dotslice_dottile8_dotunit32_weight_dotunit32_next_value0;
reg dotslice_dottile8_dotunit32_weight_dotunit32_next_value_ce0;
reg [15:0] dotslice_dottile8_dotunit32_sum_dotunit32_next_value1;
reg dotslice_dottile8_dotunit32_sum_dotunit32_next_value_ce1;
reg [1:0] dotunit33_state = 2'd0;
reg [1:0] dotunit33_next_state;
reg [7:0] dotslice_dottile8_dotunit33_weight_dotunit33_next_value0;
reg dotslice_dottile8_dotunit33_weight_dotunit33_next_value_ce0;
reg [15:0] dotslice_dottile8_dotunit33_sum_dotunit33_next_value1;
reg dotslice_dottile8_dotunit33_sum_dotunit33_next_value_ce1;
reg [1:0] dotunit34_state = 2'd0;
reg [1:0] dotunit34_next_state;
reg [7:0] dotslice_dottile8_dotunit34_weight_dotunit34_next_value0;
reg dotslice_dottile8_dotunit34_weight_dotunit34_next_value_ce0;
reg [15:0] dotslice_dottile8_dotunit34_sum_dotunit34_next_value1;
reg dotslice_dottile8_dotunit34_sum_dotunit34_next_value_ce1;
reg [1:0] dotunit35_state = 2'd0;
reg [1:0] dotunit35_next_state;
reg [7:0] dotslice_dottile8_dotunit35_weight_dotunit35_next_value0;
reg dotslice_dottile8_dotunit35_weight_dotunit35_next_value_ce0;
reg [15:0] dotslice_dottile8_dotunit35_sum_dotunit35_next_value1;
reg dotslice_dottile8_dotunit35_sum_dotunit35_next_value_ce1;
reg [1:0] fsm8_state = 2'd0;
reg [1:0] fsm8_next_state;
reg dotslice_dottile8_out_stream_w_valid_fsm8_next_value0;
reg dotslice_dottile8_out_stream_w_valid_fsm8_next_value_ce0;
reg dotslice_dottile8_out_stream_e_valid_fsm8_next_value1;
reg dotslice_dottile8_out_stream_e_valid_fsm8_next_value_ce1;
reg [1:0] dotunit36_state = 2'd0;
reg [1:0] dotunit36_next_state;
reg [7:0] dotslice_dottile9_dotunit36_weight_dotunit36_next_value0;
reg dotslice_dottile9_dotunit36_weight_dotunit36_next_value_ce0;
reg [15:0] dotslice_dottile9_dotunit36_sum_dotunit36_next_value1;
reg dotslice_dottile9_dotunit36_sum_dotunit36_next_value_ce1;
reg [1:0] dotunit37_state = 2'd0;
reg [1:0] dotunit37_next_state;
reg [7:0] dotslice_dottile9_dotunit37_weight_dotunit37_next_value0;
reg dotslice_dottile9_dotunit37_weight_dotunit37_next_value_ce0;
reg [15:0] dotslice_dottile9_dotunit37_sum_dotunit37_next_value1;
reg dotslice_dottile9_dotunit37_sum_dotunit37_next_value_ce1;
reg [1:0] dotunit38_state = 2'd0;
reg [1:0] dotunit38_next_state;
reg [7:0] dotslice_dottile9_dotunit38_weight_dotunit38_next_value0;
reg dotslice_dottile9_dotunit38_weight_dotunit38_next_value_ce0;
reg [15:0] dotslice_dottile9_dotunit38_sum_dotunit38_next_value1;
reg dotslice_dottile9_dotunit38_sum_dotunit38_next_value_ce1;
reg [1:0] dotunit39_state = 2'd0;
reg [1:0] dotunit39_next_state;
reg [7:0] dotslice_dottile9_dotunit39_weight_dotunit39_next_value0;
reg dotslice_dottile9_dotunit39_weight_dotunit39_next_value_ce0;
reg [15:0] dotslice_dottile9_dotunit39_sum_dotunit39_next_value1;
reg dotslice_dottile9_dotunit39_sum_dotunit39_next_value_ce1;
reg [1:0] fsm9_state = 2'd0;
reg [1:0] fsm9_next_state;
reg dotslice_dottile9_out_stream_w_valid_fsm9_next_value0;
reg dotslice_dottile9_out_stream_w_valid_fsm9_next_value_ce0;
reg dotslice_dottile9_out_stream_e_valid_fsm9_next_value1;
reg dotslice_dottile9_out_stream_e_valid_fsm9_next_value_ce1;
reg [1:0] dotunit40_state = 2'd0;
reg [1:0] dotunit40_next_state;
reg [7:0] dotslice_dottile10_dotunit40_weight_dotunit40_next_value0;
reg dotslice_dottile10_dotunit40_weight_dotunit40_next_value_ce0;
reg [15:0] dotslice_dottile10_dotunit40_sum_dotunit40_next_value1;
reg dotslice_dottile10_dotunit40_sum_dotunit40_next_value_ce1;
reg [1:0] dotunit41_state = 2'd0;
reg [1:0] dotunit41_next_state;
reg [7:0] dotslice_dottile10_dotunit41_weight_dotunit41_next_value0;
reg dotslice_dottile10_dotunit41_weight_dotunit41_next_value_ce0;
reg [15:0] dotslice_dottile10_dotunit41_sum_dotunit41_next_value1;
reg dotslice_dottile10_dotunit41_sum_dotunit41_next_value_ce1;
reg [1:0] dotunit42_state = 2'd0;
reg [1:0] dotunit42_next_state;
reg [7:0] dotslice_dottile10_dotunit42_weight_dotunit42_next_value0;
reg dotslice_dottile10_dotunit42_weight_dotunit42_next_value_ce0;
reg [15:0] dotslice_dottile10_dotunit42_sum_dotunit42_next_value1;
reg dotslice_dottile10_dotunit42_sum_dotunit42_next_value_ce1;
reg [1:0] dotunit43_state = 2'd0;
reg [1:0] dotunit43_next_state;
reg [7:0] dotslice_dottile10_dotunit43_weight_dotunit43_next_value0;
reg dotslice_dottile10_dotunit43_weight_dotunit43_next_value_ce0;
reg [15:0] dotslice_dottile10_dotunit43_sum_dotunit43_next_value1;
reg dotslice_dottile10_dotunit43_sum_dotunit43_next_value_ce1;
reg [1:0] fsm10_state = 2'd0;
reg [1:0] fsm10_next_state;
reg dotslice_dottile10_out_stream_w_valid_fsm10_next_value0;
reg dotslice_dottile10_out_stream_w_valid_fsm10_next_value_ce0;
reg dotslice_dottile10_out_stream_e_valid_fsm10_next_value1;
reg dotslice_dottile10_out_stream_e_valid_fsm10_next_value_ce1;
reg [1:0] dotunit44_state = 2'd0;
reg [1:0] dotunit44_next_state;
reg [7:0] dotslice_dottile11_dotunit44_weight_dotunit44_next_value0;
reg dotslice_dottile11_dotunit44_weight_dotunit44_next_value_ce0;
reg [15:0] dotslice_dottile11_dotunit44_sum_dotunit44_next_value1;
reg dotslice_dottile11_dotunit44_sum_dotunit44_next_value_ce1;
reg [1:0] dotunit45_state = 2'd0;
reg [1:0] dotunit45_next_state;
reg [7:0] dotslice_dottile11_dotunit45_weight_dotunit45_next_value0;
reg dotslice_dottile11_dotunit45_weight_dotunit45_next_value_ce0;
reg [15:0] dotslice_dottile11_dotunit45_sum_dotunit45_next_value1;
reg dotslice_dottile11_dotunit45_sum_dotunit45_next_value_ce1;
reg [1:0] dotunit46_state = 2'd0;
reg [1:0] dotunit46_next_state;
reg [7:0] dotslice_dottile11_dotunit46_weight_dotunit46_next_value0;
reg dotslice_dottile11_dotunit46_weight_dotunit46_next_value_ce0;
reg [15:0] dotslice_dottile11_dotunit46_sum_dotunit46_next_value1;
reg dotslice_dottile11_dotunit46_sum_dotunit46_next_value_ce1;
reg [1:0] dotunit47_state = 2'd0;
reg [1:0] dotunit47_next_state;
reg [7:0] dotslice_dottile11_dotunit47_weight_dotunit47_next_value0;
reg dotslice_dottile11_dotunit47_weight_dotunit47_next_value_ce0;
reg [15:0] dotslice_dottile11_dotunit47_sum_dotunit47_next_value1;
reg dotslice_dottile11_dotunit47_sum_dotunit47_next_value_ce1;
reg [1:0] fsm11_state = 2'd0;
reg [1:0] fsm11_next_state;
reg dotslice_dottile11_out_stream_w_valid_fsm11_next_value0;
reg dotslice_dottile11_out_stream_w_valid_fsm11_next_value_ce0;
reg dotslice_dottile11_out_stream_e_valid_fsm11_next_value1;
reg dotslice_dottile11_out_stream_e_valid_fsm11_next_value_ce1;
reg [1:0] dotunit48_state = 2'd0;
reg [1:0] dotunit48_next_state;
reg [7:0] dotslice_dottile12_dotunit48_weight_dotunit48_next_value0;
reg dotslice_dottile12_dotunit48_weight_dotunit48_next_value_ce0;
reg [15:0] dotslice_dottile12_dotunit48_sum_dotunit48_next_value1;
reg dotslice_dottile12_dotunit48_sum_dotunit48_next_value_ce1;
reg [1:0] dotunit49_state = 2'd0;
reg [1:0] dotunit49_next_state;
reg [7:0] dotslice_dottile12_dotunit49_weight_dotunit49_next_value0;
reg dotslice_dottile12_dotunit49_weight_dotunit49_next_value_ce0;
reg [15:0] dotslice_dottile12_dotunit49_sum_dotunit49_next_value1;
reg dotslice_dottile12_dotunit49_sum_dotunit49_next_value_ce1;
reg [1:0] dotunit50_state = 2'd0;
reg [1:0] dotunit50_next_state;
reg [7:0] dotslice_dottile12_dotunit50_weight_dotunit50_next_value0;
reg dotslice_dottile12_dotunit50_weight_dotunit50_next_value_ce0;
reg [15:0] dotslice_dottile12_dotunit50_sum_dotunit50_next_value1;
reg dotslice_dottile12_dotunit50_sum_dotunit50_next_value_ce1;
reg [1:0] dotunit51_state = 2'd0;
reg [1:0] dotunit51_next_state;
reg [7:0] dotslice_dottile12_dotunit51_weight_dotunit51_next_value0;
reg dotslice_dottile12_dotunit51_weight_dotunit51_next_value_ce0;
reg [15:0] dotslice_dottile12_dotunit51_sum_dotunit51_next_value1;
reg dotslice_dottile12_dotunit51_sum_dotunit51_next_value_ce1;
reg [1:0] fsm12_state = 2'd0;
reg [1:0] fsm12_next_state;
reg dotslice_dottile12_out_stream_w_valid_fsm12_next_value0;
reg dotslice_dottile12_out_stream_w_valid_fsm12_next_value_ce0;
reg dotslice_dottile12_out_stream_e_valid_fsm12_next_value1;
reg dotslice_dottile12_out_stream_e_valid_fsm12_next_value_ce1;
reg [1:0] dotunit52_state = 2'd0;
reg [1:0] dotunit52_next_state;
reg [7:0] dotslice_dottile13_dotunit52_weight_dotunit52_next_value0;
reg dotslice_dottile13_dotunit52_weight_dotunit52_next_value_ce0;
reg [15:0] dotslice_dottile13_dotunit52_sum_dotunit52_next_value1;
reg dotslice_dottile13_dotunit52_sum_dotunit52_next_value_ce1;
reg [1:0] dotunit53_state = 2'd0;
reg [1:0] dotunit53_next_state;
reg [7:0] dotslice_dottile13_dotunit53_weight_dotunit53_next_value0;
reg dotslice_dottile13_dotunit53_weight_dotunit53_next_value_ce0;
reg [15:0] dotslice_dottile13_dotunit53_sum_dotunit53_next_value1;
reg dotslice_dottile13_dotunit53_sum_dotunit53_next_value_ce1;
reg [1:0] dotunit54_state = 2'd0;
reg [1:0] dotunit54_next_state;
reg [7:0] dotslice_dottile13_dotunit54_weight_dotunit54_next_value0;
reg dotslice_dottile13_dotunit54_weight_dotunit54_next_value_ce0;
reg [15:0] dotslice_dottile13_dotunit54_sum_dotunit54_next_value1;
reg dotslice_dottile13_dotunit54_sum_dotunit54_next_value_ce1;
reg [1:0] dotunit55_state = 2'd0;
reg [1:0] dotunit55_next_state;
reg [7:0] dotslice_dottile13_dotunit55_weight_dotunit55_next_value0;
reg dotslice_dottile13_dotunit55_weight_dotunit55_next_value_ce0;
reg [15:0] dotslice_dottile13_dotunit55_sum_dotunit55_next_value1;
reg dotslice_dottile13_dotunit55_sum_dotunit55_next_value_ce1;
reg [1:0] fsm13_state = 2'd0;
reg [1:0] fsm13_next_state;
reg dotslice_dottile13_out_stream_w_valid_fsm13_next_value0;
reg dotslice_dottile13_out_stream_w_valid_fsm13_next_value_ce0;
reg dotslice_dottile13_out_stream_e_valid_fsm13_next_value1;
reg dotslice_dottile13_out_stream_e_valid_fsm13_next_value_ce1;
reg [1:0] dotunit56_state = 2'd0;
reg [1:0] dotunit56_next_state;
reg [7:0] dotslice_dottile14_dotunit56_weight_dotunit56_next_value0;
reg dotslice_dottile14_dotunit56_weight_dotunit56_next_value_ce0;
reg [15:0] dotslice_dottile14_dotunit56_sum_dotunit56_next_value1;
reg dotslice_dottile14_dotunit56_sum_dotunit56_next_value_ce1;
reg [1:0] dotunit57_state = 2'd0;
reg [1:0] dotunit57_next_state;
reg [7:0] dotslice_dottile14_dotunit57_weight_dotunit57_next_value0;
reg dotslice_dottile14_dotunit57_weight_dotunit57_next_value_ce0;
reg [15:0] dotslice_dottile14_dotunit57_sum_dotunit57_next_value1;
reg dotslice_dottile14_dotunit57_sum_dotunit57_next_value_ce1;
reg [1:0] dotunit58_state = 2'd0;
reg [1:0] dotunit58_next_state;
reg [7:0] dotslice_dottile14_dotunit58_weight_dotunit58_next_value0;
reg dotslice_dottile14_dotunit58_weight_dotunit58_next_value_ce0;
reg [15:0] dotslice_dottile14_dotunit58_sum_dotunit58_next_value1;
reg dotslice_dottile14_dotunit58_sum_dotunit58_next_value_ce1;
reg [1:0] dotunit59_state = 2'd0;
reg [1:0] dotunit59_next_state;
reg [7:0] dotslice_dottile14_dotunit59_weight_dotunit59_next_value0;
reg dotslice_dottile14_dotunit59_weight_dotunit59_next_value_ce0;
reg [15:0] dotslice_dottile14_dotunit59_sum_dotunit59_next_value1;
reg dotslice_dottile14_dotunit59_sum_dotunit59_next_value_ce1;
reg [1:0] fsm14_state = 2'd0;
reg [1:0] fsm14_next_state;
reg dotslice_dottile14_out_stream_w_valid_fsm14_next_value0;
reg dotslice_dottile14_out_stream_w_valid_fsm14_next_value_ce0;
reg dotslice_dottile14_out_stream_e_valid_fsm14_next_value1;
reg dotslice_dottile14_out_stream_e_valid_fsm14_next_value_ce1;
reg [1:0] dotunit60_state = 2'd0;
reg [1:0] dotunit60_next_state;
reg [7:0] dotslice_dottile15_dotunit60_weight_dotunit60_next_value0;
reg dotslice_dottile15_dotunit60_weight_dotunit60_next_value_ce0;
reg [15:0] dotslice_dottile15_dotunit60_sum_dotunit60_next_value1;
reg dotslice_dottile15_dotunit60_sum_dotunit60_next_value_ce1;
reg [1:0] dotunit61_state = 2'd0;
reg [1:0] dotunit61_next_state;
reg [7:0] dotslice_dottile15_dotunit61_weight_dotunit61_next_value0;
reg dotslice_dottile15_dotunit61_weight_dotunit61_next_value_ce0;
reg [15:0] dotslice_dottile15_dotunit61_sum_dotunit61_next_value1;
reg dotslice_dottile15_dotunit61_sum_dotunit61_next_value_ce1;
reg [1:0] dotunit62_state = 2'd0;
reg [1:0] dotunit62_next_state;
reg [7:0] dotslice_dottile15_dotunit62_weight_dotunit62_next_value0;
reg dotslice_dottile15_dotunit62_weight_dotunit62_next_value_ce0;
reg [15:0] dotslice_dottile15_dotunit62_sum_dotunit62_next_value1;
reg dotslice_dottile15_dotunit62_sum_dotunit62_next_value_ce1;
reg [1:0] dotunit63_state = 2'd0;
reg [1:0] dotunit63_next_state;
reg [7:0] dotslice_dottile15_dotunit63_weight_dotunit63_next_value0;
reg dotslice_dottile15_dotunit63_weight_dotunit63_next_value_ce0;
reg [15:0] dotslice_dottile15_dotunit63_sum_dotunit63_next_value1;
reg dotslice_dottile15_dotunit63_sum_dotunit63_next_value_ce1;
reg [1:0] fsm15_state = 2'd0;
reg [1:0] fsm15_next_state;
reg dotslice_dottile15_out_stream_w_valid_fsm15_next_value0;
reg dotslice_dottile15_out_stream_w_valid_fsm15_next_value_ce0;
reg dotslice_dottile15_out_stream_e_valid_fsm15_next_value1;
reg dotslice_dottile15_out_stream_e_valid_fsm15_next_value_ce1;

// synthesis translate_off
reg dummy_s;
initial dummy_s <= 1'd0;
// synthesis translate_on

assign dotslice_dottile0_in_stream_w = in_stream_w[31:0];
assign dotslice_dottile0_in_stream_w_valid = in_stream_w_valid[0];
assign dotslice_dottile0_in_stream_e = in_stream_e[31:0];
assign dotslice_dottile0_in_stream_e_valid = in_stream_e_valid[0];

// synthesis translate_off
reg dummy_d;
// synthesis translate_on
always @(*) begin
	dotslice_dottile0_in_ins <= 64'd0;
	dotslice_dottile0_in_ins_valid <= 1'd0;
	if (1'd1) begin
		dotslice_dottile0_in_ins <= in_ins;
		dotslice_dottile0_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile0_in_ins <= dotslice15;
		dotslice_dottile0_in_ins_valid <= dotslice31;
	end
// synthesis translate_off
	dummy_d <= dummy_s;
// synthesis translate_on
end
assign dotslice0 = dotslice_dottile0_out_ins;
assign dotslice16 = dotslice_dottile0_out_ins_valid;
assign dotslice_dottile1_in_stream_w = in_stream_w[63:32];
assign dotslice_dottile1_in_stream_w_valid = in_stream_w_valid[1];
assign dotslice_dottile1_in_stream_e = in_stream_e[63:32];
assign dotslice_dottile1_in_stream_e_valid = in_stream_e_valid[1];

// synthesis translate_off
reg dummy_d_1;
// synthesis translate_on
always @(*) begin
	dotslice_dottile1_in_ins <= 64'd0;
	dotslice_dottile1_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile1_in_ins <= in_ins;
		dotslice_dottile1_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile1_in_ins <= dotslice0;
		dotslice_dottile1_in_ins_valid <= dotslice16;
	end
// synthesis translate_off
	dummy_d_1 <= dummy_s;
// synthesis translate_on
end
assign dotslice1 = dotslice_dottile1_out_ins;
assign dotslice17 = dotslice_dottile1_out_ins_valid;
assign dotslice_dottile2_in_stream_w = in_stream_w[95:64];
assign dotslice_dottile2_in_stream_w_valid = in_stream_w_valid[2];
assign dotslice_dottile2_in_stream_e = in_stream_e[95:64];
assign dotslice_dottile2_in_stream_e_valid = in_stream_e_valid[2];

// synthesis translate_off
reg dummy_d_2;
// synthesis translate_on
always @(*) begin
	dotslice_dottile2_in_ins <= 64'd0;
	dotslice_dottile2_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile2_in_ins <= in_ins;
		dotslice_dottile2_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile2_in_ins <= dotslice1;
		dotslice_dottile2_in_ins_valid <= dotslice17;
	end
// synthesis translate_off
	dummy_d_2 <= dummy_s;
// synthesis translate_on
end
assign dotslice2 = dotslice_dottile2_out_ins;
assign dotslice18 = dotslice_dottile2_out_ins_valid;
assign dotslice_dottile3_in_stream_w = in_stream_w[127:96];
assign dotslice_dottile3_in_stream_w_valid = in_stream_w_valid[3];
assign dotslice_dottile3_in_stream_e = in_stream_e[127:96];
assign dotslice_dottile3_in_stream_e_valid = in_stream_e_valid[3];

// synthesis translate_off
reg dummy_d_3;
// synthesis translate_on
always @(*) begin
	dotslice_dottile3_in_ins <= 64'd0;
	dotslice_dottile3_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile3_in_ins <= in_ins;
		dotslice_dottile3_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile3_in_ins <= dotslice2;
		dotslice_dottile3_in_ins_valid <= dotslice18;
	end
// synthesis translate_off
	dummy_d_3 <= dummy_s;
// synthesis translate_on
end
assign dotslice3 = dotslice_dottile3_out_ins;
assign dotslice19 = dotslice_dottile3_out_ins_valid;
assign dotslice_dottile4_in_stream_w = in_stream_w[159:128];
assign dotslice_dottile4_in_stream_w_valid = in_stream_w_valid[4];
assign dotslice_dottile4_in_stream_e = in_stream_e[159:128];
assign dotslice_dottile4_in_stream_e_valid = in_stream_e_valid[4];

// synthesis translate_off
reg dummy_d_4;
// synthesis translate_on
always @(*) begin
	dotslice_dottile4_in_ins <= 64'd0;
	dotslice_dottile4_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile4_in_ins <= in_ins;
		dotslice_dottile4_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile4_in_ins <= dotslice3;
		dotslice_dottile4_in_ins_valid <= dotslice19;
	end
// synthesis translate_off
	dummy_d_4 <= dummy_s;
// synthesis translate_on
end
assign dotslice4 = dotslice_dottile4_out_ins;
assign dotslice20 = dotslice_dottile4_out_ins_valid;
assign dotslice_dottile5_in_stream_w = in_stream_w[191:160];
assign dotslice_dottile5_in_stream_w_valid = in_stream_w_valid[5];
assign dotslice_dottile5_in_stream_e = in_stream_e[191:160];
assign dotslice_dottile5_in_stream_e_valid = in_stream_e_valid[5];

// synthesis translate_off
reg dummy_d_5;
// synthesis translate_on
always @(*) begin
	dotslice_dottile5_in_ins <= 64'd0;
	dotslice_dottile5_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile5_in_ins <= in_ins;
		dotslice_dottile5_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile5_in_ins <= dotslice4;
		dotslice_dottile5_in_ins_valid <= dotslice20;
	end
// synthesis translate_off
	dummy_d_5 <= dummy_s;
// synthesis translate_on
end
assign dotslice5 = dotslice_dottile5_out_ins;
assign dotslice21 = dotslice_dottile5_out_ins_valid;
assign dotslice_dottile6_in_stream_w = in_stream_w[223:192];
assign dotslice_dottile6_in_stream_w_valid = in_stream_w_valid[6];
assign dotslice_dottile6_in_stream_e = in_stream_e[223:192];
assign dotslice_dottile6_in_stream_e_valid = in_stream_e_valid[6];

// synthesis translate_off
reg dummy_d_6;
// synthesis translate_on
always @(*) begin
	dotslice_dottile6_in_ins <= 64'd0;
	dotslice_dottile6_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile6_in_ins <= in_ins;
		dotslice_dottile6_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile6_in_ins <= dotslice5;
		dotslice_dottile6_in_ins_valid <= dotslice21;
	end
// synthesis translate_off
	dummy_d_6 <= dummy_s;
// synthesis translate_on
end
assign dotslice6 = dotslice_dottile6_out_ins;
assign dotslice22 = dotslice_dottile6_out_ins_valid;
assign dotslice_dottile7_in_stream_w = in_stream_w[255:224];
assign dotslice_dottile7_in_stream_w_valid = in_stream_w_valid[7];
assign dotslice_dottile7_in_stream_e = in_stream_e[255:224];
assign dotslice_dottile7_in_stream_e_valid = in_stream_e_valid[7];

// synthesis translate_off
reg dummy_d_7;
// synthesis translate_on
always @(*) begin
	dotslice_dottile7_in_ins <= 64'd0;
	dotslice_dottile7_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile7_in_ins <= in_ins;
		dotslice_dottile7_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile7_in_ins <= dotslice6;
		dotslice_dottile7_in_ins_valid <= dotslice22;
	end
// synthesis translate_off
	dummy_d_7 <= dummy_s;
// synthesis translate_on
end
assign dotslice7 = dotslice_dottile7_out_ins;
assign dotslice23 = dotslice_dottile7_out_ins_valid;
assign dotslice_dottile8_in_stream_w = in_stream_w[287:256];
assign dotslice_dottile8_in_stream_w_valid = in_stream_w_valid[8];
assign dotslice_dottile8_in_stream_e = in_stream_e[287:256];
assign dotslice_dottile8_in_stream_e_valid = in_stream_e_valid[8];

// synthesis translate_off
reg dummy_d_8;
// synthesis translate_on
always @(*) begin
	dotslice_dottile8_in_ins <= 64'd0;
	dotslice_dottile8_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile8_in_ins <= in_ins;
		dotslice_dottile8_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile8_in_ins <= dotslice7;
		dotslice_dottile8_in_ins_valid <= dotslice23;
	end
// synthesis translate_off
	dummy_d_8 <= dummy_s;
// synthesis translate_on
end
assign dotslice8 = dotslice_dottile8_out_ins;
assign dotslice24 = dotslice_dottile8_out_ins_valid;
assign dotslice_dottile9_in_stream_w = in_stream_w[319:288];
assign dotslice_dottile9_in_stream_w_valid = in_stream_w_valid[9];
assign dotslice_dottile9_in_stream_e = in_stream_e[319:288];
assign dotslice_dottile9_in_stream_e_valid = in_stream_e_valid[9];

// synthesis translate_off
reg dummy_d_9;
// synthesis translate_on
always @(*) begin
	dotslice_dottile9_in_ins <= 64'd0;
	dotslice_dottile9_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile9_in_ins <= in_ins;
		dotslice_dottile9_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile9_in_ins <= dotslice8;
		dotslice_dottile9_in_ins_valid <= dotslice24;
	end
// synthesis translate_off
	dummy_d_9 <= dummy_s;
// synthesis translate_on
end
assign dotslice9 = dotslice_dottile9_out_ins;
assign dotslice25 = dotslice_dottile9_out_ins_valid;
assign dotslice_dottile10_in_stream_w = in_stream_w[351:320];
assign dotslice_dottile10_in_stream_w_valid = in_stream_w_valid[10];
assign dotslice_dottile10_in_stream_e = in_stream_e[351:320];
assign dotslice_dottile10_in_stream_e_valid = in_stream_e_valid[10];

// synthesis translate_off
reg dummy_d_10;
// synthesis translate_on
always @(*) begin
	dotslice_dottile10_in_ins <= 64'd0;
	dotslice_dottile10_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile10_in_ins <= in_ins;
		dotslice_dottile10_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile10_in_ins <= dotslice9;
		dotslice_dottile10_in_ins_valid <= dotslice25;
	end
// synthesis translate_off
	dummy_d_10 <= dummy_s;
// synthesis translate_on
end
assign dotslice10 = dotslice_dottile10_out_ins;
assign dotslice26 = dotslice_dottile10_out_ins_valid;
assign dotslice_dottile11_in_stream_w = in_stream_w[383:352];
assign dotslice_dottile11_in_stream_w_valid = in_stream_w_valid[11];
assign dotslice_dottile11_in_stream_e = in_stream_e[383:352];
assign dotslice_dottile11_in_stream_e_valid = in_stream_e_valid[11];

// synthesis translate_off
reg dummy_d_11;
// synthesis translate_on
always @(*) begin
	dotslice_dottile11_in_ins <= 64'd0;
	dotslice_dottile11_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile11_in_ins <= in_ins;
		dotslice_dottile11_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile11_in_ins <= dotslice10;
		dotslice_dottile11_in_ins_valid <= dotslice26;
	end
// synthesis translate_off
	dummy_d_11 <= dummy_s;
// synthesis translate_on
end
assign dotslice11 = dotslice_dottile11_out_ins;
assign dotslice27 = dotslice_dottile11_out_ins_valid;
assign dotslice_dottile12_in_stream_w = in_stream_w[415:384];
assign dotslice_dottile12_in_stream_w_valid = in_stream_w_valid[12];
assign dotslice_dottile12_in_stream_e = in_stream_e[415:384];
assign dotslice_dottile12_in_stream_e_valid = in_stream_e_valid[12];

// synthesis translate_off
reg dummy_d_12;
// synthesis translate_on
always @(*) begin
	dotslice_dottile12_in_ins <= 64'd0;
	dotslice_dottile12_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile12_in_ins <= in_ins;
		dotslice_dottile12_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile12_in_ins <= dotslice11;
		dotslice_dottile12_in_ins_valid <= dotslice27;
	end
// synthesis translate_off
	dummy_d_12 <= dummy_s;
// synthesis translate_on
end
assign dotslice12 = dotslice_dottile12_out_ins;
assign dotslice28 = dotslice_dottile12_out_ins_valid;
assign dotslice_dottile13_in_stream_w = in_stream_w[447:416];
assign dotslice_dottile13_in_stream_w_valid = in_stream_w_valid[13];
assign dotslice_dottile13_in_stream_e = in_stream_e[447:416];
assign dotslice_dottile13_in_stream_e_valid = in_stream_e_valid[13];

// synthesis translate_off
reg dummy_d_13;
// synthesis translate_on
always @(*) begin
	dotslice_dottile13_in_ins <= 64'd0;
	dotslice_dottile13_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile13_in_ins <= in_ins;
		dotslice_dottile13_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile13_in_ins <= dotslice12;
		dotslice_dottile13_in_ins_valid <= dotslice28;
	end
// synthesis translate_off
	dummy_d_13 <= dummy_s;
// synthesis translate_on
end
assign dotslice13 = dotslice_dottile13_out_ins;
assign dotslice29 = dotslice_dottile13_out_ins_valid;
assign dotslice_dottile14_in_stream_w = in_stream_w[479:448];
assign dotslice_dottile14_in_stream_w_valid = in_stream_w_valid[14];
assign dotslice_dottile14_in_stream_e = in_stream_e[479:448];
assign dotslice_dottile14_in_stream_e_valid = in_stream_e_valid[14];

// synthesis translate_off
reg dummy_d_14;
// synthesis translate_on
always @(*) begin
	dotslice_dottile14_in_ins <= 64'd0;
	dotslice_dottile14_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile14_in_ins <= in_ins;
		dotslice_dottile14_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile14_in_ins <= dotslice13;
		dotslice_dottile14_in_ins_valid <= dotslice29;
	end
// synthesis translate_off
	dummy_d_14 <= dummy_s;
// synthesis translate_on
end
assign dotslice14 = dotslice_dottile14_out_ins;
assign dotslice30 = dotslice_dottile14_out_ins_valid;

// synthesis translate_off
reg dummy_d_15;
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
// synthesis translate_off
	dummy_d_15 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile15_in_stream_w = in_stream_w[511:480];
assign dotslice_dottile15_in_stream_w_valid = in_stream_w_valid[15];

// synthesis translate_off
reg dummy_d_16;
// synthesis translate_on
always @(*) begin
	out_stream_e <= 512'd0;
	out_stream_e[31:0] <= dotslice_dottile0_out_stream_e;
	out_stream_e[63:32] <= dotslice_dottile1_out_stream_e;
	out_stream_e[95:64] <= dotslice_dottile2_out_stream_e;
	out_stream_e[127:96] <= dotslice_dottile3_out_stream_e;
	out_stream_e[159:128] <= dotslice_dottile4_out_stream_e;
	out_stream_e[191:160] <= dotslice_dottile5_out_stream_e;
	out_stream_e[223:192] <= dotslice_dottile6_out_stream_e;
	out_stream_e[255:224] <= dotslice_dottile7_out_stream_e;
	out_stream_e[287:256] <= dotslice_dottile8_out_stream_e;
	out_stream_e[319:288] <= dotslice_dottile9_out_stream_e;
	out_stream_e[351:320] <= dotslice_dottile10_out_stream_e;
	out_stream_e[383:352] <= dotslice_dottile11_out_stream_e;
	out_stream_e[415:384] <= dotslice_dottile12_out_stream_e;
	out_stream_e[447:416] <= dotslice_dottile13_out_stream_e;
	out_stream_e[479:448] <= dotslice_dottile14_out_stream_e;
	out_stream_e[511:480] <= dotslice_dottile15_out_stream_e;
// synthesis translate_off
	dummy_d_16 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_17;
// synthesis translate_on
always @(*) begin
	out_stream_e_valid <= 16'd0;
	out_stream_e_valid[0] <= dotslice_dottile0_out_stream_e_valid;
	out_stream_e_valid[1] <= dotslice_dottile1_out_stream_e_valid;
	out_stream_e_valid[2] <= dotslice_dottile2_out_stream_e_valid;
	out_stream_e_valid[3] <= dotslice_dottile3_out_stream_e_valid;
	out_stream_e_valid[4] <= dotslice_dottile4_out_stream_e_valid;
	out_stream_e_valid[5] <= dotslice_dottile5_out_stream_e_valid;
	out_stream_e_valid[6] <= dotslice_dottile6_out_stream_e_valid;
	out_stream_e_valid[7] <= dotslice_dottile7_out_stream_e_valid;
	out_stream_e_valid[8] <= dotslice_dottile8_out_stream_e_valid;
	out_stream_e_valid[9] <= dotslice_dottile9_out_stream_e_valid;
	out_stream_e_valid[10] <= dotslice_dottile10_out_stream_e_valid;
	out_stream_e_valid[11] <= dotslice_dottile11_out_stream_e_valid;
	out_stream_e_valid[12] <= dotslice_dottile12_out_stream_e_valid;
	out_stream_e_valid[13] <= dotslice_dottile13_out_stream_e_valid;
	out_stream_e_valid[14] <= dotslice_dottile14_out_stream_e_valid;
	out_stream_e_valid[15] <= dotslice_dottile15_out_stream_e_valid;
// synthesis translate_off
	dummy_d_17 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_18;
// synthesis translate_on
always @(*) begin
	out_stream_w <= 512'd0;
	out_stream_w[31:0] <= dotslice_dottile0_out_stream_w;
	out_stream_w[63:32] <= dotslice_dottile1_out_stream_w;
	out_stream_w[95:64] <= dotslice_dottile2_out_stream_w;
	out_stream_w[127:96] <= dotslice_dottile3_out_stream_w;
	out_stream_w[159:128] <= dotslice_dottile4_out_stream_w;
	out_stream_w[191:160] <= dotslice_dottile5_out_stream_w;
	out_stream_w[223:192] <= dotslice_dottile6_out_stream_w;
	out_stream_w[255:224] <= dotslice_dottile7_out_stream_w;
	out_stream_w[287:256] <= dotslice_dottile8_out_stream_w;
	out_stream_w[319:288] <= dotslice_dottile9_out_stream_w;
	out_stream_w[351:320] <= dotslice_dottile10_out_stream_w;
	out_stream_w[383:352] <= dotslice_dottile11_out_stream_w;
	out_stream_w[415:384] <= dotslice_dottile12_out_stream_w;
	out_stream_w[447:416] <= dotslice_dottile13_out_stream_w;
	out_stream_w[479:448] <= dotslice_dottile14_out_stream_w;
	out_stream_w[511:480] <= dotslice_dottile15_out_stream_w;
// synthesis translate_off
	dummy_d_18 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_19;
// synthesis translate_on
always @(*) begin
	out_stream_w_valid <= 16'd0;
	out_stream_w_valid[0] <= dotslice_dottile0_out_stream_w_valid;
	out_stream_w_valid[1] <= dotslice_dottile1_out_stream_w_valid;
	out_stream_w_valid[2] <= dotslice_dottile2_out_stream_w_valid;
	out_stream_w_valid[3] <= dotslice_dottile3_out_stream_w_valid;
	out_stream_w_valid[4] <= dotslice_dottile4_out_stream_w_valid;
	out_stream_w_valid[5] <= dotslice_dottile5_out_stream_w_valid;
	out_stream_w_valid[6] <= dotslice_dottile6_out_stream_w_valid;
	out_stream_w_valid[7] <= dotslice_dottile7_out_stream_w_valid;
	out_stream_w_valid[8] <= dotslice_dottile8_out_stream_w_valid;
	out_stream_w_valid[9] <= dotslice_dottile9_out_stream_w_valid;
	out_stream_w_valid[10] <= dotslice_dottile10_out_stream_w_valid;
	out_stream_w_valid[11] <= dotslice_dottile11_out_stream_w_valid;
	out_stream_w_valid[12] <= dotslice_dottile12_out_stream_w_valid;
	out_stream_w_valid[13] <= dotslice_dottile13_out_stream_w_valid;
	out_stream_w_valid[14] <= dotslice_dottile14_out_stream_w_valid;
	out_stream_w_valid[15] <= dotslice_dottile15_out_stream_w_valid;
// synthesis translate_off
	dummy_d_19 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile15_in_stream_e = in_stream_e[511:480];
assign dotslice_dottile15_in_stream_e_valid = in_stream_e_valid[15];

// synthesis translate_off
reg dummy_d_20;
// synthesis translate_on
always @(*) begin
	dotslice_dottile15_in_ins <= 64'd0;
	dotslice_dottile15_in_ins_valid <= 1'd0;
	if (1'd0) begin
		dotslice_dottile15_in_ins <= in_ins;
		dotslice_dottile15_in_ins_valid <= in_ins_valid;
	end else begin
		dotslice_dottile15_in_ins <= dotslice14;
		dotslice_dottile15_in_ins_valid <= dotslice30;
	end
// synthesis translate_off
	dummy_d_20 <= dummy_s;
// synthesis translate_on
end
assign dotslice15 = dotslice_dottile15_out_ins;
assign dotslice31 = dotslice_dottile15_out_ins_valid;
assign dotslice_dottile0_dotunit0_in_stream_w = dotslice_dottile0_in_stream_w[7:0];
assign dotslice_dottile0_dotunit0_in_stream_w_valid = dotslice_dottile0_in_stream_w_valid;
assign dotslice_dottile0_dotunit0_in_stream_e = dotslice_dottile0_in_stream_e[7:0];
assign dotslice_dottile0_dotunit0_in_stream_e_valid = dotslice_dottile0_in_stream_e_valid;
assign dotslice_dottile0_dotunit0_in_weight = dotslice_dottile0_in_weight;
assign dotslice_dottile00 = dotslice_dottile0_dotunit0_out_weight;
assign dotslice_dottile0_dotunit1_in_stream_w = dotslice_dottile0_in_stream_w[15:8];
assign dotslice_dottile0_dotunit1_in_stream_w_valid = dotslice_dottile0_in_stream_w_valid;
assign dotslice_dottile0_dotunit1_in_stream_e = dotslice_dottile0_in_stream_e[15:8];
assign dotslice_dottile0_dotunit1_in_stream_e_valid = dotslice_dottile0_in_stream_e_valid;
assign dotslice_dottile0_dotunit1_in_weight = dotslice_dottile00;
assign dotslice_dottile01 = dotslice_dottile0_dotunit1_out_weight;
assign dotslice_dottile0_dotunit2_in_stream_w = dotslice_dottile0_in_stream_w[23:16];
assign dotslice_dottile0_dotunit2_in_stream_w_valid = dotslice_dottile0_in_stream_w_valid;
assign dotslice_dottile0_dotunit2_in_stream_e = dotslice_dottile0_in_stream_e[23:16];
assign dotslice_dottile0_dotunit2_in_stream_e_valid = dotslice_dottile0_in_stream_e_valid;
assign dotslice_dottile0_dotunit2_in_weight = dotslice_dottile01;
assign dotslice_dottile02 = dotslice_dottile0_dotunit2_out_weight;
assign dotslice_dottile0_dotunit3_in_stream_w = dotslice_dottile0_in_stream_w[31:24];
assign dotslice_dottile0_dotunit3_in_stream_w_valid = dotslice_dottile0_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_21;
// synthesis translate_on
always @(*) begin
	dotslice_dottile0_out_stream_e <= 32'd0;
	dotslice_dottile0_out_stream_e[7:0] <= dotslice_dottile0_dotunit0_out_stream_e;
	dotslice_dottile0_out_stream_e[15:8] <= dotslice_dottile0_dotunit1_out_stream_e;
	dotslice_dottile0_out_stream_e[23:16] <= dotslice_dottile0_dotunit2_out_stream_e;
	dotslice_dottile0_out_stream_e[31:24] <= dotslice_dottile0_dotunit3_out_stream_e;
// synthesis translate_off
	dummy_d_21 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_22;
// synthesis translate_on
always @(*) begin
	dotslice_dottile0_out_stream_w <= 32'd0;
	dotslice_dottile0_out_stream_w[7:0] <= dotslice_dottile0_dotunit0_out_stream_w;
	dotslice_dottile0_out_stream_w[15:8] <= dotslice_dottile0_dotunit1_out_stream_w;
	dotslice_dottile0_out_stream_w[23:16] <= dotslice_dottile0_dotunit2_out_stream_w;
	dotslice_dottile0_out_stream_w[31:24] <= dotslice_dottile0_dotunit3_out_stream_w;
// synthesis translate_off
	dummy_d_22 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile0_dotunit3_in_stream_e = dotslice_dottile0_in_stream_e[31:24];
assign dotslice_dottile0_dotunit3_in_stream_e_valid = dotslice_dottile0_in_stream_e_valid;
assign dotslice_dottile0_dotunit3_in_weight = dotslice_dottile02;
assign dotslice_dottile03 = dotslice_dottile0_dotunit3_out_weight;

// synthesis translate_off
reg dummy_d_23;
// synthesis translate_on
always @(*) begin
	dotslice_dottile0_dotunit0_out_stream_e <= 8'd0;
	dotslice_dottile0_dotunit0_out_stream_w <= 8'd0;
	dotunit0_next_state <= 2'd0;
	dotslice_dottile0_dotunit0_weight_dotunit0_next_value0 <= 8'd0;
	dotslice_dottile0_dotunit0_weight_dotunit0_next_value_ce0 <= 1'd0;
	dotslice_dottile0_dotunit0_sum_dotunit0_next_value1 <= 16'd0;
	dotslice_dottile0_dotunit0_sum_dotunit0_next_value_ce1 <= 1'd0;
	dotunit0_next_state <= dotunit0_state;
	case (dotunit0_state)
		1'd1: begin
			if (dotslice_dottile0_dotunit0_in_stream_w_valid) begin
				dotslice_dottile0_dotunit0_weight_dotunit0_next_value0 <= dotslice_dottile0_dotunit0_in_stream_w;
				dotslice_dottile0_dotunit0_weight_dotunit0_next_value_ce0 <= 1'd1;
				dotunit0_next_state <= 1'd0;
			end
			if (dotslice_dottile0_dotunit0_in_stream_e_valid) begin
				dotslice_dottile0_dotunit0_out_stream_e <= dotslice_dottile0_dotunit0_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile0_dotunit0_in_stream_w_valid) begin
				dotslice_dottile0_dotunit0_sum_dotunit0_next_value1 <= (dotslice_dottile0_dotunit0_sum + (dotslice_dottile0_dotunit0_in_stream_w * dotslice_dottile0_dotunit0_in_weight));
				dotslice_dottile0_dotunit0_sum_dotunit0_next_value_ce1 <= 1'd1;
				dotslice_dottile0_dotunit0_out_stream_w <= dotslice_dottile0_dotunit0_in_stream_w;
			end
			if (dotslice_dottile0_dotunit0_in_stream_e_valid) begin
				dotslice_dottile0_dotunit0_out_stream_e <= dotslice_dottile0_dotunit0_in_stream_e;
			end
			dotunit0_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile0_dotunit0_out_stream_e <= dotslice_dottile0_dotunit0_sum;
			if (dotslice_dottile0_dotunit0_in_stream_w_valid) begin
				dotslice_dottile0_dotunit0_out_stream_w <= dotslice_dottile0_dotunit0_in_stream_w;
			end
			dotunit0_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile0_dotunit0_in_stream_w_valid) begin
				dotslice_dottile0_dotunit0_out_stream_w <= dotslice_dottile0_dotunit0_in_stream_w;
			end
			if (dotslice_dottile0_dotunit0_in_stream_e_valid) begin
				dotslice_dottile0_dotunit0_out_stream_e <= dotslice_dottile0_dotunit0_in_stream_e;
			end
			dotunit0_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_23 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_24;
// synthesis translate_on
always @(*) begin
	dotslice_dottile0_dotunit1_out_stream_e <= 8'd0;
	dotslice_dottile0_dotunit1_out_stream_w <= 8'd0;
	dotunit1_next_state <= 2'd0;
	dotslice_dottile0_dotunit1_weight_dotunit1_next_value0 <= 8'd0;
	dotslice_dottile0_dotunit1_weight_dotunit1_next_value_ce0 <= 1'd0;
	dotslice_dottile0_dotunit1_sum_dotunit1_next_value1 <= 16'd0;
	dotslice_dottile0_dotunit1_sum_dotunit1_next_value_ce1 <= 1'd0;
	dotunit1_next_state <= dotunit1_state;
	case (dotunit1_state)
		1'd1: begin
			if (dotslice_dottile0_dotunit1_in_stream_w_valid) begin
				dotslice_dottile0_dotunit1_weight_dotunit1_next_value0 <= dotslice_dottile0_dotunit1_in_stream_w;
				dotslice_dottile0_dotunit1_weight_dotunit1_next_value_ce0 <= 1'd1;
				dotunit1_next_state <= 1'd0;
			end
			if (dotslice_dottile0_dotunit1_in_stream_e_valid) begin
				dotslice_dottile0_dotunit1_out_stream_e <= dotslice_dottile0_dotunit1_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile0_dotunit1_in_stream_w_valid) begin
				dotslice_dottile0_dotunit1_sum_dotunit1_next_value1 <= (dotslice_dottile0_dotunit1_sum + (dotslice_dottile0_dotunit1_in_stream_w * dotslice_dottile0_dotunit1_in_weight));
				dotslice_dottile0_dotunit1_sum_dotunit1_next_value_ce1 <= 1'd1;
				dotslice_dottile0_dotunit1_out_stream_w <= dotslice_dottile0_dotunit1_in_stream_w;
			end
			if (dotslice_dottile0_dotunit1_in_stream_e_valid) begin
				dotslice_dottile0_dotunit1_out_stream_e <= dotslice_dottile0_dotunit1_in_stream_e;
			end
			dotunit1_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile0_dotunit1_out_stream_e <= dotslice_dottile0_dotunit1_sum;
			if (dotslice_dottile0_dotunit1_in_stream_w_valid) begin
				dotslice_dottile0_dotunit1_out_stream_w <= dotslice_dottile0_dotunit1_in_stream_w;
			end
			dotunit1_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile0_dotunit1_in_stream_w_valid) begin
				dotslice_dottile0_dotunit1_out_stream_w <= dotslice_dottile0_dotunit1_in_stream_w;
			end
			if (dotslice_dottile0_dotunit1_in_stream_e_valid) begin
				dotslice_dottile0_dotunit1_out_stream_e <= dotslice_dottile0_dotunit1_in_stream_e;
			end
			dotunit1_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_24 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_25;
// synthesis translate_on
always @(*) begin
	dotslice_dottile0_dotunit2_out_stream_e <= 8'd0;
	dotslice_dottile0_dotunit2_out_stream_w <= 8'd0;
	dotunit2_next_state <= 2'd0;
	dotslice_dottile0_dotunit2_weight_dotunit2_next_value0 <= 8'd0;
	dotslice_dottile0_dotunit2_weight_dotunit2_next_value_ce0 <= 1'd0;
	dotslice_dottile0_dotunit2_sum_dotunit2_next_value1 <= 16'd0;
	dotslice_dottile0_dotunit2_sum_dotunit2_next_value_ce1 <= 1'd0;
	dotunit2_next_state <= dotunit2_state;
	case (dotunit2_state)
		1'd1: begin
			if (dotslice_dottile0_dotunit2_in_stream_w_valid) begin
				dotslice_dottile0_dotunit2_weight_dotunit2_next_value0 <= dotslice_dottile0_dotunit2_in_stream_w;
				dotslice_dottile0_dotunit2_weight_dotunit2_next_value_ce0 <= 1'd1;
				dotunit2_next_state <= 1'd0;
			end
			if (dotslice_dottile0_dotunit2_in_stream_e_valid) begin
				dotslice_dottile0_dotunit2_out_stream_e <= dotslice_dottile0_dotunit2_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile0_dotunit2_in_stream_w_valid) begin
				dotslice_dottile0_dotunit2_sum_dotunit2_next_value1 <= (dotslice_dottile0_dotunit2_sum + (dotslice_dottile0_dotunit2_in_stream_w * dotslice_dottile0_dotunit2_in_weight));
				dotslice_dottile0_dotunit2_sum_dotunit2_next_value_ce1 <= 1'd1;
				dotslice_dottile0_dotunit2_out_stream_w <= dotslice_dottile0_dotunit2_in_stream_w;
			end
			if (dotslice_dottile0_dotunit2_in_stream_e_valid) begin
				dotslice_dottile0_dotunit2_out_stream_e <= dotslice_dottile0_dotunit2_in_stream_e;
			end
			dotunit2_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile0_dotunit2_out_stream_e <= dotslice_dottile0_dotunit2_sum;
			if (dotslice_dottile0_dotunit2_in_stream_w_valid) begin
				dotslice_dottile0_dotunit2_out_stream_w <= dotslice_dottile0_dotunit2_in_stream_w;
			end
			dotunit2_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile0_dotunit2_in_stream_w_valid) begin
				dotslice_dottile0_dotunit2_out_stream_w <= dotslice_dottile0_dotunit2_in_stream_w;
			end
			if (dotslice_dottile0_dotunit2_in_stream_e_valid) begin
				dotslice_dottile0_dotunit2_out_stream_e <= dotslice_dottile0_dotunit2_in_stream_e;
			end
			dotunit2_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_25 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_26;
// synthesis translate_on
always @(*) begin
	dotslice_dottile0_dotunit3_out_stream_e <= 8'd0;
	dotslice_dottile0_dotunit3_out_stream_w <= 8'd0;
	dotunit3_next_state <= 2'd0;
	dotslice_dottile0_dotunit3_weight_dotunit3_next_value0 <= 8'd0;
	dotslice_dottile0_dotunit3_weight_dotunit3_next_value_ce0 <= 1'd0;
	dotslice_dottile0_dotunit3_sum_dotunit3_next_value1 <= 16'd0;
	dotslice_dottile0_dotunit3_sum_dotunit3_next_value_ce1 <= 1'd0;
	dotunit3_next_state <= dotunit3_state;
	case (dotunit3_state)
		1'd1: begin
			if (dotslice_dottile0_dotunit3_in_stream_w_valid) begin
				dotslice_dottile0_dotunit3_weight_dotunit3_next_value0 <= dotslice_dottile0_dotunit3_in_stream_w;
				dotslice_dottile0_dotunit3_weight_dotunit3_next_value_ce0 <= 1'd1;
				dotunit3_next_state <= 1'd0;
			end
			if (dotslice_dottile0_dotunit3_in_stream_e_valid) begin
				dotslice_dottile0_dotunit3_out_stream_e <= dotslice_dottile0_dotunit3_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile0_dotunit3_in_stream_w_valid) begin
				dotslice_dottile0_dotunit3_sum_dotunit3_next_value1 <= (dotslice_dottile0_dotunit3_sum + (dotslice_dottile0_dotunit3_in_stream_w * dotslice_dottile0_dotunit3_in_weight));
				dotslice_dottile0_dotunit3_sum_dotunit3_next_value_ce1 <= 1'd1;
				dotslice_dottile0_dotunit3_out_stream_w <= dotslice_dottile0_dotunit3_in_stream_w;
			end
			if (dotslice_dottile0_dotunit3_in_stream_e_valid) begin
				dotslice_dottile0_dotunit3_out_stream_e <= dotslice_dottile0_dotunit3_in_stream_e;
			end
			dotunit3_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile0_dotunit3_out_stream_e <= dotslice_dottile0_dotunit3_sum;
			if (dotslice_dottile0_dotunit3_in_stream_w_valid) begin
				dotslice_dottile0_dotunit3_out_stream_w <= dotslice_dottile0_dotunit3_in_stream_w;
			end
			dotunit3_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile0_dotunit3_in_stream_w_valid) begin
				dotslice_dottile0_dotunit3_out_stream_w <= dotslice_dottile0_dotunit3_in_stream_w;
			end
			if (dotslice_dottile0_dotunit3_in_stream_e_valid) begin
				dotslice_dottile0_dotunit3_out_stream_e <= dotslice_dottile0_dotunit3_in_stream_e;
			end
			dotunit3_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_26 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_27;
// synthesis translate_on
always @(*) begin
	fsm0_next_state <= 2'd0;
	dotslice_dottile0_out_stream_w_valid_fsm0_next_value0 <= 1'd0;
	dotslice_dottile0_out_stream_w_valid_fsm0_next_value_ce0 <= 1'd0;
	dotslice_dottile0_out_stream_e_valid_fsm0_next_value1 <= 1'd0;
	dotslice_dottile0_out_stream_e_valid_fsm0_next_value_ce1 <= 1'd0;
	fsm0_next_state <= fsm0_state;
	case (fsm0_state)
		1'd1: begin
			if (dotslice_dottile0_in_stream_w_valid) begin
				fsm0_next_state <= 1'd0;
			end
			dotslice_dottile0_out_stream_e_valid_fsm0_next_value1 <= dotslice_dottile0_in_stream_e_valid;
			dotslice_dottile0_out_stream_e_valid_fsm0_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile0_out_stream_w_valid_fsm0_next_value0 <= dotslice_dottile0_in_stream_w_valid;
			dotslice_dottile0_out_stream_w_valid_fsm0_next_value_ce0 <= 1'd1;
			dotslice_dottile0_out_stream_e_valid_fsm0_next_value1 <= dotslice_dottile0_in_stream_e_valid;
			dotslice_dottile0_out_stream_e_valid_fsm0_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile0_out_stream_w_valid_fsm0_next_value0 <= dotslice_dottile0_in_stream_w_valid;
			dotslice_dottile0_out_stream_w_valid_fsm0_next_value_ce0 <= 1'd1;
			dotslice_dottile0_out_stream_e_valid_fsm0_next_value1 <= 1'd1;
			dotslice_dottile0_out_stream_e_valid_fsm0_next_value_ce1 <= 1'd1;
			fsm0_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile0_out_stream_w_valid_fsm0_next_value0 <= dotslice_dottile0_in_stream_w_valid;
			dotslice_dottile0_out_stream_w_valid_fsm0_next_value_ce0 <= 1'd1;
			dotslice_dottile0_out_stream_e_valid_fsm0_next_value1 <= dotslice_dottile0_in_stream_e_valid;
			dotslice_dottile0_out_stream_e_valid_fsm0_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_27 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile1_dotunit4_in_stream_w = dotslice_dottile1_in_stream_w[7:0];
assign dotslice_dottile1_dotunit4_in_stream_w_valid = dotslice_dottile1_in_stream_w_valid;
assign dotslice_dottile1_dotunit4_in_stream_e = dotslice_dottile1_in_stream_e[7:0];
assign dotslice_dottile1_dotunit4_in_stream_e_valid = dotslice_dottile1_in_stream_e_valid;
assign dotslice_dottile1_dotunit4_in_weight = dotslice_dottile1_in_weight;
assign dotslice_dottile10 = dotslice_dottile1_dotunit4_out_weight;
assign dotslice_dottile1_dotunit5_in_stream_w = dotslice_dottile1_in_stream_w[15:8];
assign dotslice_dottile1_dotunit5_in_stream_w_valid = dotslice_dottile1_in_stream_w_valid;
assign dotslice_dottile1_dotunit5_in_stream_e = dotslice_dottile1_in_stream_e[15:8];
assign dotslice_dottile1_dotunit5_in_stream_e_valid = dotslice_dottile1_in_stream_e_valid;
assign dotslice_dottile1_dotunit5_in_weight = dotslice_dottile10;
assign dotslice_dottile11 = dotslice_dottile1_dotunit5_out_weight;
assign dotslice_dottile1_dotunit6_in_stream_w = dotslice_dottile1_in_stream_w[23:16];
assign dotslice_dottile1_dotunit6_in_stream_w_valid = dotslice_dottile1_in_stream_w_valid;
assign dotslice_dottile1_dotunit6_in_stream_e = dotslice_dottile1_in_stream_e[23:16];
assign dotslice_dottile1_dotunit6_in_stream_e_valid = dotslice_dottile1_in_stream_e_valid;
assign dotslice_dottile1_dotunit6_in_weight = dotslice_dottile11;
assign dotslice_dottile12 = dotslice_dottile1_dotunit6_out_weight;
assign dotslice_dottile1_dotunit7_in_stream_w = dotslice_dottile1_in_stream_w[31:24];
assign dotslice_dottile1_dotunit7_in_stream_w_valid = dotslice_dottile1_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_28;
// synthesis translate_on
always @(*) begin
	dotslice_dottile1_out_stream_e <= 32'd0;
	dotslice_dottile1_out_stream_e[7:0] <= dotslice_dottile1_dotunit4_out_stream_e;
	dotslice_dottile1_out_stream_e[15:8] <= dotslice_dottile1_dotunit5_out_stream_e;
	dotslice_dottile1_out_stream_e[23:16] <= dotslice_dottile1_dotunit6_out_stream_e;
	dotslice_dottile1_out_stream_e[31:24] <= dotslice_dottile1_dotunit7_out_stream_e;
// synthesis translate_off
	dummy_d_28 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_29;
// synthesis translate_on
always @(*) begin
	dotslice_dottile1_out_stream_w <= 32'd0;
	dotslice_dottile1_out_stream_w[7:0] <= dotslice_dottile1_dotunit4_out_stream_w;
	dotslice_dottile1_out_stream_w[15:8] <= dotslice_dottile1_dotunit5_out_stream_w;
	dotslice_dottile1_out_stream_w[23:16] <= dotslice_dottile1_dotunit6_out_stream_w;
	dotslice_dottile1_out_stream_w[31:24] <= dotslice_dottile1_dotunit7_out_stream_w;
// synthesis translate_off
	dummy_d_29 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile1_dotunit7_in_stream_e = dotslice_dottile1_in_stream_e[31:24];
assign dotslice_dottile1_dotunit7_in_stream_e_valid = dotslice_dottile1_in_stream_e_valid;
assign dotslice_dottile1_dotunit7_in_weight = dotslice_dottile12;
assign dotslice_dottile13 = dotslice_dottile1_dotunit7_out_weight;

// synthesis translate_off
reg dummy_d_30;
// synthesis translate_on
always @(*) begin
	dotslice_dottile1_dotunit4_out_stream_e <= 8'd0;
	dotslice_dottile1_dotunit4_out_stream_w <= 8'd0;
	dotunit4_next_state <= 2'd0;
	dotslice_dottile1_dotunit4_weight_dotunit4_next_value0 <= 8'd0;
	dotslice_dottile1_dotunit4_weight_dotunit4_next_value_ce0 <= 1'd0;
	dotslice_dottile1_dotunit4_sum_dotunit4_next_value1 <= 16'd0;
	dotslice_dottile1_dotunit4_sum_dotunit4_next_value_ce1 <= 1'd0;
	dotunit4_next_state <= dotunit4_state;
	case (dotunit4_state)
		1'd1: begin
			if (dotslice_dottile1_dotunit4_in_stream_w_valid) begin
				dotslice_dottile1_dotunit4_weight_dotunit4_next_value0 <= dotslice_dottile1_dotunit4_in_stream_w;
				dotslice_dottile1_dotunit4_weight_dotunit4_next_value_ce0 <= 1'd1;
				dotunit4_next_state <= 1'd0;
			end
			if (dotslice_dottile1_dotunit4_in_stream_e_valid) begin
				dotslice_dottile1_dotunit4_out_stream_e <= dotslice_dottile1_dotunit4_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile1_dotunit4_in_stream_w_valid) begin
				dotslice_dottile1_dotunit4_sum_dotunit4_next_value1 <= (dotslice_dottile1_dotunit4_sum + (dotslice_dottile1_dotunit4_in_stream_w * dotslice_dottile1_dotunit4_in_weight));
				dotslice_dottile1_dotunit4_sum_dotunit4_next_value_ce1 <= 1'd1;
				dotslice_dottile1_dotunit4_out_stream_w <= dotslice_dottile1_dotunit4_in_stream_w;
			end
			if (dotslice_dottile1_dotunit4_in_stream_e_valid) begin
				dotslice_dottile1_dotunit4_out_stream_e <= dotslice_dottile1_dotunit4_in_stream_e;
			end
			dotunit4_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile1_dotunit4_out_stream_e <= dotslice_dottile1_dotunit4_sum;
			if (dotslice_dottile1_dotunit4_in_stream_w_valid) begin
				dotslice_dottile1_dotunit4_out_stream_w <= dotslice_dottile1_dotunit4_in_stream_w;
			end
			dotunit4_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile1_dotunit4_in_stream_w_valid) begin
				dotslice_dottile1_dotunit4_out_stream_w <= dotslice_dottile1_dotunit4_in_stream_w;
			end
			if (dotslice_dottile1_dotunit4_in_stream_e_valid) begin
				dotslice_dottile1_dotunit4_out_stream_e <= dotslice_dottile1_dotunit4_in_stream_e;
			end
			dotunit4_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_30 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_31;
// synthesis translate_on
always @(*) begin
	dotslice_dottile1_dotunit5_out_stream_e <= 8'd0;
	dotslice_dottile1_dotunit5_out_stream_w <= 8'd0;
	dotunit5_next_state <= 2'd0;
	dotslice_dottile1_dotunit5_weight_dotunit5_next_value0 <= 8'd0;
	dotslice_dottile1_dotunit5_weight_dotunit5_next_value_ce0 <= 1'd0;
	dotslice_dottile1_dotunit5_sum_dotunit5_next_value1 <= 16'd0;
	dotslice_dottile1_dotunit5_sum_dotunit5_next_value_ce1 <= 1'd0;
	dotunit5_next_state <= dotunit5_state;
	case (dotunit5_state)
		1'd1: begin
			if (dotslice_dottile1_dotunit5_in_stream_w_valid) begin
				dotslice_dottile1_dotunit5_weight_dotunit5_next_value0 <= dotslice_dottile1_dotunit5_in_stream_w;
				dotslice_dottile1_dotunit5_weight_dotunit5_next_value_ce0 <= 1'd1;
				dotunit5_next_state <= 1'd0;
			end
			if (dotslice_dottile1_dotunit5_in_stream_e_valid) begin
				dotslice_dottile1_dotunit5_out_stream_e <= dotslice_dottile1_dotunit5_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile1_dotunit5_in_stream_w_valid) begin
				dotslice_dottile1_dotunit5_sum_dotunit5_next_value1 <= (dotslice_dottile1_dotunit5_sum + (dotslice_dottile1_dotunit5_in_stream_w * dotslice_dottile1_dotunit5_in_weight));
				dotslice_dottile1_dotunit5_sum_dotunit5_next_value_ce1 <= 1'd1;
				dotslice_dottile1_dotunit5_out_stream_w <= dotslice_dottile1_dotunit5_in_stream_w;
			end
			if (dotslice_dottile1_dotunit5_in_stream_e_valid) begin
				dotslice_dottile1_dotunit5_out_stream_e <= dotslice_dottile1_dotunit5_in_stream_e;
			end
			dotunit5_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile1_dotunit5_out_stream_e <= dotslice_dottile1_dotunit5_sum;
			if (dotslice_dottile1_dotunit5_in_stream_w_valid) begin
				dotslice_dottile1_dotunit5_out_stream_w <= dotslice_dottile1_dotunit5_in_stream_w;
			end
			dotunit5_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile1_dotunit5_in_stream_w_valid) begin
				dotslice_dottile1_dotunit5_out_stream_w <= dotslice_dottile1_dotunit5_in_stream_w;
			end
			if (dotslice_dottile1_dotunit5_in_stream_e_valid) begin
				dotslice_dottile1_dotunit5_out_stream_e <= dotslice_dottile1_dotunit5_in_stream_e;
			end
			dotunit5_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_31 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_32;
// synthesis translate_on
always @(*) begin
	dotslice_dottile1_dotunit6_out_stream_e <= 8'd0;
	dotslice_dottile1_dotunit6_out_stream_w <= 8'd0;
	dotunit6_next_state <= 2'd0;
	dotslice_dottile1_dotunit6_weight_dotunit6_next_value0 <= 8'd0;
	dotslice_dottile1_dotunit6_weight_dotunit6_next_value_ce0 <= 1'd0;
	dotslice_dottile1_dotunit6_sum_dotunit6_next_value1 <= 16'd0;
	dotslice_dottile1_dotunit6_sum_dotunit6_next_value_ce1 <= 1'd0;
	dotunit6_next_state <= dotunit6_state;
	case (dotunit6_state)
		1'd1: begin
			if (dotslice_dottile1_dotunit6_in_stream_w_valid) begin
				dotslice_dottile1_dotunit6_weight_dotunit6_next_value0 <= dotslice_dottile1_dotunit6_in_stream_w;
				dotslice_dottile1_dotunit6_weight_dotunit6_next_value_ce0 <= 1'd1;
				dotunit6_next_state <= 1'd0;
			end
			if (dotslice_dottile1_dotunit6_in_stream_e_valid) begin
				dotslice_dottile1_dotunit6_out_stream_e <= dotslice_dottile1_dotunit6_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile1_dotunit6_in_stream_w_valid) begin
				dotslice_dottile1_dotunit6_sum_dotunit6_next_value1 <= (dotslice_dottile1_dotunit6_sum + (dotslice_dottile1_dotunit6_in_stream_w * dotslice_dottile1_dotunit6_in_weight));
				dotslice_dottile1_dotunit6_sum_dotunit6_next_value_ce1 <= 1'd1;
				dotslice_dottile1_dotunit6_out_stream_w <= dotslice_dottile1_dotunit6_in_stream_w;
			end
			if (dotslice_dottile1_dotunit6_in_stream_e_valid) begin
				dotslice_dottile1_dotunit6_out_stream_e <= dotslice_dottile1_dotunit6_in_stream_e;
			end
			dotunit6_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile1_dotunit6_out_stream_e <= dotslice_dottile1_dotunit6_sum;
			if (dotslice_dottile1_dotunit6_in_stream_w_valid) begin
				dotslice_dottile1_dotunit6_out_stream_w <= dotslice_dottile1_dotunit6_in_stream_w;
			end
			dotunit6_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile1_dotunit6_in_stream_w_valid) begin
				dotslice_dottile1_dotunit6_out_stream_w <= dotslice_dottile1_dotunit6_in_stream_w;
			end
			if (dotslice_dottile1_dotunit6_in_stream_e_valid) begin
				dotslice_dottile1_dotunit6_out_stream_e <= dotslice_dottile1_dotunit6_in_stream_e;
			end
			dotunit6_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_32 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_33;
// synthesis translate_on
always @(*) begin
	dotslice_dottile1_dotunit7_out_stream_e <= 8'd0;
	dotslice_dottile1_dotunit7_out_stream_w <= 8'd0;
	dotunit7_next_state <= 2'd0;
	dotslice_dottile1_dotunit7_weight_dotunit7_next_value0 <= 8'd0;
	dotslice_dottile1_dotunit7_weight_dotunit7_next_value_ce0 <= 1'd0;
	dotslice_dottile1_dotunit7_sum_dotunit7_next_value1 <= 16'd0;
	dotslice_dottile1_dotunit7_sum_dotunit7_next_value_ce1 <= 1'd0;
	dotunit7_next_state <= dotunit7_state;
	case (dotunit7_state)
		1'd1: begin
			if (dotslice_dottile1_dotunit7_in_stream_w_valid) begin
				dotslice_dottile1_dotunit7_weight_dotunit7_next_value0 <= dotslice_dottile1_dotunit7_in_stream_w;
				dotslice_dottile1_dotunit7_weight_dotunit7_next_value_ce0 <= 1'd1;
				dotunit7_next_state <= 1'd0;
			end
			if (dotslice_dottile1_dotunit7_in_stream_e_valid) begin
				dotslice_dottile1_dotunit7_out_stream_e <= dotslice_dottile1_dotunit7_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile1_dotunit7_in_stream_w_valid) begin
				dotslice_dottile1_dotunit7_sum_dotunit7_next_value1 <= (dotslice_dottile1_dotunit7_sum + (dotslice_dottile1_dotunit7_in_stream_w * dotslice_dottile1_dotunit7_in_weight));
				dotslice_dottile1_dotunit7_sum_dotunit7_next_value_ce1 <= 1'd1;
				dotslice_dottile1_dotunit7_out_stream_w <= dotslice_dottile1_dotunit7_in_stream_w;
			end
			if (dotslice_dottile1_dotunit7_in_stream_e_valid) begin
				dotslice_dottile1_dotunit7_out_stream_e <= dotslice_dottile1_dotunit7_in_stream_e;
			end
			dotunit7_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile1_dotunit7_out_stream_e <= dotslice_dottile1_dotunit7_sum;
			if (dotslice_dottile1_dotunit7_in_stream_w_valid) begin
				dotslice_dottile1_dotunit7_out_stream_w <= dotslice_dottile1_dotunit7_in_stream_w;
			end
			dotunit7_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile1_dotunit7_in_stream_w_valid) begin
				dotslice_dottile1_dotunit7_out_stream_w <= dotslice_dottile1_dotunit7_in_stream_w;
			end
			if (dotslice_dottile1_dotunit7_in_stream_e_valid) begin
				dotslice_dottile1_dotunit7_out_stream_e <= dotslice_dottile1_dotunit7_in_stream_e;
			end
			dotunit7_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_33 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_34;
// synthesis translate_on
always @(*) begin
	fsm1_next_state <= 2'd0;
	dotslice_dottile1_out_stream_w_valid_fsm1_next_value0 <= 1'd0;
	dotslice_dottile1_out_stream_w_valid_fsm1_next_value_ce0 <= 1'd0;
	dotslice_dottile1_out_stream_e_valid_fsm1_next_value1 <= 1'd0;
	dotslice_dottile1_out_stream_e_valid_fsm1_next_value_ce1 <= 1'd0;
	fsm1_next_state <= fsm1_state;
	case (fsm1_state)
		1'd1: begin
			if (dotslice_dottile1_in_stream_w_valid) begin
				fsm1_next_state <= 1'd0;
			end
			dotslice_dottile1_out_stream_e_valid_fsm1_next_value1 <= dotslice_dottile1_in_stream_e_valid;
			dotslice_dottile1_out_stream_e_valid_fsm1_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile1_out_stream_w_valid_fsm1_next_value0 <= dotslice_dottile1_in_stream_w_valid;
			dotslice_dottile1_out_stream_w_valid_fsm1_next_value_ce0 <= 1'd1;
			dotslice_dottile1_out_stream_e_valid_fsm1_next_value1 <= dotslice_dottile1_in_stream_e_valid;
			dotslice_dottile1_out_stream_e_valid_fsm1_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile1_out_stream_w_valid_fsm1_next_value0 <= dotslice_dottile1_in_stream_w_valid;
			dotslice_dottile1_out_stream_w_valid_fsm1_next_value_ce0 <= 1'd1;
			dotslice_dottile1_out_stream_e_valid_fsm1_next_value1 <= 1'd1;
			dotslice_dottile1_out_stream_e_valid_fsm1_next_value_ce1 <= 1'd1;
			fsm1_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile1_out_stream_w_valid_fsm1_next_value0 <= dotslice_dottile1_in_stream_w_valid;
			dotslice_dottile1_out_stream_w_valid_fsm1_next_value_ce0 <= 1'd1;
			dotslice_dottile1_out_stream_e_valid_fsm1_next_value1 <= dotslice_dottile1_in_stream_e_valid;
			dotslice_dottile1_out_stream_e_valid_fsm1_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_34 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile2_dotunit8_in_stream_w = dotslice_dottile2_in_stream_w[7:0];
assign dotslice_dottile2_dotunit8_in_stream_w_valid = dotslice_dottile2_in_stream_w_valid;
assign dotslice_dottile2_dotunit8_in_stream_e = dotslice_dottile2_in_stream_e[7:0];
assign dotslice_dottile2_dotunit8_in_stream_e_valid = dotslice_dottile2_in_stream_e_valid;
assign dotslice_dottile2_dotunit8_in_weight = dotslice_dottile2_in_weight;
assign dotslice_dottile20 = dotslice_dottile2_dotunit8_out_weight;
assign dotslice_dottile2_dotunit9_in_stream_w = dotslice_dottile2_in_stream_w[15:8];
assign dotslice_dottile2_dotunit9_in_stream_w_valid = dotslice_dottile2_in_stream_w_valid;
assign dotslice_dottile2_dotunit9_in_stream_e = dotslice_dottile2_in_stream_e[15:8];
assign dotslice_dottile2_dotunit9_in_stream_e_valid = dotslice_dottile2_in_stream_e_valid;
assign dotslice_dottile2_dotunit9_in_weight = dotslice_dottile20;
assign dotslice_dottile21 = dotslice_dottile2_dotunit9_out_weight;
assign dotslice_dottile2_dotunit10_in_stream_w = dotslice_dottile2_in_stream_w[23:16];
assign dotslice_dottile2_dotunit10_in_stream_w_valid = dotslice_dottile2_in_stream_w_valid;
assign dotslice_dottile2_dotunit10_in_stream_e = dotslice_dottile2_in_stream_e[23:16];
assign dotslice_dottile2_dotunit10_in_stream_e_valid = dotslice_dottile2_in_stream_e_valid;
assign dotslice_dottile2_dotunit10_in_weight = dotslice_dottile21;
assign dotslice_dottile22 = dotslice_dottile2_dotunit10_out_weight;
assign dotslice_dottile2_dotunit11_in_stream_w = dotslice_dottile2_in_stream_w[31:24];
assign dotslice_dottile2_dotunit11_in_stream_w_valid = dotslice_dottile2_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_35;
// synthesis translate_on
always @(*) begin
	dotslice_dottile2_out_stream_e <= 32'd0;
	dotslice_dottile2_out_stream_e[7:0] <= dotslice_dottile2_dotunit8_out_stream_e;
	dotslice_dottile2_out_stream_e[15:8] <= dotslice_dottile2_dotunit9_out_stream_e;
	dotslice_dottile2_out_stream_e[23:16] <= dotslice_dottile2_dotunit10_out_stream_e;
	dotslice_dottile2_out_stream_e[31:24] <= dotslice_dottile2_dotunit11_out_stream_e;
// synthesis translate_off
	dummy_d_35 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_36;
// synthesis translate_on
always @(*) begin
	dotslice_dottile2_out_stream_w <= 32'd0;
	dotslice_dottile2_out_stream_w[7:0] <= dotslice_dottile2_dotunit8_out_stream_w;
	dotslice_dottile2_out_stream_w[15:8] <= dotslice_dottile2_dotunit9_out_stream_w;
	dotslice_dottile2_out_stream_w[23:16] <= dotslice_dottile2_dotunit10_out_stream_w;
	dotslice_dottile2_out_stream_w[31:24] <= dotslice_dottile2_dotunit11_out_stream_w;
// synthesis translate_off
	dummy_d_36 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile2_dotunit11_in_stream_e = dotslice_dottile2_in_stream_e[31:24];
assign dotslice_dottile2_dotunit11_in_stream_e_valid = dotslice_dottile2_in_stream_e_valid;
assign dotslice_dottile2_dotunit11_in_weight = dotslice_dottile22;
assign dotslice_dottile23 = dotslice_dottile2_dotunit11_out_weight;

// synthesis translate_off
reg dummy_d_37;
// synthesis translate_on
always @(*) begin
	dotslice_dottile2_dotunit8_out_stream_e <= 8'd0;
	dotslice_dottile2_dotunit8_out_stream_w <= 8'd0;
	dotunit8_next_state <= 2'd0;
	dotslice_dottile2_dotunit8_weight_dotunit8_next_value0 <= 8'd0;
	dotslice_dottile2_dotunit8_weight_dotunit8_next_value_ce0 <= 1'd0;
	dotslice_dottile2_dotunit8_sum_dotunit8_next_value1 <= 16'd0;
	dotslice_dottile2_dotunit8_sum_dotunit8_next_value_ce1 <= 1'd0;
	dotunit8_next_state <= dotunit8_state;
	case (dotunit8_state)
		1'd1: begin
			if (dotslice_dottile2_dotunit8_in_stream_w_valid) begin
				dotslice_dottile2_dotunit8_weight_dotunit8_next_value0 <= dotslice_dottile2_dotunit8_in_stream_w;
				dotslice_dottile2_dotunit8_weight_dotunit8_next_value_ce0 <= 1'd1;
				dotunit8_next_state <= 1'd0;
			end
			if (dotslice_dottile2_dotunit8_in_stream_e_valid) begin
				dotslice_dottile2_dotunit8_out_stream_e <= dotslice_dottile2_dotunit8_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile2_dotunit8_in_stream_w_valid) begin
				dotslice_dottile2_dotunit8_sum_dotunit8_next_value1 <= (dotslice_dottile2_dotunit8_sum + (dotslice_dottile2_dotunit8_in_stream_w * dotslice_dottile2_dotunit8_in_weight));
				dotslice_dottile2_dotunit8_sum_dotunit8_next_value_ce1 <= 1'd1;
				dotslice_dottile2_dotunit8_out_stream_w <= dotslice_dottile2_dotunit8_in_stream_w;
			end
			if (dotslice_dottile2_dotunit8_in_stream_e_valid) begin
				dotslice_dottile2_dotunit8_out_stream_e <= dotslice_dottile2_dotunit8_in_stream_e;
			end
			dotunit8_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile2_dotunit8_out_stream_e <= dotslice_dottile2_dotunit8_sum;
			if (dotslice_dottile2_dotunit8_in_stream_w_valid) begin
				dotslice_dottile2_dotunit8_out_stream_w <= dotslice_dottile2_dotunit8_in_stream_w;
			end
			dotunit8_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile2_dotunit8_in_stream_w_valid) begin
				dotslice_dottile2_dotunit8_out_stream_w <= dotslice_dottile2_dotunit8_in_stream_w;
			end
			if (dotslice_dottile2_dotunit8_in_stream_e_valid) begin
				dotslice_dottile2_dotunit8_out_stream_e <= dotslice_dottile2_dotunit8_in_stream_e;
			end
			dotunit8_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_37 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_38;
// synthesis translate_on
always @(*) begin
	dotslice_dottile2_dotunit9_out_stream_e <= 8'd0;
	dotslice_dottile2_dotunit9_out_stream_w <= 8'd0;
	dotunit9_next_state <= 2'd0;
	dotslice_dottile2_dotunit9_weight_dotunit9_next_value0 <= 8'd0;
	dotslice_dottile2_dotunit9_weight_dotunit9_next_value_ce0 <= 1'd0;
	dotslice_dottile2_dotunit9_sum_dotunit9_next_value1 <= 16'd0;
	dotslice_dottile2_dotunit9_sum_dotunit9_next_value_ce1 <= 1'd0;
	dotunit9_next_state <= dotunit9_state;
	case (dotunit9_state)
		1'd1: begin
			if (dotslice_dottile2_dotunit9_in_stream_w_valid) begin
				dotslice_dottile2_dotunit9_weight_dotunit9_next_value0 <= dotslice_dottile2_dotunit9_in_stream_w;
				dotslice_dottile2_dotunit9_weight_dotunit9_next_value_ce0 <= 1'd1;
				dotunit9_next_state <= 1'd0;
			end
			if (dotslice_dottile2_dotunit9_in_stream_e_valid) begin
				dotslice_dottile2_dotunit9_out_stream_e <= dotslice_dottile2_dotunit9_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile2_dotunit9_in_stream_w_valid) begin
				dotslice_dottile2_dotunit9_sum_dotunit9_next_value1 <= (dotslice_dottile2_dotunit9_sum + (dotslice_dottile2_dotunit9_in_stream_w * dotslice_dottile2_dotunit9_in_weight));
				dotslice_dottile2_dotunit9_sum_dotunit9_next_value_ce1 <= 1'd1;
				dotslice_dottile2_dotunit9_out_stream_w <= dotslice_dottile2_dotunit9_in_stream_w;
			end
			if (dotslice_dottile2_dotunit9_in_stream_e_valid) begin
				dotslice_dottile2_dotunit9_out_stream_e <= dotslice_dottile2_dotunit9_in_stream_e;
			end
			dotunit9_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile2_dotunit9_out_stream_e <= dotslice_dottile2_dotunit9_sum;
			if (dotslice_dottile2_dotunit9_in_stream_w_valid) begin
				dotslice_dottile2_dotunit9_out_stream_w <= dotslice_dottile2_dotunit9_in_stream_w;
			end
			dotunit9_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile2_dotunit9_in_stream_w_valid) begin
				dotslice_dottile2_dotunit9_out_stream_w <= dotslice_dottile2_dotunit9_in_stream_w;
			end
			if (dotslice_dottile2_dotunit9_in_stream_e_valid) begin
				dotslice_dottile2_dotunit9_out_stream_e <= dotslice_dottile2_dotunit9_in_stream_e;
			end
			dotunit9_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_38 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_39;
// synthesis translate_on
always @(*) begin
	dotslice_dottile2_dotunit10_out_stream_e <= 8'd0;
	dotslice_dottile2_dotunit10_out_stream_w <= 8'd0;
	dotunit10_next_state <= 2'd0;
	dotslice_dottile2_dotunit10_weight_dotunit10_next_value0 <= 8'd0;
	dotslice_dottile2_dotunit10_weight_dotunit10_next_value_ce0 <= 1'd0;
	dotslice_dottile2_dotunit10_sum_dotunit10_next_value1 <= 16'd0;
	dotslice_dottile2_dotunit10_sum_dotunit10_next_value_ce1 <= 1'd0;
	dotunit10_next_state <= dotunit10_state;
	case (dotunit10_state)
		1'd1: begin
			if (dotslice_dottile2_dotunit10_in_stream_w_valid) begin
				dotslice_dottile2_dotunit10_weight_dotunit10_next_value0 <= dotslice_dottile2_dotunit10_in_stream_w;
				dotslice_dottile2_dotunit10_weight_dotunit10_next_value_ce0 <= 1'd1;
				dotunit10_next_state <= 1'd0;
			end
			if (dotslice_dottile2_dotunit10_in_stream_e_valid) begin
				dotslice_dottile2_dotunit10_out_stream_e <= dotslice_dottile2_dotunit10_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile2_dotunit10_in_stream_w_valid) begin
				dotslice_dottile2_dotunit10_sum_dotunit10_next_value1 <= (dotslice_dottile2_dotunit10_sum + (dotslice_dottile2_dotunit10_in_stream_w * dotslice_dottile2_dotunit10_in_weight));
				dotslice_dottile2_dotunit10_sum_dotunit10_next_value_ce1 <= 1'd1;
				dotslice_dottile2_dotunit10_out_stream_w <= dotslice_dottile2_dotunit10_in_stream_w;
			end
			if (dotslice_dottile2_dotunit10_in_stream_e_valid) begin
				dotslice_dottile2_dotunit10_out_stream_e <= dotslice_dottile2_dotunit10_in_stream_e;
			end
			dotunit10_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile2_dotunit10_out_stream_e <= dotslice_dottile2_dotunit10_sum;
			if (dotslice_dottile2_dotunit10_in_stream_w_valid) begin
				dotslice_dottile2_dotunit10_out_stream_w <= dotslice_dottile2_dotunit10_in_stream_w;
			end
			dotunit10_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile2_dotunit10_in_stream_w_valid) begin
				dotslice_dottile2_dotunit10_out_stream_w <= dotslice_dottile2_dotunit10_in_stream_w;
			end
			if (dotslice_dottile2_dotunit10_in_stream_e_valid) begin
				dotslice_dottile2_dotunit10_out_stream_e <= dotslice_dottile2_dotunit10_in_stream_e;
			end
			dotunit10_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_39 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_40;
// synthesis translate_on
always @(*) begin
	dotslice_dottile2_dotunit11_out_stream_e <= 8'd0;
	dotslice_dottile2_dotunit11_out_stream_w <= 8'd0;
	dotunit11_next_state <= 2'd0;
	dotslice_dottile2_dotunit11_weight_dotunit11_next_value0 <= 8'd0;
	dotslice_dottile2_dotunit11_weight_dotunit11_next_value_ce0 <= 1'd0;
	dotslice_dottile2_dotunit11_sum_dotunit11_next_value1 <= 16'd0;
	dotslice_dottile2_dotunit11_sum_dotunit11_next_value_ce1 <= 1'd0;
	dotunit11_next_state <= dotunit11_state;
	case (dotunit11_state)
		1'd1: begin
			if (dotslice_dottile2_dotunit11_in_stream_w_valid) begin
				dotslice_dottile2_dotunit11_weight_dotunit11_next_value0 <= dotslice_dottile2_dotunit11_in_stream_w;
				dotslice_dottile2_dotunit11_weight_dotunit11_next_value_ce0 <= 1'd1;
				dotunit11_next_state <= 1'd0;
			end
			if (dotslice_dottile2_dotunit11_in_stream_e_valid) begin
				dotslice_dottile2_dotunit11_out_stream_e <= dotslice_dottile2_dotunit11_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile2_dotunit11_in_stream_w_valid) begin
				dotslice_dottile2_dotunit11_sum_dotunit11_next_value1 <= (dotslice_dottile2_dotunit11_sum + (dotslice_dottile2_dotunit11_in_stream_w * dotslice_dottile2_dotunit11_in_weight));
				dotslice_dottile2_dotunit11_sum_dotunit11_next_value_ce1 <= 1'd1;
				dotslice_dottile2_dotunit11_out_stream_w <= dotslice_dottile2_dotunit11_in_stream_w;
			end
			if (dotslice_dottile2_dotunit11_in_stream_e_valid) begin
				dotslice_dottile2_dotunit11_out_stream_e <= dotslice_dottile2_dotunit11_in_stream_e;
			end
			dotunit11_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile2_dotunit11_out_stream_e <= dotslice_dottile2_dotunit11_sum;
			if (dotslice_dottile2_dotunit11_in_stream_w_valid) begin
				dotslice_dottile2_dotunit11_out_stream_w <= dotslice_dottile2_dotunit11_in_stream_w;
			end
			dotunit11_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile2_dotunit11_in_stream_w_valid) begin
				dotslice_dottile2_dotunit11_out_stream_w <= dotslice_dottile2_dotunit11_in_stream_w;
			end
			if (dotslice_dottile2_dotunit11_in_stream_e_valid) begin
				dotslice_dottile2_dotunit11_out_stream_e <= dotslice_dottile2_dotunit11_in_stream_e;
			end
			dotunit11_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_40 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_41;
// synthesis translate_on
always @(*) begin
	fsm2_next_state <= 2'd0;
	dotslice_dottile2_out_stream_w_valid_fsm2_next_value0 <= 1'd0;
	dotslice_dottile2_out_stream_w_valid_fsm2_next_value_ce0 <= 1'd0;
	dotslice_dottile2_out_stream_e_valid_fsm2_next_value1 <= 1'd0;
	dotslice_dottile2_out_stream_e_valid_fsm2_next_value_ce1 <= 1'd0;
	fsm2_next_state <= fsm2_state;
	case (fsm2_state)
		1'd1: begin
			if (dotslice_dottile2_in_stream_w_valid) begin
				fsm2_next_state <= 1'd0;
			end
			dotslice_dottile2_out_stream_e_valid_fsm2_next_value1 <= dotslice_dottile2_in_stream_e_valid;
			dotslice_dottile2_out_stream_e_valid_fsm2_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile2_out_stream_w_valid_fsm2_next_value0 <= dotslice_dottile2_in_stream_w_valid;
			dotslice_dottile2_out_stream_w_valid_fsm2_next_value_ce0 <= 1'd1;
			dotslice_dottile2_out_stream_e_valid_fsm2_next_value1 <= dotslice_dottile2_in_stream_e_valid;
			dotslice_dottile2_out_stream_e_valid_fsm2_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile2_out_stream_w_valid_fsm2_next_value0 <= dotslice_dottile2_in_stream_w_valid;
			dotslice_dottile2_out_stream_w_valid_fsm2_next_value_ce0 <= 1'd1;
			dotslice_dottile2_out_stream_e_valid_fsm2_next_value1 <= 1'd1;
			dotslice_dottile2_out_stream_e_valid_fsm2_next_value_ce1 <= 1'd1;
			fsm2_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile2_out_stream_w_valid_fsm2_next_value0 <= dotslice_dottile2_in_stream_w_valid;
			dotslice_dottile2_out_stream_w_valid_fsm2_next_value_ce0 <= 1'd1;
			dotslice_dottile2_out_stream_e_valid_fsm2_next_value1 <= dotslice_dottile2_in_stream_e_valid;
			dotslice_dottile2_out_stream_e_valid_fsm2_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_41 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile3_dotunit12_in_stream_w = dotslice_dottile3_in_stream_w[7:0];
assign dotslice_dottile3_dotunit12_in_stream_w_valid = dotslice_dottile3_in_stream_w_valid;
assign dotslice_dottile3_dotunit12_in_stream_e = dotslice_dottile3_in_stream_e[7:0];
assign dotslice_dottile3_dotunit12_in_stream_e_valid = dotslice_dottile3_in_stream_e_valid;
assign dotslice_dottile3_dotunit12_in_weight = dotslice_dottile3_in_weight;
assign dotslice_dottile30 = dotslice_dottile3_dotunit12_out_weight;
assign dotslice_dottile3_dotunit13_in_stream_w = dotslice_dottile3_in_stream_w[15:8];
assign dotslice_dottile3_dotunit13_in_stream_w_valid = dotslice_dottile3_in_stream_w_valid;
assign dotslice_dottile3_dotunit13_in_stream_e = dotslice_dottile3_in_stream_e[15:8];
assign dotslice_dottile3_dotunit13_in_stream_e_valid = dotslice_dottile3_in_stream_e_valid;
assign dotslice_dottile3_dotunit13_in_weight = dotslice_dottile30;
assign dotslice_dottile31 = dotslice_dottile3_dotunit13_out_weight;
assign dotslice_dottile3_dotunit14_in_stream_w = dotslice_dottile3_in_stream_w[23:16];
assign dotslice_dottile3_dotunit14_in_stream_w_valid = dotslice_dottile3_in_stream_w_valid;
assign dotslice_dottile3_dotunit14_in_stream_e = dotslice_dottile3_in_stream_e[23:16];
assign dotslice_dottile3_dotunit14_in_stream_e_valid = dotslice_dottile3_in_stream_e_valid;
assign dotslice_dottile3_dotunit14_in_weight = dotslice_dottile31;
assign dotslice_dottile32 = dotslice_dottile3_dotunit14_out_weight;
assign dotslice_dottile3_dotunit15_in_stream_w = dotslice_dottile3_in_stream_w[31:24];
assign dotslice_dottile3_dotunit15_in_stream_w_valid = dotslice_dottile3_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_42;
// synthesis translate_on
always @(*) begin
	dotslice_dottile3_out_stream_e <= 32'd0;
	dotslice_dottile3_out_stream_e[7:0] <= dotslice_dottile3_dotunit12_out_stream_e;
	dotslice_dottile3_out_stream_e[15:8] <= dotslice_dottile3_dotunit13_out_stream_e;
	dotslice_dottile3_out_stream_e[23:16] <= dotslice_dottile3_dotunit14_out_stream_e;
	dotslice_dottile3_out_stream_e[31:24] <= dotslice_dottile3_dotunit15_out_stream_e;
// synthesis translate_off
	dummy_d_42 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_43;
// synthesis translate_on
always @(*) begin
	dotslice_dottile3_out_stream_w <= 32'd0;
	dotslice_dottile3_out_stream_w[7:0] <= dotslice_dottile3_dotunit12_out_stream_w;
	dotslice_dottile3_out_stream_w[15:8] <= dotslice_dottile3_dotunit13_out_stream_w;
	dotslice_dottile3_out_stream_w[23:16] <= dotslice_dottile3_dotunit14_out_stream_w;
	dotslice_dottile3_out_stream_w[31:24] <= dotslice_dottile3_dotunit15_out_stream_w;
// synthesis translate_off
	dummy_d_43 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile3_dotunit15_in_stream_e = dotslice_dottile3_in_stream_e[31:24];
assign dotslice_dottile3_dotunit15_in_stream_e_valid = dotslice_dottile3_in_stream_e_valid;
assign dotslice_dottile3_dotunit15_in_weight = dotslice_dottile32;
assign dotslice_dottile33 = dotslice_dottile3_dotunit15_out_weight;

// synthesis translate_off
reg dummy_d_44;
// synthesis translate_on
always @(*) begin
	dotslice_dottile3_dotunit12_out_stream_e <= 8'd0;
	dotslice_dottile3_dotunit12_out_stream_w <= 8'd0;
	dotunit12_next_state <= 2'd0;
	dotslice_dottile3_dotunit12_weight_dotunit12_next_value0 <= 8'd0;
	dotslice_dottile3_dotunit12_weight_dotunit12_next_value_ce0 <= 1'd0;
	dotslice_dottile3_dotunit12_sum_dotunit12_next_value1 <= 16'd0;
	dotslice_dottile3_dotunit12_sum_dotunit12_next_value_ce1 <= 1'd0;
	dotunit12_next_state <= dotunit12_state;
	case (dotunit12_state)
		1'd1: begin
			if (dotslice_dottile3_dotunit12_in_stream_w_valid) begin
				dotslice_dottile3_dotunit12_weight_dotunit12_next_value0 <= dotslice_dottile3_dotunit12_in_stream_w;
				dotslice_dottile3_dotunit12_weight_dotunit12_next_value_ce0 <= 1'd1;
				dotunit12_next_state <= 1'd0;
			end
			if (dotslice_dottile3_dotunit12_in_stream_e_valid) begin
				dotslice_dottile3_dotunit12_out_stream_e <= dotslice_dottile3_dotunit12_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile3_dotunit12_in_stream_w_valid) begin
				dotslice_dottile3_dotunit12_sum_dotunit12_next_value1 <= (dotslice_dottile3_dotunit12_sum + (dotslice_dottile3_dotunit12_in_stream_w * dotslice_dottile3_dotunit12_in_weight));
				dotslice_dottile3_dotunit12_sum_dotunit12_next_value_ce1 <= 1'd1;
				dotslice_dottile3_dotunit12_out_stream_w <= dotslice_dottile3_dotunit12_in_stream_w;
			end
			if (dotslice_dottile3_dotunit12_in_stream_e_valid) begin
				dotslice_dottile3_dotunit12_out_stream_e <= dotslice_dottile3_dotunit12_in_stream_e;
			end
			dotunit12_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile3_dotunit12_out_stream_e <= dotslice_dottile3_dotunit12_sum;
			if (dotslice_dottile3_dotunit12_in_stream_w_valid) begin
				dotslice_dottile3_dotunit12_out_stream_w <= dotslice_dottile3_dotunit12_in_stream_w;
			end
			dotunit12_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile3_dotunit12_in_stream_w_valid) begin
				dotslice_dottile3_dotunit12_out_stream_w <= dotslice_dottile3_dotunit12_in_stream_w;
			end
			if (dotslice_dottile3_dotunit12_in_stream_e_valid) begin
				dotslice_dottile3_dotunit12_out_stream_e <= dotslice_dottile3_dotunit12_in_stream_e;
			end
			dotunit12_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_44 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_45;
// synthesis translate_on
always @(*) begin
	dotslice_dottile3_dotunit13_out_stream_e <= 8'd0;
	dotslice_dottile3_dotunit13_out_stream_w <= 8'd0;
	dotunit13_next_state <= 2'd0;
	dotslice_dottile3_dotunit13_weight_dotunit13_next_value0 <= 8'd0;
	dotslice_dottile3_dotunit13_weight_dotunit13_next_value_ce0 <= 1'd0;
	dotslice_dottile3_dotunit13_sum_dotunit13_next_value1 <= 16'd0;
	dotslice_dottile3_dotunit13_sum_dotunit13_next_value_ce1 <= 1'd0;
	dotunit13_next_state <= dotunit13_state;
	case (dotunit13_state)
		1'd1: begin
			if (dotslice_dottile3_dotunit13_in_stream_w_valid) begin
				dotslice_dottile3_dotunit13_weight_dotunit13_next_value0 <= dotslice_dottile3_dotunit13_in_stream_w;
				dotslice_dottile3_dotunit13_weight_dotunit13_next_value_ce0 <= 1'd1;
				dotunit13_next_state <= 1'd0;
			end
			if (dotslice_dottile3_dotunit13_in_stream_e_valid) begin
				dotslice_dottile3_dotunit13_out_stream_e <= dotslice_dottile3_dotunit13_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile3_dotunit13_in_stream_w_valid) begin
				dotslice_dottile3_dotunit13_sum_dotunit13_next_value1 <= (dotslice_dottile3_dotunit13_sum + (dotslice_dottile3_dotunit13_in_stream_w * dotslice_dottile3_dotunit13_in_weight));
				dotslice_dottile3_dotunit13_sum_dotunit13_next_value_ce1 <= 1'd1;
				dotslice_dottile3_dotunit13_out_stream_w <= dotslice_dottile3_dotunit13_in_stream_w;
			end
			if (dotslice_dottile3_dotunit13_in_stream_e_valid) begin
				dotslice_dottile3_dotunit13_out_stream_e <= dotslice_dottile3_dotunit13_in_stream_e;
			end
			dotunit13_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile3_dotunit13_out_stream_e <= dotslice_dottile3_dotunit13_sum;
			if (dotslice_dottile3_dotunit13_in_stream_w_valid) begin
				dotslice_dottile3_dotunit13_out_stream_w <= dotslice_dottile3_dotunit13_in_stream_w;
			end
			dotunit13_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile3_dotunit13_in_stream_w_valid) begin
				dotslice_dottile3_dotunit13_out_stream_w <= dotslice_dottile3_dotunit13_in_stream_w;
			end
			if (dotslice_dottile3_dotunit13_in_stream_e_valid) begin
				dotslice_dottile3_dotunit13_out_stream_e <= dotslice_dottile3_dotunit13_in_stream_e;
			end
			dotunit13_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_45 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_46;
// synthesis translate_on
always @(*) begin
	dotslice_dottile3_dotunit14_out_stream_e <= 8'd0;
	dotslice_dottile3_dotunit14_out_stream_w <= 8'd0;
	dotunit14_next_state <= 2'd0;
	dotslice_dottile3_dotunit14_weight_dotunit14_next_value0 <= 8'd0;
	dotslice_dottile3_dotunit14_weight_dotunit14_next_value_ce0 <= 1'd0;
	dotslice_dottile3_dotunit14_sum_dotunit14_next_value1 <= 16'd0;
	dotslice_dottile3_dotunit14_sum_dotunit14_next_value_ce1 <= 1'd0;
	dotunit14_next_state <= dotunit14_state;
	case (dotunit14_state)
		1'd1: begin
			if (dotslice_dottile3_dotunit14_in_stream_w_valid) begin
				dotslice_dottile3_dotunit14_weight_dotunit14_next_value0 <= dotslice_dottile3_dotunit14_in_stream_w;
				dotslice_dottile3_dotunit14_weight_dotunit14_next_value_ce0 <= 1'd1;
				dotunit14_next_state <= 1'd0;
			end
			if (dotslice_dottile3_dotunit14_in_stream_e_valid) begin
				dotslice_dottile3_dotunit14_out_stream_e <= dotslice_dottile3_dotunit14_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile3_dotunit14_in_stream_w_valid) begin
				dotslice_dottile3_dotunit14_sum_dotunit14_next_value1 <= (dotslice_dottile3_dotunit14_sum + (dotslice_dottile3_dotunit14_in_stream_w * dotslice_dottile3_dotunit14_in_weight));
				dotslice_dottile3_dotunit14_sum_dotunit14_next_value_ce1 <= 1'd1;
				dotslice_dottile3_dotunit14_out_stream_w <= dotslice_dottile3_dotunit14_in_stream_w;
			end
			if (dotslice_dottile3_dotunit14_in_stream_e_valid) begin
				dotslice_dottile3_dotunit14_out_stream_e <= dotslice_dottile3_dotunit14_in_stream_e;
			end
			dotunit14_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile3_dotunit14_out_stream_e <= dotslice_dottile3_dotunit14_sum;
			if (dotslice_dottile3_dotunit14_in_stream_w_valid) begin
				dotslice_dottile3_dotunit14_out_stream_w <= dotslice_dottile3_dotunit14_in_stream_w;
			end
			dotunit14_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile3_dotunit14_in_stream_w_valid) begin
				dotslice_dottile3_dotunit14_out_stream_w <= dotslice_dottile3_dotunit14_in_stream_w;
			end
			if (dotslice_dottile3_dotunit14_in_stream_e_valid) begin
				dotslice_dottile3_dotunit14_out_stream_e <= dotslice_dottile3_dotunit14_in_stream_e;
			end
			dotunit14_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_46 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_47;
// synthesis translate_on
always @(*) begin
	dotslice_dottile3_dotunit15_out_stream_e <= 8'd0;
	dotslice_dottile3_dotunit15_out_stream_w <= 8'd0;
	dotunit15_next_state <= 2'd0;
	dotslice_dottile3_dotunit15_weight_dotunit15_next_value0 <= 8'd0;
	dotslice_dottile3_dotunit15_weight_dotunit15_next_value_ce0 <= 1'd0;
	dotslice_dottile3_dotunit15_sum_dotunit15_next_value1 <= 16'd0;
	dotslice_dottile3_dotunit15_sum_dotunit15_next_value_ce1 <= 1'd0;
	dotunit15_next_state <= dotunit15_state;
	case (dotunit15_state)
		1'd1: begin
			if (dotslice_dottile3_dotunit15_in_stream_w_valid) begin
				dotslice_dottile3_dotunit15_weight_dotunit15_next_value0 <= dotslice_dottile3_dotunit15_in_stream_w;
				dotslice_dottile3_dotunit15_weight_dotunit15_next_value_ce0 <= 1'd1;
				dotunit15_next_state <= 1'd0;
			end
			if (dotslice_dottile3_dotunit15_in_stream_e_valid) begin
				dotslice_dottile3_dotunit15_out_stream_e <= dotslice_dottile3_dotunit15_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile3_dotunit15_in_stream_w_valid) begin
				dotslice_dottile3_dotunit15_sum_dotunit15_next_value1 <= (dotslice_dottile3_dotunit15_sum + (dotslice_dottile3_dotunit15_in_stream_w * dotslice_dottile3_dotunit15_in_weight));
				dotslice_dottile3_dotunit15_sum_dotunit15_next_value_ce1 <= 1'd1;
				dotslice_dottile3_dotunit15_out_stream_w <= dotslice_dottile3_dotunit15_in_stream_w;
			end
			if (dotslice_dottile3_dotunit15_in_stream_e_valid) begin
				dotslice_dottile3_dotunit15_out_stream_e <= dotslice_dottile3_dotunit15_in_stream_e;
			end
			dotunit15_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile3_dotunit15_out_stream_e <= dotslice_dottile3_dotunit15_sum;
			if (dotslice_dottile3_dotunit15_in_stream_w_valid) begin
				dotslice_dottile3_dotunit15_out_stream_w <= dotslice_dottile3_dotunit15_in_stream_w;
			end
			dotunit15_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile3_dotunit15_in_stream_w_valid) begin
				dotslice_dottile3_dotunit15_out_stream_w <= dotslice_dottile3_dotunit15_in_stream_w;
			end
			if (dotslice_dottile3_dotunit15_in_stream_e_valid) begin
				dotslice_dottile3_dotunit15_out_stream_e <= dotslice_dottile3_dotunit15_in_stream_e;
			end
			dotunit15_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_47 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_48;
// synthesis translate_on
always @(*) begin
	fsm3_next_state <= 2'd0;
	dotslice_dottile3_out_stream_w_valid_fsm3_next_value0 <= 1'd0;
	dotslice_dottile3_out_stream_w_valid_fsm3_next_value_ce0 <= 1'd0;
	dotslice_dottile3_out_stream_e_valid_fsm3_next_value1 <= 1'd0;
	dotslice_dottile3_out_stream_e_valid_fsm3_next_value_ce1 <= 1'd0;
	fsm3_next_state <= fsm3_state;
	case (fsm3_state)
		1'd1: begin
			if (dotslice_dottile3_in_stream_w_valid) begin
				fsm3_next_state <= 1'd0;
			end
			dotslice_dottile3_out_stream_e_valid_fsm3_next_value1 <= dotslice_dottile3_in_stream_e_valid;
			dotslice_dottile3_out_stream_e_valid_fsm3_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile3_out_stream_w_valid_fsm3_next_value0 <= dotslice_dottile3_in_stream_w_valid;
			dotslice_dottile3_out_stream_w_valid_fsm3_next_value_ce0 <= 1'd1;
			dotslice_dottile3_out_stream_e_valid_fsm3_next_value1 <= dotslice_dottile3_in_stream_e_valid;
			dotslice_dottile3_out_stream_e_valid_fsm3_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile3_out_stream_w_valid_fsm3_next_value0 <= dotslice_dottile3_in_stream_w_valid;
			dotslice_dottile3_out_stream_w_valid_fsm3_next_value_ce0 <= 1'd1;
			dotslice_dottile3_out_stream_e_valid_fsm3_next_value1 <= 1'd1;
			dotslice_dottile3_out_stream_e_valid_fsm3_next_value_ce1 <= 1'd1;
			fsm3_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile3_out_stream_w_valid_fsm3_next_value0 <= dotslice_dottile3_in_stream_w_valid;
			dotslice_dottile3_out_stream_w_valid_fsm3_next_value_ce0 <= 1'd1;
			dotslice_dottile3_out_stream_e_valid_fsm3_next_value1 <= dotslice_dottile3_in_stream_e_valid;
			dotslice_dottile3_out_stream_e_valid_fsm3_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_48 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile4_dotunit16_in_stream_w = dotslice_dottile4_in_stream_w[7:0];
assign dotslice_dottile4_dotunit16_in_stream_w_valid = dotslice_dottile4_in_stream_w_valid;
assign dotslice_dottile4_dotunit16_in_stream_e = dotslice_dottile4_in_stream_e[7:0];
assign dotslice_dottile4_dotunit16_in_stream_e_valid = dotslice_dottile4_in_stream_e_valid;
assign dotslice_dottile4_dotunit16_in_weight = dotslice_dottile4_in_weight;
assign dotslice_dottile40 = dotslice_dottile4_dotunit16_out_weight;
assign dotslice_dottile4_dotunit17_in_stream_w = dotslice_dottile4_in_stream_w[15:8];
assign dotslice_dottile4_dotunit17_in_stream_w_valid = dotslice_dottile4_in_stream_w_valid;
assign dotslice_dottile4_dotunit17_in_stream_e = dotslice_dottile4_in_stream_e[15:8];
assign dotslice_dottile4_dotunit17_in_stream_e_valid = dotslice_dottile4_in_stream_e_valid;
assign dotslice_dottile4_dotunit17_in_weight = dotslice_dottile40;
assign dotslice_dottile41 = dotslice_dottile4_dotunit17_out_weight;
assign dotslice_dottile4_dotunit18_in_stream_w = dotslice_dottile4_in_stream_w[23:16];
assign dotslice_dottile4_dotunit18_in_stream_w_valid = dotslice_dottile4_in_stream_w_valid;
assign dotslice_dottile4_dotunit18_in_stream_e = dotslice_dottile4_in_stream_e[23:16];
assign dotslice_dottile4_dotunit18_in_stream_e_valid = dotslice_dottile4_in_stream_e_valid;
assign dotslice_dottile4_dotunit18_in_weight = dotslice_dottile41;
assign dotslice_dottile42 = dotslice_dottile4_dotunit18_out_weight;
assign dotslice_dottile4_dotunit19_in_stream_w = dotslice_dottile4_in_stream_w[31:24];
assign dotslice_dottile4_dotunit19_in_stream_w_valid = dotslice_dottile4_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_49;
// synthesis translate_on
always @(*) begin
	dotslice_dottile4_out_stream_e <= 32'd0;
	dotslice_dottile4_out_stream_e[7:0] <= dotslice_dottile4_dotunit16_out_stream_e;
	dotslice_dottile4_out_stream_e[15:8] <= dotslice_dottile4_dotunit17_out_stream_e;
	dotslice_dottile4_out_stream_e[23:16] <= dotslice_dottile4_dotunit18_out_stream_e;
	dotslice_dottile4_out_stream_e[31:24] <= dotslice_dottile4_dotunit19_out_stream_e;
// synthesis translate_off
	dummy_d_49 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_50;
// synthesis translate_on
always @(*) begin
	dotslice_dottile4_out_stream_w <= 32'd0;
	dotslice_dottile4_out_stream_w[7:0] <= dotslice_dottile4_dotunit16_out_stream_w;
	dotslice_dottile4_out_stream_w[15:8] <= dotslice_dottile4_dotunit17_out_stream_w;
	dotslice_dottile4_out_stream_w[23:16] <= dotslice_dottile4_dotunit18_out_stream_w;
	dotslice_dottile4_out_stream_w[31:24] <= dotslice_dottile4_dotunit19_out_stream_w;
// synthesis translate_off
	dummy_d_50 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile4_dotunit19_in_stream_e = dotslice_dottile4_in_stream_e[31:24];
assign dotslice_dottile4_dotunit19_in_stream_e_valid = dotslice_dottile4_in_stream_e_valid;
assign dotslice_dottile4_dotunit19_in_weight = dotslice_dottile42;
assign dotslice_dottile43 = dotslice_dottile4_dotunit19_out_weight;

// synthesis translate_off
reg dummy_d_51;
// synthesis translate_on
always @(*) begin
	dotslice_dottile4_dotunit16_out_stream_e <= 8'd0;
	dotslice_dottile4_dotunit16_out_stream_w <= 8'd0;
	dotunit16_next_state <= 2'd0;
	dotslice_dottile4_dotunit16_weight_dotunit16_next_value0 <= 8'd0;
	dotslice_dottile4_dotunit16_weight_dotunit16_next_value_ce0 <= 1'd0;
	dotslice_dottile4_dotunit16_sum_dotunit16_next_value1 <= 16'd0;
	dotslice_dottile4_dotunit16_sum_dotunit16_next_value_ce1 <= 1'd0;
	dotunit16_next_state <= dotunit16_state;
	case (dotunit16_state)
		1'd1: begin
			if (dotslice_dottile4_dotunit16_in_stream_w_valid) begin
				dotslice_dottile4_dotunit16_weight_dotunit16_next_value0 <= dotslice_dottile4_dotunit16_in_stream_w;
				dotslice_dottile4_dotunit16_weight_dotunit16_next_value_ce0 <= 1'd1;
				dotunit16_next_state <= 1'd0;
			end
			if (dotslice_dottile4_dotunit16_in_stream_e_valid) begin
				dotslice_dottile4_dotunit16_out_stream_e <= dotslice_dottile4_dotunit16_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile4_dotunit16_in_stream_w_valid) begin
				dotslice_dottile4_dotunit16_sum_dotunit16_next_value1 <= (dotslice_dottile4_dotunit16_sum + (dotslice_dottile4_dotunit16_in_stream_w * dotslice_dottile4_dotunit16_in_weight));
				dotslice_dottile4_dotunit16_sum_dotunit16_next_value_ce1 <= 1'd1;
				dotslice_dottile4_dotunit16_out_stream_w <= dotslice_dottile4_dotunit16_in_stream_w;
			end
			if (dotslice_dottile4_dotunit16_in_stream_e_valid) begin
				dotslice_dottile4_dotunit16_out_stream_e <= dotslice_dottile4_dotunit16_in_stream_e;
			end
			dotunit16_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile4_dotunit16_out_stream_e <= dotslice_dottile4_dotunit16_sum;
			if (dotslice_dottile4_dotunit16_in_stream_w_valid) begin
				dotslice_dottile4_dotunit16_out_stream_w <= dotslice_dottile4_dotunit16_in_stream_w;
			end
			dotunit16_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile4_dotunit16_in_stream_w_valid) begin
				dotslice_dottile4_dotunit16_out_stream_w <= dotslice_dottile4_dotunit16_in_stream_w;
			end
			if (dotslice_dottile4_dotunit16_in_stream_e_valid) begin
				dotslice_dottile4_dotunit16_out_stream_e <= dotslice_dottile4_dotunit16_in_stream_e;
			end
			dotunit16_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_51 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_52;
// synthesis translate_on
always @(*) begin
	dotslice_dottile4_dotunit17_out_stream_e <= 8'd0;
	dotslice_dottile4_dotunit17_out_stream_w <= 8'd0;
	dotunit17_next_state <= 2'd0;
	dotslice_dottile4_dotunit17_weight_dotunit17_next_value0 <= 8'd0;
	dotslice_dottile4_dotunit17_weight_dotunit17_next_value_ce0 <= 1'd0;
	dotslice_dottile4_dotunit17_sum_dotunit17_next_value1 <= 16'd0;
	dotslice_dottile4_dotunit17_sum_dotunit17_next_value_ce1 <= 1'd0;
	dotunit17_next_state <= dotunit17_state;
	case (dotunit17_state)
		1'd1: begin
			if (dotslice_dottile4_dotunit17_in_stream_w_valid) begin
				dotslice_dottile4_dotunit17_weight_dotunit17_next_value0 <= dotslice_dottile4_dotunit17_in_stream_w;
				dotslice_dottile4_dotunit17_weight_dotunit17_next_value_ce0 <= 1'd1;
				dotunit17_next_state <= 1'd0;
			end
			if (dotslice_dottile4_dotunit17_in_stream_e_valid) begin
				dotslice_dottile4_dotunit17_out_stream_e <= dotslice_dottile4_dotunit17_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile4_dotunit17_in_stream_w_valid) begin
				dotslice_dottile4_dotunit17_sum_dotunit17_next_value1 <= (dotslice_dottile4_dotunit17_sum + (dotslice_dottile4_dotunit17_in_stream_w * dotslice_dottile4_dotunit17_in_weight));
				dotslice_dottile4_dotunit17_sum_dotunit17_next_value_ce1 <= 1'd1;
				dotslice_dottile4_dotunit17_out_stream_w <= dotslice_dottile4_dotunit17_in_stream_w;
			end
			if (dotslice_dottile4_dotunit17_in_stream_e_valid) begin
				dotslice_dottile4_dotunit17_out_stream_e <= dotslice_dottile4_dotunit17_in_stream_e;
			end
			dotunit17_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile4_dotunit17_out_stream_e <= dotslice_dottile4_dotunit17_sum;
			if (dotslice_dottile4_dotunit17_in_stream_w_valid) begin
				dotslice_dottile4_dotunit17_out_stream_w <= dotslice_dottile4_dotunit17_in_stream_w;
			end
			dotunit17_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile4_dotunit17_in_stream_w_valid) begin
				dotslice_dottile4_dotunit17_out_stream_w <= dotslice_dottile4_dotunit17_in_stream_w;
			end
			if (dotslice_dottile4_dotunit17_in_stream_e_valid) begin
				dotslice_dottile4_dotunit17_out_stream_e <= dotslice_dottile4_dotunit17_in_stream_e;
			end
			dotunit17_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_52 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_53;
// synthesis translate_on
always @(*) begin
	dotslice_dottile4_dotunit18_out_stream_e <= 8'd0;
	dotslice_dottile4_dotunit18_out_stream_w <= 8'd0;
	dotunit18_next_state <= 2'd0;
	dotslice_dottile4_dotunit18_weight_dotunit18_next_value0 <= 8'd0;
	dotslice_dottile4_dotunit18_weight_dotunit18_next_value_ce0 <= 1'd0;
	dotslice_dottile4_dotunit18_sum_dotunit18_next_value1 <= 16'd0;
	dotslice_dottile4_dotunit18_sum_dotunit18_next_value_ce1 <= 1'd0;
	dotunit18_next_state <= dotunit18_state;
	case (dotunit18_state)
		1'd1: begin
			if (dotslice_dottile4_dotunit18_in_stream_w_valid) begin
				dotslice_dottile4_dotunit18_weight_dotunit18_next_value0 <= dotslice_dottile4_dotunit18_in_stream_w;
				dotslice_dottile4_dotunit18_weight_dotunit18_next_value_ce0 <= 1'd1;
				dotunit18_next_state <= 1'd0;
			end
			if (dotslice_dottile4_dotunit18_in_stream_e_valid) begin
				dotslice_dottile4_dotunit18_out_stream_e <= dotslice_dottile4_dotunit18_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile4_dotunit18_in_stream_w_valid) begin
				dotslice_dottile4_dotunit18_sum_dotunit18_next_value1 <= (dotslice_dottile4_dotunit18_sum + (dotslice_dottile4_dotunit18_in_stream_w * dotslice_dottile4_dotunit18_in_weight));
				dotslice_dottile4_dotunit18_sum_dotunit18_next_value_ce1 <= 1'd1;
				dotslice_dottile4_dotunit18_out_stream_w <= dotslice_dottile4_dotunit18_in_stream_w;
			end
			if (dotslice_dottile4_dotunit18_in_stream_e_valid) begin
				dotslice_dottile4_dotunit18_out_stream_e <= dotslice_dottile4_dotunit18_in_stream_e;
			end
			dotunit18_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile4_dotunit18_out_stream_e <= dotslice_dottile4_dotunit18_sum;
			if (dotslice_dottile4_dotunit18_in_stream_w_valid) begin
				dotslice_dottile4_dotunit18_out_stream_w <= dotslice_dottile4_dotunit18_in_stream_w;
			end
			dotunit18_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile4_dotunit18_in_stream_w_valid) begin
				dotslice_dottile4_dotunit18_out_stream_w <= dotslice_dottile4_dotunit18_in_stream_w;
			end
			if (dotslice_dottile4_dotunit18_in_stream_e_valid) begin
				dotslice_dottile4_dotunit18_out_stream_e <= dotslice_dottile4_dotunit18_in_stream_e;
			end
			dotunit18_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_53 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_54;
// synthesis translate_on
always @(*) begin
	dotslice_dottile4_dotunit19_out_stream_e <= 8'd0;
	dotslice_dottile4_dotunit19_out_stream_w <= 8'd0;
	dotunit19_next_state <= 2'd0;
	dotslice_dottile4_dotunit19_weight_dotunit19_next_value0 <= 8'd0;
	dotslice_dottile4_dotunit19_weight_dotunit19_next_value_ce0 <= 1'd0;
	dotslice_dottile4_dotunit19_sum_dotunit19_next_value1 <= 16'd0;
	dotslice_dottile4_dotunit19_sum_dotunit19_next_value_ce1 <= 1'd0;
	dotunit19_next_state <= dotunit19_state;
	case (dotunit19_state)
		1'd1: begin
			if (dotslice_dottile4_dotunit19_in_stream_w_valid) begin
				dotslice_dottile4_dotunit19_weight_dotunit19_next_value0 <= dotslice_dottile4_dotunit19_in_stream_w;
				dotslice_dottile4_dotunit19_weight_dotunit19_next_value_ce0 <= 1'd1;
				dotunit19_next_state <= 1'd0;
			end
			if (dotslice_dottile4_dotunit19_in_stream_e_valid) begin
				dotslice_dottile4_dotunit19_out_stream_e <= dotslice_dottile4_dotunit19_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile4_dotunit19_in_stream_w_valid) begin
				dotslice_dottile4_dotunit19_sum_dotunit19_next_value1 <= (dotslice_dottile4_dotunit19_sum + (dotslice_dottile4_dotunit19_in_stream_w * dotslice_dottile4_dotunit19_in_weight));
				dotslice_dottile4_dotunit19_sum_dotunit19_next_value_ce1 <= 1'd1;
				dotslice_dottile4_dotunit19_out_stream_w <= dotslice_dottile4_dotunit19_in_stream_w;
			end
			if (dotslice_dottile4_dotunit19_in_stream_e_valid) begin
				dotslice_dottile4_dotunit19_out_stream_e <= dotslice_dottile4_dotunit19_in_stream_e;
			end
			dotunit19_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile4_dotunit19_out_stream_e <= dotslice_dottile4_dotunit19_sum;
			if (dotslice_dottile4_dotunit19_in_stream_w_valid) begin
				dotslice_dottile4_dotunit19_out_stream_w <= dotslice_dottile4_dotunit19_in_stream_w;
			end
			dotunit19_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile4_dotunit19_in_stream_w_valid) begin
				dotslice_dottile4_dotunit19_out_stream_w <= dotslice_dottile4_dotunit19_in_stream_w;
			end
			if (dotslice_dottile4_dotunit19_in_stream_e_valid) begin
				dotslice_dottile4_dotunit19_out_stream_e <= dotslice_dottile4_dotunit19_in_stream_e;
			end
			dotunit19_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_54 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_55;
// synthesis translate_on
always @(*) begin
	fsm4_next_state <= 2'd0;
	dotslice_dottile4_out_stream_w_valid_fsm4_next_value0 <= 1'd0;
	dotslice_dottile4_out_stream_w_valid_fsm4_next_value_ce0 <= 1'd0;
	dotslice_dottile4_out_stream_e_valid_fsm4_next_value1 <= 1'd0;
	dotslice_dottile4_out_stream_e_valid_fsm4_next_value_ce1 <= 1'd0;
	fsm4_next_state <= fsm4_state;
	case (fsm4_state)
		1'd1: begin
			if (dotslice_dottile4_in_stream_w_valid) begin
				fsm4_next_state <= 1'd0;
			end
			dotslice_dottile4_out_stream_e_valid_fsm4_next_value1 <= dotslice_dottile4_in_stream_e_valid;
			dotslice_dottile4_out_stream_e_valid_fsm4_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile4_out_stream_w_valid_fsm4_next_value0 <= dotslice_dottile4_in_stream_w_valid;
			dotslice_dottile4_out_stream_w_valid_fsm4_next_value_ce0 <= 1'd1;
			dotslice_dottile4_out_stream_e_valid_fsm4_next_value1 <= dotslice_dottile4_in_stream_e_valid;
			dotslice_dottile4_out_stream_e_valid_fsm4_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile4_out_stream_w_valid_fsm4_next_value0 <= dotslice_dottile4_in_stream_w_valid;
			dotslice_dottile4_out_stream_w_valid_fsm4_next_value_ce0 <= 1'd1;
			dotslice_dottile4_out_stream_e_valid_fsm4_next_value1 <= 1'd1;
			dotslice_dottile4_out_stream_e_valid_fsm4_next_value_ce1 <= 1'd1;
			fsm4_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile4_out_stream_w_valid_fsm4_next_value0 <= dotslice_dottile4_in_stream_w_valid;
			dotslice_dottile4_out_stream_w_valid_fsm4_next_value_ce0 <= 1'd1;
			dotslice_dottile4_out_stream_e_valid_fsm4_next_value1 <= dotslice_dottile4_in_stream_e_valid;
			dotslice_dottile4_out_stream_e_valid_fsm4_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_55 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile5_dotunit20_in_stream_w = dotslice_dottile5_in_stream_w[7:0];
assign dotslice_dottile5_dotunit20_in_stream_w_valid = dotslice_dottile5_in_stream_w_valid;
assign dotslice_dottile5_dotunit20_in_stream_e = dotslice_dottile5_in_stream_e[7:0];
assign dotslice_dottile5_dotunit20_in_stream_e_valid = dotslice_dottile5_in_stream_e_valid;
assign dotslice_dottile5_dotunit20_in_weight = dotslice_dottile5_in_weight;
assign dotslice_dottile50 = dotslice_dottile5_dotunit20_out_weight;
assign dotslice_dottile5_dotunit21_in_stream_w = dotslice_dottile5_in_stream_w[15:8];
assign dotslice_dottile5_dotunit21_in_stream_w_valid = dotslice_dottile5_in_stream_w_valid;
assign dotslice_dottile5_dotunit21_in_stream_e = dotslice_dottile5_in_stream_e[15:8];
assign dotslice_dottile5_dotunit21_in_stream_e_valid = dotslice_dottile5_in_stream_e_valid;
assign dotslice_dottile5_dotunit21_in_weight = dotslice_dottile50;
assign dotslice_dottile51 = dotslice_dottile5_dotunit21_out_weight;
assign dotslice_dottile5_dotunit22_in_stream_w = dotslice_dottile5_in_stream_w[23:16];
assign dotslice_dottile5_dotunit22_in_stream_w_valid = dotslice_dottile5_in_stream_w_valid;
assign dotslice_dottile5_dotunit22_in_stream_e = dotslice_dottile5_in_stream_e[23:16];
assign dotslice_dottile5_dotunit22_in_stream_e_valid = dotslice_dottile5_in_stream_e_valid;
assign dotslice_dottile5_dotunit22_in_weight = dotslice_dottile51;
assign dotslice_dottile52 = dotslice_dottile5_dotunit22_out_weight;
assign dotslice_dottile5_dotunit23_in_stream_w = dotslice_dottile5_in_stream_w[31:24];
assign dotslice_dottile5_dotunit23_in_stream_w_valid = dotslice_dottile5_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_56;
// synthesis translate_on
always @(*) begin
	dotslice_dottile5_out_stream_e <= 32'd0;
	dotslice_dottile5_out_stream_e[7:0] <= dotslice_dottile5_dotunit20_out_stream_e;
	dotslice_dottile5_out_stream_e[15:8] <= dotslice_dottile5_dotunit21_out_stream_e;
	dotslice_dottile5_out_stream_e[23:16] <= dotslice_dottile5_dotunit22_out_stream_e;
	dotslice_dottile5_out_stream_e[31:24] <= dotslice_dottile5_dotunit23_out_stream_e;
// synthesis translate_off
	dummy_d_56 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_57;
// synthesis translate_on
always @(*) begin
	dotslice_dottile5_out_stream_w <= 32'd0;
	dotslice_dottile5_out_stream_w[7:0] <= dotslice_dottile5_dotunit20_out_stream_w;
	dotslice_dottile5_out_stream_w[15:8] <= dotslice_dottile5_dotunit21_out_stream_w;
	dotslice_dottile5_out_stream_w[23:16] <= dotslice_dottile5_dotunit22_out_stream_w;
	dotslice_dottile5_out_stream_w[31:24] <= dotslice_dottile5_dotunit23_out_stream_w;
// synthesis translate_off
	dummy_d_57 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile5_dotunit23_in_stream_e = dotslice_dottile5_in_stream_e[31:24];
assign dotslice_dottile5_dotunit23_in_stream_e_valid = dotslice_dottile5_in_stream_e_valid;
assign dotslice_dottile5_dotunit23_in_weight = dotslice_dottile52;
assign dotslice_dottile53 = dotslice_dottile5_dotunit23_out_weight;

// synthesis translate_off
reg dummy_d_58;
// synthesis translate_on
always @(*) begin
	dotslice_dottile5_dotunit20_out_stream_e <= 8'd0;
	dotslice_dottile5_dotunit20_out_stream_w <= 8'd0;
	dotunit20_next_state <= 2'd0;
	dotslice_dottile5_dotunit20_weight_dotunit20_next_value0 <= 8'd0;
	dotslice_dottile5_dotunit20_weight_dotunit20_next_value_ce0 <= 1'd0;
	dotslice_dottile5_dotunit20_sum_dotunit20_next_value1 <= 16'd0;
	dotslice_dottile5_dotunit20_sum_dotunit20_next_value_ce1 <= 1'd0;
	dotunit20_next_state <= dotunit20_state;
	case (dotunit20_state)
		1'd1: begin
			if (dotslice_dottile5_dotunit20_in_stream_w_valid) begin
				dotslice_dottile5_dotunit20_weight_dotunit20_next_value0 <= dotslice_dottile5_dotunit20_in_stream_w;
				dotslice_dottile5_dotunit20_weight_dotunit20_next_value_ce0 <= 1'd1;
				dotunit20_next_state <= 1'd0;
			end
			if (dotslice_dottile5_dotunit20_in_stream_e_valid) begin
				dotslice_dottile5_dotunit20_out_stream_e <= dotslice_dottile5_dotunit20_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile5_dotunit20_in_stream_w_valid) begin
				dotslice_dottile5_dotunit20_sum_dotunit20_next_value1 <= (dotslice_dottile5_dotunit20_sum + (dotslice_dottile5_dotunit20_in_stream_w * dotslice_dottile5_dotunit20_in_weight));
				dotslice_dottile5_dotunit20_sum_dotunit20_next_value_ce1 <= 1'd1;
				dotslice_dottile5_dotunit20_out_stream_w <= dotslice_dottile5_dotunit20_in_stream_w;
			end
			if (dotslice_dottile5_dotunit20_in_stream_e_valid) begin
				dotslice_dottile5_dotunit20_out_stream_e <= dotslice_dottile5_dotunit20_in_stream_e;
			end
			dotunit20_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile5_dotunit20_out_stream_e <= dotslice_dottile5_dotunit20_sum;
			if (dotslice_dottile5_dotunit20_in_stream_w_valid) begin
				dotslice_dottile5_dotunit20_out_stream_w <= dotslice_dottile5_dotunit20_in_stream_w;
			end
			dotunit20_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile5_dotunit20_in_stream_w_valid) begin
				dotslice_dottile5_dotunit20_out_stream_w <= dotslice_dottile5_dotunit20_in_stream_w;
			end
			if (dotslice_dottile5_dotunit20_in_stream_e_valid) begin
				dotslice_dottile5_dotunit20_out_stream_e <= dotslice_dottile5_dotunit20_in_stream_e;
			end
			dotunit20_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_58 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_59;
// synthesis translate_on
always @(*) begin
	dotslice_dottile5_dotunit21_out_stream_e <= 8'd0;
	dotslice_dottile5_dotunit21_out_stream_w <= 8'd0;
	dotunit21_next_state <= 2'd0;
	dotslice_dottile5_dotunit21_weight_dotunit21_next_value0 <= 8'd0;
	dotslice_dottile5_dotunit21_weight_dotunit21_next_value_ce0 <= 1'd0;
	dotslice_dottile5_dotunit21_sum_dotunit21_next_value1 <= 16'd0;
	dotslice_dottile5_dotunit21_sum_dotunit21_next_value_ce1 <= 1'd0;
	dotunit21_next_state <= dotunit21_state;
	case (dotunit21_state)
		1'd1: begin
			if (dotslice_dottile5_dotunit21_in_stream_w_valid) begin
				dotslice_dottile5_dotunit21_weight_dotunit21_next_value0 <= dotslice_dottile5_dotunit21_in_stream_w;
				dotslice_dottile5_dotunit21_weight_dotunit21_next_value_ce0 <= 1'd1;
				dotunit21_next_state <= 1'd0;
			end
			if (dotslice_dottile5_dotunit21_in_stream_e_valid) begin
				dotslice_dottile5_dotunit21_out_stream_e <= dotslice_dottile5_dotunit21_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile5_dotunit21_in_stream_w_valid) begin
				dotslice_dottile5_dotunit21_sum_dotunit21_next_value1 <= (dotslice_dottile5_dotunit21_sum + (dotslice_dottile5_dotunit21_in_stream_w * dotslice_dottile5_dotunit21_in_weight));
				dotslice_dottile5_dotunit21_sum_dotunit21_next_value_ce1 <= 1'd1;
				dotslice_dottile5_dotunit21_out_stream_w <= dotslice_dottile5_dotunit21_in_stream_w;
			end
			if (dotslice_dottile5_dotunit21_in_stream_e_valid) begin
				dotslice_dottile5_dotunit21_out_stream_e <= dotslice_dottile5_dotunit21_in_stream_e;
			end
			dotunit21_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile5_dotunit21_out_stream_e <= dotslice_dottile5_dotunit21_sum;
			if (dotslice_dottile5_dotunit21_in_stream_w_valid) begin
				dotslice_dottile5_dotunit21_out_stream_w <= dotslice_dottile5_dotunit21_in_stream_w;
			end
			dotunit21_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile5_dotunit21_in_stream_w_valid) begin
				dotslice_dottile5_dotunit21_out_stream_w <= dotslice_dottile5_dotunit21_in_stream_w;
			end
			if (dotslice_dottile5_dotunit21_in_stream_e_valid) begin
				dotslice_dottile5_dotunit21_out_stream_e <= dotslice_dottile5_dotunit21_in_stream_e;
			end
			dotunit21_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_59 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_60;
// synthesis translate_on
always @(*) begin
	dotslice_dottile5_dotunit22_out_stream_e <= 8'd0;
	dotslice_dottile5_dotunit22_out_stream_w <= 8'd0;
	dotunit22_next_state <= 2'd0;
	dotslice_dottile5_dotunit22_weight_dotunit22_next_value0 <= 8'd0;
	dotslice_dottile5_dotunit22_weight_dotunit22_next_value_ce0 <= 1'd0;
	dotslice_dottile5_dotunit22_sum_dotunit22_next_value1 <= 16'd0;
	dotslice_dottile5_dotunit22_sum_dotunit22_next_value_ce1 <= 1'd0;
	dotunit22_next_state <= dotunit22_state;
	case (dotunit22_state)
		1'd1: begin
			if (dotslice_dottile5_dotunit22_in_stream_w_valid) begin
				dotslice_dottile5_dotunit22_weight_dotunit22_next_value0 <= dotslice_dottile5_dotunit22_in_stream_w;
				dotslice_dottile5_dotunit22_weight_dotunit22_next_value_ce0 <= 1'd1;
				dotunit22_next_state <= 1'd0;
			end
			if (dotslice_dottile5_dotunit22_in_stream_e_valid) begin
				dotslice_dottile5_dotunit22_out_stream_e <= dotslice_dottile5_dotunit22_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile5_dotunit22_in_stream_w_valid) begin
				dotslice_dottile5_dotunit22_sum_dotunit22_next_value1 <= (dotslice_dottile5_dotunit22_sum + (dotslice_dottile5_dotunit22_in_stream_w * dotslice_dottile5_dotunit22_in_weight));
				dotslice_dottile5_dotunit22_sum_dotunit22_next_value_ce1 <= 1'd1;
				dotslice_dottile5_dotunit22_out_stream_w <= dotslice_dottile5_dotunit22_in_stream_w;
			end
			if (dotslice_dottile5_dotunit22_in_stream_e_valid) begin
				dotslice_dottile5_dotunit22_out_stream_e <= dotslice_dottile5_dotunit22_in_stream_e;
			end
			dotunit22_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile5_dotunit22_out_stream_e <= dotslice_dottile5_dotunit22_sum;
			if (dotslice_dottile5_dotunit22_in_stream_w_valid) begin
				dotslice_dottile5_dotunit22_out_stream_w <= dotslice_dottile5_dotunit22_in_stream_w;
			end
			dotunit22_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile5_dotunit22_in_stream_w_valid) begin
				dotslice_dottile5_dotunit22_out_stream_w <= dotslice_dottile5_dotunit22_in_stream_w;
			end
			if (dotslice_dottile5_dotunit22_in_stream_e_valid) begin
				dotslice_dottile5_dotunit22_out_stream_e <= dotslice_dottile5_dotunit22_in_stream_e;
			end
			dotunit22_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_60 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_61;
// synthesis translate_on
always @(*) begin
	dotslice_dottile5_dotunit23_out_stream_e <= 8'd0;
	dotslice_dottile5_dotunit23_out_stream_w <= 8'd0;
	dotunit23_next_state <= 2'd0;
	dotslice_dottile5_dotunit23_weight_dotunit23_next_value0 <= 8'd0;
	dotslice_dottile5_dotunit23_weight_dotunit23_next_value_ce0 <= 1'd0;
	dotslice_dottile5_dotunit23_sum_dotunit23_next_value1 <= 16'd0;
	dotslice_dottile5_dotunit23_sum_dotunit23_next_value_ce1 <= 1'd0;
	dotunit23_next_state <= dotunit23_state;
	case (dotunit23_state)
		1'd1: begin
			if (dotslice_dottile5_dotunit23_in_stream_w_valid) begin
				dotslice_dottile5_dotunit23_weight_dotunit23_next_value0 <= dotslice_dottile5_dotunit23_in_stream_w;
				dotslice_dottile5_dotunit23_weight_dotunit23_next_value_ce0 <= 1'd1;
				dotunit23_next_state <= 1'd0;
			end
			if (dotslice_dottile5_dotunit23_in_stream_e_valid) begin
				dotslice_dottile5_dotunit23_out_stream_e <= dotslice_dottile5_dotunit23_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile5_dotunit23_in_stream_w_valid) begin
				dotslice_dottile5_dotunit23_sum_dotunit23_next_value1 <= (dotslice_dottile5_dotunit23_sum + (dotslice_dottile5_dotunit23_in_stream_w * dotslice_dottile5_dotunit23_in_weight));
				dotslice_dottile5_dotunit23_sum_dotunit23_next_value_ce1 <= 1'd1;
				dotslice_dottile5_dotunit23_out_stream_w <= dotslice_dottile5_dotunit23_in_stream_w;
			end
			if (dotslice_dottile5_dotunit23_in_stream_e_valid) begin
				dotslice_dottile5_dotunit23_out_stream_e <= dotslice_dottile5_dotunit23_in_stream_e;
			end
			dotunit23_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile5_dotunit23_out_stream_e <= dotslice_dottile5_dotunit23_sum;
			if (dotslice_dottile5_dotunit23_in_stream_w_valid) begin
				dotslice_dottile5_dotunit23_out_stream_w <= dotslice_dottile5_dotunit23_in_stream_w;
			end
			dotunit23_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile5_dotunit23_in_stream_w_valid) begin
				dotslice_dottile5_dotunit23_out_stream_w <= dotslice_dottile5_dotunit23_in_stream_w;
			end
			if (dotslice_dottile5_dotunit23_in_stream_e_valid) begin
				dotslice_dottile5_dotunit23_out_stream_e <= dotslice_dottile5_dotunit23_in_stream_e;
			end
			dotunit23_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_61 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_62;
// synthesis translate_on
always @(*) begin
	fsm5_next_state <= 2'd0;
	dotslice_dottile5_out_stream_w_valid_fsm5_next_value0 <= 1'd0;
	dotslice_dottile5_out_stream_w_valid_fsm5_next_value_ce0 <= 1'd0;
	dotslice_dottile5_out_stream_e_valid_fsm5_next_value1 <= 1'd0;
	dotslice_dottile5_out_stream_e_valid_fsm5_next_value_ce1 <= 1'd0;
	fsm5_next_state <= fsm5_state;
	case (fsm5_state)
		1'd1: begin
			if (dotslice_dottile5_in_stream_w_valid) begin
				fsm5_next_state <= 1'd0;
			end
			dotslice_dottile5_out_stream_e_valid_fsm5_next_value1 <= dotslice_dottile5_in_stream_e_valid;
			dotslice_dottile5_out_stream_e_valid_fsm5_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile5_out_stream_w_valid_fsm5_next_value0 <= dotslice_dottile5_in_stream_w_valid;
			dotslice_dottile5_out_stream_w_valid_fsm5_next_value_ce0 <= 1'd1;
			dotslice_dottile5_out_stream_e_valid_fsm5_next_value1 <= dotslice_dottile5_in_stream_e_valid;
			dotslice_dottile5_out_stream_e_valid_fsm5_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile5_out_stream_w_valid_fsm5_next_value0 <= dotslice_dottile5_in_stream_w_valid;
			dotslice_dottile5_out_stream_w_valid_fsm5_next_value_ce0 <= 1'd1;
			dotslice_dottile5_out_stream_e_valid_fsm5_next_value1 <= 1'd1;
			dotslice_dottile5_out_stream_e_valid_fsm5_next_value_ce1 <= 1'd1;
			fsm5_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile5_out_stream_w_valid_fsm5_next_value0 <= dotslice_dottile5_in_stream_w_valid;
			dotslice_dottile5_out_stream_w_valid_fsm5_next_value_ce0 <= 1'd1;
			dotslice_dottile5_out_stream_e_valid_fsm5_next_value1 <= dotslice_dottile5_in_stream_e_valid;
			dotslice_dottile5_out_stream_e_valid_fsm5_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_62 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile6_dotunit24_in_stream_w = dotslice_dottile6_in_stream_w[7:0];
assign dotslice_dottile6_dotunit24_in_stream_w_valid = dotslice_dottile6_in_stream_w_valid;
assign dotslice_dottile6_dotunit24_in_stream_e = dotslice_dottile6_in_stream_e[7:0];
assign dotslice_dottile6_dotunit24_in_stream_e_valid = dotslice_dottile6_in_stream_e_valid;
assign dotslice_dottile6_dotunit24_in_weight = dotslice_dottile6_in_weight;
assign dotslice_dottile60 = dotslice_dottile6_dotunit24_out_weight;
assign dotslice_dottile6_dotunit25_in_stream_w = dotslice_dottile6_in_stream_w[15:8];
assign dotslice_dottile6_dotunit25_in_stream_w_valid = dotslice_dottile6_in_stream_w_valid;
assign dotslice_dottile6_dotunit25_in_stream_e = dotslice_dottile6_in_stream_e[15:8];
assign dotslice_dottile6_dotunit25_in_stream_e_valid = dotslice_dottile6_in_stream_e_valid;
assign dotslice_dottile6_dotunit25_in_weight = dotslice_dottile60;
assign dotslice_dottile61 = dotslice_dottile6_dotunit25_out_weight;
assign dotslice_dottile6_dotunit26_in_stream_w = dotslice_dottile6_in_stream_w[23:16];
assign dotslice_dottile6_dotunit26_in_stream_w_valid = dotslice_dottile6_in_stream_w_valid;
assign dotslice_dottile6_dotunit26_in_stream_e = dotslice_dottile6_in_stream_e[23:16];
assign dotslice_dottile6_dotunit26_in_stream_e_valid = dotslice_dottile6_in_stream_e_valid;
assign dotslice_dottile6_dotunit26_in_weight = dotslice_dottile61;
assign dotslice_dottile62 = dotslice_dottile6_dotunit26_out_weight;
assign dotslice_dottile6_dotunit27_in_stream_w = dotslice_dottile6_in_stream_w[31:24];
assign dotslice_dottile6_dotunit27_in_stream_w_valid = dotslice_dottile6_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_63;
// synthesis translate_on
always @(*) begin
	dotslice_dottile6_out_stream_e <= 32'd0;
	dotslice_dottile6_out_stream_e[7:0] <= dotslice_dottile6_dotunit24_out_stream_e;
	dotslice_dottile6_out_stream_e[15:8] <= dotslice_dottile6_dotunit25_out_stream_e;
	dotslice_dottile6_out_stream_e[23:16] <= dotslice_dottile6_dotunit26_out_stream_e;
	dotslice_dottile6_out_stream_e[31:24] <= dotslice_dottile6_dotunit27_out_stream_e;
// synthesis translate_off
	dummy_d_63 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_64;
// synthesis translate_on
always @(*) begin
	dotslice_dottile6_out_stream_w <= 32'd0;
	dotslice_dottile6_out_stream_w[7:0] <= dotslice_dottile6_dotunit24_out_stream_w;
	dotslice_dottile6_out_stream_w[15:8] <= dotslice_dottile6_dotunit25_out_stream_w;
	dotslice_dottile6_out_stream_w[23:16] <= dotslice_dottile6_dotunit26_out_stream_w;
	dotslice_dottile6_out_stream_w[31:24] <= dotslice_dottile6_dotunit27_out_stream_w;
// synthesis translate_off
	dummy_d_64 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile6_dotunit27_in_stream_e = dotslice_dottile6_in_stream_e[31:24];
assign dotslice_dottile6_dotunit27_in_stream_e_valid = dotslice_dottile6_in_stream_e_valid;
assign dotslice_dottile6_dotunit27_in_weight = dotslice_dottile62;
assign dotslice_dottile63 = dotslice_dottile6_dotunit27_out_weight;

// synthesis translate_off
reg dummy_d_65;
// synthesis translate_on
always @(*) begin
	dotslice_dottile6_dotunit24_out_stream_e <= 8'd0;
	dotslice_dottile6_dotunit24_out_stream_w <= 8'd0;
	dotunit24_next_state <= 2'd0;
	dotslice_dottile6_dotunit24_weight_dotunit24_next_value0 <= 8'd0;
	dotslice_dottile6_dotunit24_weight_dotunit24_next_value_ce0 <= 1'd0;
	dotslice_dottile6_dotunit24_sum_dotunit24_next_value1 <= 16'd0;
	dotslice_dottile6_dotunit24_sum_dotunit24_next_value_ce1 <= 1'd0;
	dotunit24_next_state <= dotunit24_state;
	case (dotunit24_state)
		1'd1: begin
			if (dotslice_dottile6_dotunit24_in_stream_w_valid) begin
				dotslice_dottile6_dotunit24_weight_dotunit24_next_value0 <= dotslice_dottile6_dotunit24_in_stream_w;
				dotslice_dottile6_dotunit24_weight_dotunit24_next_value_ce0 <= 1'd1;
				dotunit24_next_state <= 1'd0;
			end
			if (dotslice_dottile6_dotunit24_in_stream_e_valid) begin
				dotslice_dottile6_dotunit24_out_stream_e <= dotslice_dottile6_dotunit24_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile6_dotunit24_in_stream_w_valid) begin
				dotslice_dottile6_dotunit24_sum_dotunit24_next_value1 <= (dotslice_dottile6_dotunit24_sum + (dotslice_dottile6_dotunit24_in_stream_w * dotslice_dottile6_dotunit24_in_weight));
				dotslice_dottile6_dotunit24_sum_dotunit24_next_value_ce1 <= 1'd1;
				dotslice_dottile6_dotunit24_out_stream_w <= dotslice_dottile6_dotunit24_in_stream_w;
			end
			if (dotslice_dottile6_dotunit24_in_stream_e_valid) begin
				dotslice_dottile6_dotunit24_out_stream_e <= dotslice_dottile6_dotunit24_in_stream_e;
			end
			dotunit24_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile6_dotunit24_out_stream_e <= dotslice_dottile6_dotunit24_sum;
			if (dotslice_dottile6_dotunit24_in_stream_w_valid) begin
				dotslice_dottile6_dotunit24_out_stream_w <= dotslice_dottile6_dotunit24_in_stream_w;
			end
			dotunit24_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile6_dotunit24_in_stream_w_valid) begin
				dotslice_dottile6_dotunit24_out_stream_w <= dotslice_dottile6_dotunit24_in_stream_w;
			end
			if (dotslice_dottile6_dotunit24_in_stream_e_valid) begin
				dotslice_dottile6_dotunit24_out_stream_e <= dotslice_dottile6_dotunit24_in_stream_e;
			end
			dotunit24_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_65 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_66;
// synthesis translate_on
always @(*) begin
	dotslice_dottile6_dotunit25_out_stream_e <= 8'd0;
	dotslice_dottile6_dotunit25_out_stream_w <= 8'd0;
	dotunit25_next_state <= 2'd0;
	dotslice_dottile6_dotunit25_weight_dotunit25_next_value0 <= 8'd0;
	dotslice_dottile6_dotunit25_weight_dotunit25_next_value_ce0 <= 1'd0;
	dotslice_dottile6_dotunit25_sum_dotunit25_next_value1 <= 16'd0;
	dotslice_dottile6_dotunit25_sum_dotunit25_next_value_ce1 <= 1'd0;
	dotunit25_next_state <= dotunit25_state;
	case (dotunit25_state)
		1'd1: begin
			if (dotslice_dottile6_dotunit25_in_stream_w_valid) begin
				dotslice_dottile6_dotunit25_weight_dotunit25_next_value0 <= dotslice_dottile6_dotunit25_in_stream_w;
				dotslice_dottile6_dotunit25_weight_dotunit25_next_value_ce0 <= 1'd1;
				dotunit25_next_state <= 1'd0;
			end
			if (dotslice_dottile6_dotunit25_in_stream_e_valid) begin
				dotslice_dottile6_dotunit25_out_stream_e <= dotslice_dottile6_dotunit25_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile6_dotunit25_in_stream_w_valid) begin
				dotslice_dottile6_dotunit25_sum_dotunit25_next_value1 <= (dotslice_dottile6_dotunit25_sum + (dotslice_dottile6_dotunit25_in_stream_w * dotslice_dottile6_dotunit25_in_weight));
				dotslice_dottile6_dotunit25_sum_dotunit25_next_value_ce1 <= 1'd1;
				dotslice_dottile6_dotunit25_out_stream_w <= dotslice_dottile6_dotunit25_in_stream_w;
			end
			if (dotslice_dottile6_dotunit25_in_stream_e_valid) begin
				dotslice_dottile6_dotunit25_out_stream_e <= dotslice_dottile6_dotunit25_in_stream_e;
			end
			dotunit25_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile6_dotunit25_out_stream_e <= dotslice_dottile6_dotunit25_sum;
			if (dotslice_dottile6_dotunit25_in_stream_w_valid) begin
				dotslice_dottile6_dotunit25_out_stream_w <= dotslice_dottile6_dotunit25_in_stream_w;
			end
			dotunit25_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile6_dotunit25_in_stream_w_valid) begin
				dotslice_dottile6_dotunit25_out_stream_w <= dotslice_dottile6_dotunit25_in_stream_w;
			end
			if (dotslice_dottile6_dotunit25_in_stream_e_valid) begin
				dotslice_dottile6_dotunit25_out_stream_e <= dotslice_dottile6_dotunit25_in_stream_e;
			end
			dotunit25_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_66 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_67;
// synthesis translate_on
always @(*) begin
	dotslice_dottile6_dotunit26_out_stream_e <= 8'd0;
	dotslice_dottile6_dotunit26_out_stream_w <= 8'd0;
	dotunit26_next_state <= 2'd0;
	dotslice_dottile6_dotunit26_weight_dotunit26_next_value0 <= 8'd0;
	dotslice_dottile6_dotunit26_weight_dotunit26_next_value_ce0 <= 1'd0;
	dotslice_dottile6_dotunit26_sum_dotunit26_next_value1 <= 16'd0;
	dotslice_dottile6_dotunit26_sum_dotunit26_next_value_ce1 <= 1'd0;
	dotunit26_next_state <= dotunit26_state;
	case (dotunit26_state)
		1'd1: begin
			if (dotslice_dottile6_dotunit26_in_stream_w_valid) begin
				dotslice_dottile6_dotunit26_weight_dotunit26_next_value0 <= dotslice_dottile6_dotunit26_in_stream_w;
				dotslice_dottile6_dotunit26_weight_dotunit26_next_value_ce0 <= 1'd1;
				dotunit26_next_state <= 1'd0;
			end
			if (dotslice_dottile6_dotunit26_in_stream_e_valid) begin
				dotslice_dottile6_dotunit26_out_stream_e <= dotslice_dottile6_dotunit26_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile6_dotunit26_in_stream_w_valid) begin
				dotslice_dottile6_dotunit26_sum_dotunit26_next_value1 <= (dotslice_dottile6_dotunit26_sum + (dotslice_dottile6_dotunit26_in_stream_w * dotslice_dottile6_dotunit26_in_weight));
				dotslice_dottile6_dotunit26_sum_dotunit26_next_value_ce1 <= 1'd1;
				dotslice_dottile6_dotunit26_out_stream_w <= dotslice_dottile6_dotunit26_in_stream_w;
			end
			if (dotslice_dottile6_dotunit26_in_stream_e_valid) begin
				dotslice_dottile6_dotunit26_out_stream_e <= dotslice_dottile6_dotunit26_in_stream_e;
			end
			dotunit26_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile6_dotunit26_out_stream_e <= dotslice_dottile6_dotunit26_sum;
			if (dotslice_dottile6_dotunit26_in_stream_w_valid) begin
				dotslice_dottile6_dotunit26_out_stream_w <= dotslice_dottile6_dotunit26_in_stream_w;
			end
			dotunit26_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile6_dotunit26_in_stream_w_valid) begin
				dotslice_dottile6_dotunit26_out_stream_w <= dotslice_dottile6_dotunit26_in_stream_w;
			end
			if (dotslice_dottile6_dotunit26_in_stream_e_valid) begin
				dotslice_dottile6_dotunit26_out_stream_e <= dotslice_dottile6_dotunit26_in_stream_e;
			end
			dotunit26_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_67 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_68;
// synthesis translate_on
always @(*) begin
	dotslice_dottile6_dotunit27_out_stream_e <= 8'd0;
	dotslice_dottile6_dotunit27_out_stream_w <= 8'd0;
	dotunit27_next_state <= 2'd0;
	dotslice_dottile6_dotunit27_weight_dotunit27_next_value0 <= 8'd0;
	dotslice_dottile6_dotunit27_weight_dotunit27_next_value_ce0 <= 1'd0;
	dotslice_dottile6_dotunit27_sum_dotunit27_next_value1 <= 16'd0;
	dotslice_dottile6_dotunit27_sum_dotunit27_next_value_ce1 <= 1'd0;
	dotunit27_next_state <= dotunit27_state;
	case (dotunit27_state)
		1'd1: begin
			if (dotslice_dottile6_dotunit27_in_stream_w_valid) begin
				dotslice_dottile6_dotunit27_weight_dotunit27_next_value0 <= dotslice_dottile6_dotunit27_in_stream_w;
				dotslice_dottile6_dotunit27_weight_dotunit27_next_value_ce0 <= 1'd1;
				dotunit27_next_state <= 1'd0;
			end
			if (dotslice_dottile6_dotunit27_in_stream_e_valid) begin
				dotslice_dottile6_dotunit27_out_stream_e <= dotslice_dottile6_dotunit27_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile6_dotunit27_in_stream_w_valid) begin
				dotslice_dottile6_dotunit27_sum_dotunit27_next_value1 <= (dotslice_dottile6_dotunit27_sum + (dotslice_dottile6_dotunit27_in_stream_w * dotslice_dottile6_dotunit27_in_weight));
				dotslice_dottile6_dotunit27_sum_dotunit27_next_value_ce1 <= 1'd1;
				dotslice_dottile6_dotunit27_out_stream_w <= dotslice_dottile6_dotunit27_in_stream_w;
			end
			if (dotslice_dottile6_dotunit27_in_stream_e_valid) begin
				dotslice_dottile6_dotunit27_out_stream_e <= dotslice_dottile6_dotunit27_in_stream_e;
			end
			dotunit27_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile6_dotunit27_out_stream_e <= dotslice_dottile6_dotunit27_sum;
			if (dotslice_dottile6_dotunit27_in_stream_w_valid) begin
				dotslice_dottile6_dotunit27_out_stream_w <= dotslice_dottile6_dotunit27_in_stream_w;
			end
			dotunit27_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile6_dotunit27_in_stream_w_valid) begin
				dotslice_dottile6_dotunit27_out_stream_w <= dotslice_dottile6_dotunit27_in_stream_w;
			end
			if (dotslice_dottile6_dotunit27_in_stream_e_valid) begin
				dotslice_dottile6_dotunit27_out_stream_e <= dotslice_dottile6_dotunit27_in_stream_e;
			end
			dotunit27_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_68 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_69;
// synthesis translate_on
always @(*) begin
	fsm6_next_state <= 2'd0;
	dotslice_dottile6_out_stream_w_valid_fsm6_next_value0 <= 1'd0;
	dotslice_dottile6_out_stream_w_valid_fsm6_next_value_ce0 <= 1'd0;
	dotslice_dottile6_out_stream_e_valid_fsm6_next_value1 <= 1'd0;
	dotslice_dottile6_out_stream_e_valid_fsm6_next_value_ce1 <= 1'd0;
	fsm6_next_state <= fsm6_state;
	case (fsm6_state)
		1'd1: begin
			if (dotslice_dottile6_in_stream_w_valid) begin
				fsm6_next_state <= 1'd0;
			end
			dotslice_dottile6_out_stream_e_valid_fsm6_next_value1 <= dotslice_dottile6_in_stream_e_valid;
			dotslice_dottile6_out_stream_e_valid_fsm6_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile6_out_stream_w_valid_fsm6_next_value0 <= dotslice_dottile6_in_stream_w_valid;
			dotslice_dottile6_out_stream_w_valid_fsm6_next_value_ce0 <= 1'd1;
			dotslice_dottile6_out_stream_e_valid_fsm6_next_value1 <= dotslice_dottile6_in_stream_e_valid;
			dotslice_dottile6_out_stream_e_valid_fsm6_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile6_out_stream_w_valid_fsm6_next_value0 <= dotslice_dottile6_in_stream_w_valid;
			dotslice_dottile6_out_stream_w_valid_fsm6_next_value_ce0 <= 1'd1;
			dotslice_dottile6_out_stream_e_valid_fsm6_next_value1 <= 1'd1;
			dotslice_dottile6_out_stream_e_valid_fsm6_next_value_ce1 <= 1'd1;
			fsm6_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile6_out_stream_w_valid_fsm6_next_value0 <= dotslice_dottile6_in_stream_w_valid;
			dotslice_dottile6_out_stream_w_valid_fsm6_next_value_ce0 <= 1'd1;
			dotslice_dottile6_out_stream_e_valid_fsm6_next_value1 <= dotslice_dottile6_in_stream_e_valid;
			dotslice_dottile6_out_stream_e_valid_fsm6_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_69 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile7_dotunit28_in_stream_w = dotslice_dottile7_in_stream_w[7:0];
assign dotslice_dottile7_dotunit28_in_stream_w_valid = dotslice_dottile7_in_stream_w_valid;
assign dotslice_dottile7_dotunit28_in_stream_e = dotslice_dottile7_in_stream_e[7:0];
assign dotslice_dottile7_dotunit28_in_stream_e_valid = dotslice_dottile7_in_stream_e_valid;
assign dotslice_dottile7_dotunit28_in_weight = dotslice_dottile7_in_weight;
assign dotslice_dottile70 = dotslice_dottile7_dotunit28_out_weight;
assign dotslice_dottile7_dotunit29_in_stream_w = dotslice_dottile7_in_stream_w[15:8];
assign dotslice_dottile7_dotunit29_in_stream_w_valid = dotslice_dottile7_in_stream_w_valid;
assign dotslice_dottile7_dotunit29_in_stream_e = dotslice_dottile7_in_stream_e[15:8];
assign dotslice_dottile7_dotunit29_in_stream_e_valid = dotslice_dottile7_in_stream_e_valid;
assign dotslice_dottile7_dotunit29_in_weight = dotslice_dottile70;
assign dotslice_dottile71 = dotslice_dottile7_dotunit29_out_weight;
assign dotslice_dottile7_dotunit30_in_stream_w = dotslice_dottile7_in_stream_w[23:16];
assign dotslice_dottile7_dotunit30_in_stream_w_valid = dotslice_dottile7_in_stream_w_valid;
assign dotslice_dottile7_dotunit30_in_stream_e = dotslice_dottile7_in_stream_e[23:16];
assign dotslice_dottile7_dotunit30_in_stream_e_valid = dotslice_dottile7_in_stream_e_valid;
assign dotslice_dottile7_dotunit30_in_weight = dotslice_dottile71;
assign dotslice_dottile72 = dotslice_dottile7_dotunit30_out_weight;
assign dotslice_dottile7_dotunit31_in_stream_w = dotslice_dottile7_in_stream_w[31:24];
assign dotslice_dottile7_dotunit31_in_stream_w_valid = dotslice_dottile7_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_70;
// synthesis translate_on
always @(*) begin
	dotslice_dottile7_out_stream_e <= 32'd0;
	dotslice_dottile7_out_stream_e[7:0] <= dotslice_dottile7_dotunit28_out_stream_e;
	dotslice_dottile7_out_stream_e[15:8] <= dotslice_dottile7_dotunit29_out_stream_e;
	dotslice_dottile7_out_stream_e[23:16] <= dotslice_dottile7_dotunit30_out_stream_e;
	dotslice_dottile7_out_stream_e[31:24] <= dotslice_dottile7_dotunit31_out_stream_e;
// synthesis translate_off
	dummy_d_70 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_71;
// synthesis translate_on
always @(*) begin
	dotslice_dottile7_out_stream_w <= 32'd0;
	dotslice_dottile7_out_stream_w[7:0] <= dotslice_dottile7_dotunit28_out_stream_w;
	dotslice_dottile7_out_stream_w[15:8] <= dotslice_dottile7_dotunit29_out_stream_w;
	dotslice_dottile7_out_stream_w[23:16] <= dotslice_dottile7_dotunit30_out_stream_w;
	dotslice_dottile7_out_stream_w[31:24] <= dotslice_dottile7_dotunit31_out_stream_w;
// synthesis translate_off
	dummy_d_71 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile7_dotunit31_in_stream_e = dotslice_dottile7_in_stream_e[31:24];
assign dotslice_dottile7_dotunit31_in_stream_e_valid = dotslice_dottile7_in_stream_e_valid;
assign dotslice_dottile7_dotunit31_in_weight = dotslice_dottile72;
assign dotslice_dottile73 = dotslice_dottile7_dotunit31_out_weight;

// synthesis translate_off
reg dummy_d_72;
// synthesis translate_on
always @(*) begin
	dotslice_dottile7_dotunit28_out_stream_e <= 8'd0;
	dotslice_dottile7_dotunit28_out_stream_w <= 8'd0;
	dotunit28_next_state <= 2'd0;
	dotslice_dottile7_dotunit28_weight_dotunit28_next_value0 <= 8'd0;
	dotslice_dottile7_dotunit28_weight_dotunit28_next_value_ce0 <= 1'd0;
	dotslice_dottile7_dotunit28_sum_dotunit28_next_value1 <= 16'd0;
	dotslice_dottile7_dotunit28_sum_dotunit28_next_value_ce1 <= 1'd0;
	dotunit28_next_state <= dotunit28_state;
	case (dotunit28_state)
		1'd1: begin
			if (dotslice_dottile7_dotunit28_in_stream_w_valid) begin
				dotslice_dottile7_dotunit28_weight_dotunit28_next_value0 <= dotslice_dottile7_dotunit28_in_stream_w;
				dotslice_dottile7_dotunit28_weight_dotunit28_next_value_ce0 <= 1'd1;
				dotunit28_next_state <= 1'd0;
			end
			if (dotslice_dottile7_dotunit28_in_stream_e_valid) begin
				dotslice_dottile7_dotunit28_out_stream_e <= dotslice_dottile7_dotunit28_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile7_dotunit28_in_stream_w_valid) begin
				dotslice_dottile7_dotunit28_sum_dotunit28_next_value1 <= (dotslice_dottile7_dotunit28_sum + (dotslice_dottile7_dotunit28_in_stream_w * dotslice_dottile7_dotunit28_in_weight));
				dotslice_dottile7_dotunit28_sum_dotunit28_next_value_ce1 <= 1'd1;
				dotslice_dottile7_dotunit28_out_stream_w <= dotslice_dottile7_dotunit28_in_stream_w;
			end
			if (dotslice_dottile7_dotunit28_in_stream_e_valid) begin
				dotslice_dottile7_dotunit28_out_stream_e <= dotslice_dottile7_dotunit28_in_stream_e;
			end
			dotunit28_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile7_dotunit28_out_stream_e <= dotslice_dottile7_dotunit28_sum;
			if (dotslice_dottile7_dotunit28_in_stream_w_valid) begin
				dotslice_dottile7_dotunit28_out_stream_w <= dotslice_dottile7_dotunit28_in_stream_w;
			end
			dotunit28_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile7_dotunit28_in_stream_w_valid) begin
				dotslice_dottile7_dotunit28_out_stream_w <= dotslice_dottile7_dotunit28_in_stream_w;
			end
			if (dotslice_dottile7_dotunit28_in_stream_e_valid) begin
				dotslice_dottile7_dotunit28_out_stream_e <= dotslice_dottile7_dotunit28_in_stream_e;
			end
			dotunit28_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_72 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_73;
// synthesis translate_on
always @(*) begin
	dotslice_dottile7_dotunit29_out_stream_e <= 8'd0;
	dotslice_dottile7_dotunit29_out_stream_w <= 8'd0;
	dotunit29_next_state <= 2'd0;
	dotslice_dottile7_dotunit29_weight_dotunit29_next_value0 <= 8'd0;
	dotslice_dottile7_dotunit29_weight_dotunit29_next_value_ce0 <= 1'd0;
	dotslice_dottile7_dotunit29_sum_dotunit29_next_value1 <= 16'd0;
	dotslice_dottile7_dotunit29_sum_dotunit29_next_value_ce1 <= 1'd0;
	dotunit29_next_state <= dotunit29_state;
	case (dotunit29_state)
		1'd1: begin
			if (dotslice_dottile7_dotunit29_in_stream_w_valid) begin
				dotslice_dottile7_dotunit29_weight_dotunit29_next_value0 <= dotslice_dottile7_dotunit29_in_stream_w;
				dotslice_dottile7_dotunit29_weight_dotunit29_next_value_ce0 <= 1'd1;
				dotunit29_next_state <= 1'd0;
			end
			if (dotslice_dottile7_dotunit29_in_stream_e_valid) begin
				dotslice_dottile7_dotunit29_out_stream_e <= dotslice_dottile7_dotunit29_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile7_dotunit29_in_stream_w_valid) begin
				dotslice_dottile7_dotunit29_sum_dotunit29_next_value1 <= (dotslice_dottile7_dotunit29_sum + (dotslice_dottile7_dotunit29_in_stream_w * dotslice_dottile7_dotunit29_in_weight));
				dotslice_dottile7_dotunit29_sum_dotunit29_next_value_ce1 <= 1'd1;
				dotslice_dottile7_dotunit29_out_stream_w <= dotslice_dottile7_dotunit29_in_stream_w;
			end
			if (dotslice_dottile7_dotunit29_in_stream_e_valid) begin
				dotslice_dottile7_dotunit29_out_stream_e <= dotslice_dottile7_dotunit29_in_stream_e;
			end
			dotunit29_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile7_dotunit29_out_stream_e <= dotslice_dottile7_dotunit29_sum;
			if (dotslice_dottile7_dotunit29_in_stream_w_valid) begin
				dotslice_dottile7_dotunit29_out_stream_w <= dotslice_dottile7_dotunit29_in_stream_w;
			end
			dotunit29_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile7_dotunit29_in_stream_w_valid) begin
				dotslice_dottile7_dotunit29_out_stream_w <= dotslice_dottile7_dotunit29_in_stream_w;
			end
			if (dotslice_dottile7_dotunit29_in_stream_e_valid) begin
				dotslice_dottile7_dotunit29_out_stream_e <= dotslice_dottile7_dotunit29_in_stream_e;
			end
			dotunit29_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_73 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_74;
// synthesis translate_on
always @(*) begin
	dotslice_dottile7_dotunit30_out_stream_e <= 8'd0;
	dotslice_dottile7_dotunit30_out_stream_w <= 8'd0;
	dotunit30_next_state <= 2'd0;
	dotslice_dottile7_dotunit30_weight_dotunit30_next_value0 <= 8'd0;
	dotslice_dottile7_dotunit30_weight_dotunit30_next_value_ce0 <= 1'd0;
	dotslice_dottile7_dotunit30_sum_dotunit30_next_value1 <= 16'd0;
	dotslice_dottile7_dotunit30_sum_dotunit30_next_value_ce1 <= 1'd0;
	dotunit30_next_state <= dotunit30_state;
	case (dotunit30_state)
		1'd1: begin
			if (dotslice_dottile7_dotunit30_in_stream_w_valid) begin
				dotslice_dottile7_dotunit30_weight_dotunit30_next_value0 <= dotslice_dottile7_dotunit30_in_stream_w;
				dotslice_dottile7_dotunit30_weight_dotunit30_next_value_ce0 <= 1'd1;
				dotunit30_next_state <= 1'd0;
			end
			if (dotslice_dottile7_dotunit30_in_stream_e_valid) begin
				dotslice_dottile7_dotunit30_out_stream_e <= dotslice_dottile7_dotunit30_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile7_dotunit30_in_stream_w_valid) begin
				dotslice_dottile7_dotunit30_sum_dotunit30_next_value1 <= (dotslice_dottile7_dotunit30_sum + (dotslice_dottile7_dotunit30_in_stream_w * dotslice_dottile7_dotunit30_in_weight));
				dotslice_dottile7_dotunit30_sum_dotunit30_next_value_ce1 <= 1'd1;
				dotslice_dottile7_dotunit30_out_stream_w <= dotslice_dottile7_dotunit30_in_stream_w;
			end
			if (dotslice_dottile7_dotunit30_in_stream_e_valid) begin
				dotslice_dottile7_dotunit30_out_stream_e <= dotslice_dottile7_dotunit30_in_stream_e;
			end
			dotunit30_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile7_dotunit30_out_stream_e <= dotslice_dottile7_dotunit30_sum;
			if (dotslice_dottile7_dotunit30_in_stream_w_valid) begin
				dotslice_dottile7_dotunit30_out_stream_w <= dotslice_dottile7_dotunit30_in_stream_w;
			end
			dotunit30_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile7_dotunit30_in_stream_w_valid) begin
				dotslice_dottile7_dotunit30_out_stream_w <= dotslice_dottile7_dotunit30_in_stream_w;
			end
			if (dotslice_dottile7_dotunit30_in_stream_e_valid) begin
				dotslice_dottile7_dotunit30_out_stream_e <= dotslice_dottile7_dotunit30_in_stream_e;
			end
			dotunit30_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_74 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_75;
// synthesis translate_on
always @(*) begin
	dotslice_dottile7_dotunit31_out_stream_e <= 8'd0;
	dotslice_dottile7_dotunit31_out_stream_w <= 8'd0;
	dotunit31_next_state <= 2'd0;
	dotslice_dottile7_dotunit31_weight_dotunit31_next_value0 <= 8'd0;
	dotslice_dottile7_dotunit31_weight_dotunit31_next_value_ce0 <= 1'd0;
	dotslice_dottile7_dotunit31_sum_dotunit31_next_value1 <= 16'd0;
	dotslice_dottile7_dotunit31_sum_dotunit31_next_value_ce1 <= 1'd0;
	dotunit31_next_state <= dotunit31_state;
	case (dotunit31_state)
		1'd1: begin
			if (dotslice_dottile7_dotunit31_in_stream_w_valid) begin
				dotslice_dottile7_dotunit31_weight_dotunit31_next_value0 <= dotslice_dottile7_dotunit31_in_stream_w;
				dotslice_dottile7_dotunit31_weight_dotunit31_next_value_ce0 <= 1'd1;
				dotunit31_next_state <= 1'd0;
			end
			if (dotslice_dottile7_dotunit31_in_stream_e_valid) begin
				dotslice_dottile7_dotunit31_out_stream_e <= dotslice_dottile7_dotunit31_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile7_dotunit31_in_stream_w_valid) begin
				dotslice_dottile7_dotunit31_sum_dotunit31_next_value1 <= (dotslice_dottile7_dotunit31_sum + (dotslice_dottile7_dotunit31_in_stream_w * dotslice_dottile7_dotunit31_in_weight));
				dotslice_dottile7_dotunit31_sum_dotunit31_next_value_ce1 <= 1'd1;
				dotslice_dottile7_dotunit31_out_stream_w <= dotslice_dottile7_dotunit31_in_stream_w;
			end
			if (dotslice_dottile7_dotunit31_in_stream_e_valid) begin
				dotslice_dottile7_dotunit31_out_stream_e <= dotslice_dottile7_dotunit31_in_stream_e;
			end
			dotunit31_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile7_dotunit31_out_stream_e <= dotslice_dottile7_dotunit31_sum;
			if (dotslice_dottile7_dotunit31_in_stream_w_valid) begin
				dotslice_dottile7_dotunit31_out_stream_w <= dotslice_dottile7_dotunit31_in_stream_w;
			end
			dotunit31_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile7_dotunit31_in_stream_w_valid) begin
				dotslice_dottile7_dotunit31_out_stream_w <= dotslice_dottile7_dotunit31_in_stream_w;
			end
			if (dotslice_dottile7_dotunit31_in_stream_e_valid) begin
				dotslice_dottile7_dotunit31_out_stream_e <= dotslice_dottile7_dotunit31_in_stream_e;
			end
			dotunit31_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_75 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_76;
// synthesis translate_on
always @(*) begin
	fsm7_next_state <= 2'd0;
	dotslice_dottile7_out_stream_w_valid_fsm7_next_value0 <= 1'd0;
	dotslice_dottile7_out_stream_w_valid_fsm7_next_value_ce0 <= 1'd0;
	dotslice_dottile7_out_stream_e_valid_fsm7_next_value1 <= 1'd0;
	dotslice_dottile7_out_stream_e_valid_fsm7_next_value_ce1 <= 1'd0;
	fsm7_next_state <= fsm7_state;
	case (fsm7_state)
		1'd1: begin
			if (dotslice_dottile7_in_stream_w_valid) begin
				fsm7_next_state <= 1'd0;
			end
			dotslice_dottile7_out_stream_e_valid_fsm7_next_value1 <= dotslice_dottile7_in_stream_e_valid;
			dotslice_dottile7_out_stream_e_valid_fsm7_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile7_out_stream_w_valid_fsm7_next_value0 <= dotslice_dottile7_in_stream_w_valid;
			dotslice_dottile7_out_stream_w_valid_fsm7_next_value_ce0 <= 1'd1;
			dotslice_dottile7_out_stream_e_valid_fsm7_next_value1 <= dotslice_dottile7_in_stream_e_valid;
			dotslice_dottile7_out_stream_e_valid_fsm7_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile7_out_stream_w_valid_fsm7_next_value0 <= dotslice_dottile7_in_stream_w_valid;
			dotslice_dottile7_out_stream_w_valid_fsm7_next_value_ce0 <= 1'd1;
			dotslice_dottile7_out_stream_e_valid_fsm7_next_value1 <= 1'd1;
			dotslice_dottile7_out_stream_e_valid_fsm7_next_value_ce1 <= 1'd1;
			fsm7_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile7_out_stream_w_valid_fsm7_next_value0 <= dotslice_dottile7_in_stream_w_valid;
			dotslice_dottile7_out_stream_w_valid_fsm7_next_value_ce0 <= 1'd1;
			dotslice_dottile7_out_stream_e_valid_fsm7_next_value1 <= dotslice_dottile7_in_stream_e_valid;
			dotslice_dottile7_out_stream_e_valid_fsm7_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_76 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile8_dotunit32_in_stream_w = dotslice_dottile8_in_stream_w[7:0];
assign dotslice_dottile8_dotunit32_in_stream_w_valid = dotslice_dottile8_in_stream_w_valid;
assign dotslice_dottile8_dotunit32_in_stream_e = dotslice_dottile8_in_stream_e[7:0];
assign dotslice_dottile8_dotunit32_in_stream_e_valid = dotslice_dottile8_in_stream_e_valid;
assign dotslice_dottile8_dotunit32_in_weight = dotslice_dottile8_in_weight;
assign dotslice_dottile80 = dotslice_dottile8_dotunit32_out_weight;
assign dotslice_dottile8_dotunit33_in_stream_w = dotslice_dottile8_in_stream_w[15:8];
assign dotslice_dottile8_dotunit33_in_stream_w_valid = dotslice_dottile8_in_stream_w_valid;
assign dotslice_dottile8_dotunit33_in_stream_e = dotslice_dottile8_in_stream_e[15:8];
assign dotslice_dottile8_dotunit33_in_stream_e_valid = dotslice_dottile8_in_stream_e_valid;
assign dotslice_dottile8_dotunit33_in_weight = dotslice_dottile80;
assign dotslice_dottile81 = dotslice_dottile8_dotunit33_out_weight;
assign dotslice_dottile8_dotunit34_in_stream_w = dotslice_dottile8_in_stream_w[23:16];
assign dotslice_dottile8_dotunit34_in_stream_w_valid = dotslice_dottile8_in_stream_w_valid;
assign dotslice_dottile8_dotunit34_in_stream_e = dotslice_dottile8_in_stream_e[23:16];
assign dotslice_dottile8_dotunit34_in_stream_e_valid = dotslice_dottile8_in_stream_e_valid;
assign dotslice_dottile8_dotunit34_in_weight = dotslice_dottile81;
assign dotslice_dottile82 = dotslice_dottile8_dotunit34_out_weight;
assign dotslice_dottile8_dotunit35_in_stream_w = dotslice_dottile8_in_stream_w[31:24];
assign dotslice_dottile8_dotunit35_in_stream_w_valid = dotslice_dottile8_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_77;
// synthesis translate_on
always @(*) begin
	dotslice_dottile8_out_stream_e <= 32'd0;
	dotslice_dottile8_out_stream_e[7:0] <= dotslice_dottile8_dotunit32_out_stream_e;
	dotslice_dottile8_out_stream_e[15:8] <= dotslice_dottile8_dotunit33_out_stream_e;
	dotslice_dottile8_out_stream_e[23:16] <= dotslice_dottile8_dotunit34_out_stream_e;
	dotslice_dottile8_out_stream_e[31:24] <= dotslice_dottile8_dotunit35_out_stream_e;
// synthesis translate_off
	dummy_d_77 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_78;
// synthesis translate_on
always @(*) begin
	dotslice_dottile8_out_stream_w <= 32'd0;
	dotslice_dottile8_out_stream_w[7:0] <= dotslice_dottile8_dotunit32_out_stream_w;
	dotslice_dottile8_out_stream_w[15:8] <= dotslice_dottile8_dotunit33_out_stream_w;
	dotslice_dottile8_out_stream_w[23:16] <= dotslice_dottile8_dotunit34_out_stream_w;
	dotslice_dottile8_out_stream_w[31:24] <= dotslice_dottile8_dotunit35_out_stream_w;
// synthesis translate_off
	dummy_d_78 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile8_dotunit35_in_stream_e = dotslice_dottile8_in_stream_e[31:24];
assign dotslice_dottile8_dotunit35_in_stream_e_valid = dotslice_dottile8_in_stream_e_valid;
assign dotslice_dottile8_dotunit35_in_weight = dotslice_dottile82;
assign dotslice_dottile83 = dotslice_dottile8_dotunit35_out_weight;

// synthesis translate_off
reg dummy_d_79;
// synthesis translate_on
always @(*) begin
	dotslice_dottile8_dotunit32_out_stream_e <= 8'd0;
	dotslice_dottile8_dotunit32_out_stream_w <= 8'd0;
	dotunit32_next_state <= 2'd0;
	dotslice_dottile8_dotunit32_weight_dotunit32_next_value0 <= 8'd0;
	dotslice_dottile8_dotunit32_weight_dotunit32_next_value_ce0 <= 1'd0;
	dotslice_dottile8_dotunit32_sum_dotunit32_next_value1 <= 16'd0;
	dotslice_dottile8_dotunit32_sum_dotunit32_next_value_ce1 <= 1'd0;
	dotunit32_next_state <= dotunit32_state;
	case (dotunit32_state)
		1'd1: begin
			if (dotslice_dottile8_dotunit32_in_stream_w_valid) begin
				dotslice_dottile8_dotunit32_weight_dotunit32_next_value0 <= dotslice_dottile8_dotunit32_in_stream_w;
				dotslice_dottile8_dotunit32_weight_dotunit32_next_value_ce0 <= 1'd1;
				dotunit32_next_state <= 1'd0;
			end
			if (dotslice_dottile8_dotunit32_in_stream_e_valid) begin
				dotslice_dottile8_dotunit32_out_stream_e <= dotslice_dottile8_dotunit32_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile8_dotunit32_in_stream_w_valid) begin
				dotslice_dottile8_dotunit32_sum_dotunit32_next_value1 <= (dotslice_dottile8_dotunit32_sum + (dotslice_dottile8_dotunit32_in_stream_w * dotslice_dottile8_dotunit32_in_weight));
				dotslice_dottile8_dotunit32_sum_dotunit32_next_value_ce1 <= 1'd1;
				dotslice_dottile8_dotunit32_out_stream_w <= dotslice_dottile8_dotunit32_in_stream_w;
			end
			if (dotslice_dottile8_dotunit32_in_stream_e_valid) begin
				dotslice_dottile8_dotunit32_out_stream_e <= dotslice_dottile8_dotunit32_in_stream_e;
			end
			dotunit32_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile8_dotunit32_out_stream_e <= dotslice_dottile8_dotunit32_sum;
			if (dotslice_dottile8_dotunit32_in_stream_w_valid) begin
				dotslice_dottile8_dotunit32_out_stream_w <= dotslice_dottile8_dotunit32_in_stream_w;
			end
			dotunit32_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile8_dotunit32_in_stream_w_valid) begin
				dotslice_dottile8_dotunit32_out_stream_w <= dotslice_dottile8_dotunit32_in_stream_w;
			end
			if (dotslice_dottile8_dotunit32_in_stream_e_valid) begin
				dotslice_dottile8_dotunit32_out_stream_e <= dotslice_dottile8_dotunit32_in_stream_e;
			end
			dotunit32_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_79 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_80;
// synthesis translate_on
always @(*) begin
	dotslice_dottile8_dotunit33_out_stream_e <= 8'd0;
	dotslice_dottile8_dotunit33_out_stream_w <= 8'd0;
	dotunit33_next_state <= 2'd0;
	dotslice_dottile8_dotunit33_weight_dotunit33_next_value0 <= 8'd0;
	dotslice_dottile8_dotunit33_weight_dotunit33_next_value_ce0 <= 1'd0;
	dotslice_dottile8_dotunit33_sum_dotunit33_next_value1 <= 16'd0;
	dotslice_dottile8_dotunit33_sum_dotunit33_next_value_ce1 <= 1'd0;
	dotunit33_next_state <= dotunit33_state;
	case (dotunit33_state)
		1'd1: begin
			if (dotslice_dottile8_dotunit33_in_stream_w_valid) begin
				dotslice_dottile8_dotunit33_weight_dotunit33_next_value0 <= dotslice_dottile8_dotunit33_in_stream_w;
				dotslice_dottile8_dotunit33_weight_dotunit33_next_value_ce0 <= 1'd1;
				dotunit33_next_state <= 1'd0;
			end
			if (dotslice_dottile8_dotunit33_in_stream_e_valid) begin
				dotslice_dottile8_dotunit33_out_stream_e <= dotslice_dottile8_dotunit33_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile8_dotunit33_in_stream_w_valid) begin
				dotslice_dottile8_dotunit33_sum_dotunit33_next_value1 <= (dotslice_dottile8_dotunit33_sum + (dotslice_dottile8_dotunit33_in_stream_w * dotslice_dottile8_dotunit33_in_weight));
				dotslice_dottile8_dotunit33_sum_dotunit33_next_value_ce1 <= 1'd1;
				dotslice_dottile8_dotunit33_out_stream_w <= dotslice_dottile8_dotunit33_in_stream_w;
			end
			if (dotslice_dottile8_dotunit33_in_stream_e_valid) begin
				dotslice_dottile8_dotunit33_out_stream_e <= dotslice_dottile8_dotunit33_in_stream_e;
			end
			dotunit33_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile8_dotunit33_out_stream_e <= dotslice_dottile8_dotunit33_sum;
			if (dotslice_dottile8_dotunit33_in_stream_w_valid) begin
				dotslice_dottile8_dotunit33_out_stream_w <= dotslice_dottile8_dotunit33_in_stream_w;
			end
			dotunit33_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile8_dotunit33_in_stream_w_valid) begin
				dotslice_dottile8_dotunit33_out_stream_w <= dotslice_dottile8_dotunit33_in_stream_w;
			end
			if (dotslice_dottile8_dotunit33_in_stream_e_valid) begin
				dotslice_dottile8_dotunit33_out_stream_e <= dotslice_dottile8_dotunit33_in_stream_e;
			end
			dotunit33_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_80 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_81;
// synthesis translate_on
always @(*) begin
	dotslice_dottile8_dotunit34_out_stream_e <= 8'd0;
	dotslice_dottile8_dotunit34_out_stream_w <= 8'd0;
	dotunit34_next_state <= 2'd0;
	dotslice_dottile8_dotunit34_weight_dotunit34_next_value0 <= 8'd0;
	dotslice_dottile8_dotunit34_weight_dotunit34_next_value_ce0 <= 1'd0;
	dotslice_dottile8_dotunit34_sum_dotunit34_next_value1 <= 16'd0;
	dotslice_dottile8_dotunit34_sum_dotunit34_next_value_ce1 <= 1'd0;
	dotunit34_next_state <= dotunit34_state;
	case (dotunit34_state)
		1'd1: begin
			if (dotslice_dottile8_dotunit34_in_stream_w_valid) begin
				dotslice_dottile8_dotunit34_weight_dotunit34_next_value0 <= dotslice_dottile8_dotunit34_in_stream_w;
				dotslice_dottile8_dotunit34_weight_dotunit34_next_value_ce0 <= 1'd1;
				dotunit34_next_state <= 1'd0;
			end
			if (dotslice_dottile8_dotunit34_in_stream_e_valid) begin
				dotslice_dottile8_dotunit34_out_stream_e <= dotslice_dottile8_dotunit34_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile8_dotunit34_in_stream_w_valid) begin
				dotslice_dottile8_dotunit34_sum_dotunit34_next_value1 <= (dotslice_dottile8_dotunit34_sum + (dotslice_dottile8_dotunit34_in_stream_w * dotslice_dottile8_dotunit34_in_weight));
				dotslice_dottile8_dotunit34_sum_dotunit34_next_value_ce1 <= 1'd1;
				dotslice_dottile8_dotunit34_out_stream_w <= dotslice_dottile8_dotunit34_in_stream_w;
			end
			if (dotslice_dottile8_dotunit34_in_stream_e_valid) begin
				dotslice_dottile8_dotunit34_out_stream_e <= dotslice_dottile8_dotunit34_in_stream_e;
			end
			dotunit34_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile8_dotunit34_out_stream_e <= dotslice_dottile8_dotunit34_sum;
			if (dotslice_dottile8_dotunit34_in_stream_w_valid) begin
				dotslice_dottile8_dotunit34_out_stream_w <= dotslice_dottile8_dotunit34_in_stream_w;
			end
			dotunit34_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile8_dotunit34_in_stream_w_valid) begin
				dotslice_dottile8_dotunit34_out_stream_w <= dotslice_dottile8_dotunit34_in_stream_w;
			end
			if (dotslice_dottile8_dotunit34_in_stream_e_valid) begin
				dotslice_dottile8_dotunit34_out_stream_e <= dotslice_dottile8_dotunit34_in_stream_e;
			end
			dotunit34_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_81 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_82;
// synthesis translate_on
always @(*) begin
	dotslice_dottile8_dotunit35_out_stream_e <= 8'd0;
	dotslice_dottile8_dotunit35_out_stream_w <= 8'd0;
	dotunit35_next_state <= 2'd0;
	dotslice_dottile8_dotunit35_weight_dotunit35_next_value0 <= 8'd0;
	dotslice_dottile8_dotunit35_weight_dotunit35_next_value_ce0 <= 1'd0;
	dotslice_dottile8_dotunit35_sum_dotunit35_next_value1 <= 16'd0;
	dotslice_dottile8_dotunit35_sum_dotunit35_next_value_ce1 <= 1'd0;
	dotunit35_next_state <= dotunit35_state;
	case (dotunit35_state)
		1'd1: begin
			if (dotslice_dottile8_dotunit35_in_stream_w_valid) begin
				dotslice_dottile8_dotunit35_weight_dotunit35_next_value0 <= dotslice_dottile8_dotunit35_in_stream_w;
				dotslice_dottile8_dotunit35_weight_dotunit35_next_value_ce0 <= 1'd1;
				dotunit35_next_state <= 1'd0;
			end
			if (dotslice_dottile8_dotunit35_in_stream_e_valid) begin
				dotslice_dottile8_dotunit35_out_stream_e <= dotslice_dottile8_dotunit35_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile8_dotunit35_in_stream_w_valid) begin
				dotslice_dottile8_dotunit35_sum_dotunit35_next_value1 <= (dotslice_dottile8_dotunit35_sum + (dotslice_dottile8_dotunit35_in_stream_w * dotslice_dottile8_dotunit35_in_weight));
				dotslice_dottile8_dotunit35_sum_dotunit35_next_value_ce1 <= 1'd1;
				dotslice_dottile8_dotunit35_out_stream_w <= dotslice_dottile8_dotunit35_in_stream_w;
			end
			if (dotslice_dottile8_dotunit35_in_stream_e_valid) begin
				dotslice_dottile8_dotunit35_out_stream_e <= dotslice_dottile8_dotunit35_in_stream_e;
			end
			dotunit35_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile8_dotunit35_out_stream_e <= dotslice_dottile8_dotunit35_sum;
			if (dotslice_dottile8_dotunit35_in_stream_w_valid) begin
				dotslice_dottile8_dotunit35_out_stream_w <= dotslice_dottile8_dotunit35_in_stream_w;
			end
			dotunit35_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile8_dotunit35_in_stream_w_valid) begin
				dotslice_dottile8_dotunit35_out_stream_w <= dotslice_dottile8_dotunit35_in_stream_w;
			end
			if (dotslice_dottile8_dotunit35_in_stream_e_valid) begin
				dotslice_dottile8_dotunit35_out_stream_e <= dotslice_dottile8_dotunit35_in_stream_e;
			end
			dotunit35_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_82 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_83;
// synthesis translate_on
always @(*) begin
	fsm8_next_state <= 2'd0;
	dotslice_dottile8_out_stream_w_valid_fsm8_next_value0 <= 1'd0;
	dotslice_dottile8_out_stream_w_valid_fsm8_next_value_ce0 <= 1'd0;
	dotslice_dottile8_out_stream_e_valid_fsm8_next_value1 <= 1'd0;
	dotslice_dottile8_out_stream_e_valid_fsm8_next_value_ce1 <= 1'd0;
	fsm8_next_state <= fsm8_state;
	case (fsm8_state)
		1'd1: begin
			if (dotslice_dottile8_in_stream_w_valid) begin
				fsm8_next_state <= 1'd0;
			end
			dotslice_dottile8_out_stream_e_valid_fsm8_next_value1 <= dotslice_dottile8_in_stream_e_valid;
			dotslice_dottile8_out_stream_e_valid_fsm8_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile8_out_stream_w_valid_fsm8_next_value0 <= dotslice_dottile8_in_stream_w_valid;
			dotslice_dottile8_out_stream_w_valid_fsm8_next_value_ce0 <= 1'd1;
			dotslice_dottile8_out_stream_e_valid_fsm8_next_value1 <= dotslice_dottile8_in_stream_e_valid;
			dotslice_dottile8_out_stream_e_valid_fsm8_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile8_out_stream_w_valid_fsm8_next_value0 <= dotslice_dottile8_in_stream_w_valid;
			dotslice_dottile8_out_stream_w_valid_fsm8_next_value_ce0 <= 1'd1;
			dotslice_dottile8_out_stream_e_valid_fsm8_next_value1 <= 1'd1;
			dotslice_dottile8_out_stream_e_valid_fsm8_next_value_ce1 <= 1'd1;
			fsm8_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile8_out_stream_w_valid_fsm8_next_value0 <= dotslice_dottile8_in_stream_w_valid;
			dotslice_dottile8_out_stream_w_valid_fsm8_next_value_ce0 <= 1'd1;
			dotslice_dottile8_out_stream_e_valid_fsm8_next_value1 <= dotslice_dottile8_in_stream_e_valid;
			dotslice_dottile8_out_stream_e_valid_fsm8_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_83 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile9_dotunit36_in_stream_w = dotslice_dottile9_in_stream_w[7:0];
assign dotslice_dottile9_dotunit36_in_stream_w_valid = dotslice_dottile9_in_stream_w_valid;
assign dotslice_dottile9_dotunit36_in_stream_e = dotslice_dottile9_in_stream_e[7:0];
assign dotslice_dottile9_dotunit36_in_stream_e_valid = dotslice_dottile9_in_stream_e_valid;
assign dotslice_dottile9_dotunit36_in_weight = dotslice_dottile9_in_weight;
assign dotslice_dottile90 = dotslice_dottile9_dotunit36_out_weight;
assign dotslice_dottile9_dotunit37_in_stream_w = dotslice_dottile9_in_stream_w[15:8];
assign dotslice_dottile9_dotunit37_in_stream_w_valid = dotslice_dottile9_in_stream_w_valid;
assign dotslice_dottile9_dotunit37_in_stream_e = dotslice_dottile9_in_stream_e[15:8];
assign dotslice_dottile9_dotunit37_in_stream_e_valid = dotslice_dottile9_in_stream_e_valid;
assign dotslice_dottile9_dotunit37_in_weight = dotslice_dottile90;
assign dotslice_dottile91 = dotslice_dottile9_dotunit37_out_weight;
assign dotslice_dottile9_dotunit38_in_stream_w = dotslice_dottile9_in_stream_w[23:16];
assign dotslice_dottile9_dotunit38_in_stream_w_valid = dotslice_dottile9_in_stream_w_valid;
assign dotslice_dottile9_dotunit38_in_stream_e = dotslice_dottile9_in_stream_e[23:16];
assign dotslice_dottile9_dotunit38_in_stream_e_valid = dotslice_dottile9_in_stream_e_valid;
assign dotslice_dottile9_dotunit38_in_weight = dotslice_dottile91;
assign dotslice_dottile92 = dotslice_dottile9_dotunit38_out_weight;
assign dotslice_dottile9_dotunit39_in_stream_w = dotslice_dottile9_in_stream_w[31:24];
assign dotslice_dottile9_dotunit39_in_stream_w_valid = dotslice_dottile9_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_84;
// synthesis translate_on
always @(*) begin
	dotslice_dottile9_out_stream_e <= 32'd0;
	dotslice_dottile9_out_stream_e[7:0] <= dotslice_dottile9_dotunit36_out_stream_e;
	dotslice_dottile9_out_stream_e[15:8] <= dotslice_dottile9_dotunit37_out_stream_e;
	dotslice_dottile9_out_stream_e[23:16] <= dotslice_dottile9_dotunit38_out_stream_e;
	dotslice_dottile9_out_stream_e[31:24] <= dotslice_dottile9_dotunit39_out_stream_e;
// synthesis translate_off
	dummy_d_84 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_85;
// synthesis translate_on
always @(*) begin
	dotslice_dottile9_out_stream_w <= 32'd0;
	dotslice_dottile9_out_stream_w[7:0] <= dotslice_dottile9_dotunit36_out_stream_w;
	dotslice_dottile9_out_stream_w[15:8] <= dotslice_dottile9_dotunit37_out_stream_w;
	dotslice_dottile9_out_stream_w[23:16] <= dotslice_dottile9_dotunit38_out_stream_w;
	dotslice_dottile9_out_stream_w[31:24] <= dotslice_dottile9_dotunit39_out_stream_w;
// synthesis translate_off
	dummy_d_85 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile9_dotunit39_in_stream_e = dotslice_dottile9_in_stream_e[31:24];
assign dotslice_dottile9_dotunit39_in_stream_e_valid = dotslice_dottile9_in_stream_e_valid;
assign dotslice_dottile9_dotunit39_in_weight = dotslice_dottile92;
assign dotslice_dottile93 = dotslice_dottile9_dotunit39_out_weight;

// synthesis translate_off
reg dummy_d_86;
// synthesis translate_on
always @(*) begin
	dotslice_dottile9_dotunit36_out_stream_e <= 8'd0;
	dotslice_dottile9_dotunit36_out_stream_w <= 8'd0;
	dotunit36_next_state <= 2'd0;
	dotslice_dottile9_dotunit36_weight_dotunit36_next_value0 <= 8'd0;
	dotslice_dottile9_dotunit36_weight_dotunit36_next_value_ce0 <= 1'd0;
	dotslice_dottile9_dotunit36_sum_dotunit36_next_value1 <= 16'd0;
	dotslice_dottile9_dotunit36_sum_dotunit36_next_value_ce1 <= 1'd0;
	dotunit36_next_state <= dotunit36_state;
	case (dotunit36_state)
		1'd1: begin
			if (dotslice_dottile9_dotunit36_in_stream_w_valid) begin
				dotslice_dottile9_dotunit36_weight_dotunit36_next_value0 <= dotslice_dottile9_dotunit36_in_stream_w;
				dotslice_dottile9_dotunit36_weight_dotunit36_next_value_ce0 <= 1'd1;
				dotunit36_next_state <= 1'd0;
			end
			if (dotslice_dottile9_dotunit36_in_stream_e_valid) begin
				dotslice_dottile9_dotunit36_out_stream_e <= dotslice_dottile9_dotunit36_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile9_dotunit36_in_stream_w_valid) begin
				dotslice_dottile9_dotunit36_sum_dotunit36_next_value1 <= (dotslice_dottile9_dotunit36_sum + (dotslice_dottile9_dotunit36_in_stream_w * dotslice_dottile9_dotunit36_in_weight));
				dotslice_dottile9_dotunit36_sum_dotunit36_next_value_ce1 <= 1'd1;
				dotslice_dottile9_dotunit36_out_stream_w <= dotslice_dottile9_dotunit36_in_stream_w;
			end
			if (dotslice_dottile9_dotunit36_in_stream_e_valid) begin
				dotslice_dottile9_dotunit36_out_stream_e <= dotslice_dottile9_dotunit36_in_stream_e;
			end
			dotunit36_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile9_dotunit36_out_stream_e <= dotslice_dottile9_dotunit36_sum;
			if (dotslice_dottile9_dotunit36_in_stream_w_valid) begin
				dotslice_dottile9_dotunit36_out_stream_w <= dotslice_dottile9_dotunit36_in_stream_w;
			end
			dotunit36_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile9_dotunit36_in_stream_w_valid) begin
				dotslice_dottile9_dotunit36_out_stream_w <= dotslice_dottile9_dotunit36_in_stream_w;
			end
			if (dotslice_dottile9_dotunit36_in_stream_e_valid) begin
				dotslice_dottile9_dotunit36_out_stream_e <= dotslice_dottile9_dotunit36_in_stream_e;
			end
			dotunit36_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_86 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_87;
// synthesis translate_on
always @(*) begin
	dotslice_dottile9_dotunit37_out_stream_e <= 8'd0;
	dotslice_dottile9_dotunit37_out_stream_w <= 8'd0;
	dotunit37_next_state <= 2'd0;
	dotslice_dottile9_dotunit37_weight_dotunit37_next_value0 <= 8'd0;
	dotslice_dottile9_dotunit37_weight_dotunit37_next_value_ce0 <= 1'd0;
	dotslice_dottile9_dotunit37_sum_dotunit37_next_value1 <= 16'd0;
	dotslice_dottile9_dotunit37_sum_dotunit37_next_value_ce1 <= 1'd0;
	dotunit37_next_state <= dotunit37_state;
	case (dotunit37_state)
		1'd1: begin
			if (dotslice_dottile9_dotunit37_in_stream_w_valid) begin
				dotslice_dottile9_dotunit37_weight_dotunit37_next_value0 <= dotslice_dottile9_dotunit37_in_stream_w;
				dotslice_dottile9_dotunit37_weight_dotunit37_next_value_ce0 <= 1'd1;
				dotunit37_next_state <= 1'd0;
			end
			if (dotslice_dottile9_dotunit37_in_stream_e_valid) begin
				dotslice_dottile9_dotunit37_out_stream_e <= dotslice_dottile9_dotunit37_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile9_dotunit37_in_stream_w_valid) begin
				dotslice_dottile9_dotunit37_sum_dotunit37_next_value1 <= (dotslice_dottile9_dotunit37_sum + (dotslice_dottile9_dotunit37_in_stream_w * dotslice_dottile9_dotunit37_in_weight));
				dotslice_dottile9_dotunit37_sum_dotunit37_next_value_ce1 <= 1'd1;
				dotslice_dottile9_dotunit37_out_stream_w <= dotslice_dottile9_dotunit37_in_stream_w;
			end
			if (dotslice_dottile9_dotunit37_in_stream_e_valid) begin
				dotslice_dottile9_dotunit37_out_stream_e <= dotslice_dottile9_dotunit37_in_stream_e;
			end
			dotunit37_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile9_dotunit37_out_stream_e <= dotslice_dottile9_dotunit37_sum;
			if (dotslice_dottile9_dotunit37_in_stream_w_valid) begin
				dotslice_dottile9_dotunit37_out_stream_w <= dotslice_dottile9_dotunit37_in_stream_w;
			end
			dotunit37_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile9_dotunit37_in_stream_w_valid) begin
				dotslice_dottile9_dotunit37_out_stream_w <= dotslice_dottile9_dotunit37_in_stream_w;
			end
			if (dotslice_dottile9_dotunit37_in_stream_e_valid) begin
				dotslice_dottile9_dotunit37_out_stream_e <= dotslice_dottile9_dotunit37_in_stream_e;
			end
			dotunit37_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_87 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_88;
// synthesis translate_on
always @(*) begin
	dotslice_dottile9_dotunit38_out_stream_e <= 8'd0;
	dotslice_dottile9_dotunit38_out_stream_w <= 8'd0;
	dotunit38_next_state <= 2'd0;
	dotslice_dottile9_dotunit38_weight_dotunit38_next_value0 <= 8'd0;
	dotslice_dottile9_dotunit38_weight_dotunit38_next_value_ce0 <= 1'd0;
	dotslice_dottile9_dotunit38_sum_dotunit38_next_value1 <= 16'd0;
	dotslice_dottile9_dotunit38_sum_dotunit38_next_value_ce1 <= 1'd0;
	dotunit38_next_state <= dotunit38_state;
	case (dotunit38_state)
		1'd1: begin
			if (dotslice_dottile9_dotunit38_in_stream_w_valid) begin
				dotslice_dottile9_dotunit38_weight_dotunit38_next_value0 <= dotslice_dottile9_dotunit38_in_stream_w;
				dotslice_dottile9_dotunit38_weight_dotunit38_next_value_ce0 <= 1'd1;
				dotunit38_next_state <= 1'd0;
			end
			if (dotslice_dottile9_dotunit38_in_stream_e_valid) begin
				dotslice_dottile9_dotunit38_out_stream_e <= dotslice_dottile9_dotunit38_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile9_dotunit38_in_stream_w_valid) begin
				dotslice_dottile9_dotunit38_sum_dotunit38_next_value1 <= (dotslice_dottile9_dotunit38_sum + (dotslice_dottile9_dotunit38_in_stream_w * dotslice_dottile9_dotunit38_in_weight));
				dotslice_dottile9_dotunit38_sum_dotunit38_next_value_ce1 <= 1'd1;
				dotslice_dottile9_dotunit38_out_stream_w <= dotslice_dottile9_dotunit38_in_stream_w;
			end
			if (dotslice_dottile9_dotunit38_in_stream_e_valid) begin
				dotslice_dottile9_dotunit38_out_stream_e <= dotslice_dottile9_dotunit38_in_stream_e;
			end
			dotunit38_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile9_dotunit38_out_stream_e <= dotslice_dottile9_dotunit38_sum;
			if (dotslice_dottile9_dotunit38_in_stream_w_valid) begin
				dotslice_dottile9_dotunit38_out_stream_w <= dotslice_dottile9_dotunit38_in_stream_w;
			end
			dotunit38_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile9_dotunit38_in_stream_w_valid) begin
				dotslice_dottile9_dotunit38_out_stream_w <= dotslice_dottile9_dotunit38_in_stream_w;
			end
			if (dotslice_dottile9_dotunit38_in_stream_e_valid) begin
				dotslice_dottile9_dotunit38_out_stream_e <= dotslice_dottile9_dotunit38_in_stream_e;
			end
			dotunit38_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_88 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_89;
// synthesis translate_on
always @(*) begin
	dotslice_dottile9_dotunit39_out_stream_e <= 8'd0;
	dotslice_dottile9_dotunit39_out_stream_w <= 8'd0;
	dotunit39_next_state <= 2'd0;
	dotslice_dottile9_dotunit39_weight_dotunit39_next_value0 <= 8'd0;
	dotslice_dottile9_dotunit39_weight_dotunit39_next_value_ce0 <= 1'd0;
	dotslice_dottile9_dotunit39_sum_dotunit39_next_value1 <= 16'd0;
	dotslice_dottile9_dotunit39_sum_dotunit39_next_value_ce1 <= 1'd0;
	dotunit39_next_state <= dotunit39_state;
	case (dotunit39_state)
		1'd1: begin
			if (dotslice_dottile9_dotunit39_in_stream_w_valid) begin
				dotslice_dottile9_dotunit39_weight_dotunit39_next_value0 <= dotslice_dottile9_dotunit39_in_stream_w;
				dotslice_dottile9_dotunit39_weight_dotunit39_next_value_ce0 <= 1'd1;
				dotunit39_next_state <= 1'd0;
			end
			if (dotslice_dottile9_dotunit39_in_stream_e_valid) begin
				dotslice_dottile9_dotunit39_out_stream_e <= dotslice_dottile9_dotunit39_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile9_dotunit39_in_stream_w_valid) begin
				dotslice_dottile9_dotunit39_sum_dotunit39_next_value1 <= (dotslice_dottile9_dotunit39_sum + (dotslice_dottile9_dotunit39_in_stream_w * dotslice_dottile9_dotunit39_in_weight));
				dotslice_dottile9_dotunit39_sum_dotunit39_next_value_ce1 <= 1'd1;
				dotslice_dottile9_dotunit39_out_stream_w <= dotslice_dottile9_dotunit39_in_stream_w;
			end
			if (dotslice_dottile9_dotunit39_in_stream_e_valid) begin
				dotslice_dottile9_dotunit39_out_stream_e <= dotslice_dottile9_dotunit39_in_stream_e;
			end
			dotunit39_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile9_dotunit39_out_stream_e <= dotslice_dottile9_dotunit39_sum;
			if (dotslice_dottile9_dotunit39_in_stream_w_valid) begin
				dotslice_dottile9_dotunit39_out_stream_w <= dotslice_dottile9_dotunit39_in_stream_w;
			end
			dotunit39_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile9_dotunit39_in_stream_w_valid) begin
				dotslice_dottile9_dotunit39_out_stream_w <= dotslice_dottile9_dotunit39_in_stream_w;
			end
			if (dotslice_dottile9_dotunit39_in_stream_e_valid) begin
				dotslice_dottile9_dotunit39_out_stream_e <= dotslice_dottile9_dotunit39_in_stream_e;
			end
			dotunit39_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_89 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_90;
// synthesis translate_on
always @(*) begin
	fsm9_next_state <= 2'd0;
	dotslice_dottile9_out_stream_w_valid_fsm9_next_value0 <= 1'd0;
	dotslice_dottile9_out_stream_w_valid_fsm9_next_value_ce0 <= 1'd0;
	dotslice_dottile9_out_stream_e_valid_fsm9_next_value1 <= 1'd0;
	dotslice_dottile9_out_stream_e_valid_fsm9_next_value_ce1 <= 1'd0;
	fsm9_next_state <= fsm9_state;
	case (fsm9_state)
		1'd1: begin
			if (dotslice_dottile9_in_stream_w_valid) begin
				fsm9_next_state <= 1'd0;
			end
			dotslice_dottile9_out_stream_e_valid_fsm9_next_value1 <= dotslice_dottile9_in_stream_e_valid;
			dotslice_dottile9_out_stream_e_valid_fsm9_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile9_out_stream_w_valid_fsm9_next_value0 <= dotslice_dottile9_in_stream_w_valid;
			dotslice_dottile9_out_stream_w_valid_fsm9_next_value_ce0 <= 1'd1;
			dotslice_dottile9_out_stream_e_valid_fsm9_next_value1 <= dotslice_dottile9_in_stream_e_valid;
			dotslice_dottile9_out_stream_e_valid_fsm9_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile9_out_stream_w_valid_fsm9_next_value0 <= dotslice_dottile9_in_stream_w_valid;
			dotslice_dottile9_out_stream_w_valid_fsm9_next_value_ce0 <= 1'd1;
			dotslice_dottile9_out_stream_e_valid_fsm9_next_value1 <= 1'd1;
			dotslice_dottile9_out_stream_e_valid_fsm9_next_value_ce1 <= 1'd1;
			fsm9_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile9_out_stream_w_valid_fsm9_next_value0 <= dotslice_dottile9_in_stream_w_valid;
			dotslice_dottile9_out_stream_w_valid_fsm9_next_value_ce0 <= 1'd1;
			dotslice_dottile9_out_stream_e_valid_fsm9_next_value1 <= dotslice_dottile9_in_stream_e_valid;
			dotslice_dottile9_out_stream_e_valid_fsm9_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_90 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile10_dotunit40_in_stream_w = dotslice_dottile10_in_stream_w[7:0];
assign dotslice_dottile10_dotunit40_in_stream_w_valid = dotslice_dottile10_in_stream_w_valid;
assign dotslice_dottile10_dotunit40_in_stream_e = dotslice_dottile10_in_stream_e[7:0];
assign dotslice_dottile10_dotunit40_in_stream_e_valid = dotslice_dottile10_in_stream_e_valid;
assign dotslice_dottile10_dotunit40_in_weight = dotslice_dottile10_in_weight;
assign dotslice_dottile100 = dotslice_dottile10_dotunit40_out_weight;
assign dotslice_dottile10_dotunit41_in_stream_w = dotslice_dottile10_in_stream_w[15:8];
assign dotslice_dottile10_dotunit41_in_stream_w_valid = dotslice_dottile10_in_stream_w_valid;
assign dotslice_dottile10_dotunit41_in_stream_e = dotslice_dottile10_in_stream_e[15:8];
assign dotslice_dottile10_dotunit41_in_stream_e_valid = dotslice_dottile10_in_stream_e_valid;
assign dotslice_dottile10_dotunit41_in_weight = dotslice_dottile100;
assign dotslice_dottile101 = dotslice_dottile10_dotunit41_out_weight;
assign dotslice_dottile10_dotunit42_in_stream_w = dotslice_dottile10_in_stream_w[23:16];
assign dotslice_dottile10_dotunit42_in_stream_w_valid = dotslice_dottile10_in_stream_w_valid;
assign dotslice_dottile10_dotunit42_in_stream_e = dotslice_dottile10_in_stream_e[23:16];
assign dotslice_dottile10_dotunit42_in_stream_e_valid = dotslice_dottile10_in_stream_e_valid;
assign dotslice_dottile10_dotunit42_in_weight = dotslice_dottile101;
assign dotslice_dottile102 = dotslice_dottile10_dotunit42_out_weight;
assign dotslice_dottile10_dotunit43_in_stream_w = dotslice_dottile10_in_stream_w[31:24];
assign dotslice_dottile10_dotunit43_in_stream_w_valid = dotslice_dottile10_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_91;
// synthesis translate_on
always @(*) begin
	dotslice_dottile10_out_stream_e <= 32'd0;
	dotslice_dottile10_out_stream_e[7:0] <= dotslice_dottile10_dotunit40_out_stream_e;
	dotslice_dottile10_out_stream_e[15:8] <= dotslice_dottile10_dotunit41_out_stream_e;
	dotslice_dottile10_out_stream_e[23:16] <= dotslice_dottile10_dotunit42_out_stream_e;
	dotslice_dottile10_out_stream_e[31:24] <= dotslice_dottile10_dotunit43_out_stream_e;
// synthesis translate_off
	dummy_d_91 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_92;
// synthesis translate_on
always @(*) begin
	dotslice_dottile10_out_stream_w <= 32'd0;
	dotslice_dottile10_out_stream_w[7:0] <= dotslice_dottile10_dotunit40_out_stream_w;
	dotslice_dottile10_out_stream_w[15:8] <= dotslice_dottile10_dotunit41_out_stream_w;
	dotslice_dottile10_out_stream_w[23:16] <= dotslice_dottile10_dotunit42_out_stream_w;
	dotslice_dottile10_out_stream_w[31:24] <= dotslice_dottile10_dotunit43_out_stream_w;
// synthesis translate_off
	dummy_d_92 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile10_dotunit43_in_stream_e = dotslice_dottile10_in_stream_e[31:24];
assign dotslice_dottile10_dotunit43_in_stream_e_valid = dotslice_dottile10_in_stream_e_valid;
assign dotslice_dottile10_dotunit43_in_weight = dotslice_dottile102;
assign dotslice_dottile103 = dotslice_dottile10_dotunit43_out_weight;

// synthesis translate_off
reg dummy_d_93;
// synthesis translate_on
always @(*) begin
	dotslice_dottile10_dotunit40_out_stream_e <= 8'd0;
	dotslice_dottile10_dotunit40_out_stream_w <= 8'd0;
	dotunit40_next_state <= 2'd0;
	dotslice_dottile10_dotunit40_weight_dotunit40_next_value0 <= 8'd0;
	dotslice_dottile10_dotunit40_weight_dotunit40_next_value_ce0 <= 1'd0;
	dotslice_dottile10_dotunit40_sum_dotunit40_next_value1 <= 16'd0;
	dotslice_dottile10_dotunit40_sum_dotunit40_next_value_ce1 <= 1'd0;
	dotunit40_next_state <= dotunit40_state;
	case (dotunit40_state)
		1'd1: begin
			if (dotslice_dottile10_dotunit40_in_stream_w_valid) begin
				dotslice_dottile10_dotunit40_weight_dotunit40_next_value0 <= dotslice_dottile10_dotunit40_in_stream_w;
				dotslice_dottile10_dotunit40_weight_dotunit40_next_value_ce0 <= 1'd1;
				dotunit40_next_state <= 1'd0;
			end
			if (dotslice_dottile10_dotunit40_in_stream_e_valid) begin
				dotslice_dottile10_dotunit40_out_stream_e <= dotslice_dottile10_dotunit40_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile10_dotunit40_in_stream_w_valid) begin
				dotslice_dottile10_dotunit40_sum_dotunit40_next_value1 <= (dotslice_dottile10_dotunit40_sum + (dotslice_dottile10_dotunit40_in_stream_w * dotslice_dottile10_dotunit40_in_weight));
				dotslice_dottile10_dotunit40_sum_dotunit40_next_value_ce1 <= 1'd1;
				dotslice_dottile10_dotunit40_out_stream_w <= dotslice_dottile10_dotunit40_in_stream_w;
			end
			if (dotslice_dottile10_dotunit40_in_stream_e_valid) begin
				dotslice_dottile10_dotunit40_out_stream_e <= dotslice_dottile10_dotunit40_in_stream_e;
			end
			dotunit40_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile10_dotunit40_out_stream_e <= dotslice_dottile10_dotunit40_sum;
			if (dotslice_dottile10_dotunit40_in_stream_w_valid) begin
				dotslice_dottile10_dotunit40_out_stream_w <= dotslice_dottile10_dotunit40_in_stream_w;
			end
			dotunit40_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile10_dotunit40_in_stream_w_valid) begin
				dotslice_dottile10_dotunit40_out_stream_w <= dotslice_dottile10_dotunit40_in_stream_w;
			end
			if (dotslice_dottile10_dotunit40_in_stream_e_valid) begin
				dotslice_dottile10_dotunit40_out_stream_e <= dotslice_dottile10_dotunit40_in_stream_e;
			end
			dotunit40_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_93 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_94;
// synthesis translate_on
always @(*) begin
	dotslice_dottile10_dotunit41_out_stream_e <= 8'd0;
	dotslice_dottile10_dotunit41_out_stream_w <= 8'd0;
	dotunit41_next_state <= 2'd0;
	dotslice_dottile10_dotunit41_weight_dotunit41_next_value0 <= 8'd0;
	dotslice_dottile10_dotunit41_weight_dotunit41_next_value_ce0 <= 1'd0;
	dotslice_dottile10_dotunit41_sum_dotunit41_next_value1 <= 16'd0;
	dotslice_dottile10_dotunit41_sum_dotunit41_next_value_ce1 <= 1'd0;
	dotunit41_next_state <= dotunit41_state;
	case (dotunit41_state)
		1'd1: begin
			if (dotslice_dottile10_dotunit41_in_stream_w_valid) begin
				dotslice_dottile10_dotunit41_weight_dotunit41_next_value0 <= dotslice_dottile10_dotunit41_in_stream_w;
				dotslice_dottile10_dotunit41_weight_dotunit41_next_value_ce0 <= 1'd1;
				dotunit41_next_state <= 1'd0;
			end
			if (dotslice_dottile10_dotunit41_in_stream_e_valid) begin
				dotslice_dottile10_dotunit41_out_stream_e <= dotslice_dottile10_dotunit41_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile10_dotunit41_in_stream_w_valid) begin
				dotslice_dottile10_dotunit41_sum_dotunit41_next_value1 <= (dotslice_dottile10_dotunit41_sum + (dotslice_dottile10_dotunit41_in_stream_w * dotslice_dottile10_dotunit41_in_weight));
				dotslice_dottile10_dotunit41_sum_dotunit41_next_value_ce1 <= 1'd1;
				dotslice_dottile10_dotunit41_out_stream_w <= dotslice_dottile10_dotunit41_in_stream_w;
			end
			if (dotslice_dottile10_dotunit41_in_stream_e_valid) begin
				dotslice_dottile10_dotunit41_out_stream_e <= dotslice_dottile10_dotunit41_in_stream_e;
			end
			dotunit41_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile10_dotunit41_out_stream_e <= dotslice_dottile10_dotunit41_sum;
			if (dotslice_dottile10_dotunit41_in_stream_w_valid) begin
				dotslice_dottile10_dotunit41_out_stream_w <= dotslice_dottile10_dotunit41_in_stream_w;
			end
			dotunit41_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile10_dotunit41_in_stream_w_valid) begin
				dotslice_dottile10_dotunit41_out_stream_w <= dotslice_dottile10_dotunit41_in_stream_w;
			end
			if (dotslice_dottile10_dotunit41_in_stream_e_valid) begin
				dotslice_dottile10_dotunit41_out_stream_e <= dotslice_dottile10_dotunit41_in_stream_e;
			end
			dotunit41_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_94 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_95;
// synthesis translate_on
always @(*) begin
	dotslice_dottile10_dotunit42_out_stream_e <= 8'd0;
	dotslice_dottile10_dotunit42_out_stream_w <= 8'd0;
	dotunit42_next_state <= 2'd0;
	dotslice_dottile10_dotunit42_weight_dotunit42_next_value0 <= 8'd0;
	dotslice_dottile10_dotunit42_weight_dotunit42_next_value_ce0 <= 1'd0;
	dotslice_dottile10_dotunit42_sum_dotunit42_next_value1 <= 16'd0;
	dotslice_dottile10_dotunit42_sum_dotunit42_next_value_ce1 <= 1'd0;
	dotunit42_next_state <= dotunit42_state;
	case (dotunit42_state)
		1'd1: begin
			if (dotslice_dottile10_dotunit42_in_stream_w_valid) begin
				dotslice_dottile10_dotunit42_weight_dotunit42_next_value0 <= dotslice_dottile10_dotunit42_in_stream_w;
				dotslice_dottile10_dotunit42_weight_dotunit42_next_value_ce0 <= 1'd1;
				dotunit42_next_state <= 1'd0;
			end
			if (dotslice_dottile10_dotunit42_in_stream_e_valid) begin
				dotslice_dottile10_dotunit42_out_stream_e <= dotslice_dottile10_dotunit42_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile10_dotunit42_in_stream_w_valid) begin
				dotslice_dottile10_dotunit42_sum_dotunit42_next_value1 <= (dotslice_dottile10_dotunit42_sum + (dotslice_dottile10_dotunit42_in_stream_w * dotslice_dottile10_dotunit42_in_weight));
				dotslice_dottile10_dotunit42_sum_dotunit42_next_value_ce1 <= 1'd1;
				dotslice_dottile10_dotunit42_out_stream_w <= dotslice_dottile10_dotunit42_in_stream_w;
			end
			if (dotslice_dottile10_dotunit42_in_stream_e_valid) begin
				dotslice_dottile10_dotunit42_out_stream_e <= dotslice_dottile10_dotunit42_in_stream_e;
			end
			dotunit42_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile10_dotunit42_out_stream_e <= dotslice_dottile10_dotunit42_sum;
			if (dotslice_dottile10_dotunit42_in_stream_w_valid) begin
				dotslice_dottile10_dotunit42_out_stream_w <= dotslice_dottile10_dotunit42_in_stream_w;
			end
			dotunit42_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile10_dotunit42_in_stream_w_valid) begin
				dotslice_dottile10_dotunit42_out_stream_w <= dotslice_dottile10_dotunit42_in_stream_w;
			end
			if (dotslice_dottile10_dotunit42_in_stream_e_valid) begin
				dotslice_dottile10_dotunit42_out_stream_e <= dotslice_dottile10_dotunit42_in_stream_e;
			end
			dotunit42_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_95 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_96;
// synthesis translate_on
always @(*) begin
	dotslice_dottile10_dotunit43_out_stream_e <= 8'd0;
	dotslice_dottile10_dotunit43_out_stream_w <= 8'd0;
	dotunit43_next_state <= 2'd0;
	dotslice_dottile10_dotunit43_weight_dotunit43_next_value0 <= 8'd0;
	dotslice_dottile10_dotunit43_weight_dotunit43_next_value_ce0 <= 1'd0;
	dotslice_dottile10_dotunit43_sum_dotunit43_next_value1 <= 16'd0;
	dotslice_dottile10_dotunit43_sum_dotunit43_next_value_ce1 <= 1'd0;
	dotunit43_next_state <= dotunit43_state;
	case (dotunit43_state)
		1'd1: begin
			if (dotslice_dottile10_dotunit43_in_stream_w_valid) begin
				dotslice_dottile10_dotunit43_weight_dotunit43_next_value0 <= dotslice_dottile10_dotunit43_in_stream_w;
				dotslice_dottile10_dotunit43_weight_dotunit43_next_value_ce0 <= 1'd1;
				dotunit43_next_state <= 1'd0;
			end
			if (dotslice_dottile10_dotunit43_in_stream_e_valid) begin
				dotslice_dottile10_dotunit43_out_stream_e <= dotslice_dottile10_dotunit43_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile10_dotunit43_in_stream_w_valid) begin
				dotslice_dottile10_dotunit43_sum_dotunit43_next_value1 <= (dotslice_dottile10_dotunit43_sum + (dotslice_dottile10_dotunit43_in_stream_w * dotslice_dottile10_dotunit43_in_weight));
				dotslice_dottile10_dotunit43_sum_dotunit43_next_value_ce1 <= 1'd1;
				dotslice_dottile10_dotunit43_out_stream_w <= dotslice_dottile10_dotunit43_in_stream_w;
			end
			if (dotslice_dottile10_dotunit43_in_stream_e_valid) begin
				dotslice_dottile10_dotunit43_out_stream_e <= dotslice_dottile10_dotunit43_in_stream_e;
			end
			dotunit43_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile10_dotunit43_out_stream_e <= dotslice_dottile10_dotunit43_sum;
			if (dotslice_dottile10_dotunit43_in_stream_w_valid) begin
				dotslice_dottile10_dotunit43_out_stream_w <= dotslice_dottile10_dotunit43_in_stream_w;
			end
			dotunit43_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile10_dotunit43_in_stream_w_valid) begin
				dotslice_dottile10_dotunit43_out_stream_w <= dotslice_dottile10_dotunit43_in_stream_w;
			end
			if (dotslice_dottile10_dotunit43_in_stream_e_valid) begin
				dotslice_dottile10_dotunit43_out_stream_e <= dotslice_dottile10_dotunit43_in_stream_e;
			end
			dotunit43_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_96 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_97;
// synthesis translate_on
always @(*) begin
	fsm10_next_state <= 2'd0;
	dotslice_dottile10_out_stream_w_valid_fsm10_next_value0 <= 1'd0;
	dotslice_dottile10_out_stream_w_valid_fsm10_next_value_ce0 <= 1'd0;
	dotslice_dottile10_out_stream_e_valid_fsm10_next_value1 <= 1'd0;
	dotslice_dottile10_out_stream_e_valid_fsm10_next_value_ce1 <= 1'd0;
	fsm10_next_state <= fsm10_state;
	case (fsm10_state)
		1'd1: begin
			if (dotslice_dottile10_in_stream_w_valid) begin
				fsm10_next_state <= 1'd0;
			end
			dotslice_dottile10_out_stream_e_valid_fsm10_next_value1 <= dotslice_dottile10_in_stream_e_valid;
			dotslice_dottile10_out_stream_e_valid_fsm10_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile10_out_stream_w_valid_fsm10_next_value0 <= dotslice_dottile10_in_stream_w_valid;
			dotslice_dottile10_out_stream_w_valid_fsm10_next_value_ce0 <= 1'd1;
			dotslice_dottile10_out_stream_e_valid_fsm10_next_value1 <= dotslice_dottile10_in_stream_e_valid;
			dotslice_dottile10_out_stream_e_valid_fsm10_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile10_out_stream_w_valid_fsm10_next_value0 <= dotslice_dottile10_in_stream_w_valid;
			dotslice_dottile10_out_stream_w_valid_fsm10_next_value_ce0 <= 1'd1;
			dotslice_dottile10_out_stream_e_valid_fsm10_next_value1 <= 1'd1;
			dotslice_dottile10_out_stream_e_valid_fsm10_next_value_ce1 <= 1'd1;
			fsm10_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile10_out_stream_w_valid_fsm10_next_value0 <= dotslice_dottile10_in_stream_w_valid;
			dotslice_dottile10_out_stream_w_valid_fsm10_next_value_ce0 <= 1'd1;
			dotslice_dottile10_out_stream_e_valid_fsm10_next_value1 <= dotslice_dottile10_in_stream_e_valid;
			dotslice_dottile10_out_stream_e_valid_fsm10_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_97 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile11_dotunit44_in_stream_w = dotslice_dottile11_in_stream_w[7:0];
assign dotslice_dottile11_dotunit44_in_stream_w_valid = dotslice_dottile11_in_stream_w_valid;
assign dotslice_dottile11_dotunit44_in_stream_e = dotslice_dottile11_in_stream_e[7:0];
assign dotslice_dottile11_dotunit44_in_stream_e_valid = dotslice_dottile11_in_stream_e_valid;
assign dotslice_dottile11_dotunit44_in_weight = dotslice_dottile11_in_weight;
assign dotslice_dottile110 = dotslice_dottile11_dotunit44_out_weight;
assign dotslice_dottile11_dotunit45_in_stream_w = dotslice_dottile11_in_stream_w[15:8];
assign dotslice_dottile11_dotunit45_in_stream_w_valid = dotslice_dottile11_in_stream_w_valid;
assign dotslice_dottile11_dotunit45_in_stream_e = dotslice_dottile11_in_stream_e[15:8];
assign dotslice_dottile11_dotunit45_in_stream_e_valid = dotslice_dottile11_in_stream_e_valid;
assign dotslice_dottile11_dotunit45_in_weight = dotslice_dottile110;
assign dotslice_dottile111 = dotslice_dottile11_dotunit45_out_weight;
assign dotslice_dottile11_dotunit46_in_stream_w = dotslice_dottile11_in_stream_w[23:16];
assign dotslice_dottile11_dotunit46_in_stream_w_valid = dotslice_dottile11_in_stream_w_valid;
assign dotslice_dottile11_dotunit46_in_stream_e = dotslice_dottile11_in_stream_e[23:16];
assign dotslice_dottile11_dotunit46_in_stream_e_valid = dotslice_dottile11_in_stream_e_valid;
assign dotslice_dottile11_dotunit46_in_weight = dotslice_dottile111;
assign dotslice_dottile112 = dotslice_dottile11_dotunit46_out_weight;
assign dotslice_dottile11_dotunit47_in_stream_w = dotslice_dottile11_in_stream_w[31:24];
assign dotslice_dottile11_dotunit47_in_stream_w_valid = dotslice_dottile11_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_98;
// synthesis translate_on
always @(*) begin
	dotslice_dottile11_out_stream_e <= 32'd0;
	dotslice_dottile11_out_stream_e[7:0] <= dotslice_dottile11_dotunit44_out_stream_e;
	dotslice_dottile11_out_stream_e[15:8] <= dotslice_dottile11_dotunit45_out_stream_e;
	dotslice_dottile11_out_stream_e[23:16] <= dotslice_dottile11_dotunit46_out_stream_e;
	dotslice_dottile11_out_stream_e[31:24] <= dotslice_dottile11_dotunit47_out_stream_e;
// synthesis translate_off
	dummy_d_98 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_99;
// synthesis translate_on
always @(*) begin
	dotslice_dottile11_out_stream_w <= 32'd0;
	dotslice_dottile11_out_stream_w[7:0] <= dotslice_dottile11_dotunit44_out_stream_w;
	dotslice_dottile11_out_stream_w[15:8] <= dotslice_dottile11_dotunit45_out_stream_w;
	dotslice_dottile11_out_stream_w[23:16] <= dotslice_dottile11_dotunit46_out_stream_w;
	dotslice_dottile11_out_stream_w[31:24] <= dotslice_dottile11_dotunit47_out_stream_w;
// synthesis translate_off
	dummy_d_99 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile11_dotunit47_in_stream_e = dotslice_dottile11_in_stream_e[31:24];
assign dotslice_dottile11_dotunit47_in_stream_e_valid = dotslice_dottile11_in_stream_e_valid;
assign dotslice_dottile11_dotunit47_in_weight = dotslice_dottile112;
assign dotslice_dottile113 = dotslice_dottile11_dotunit47_out_weight;

// synthesis translate_off
reg dummy_d_100;
// synthesis translate_on
always @(*) begin
	dotslice_dottile11_dotunit44_out_stream_e <= 8'd0;
	dotslice_dottile11_dotunit44_out_stream_w <= 8'd0;
	dotunit44_next_state <= 2'd0;
	dotslice_dottile11_dotunit44_weight_dotunit44_next_value0 <= 8'd0;
	dotslice_dottile11_dotunit44_weight_dotunit44_next_value_ce0 <= 1'd0;
	dotslice_dottile11_dotunit44_sum_dotunit44_next_value1 <= 16'd0;
	dotslice_dottile11_dotunit44_sum_dotunit44_next_value_ce1 <= 1'd0;
	dotunit44_next_state <= dotunit44_state;
	case (dotunit44_state)
		1'd1: begin
			if (dotslice_dottile11_dotunit44_in_stream_w_valid) begin
				dotslice_dottile11_dotunit44_weight_dotunit44_next_value0 <= dotslice_dottile11_dotunit44_in_stream_w;
				dotslice_dottile11_dotunit44_weight_dotunit44_next_value_ce0 <= 1'd1;
				dotunit44_next_state <= 1'd0;
			end
			if (dotslice_dottile11_dotunit44_in_stream_e_valid) begin
				dotslice_dottile11_dotunit44_out_stream_e <= dotslice_dottile11_dotunit44_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile11_dotunit44_in_stream_w_valid) begin
				dotslice_dottile11_dotunit44_sum_dotunit44_next_value1 <= (dotslice_dottile11_dotunit44_sum + (dotslice_dottile11_dotunit44_in_stream_w * dotslice_dottile11_dotunit44_in_weight));
				dotslice_dottile11_dotunit44_sum_dotunit44_next_value_ce1 <= 1'd1;
				dotslice_dottile11_dotunit44_out_stream_w <= dotslice_dottile11_dotunit44_in_stream_w;
			end
			if (dotslice_dottile11_dotunit44_in_stream_e_valid) begin
				dotslice_dottile11_dotunit44_out_stream_e <= dotslice_dottile11_dotunit44_in_stream_e;
			end
			dotunit44_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile11_dotunit44_out_stream_e <= dotslice_dottile11_dotunit44_sum;
			if (dotslice_dottile11_dotunit44_in_stream_w_valid) begin
				dotslice_dottile11_dotunit44_out_stream_w <= dotslice_dottile11_dotunit44_in_stream_w;
			end
			dotunit44_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile11_dotunit44_in_stream_w_valid) begin
				dotslice_dottile11_dotunit44_out_stream_w <= dotslice_dottile11_dotunit44_in_stream_w;
			end
			if (dotslice_dottile11_dotunit44_in_stream_e_valid) begin
				dotslice_dottile11_dotunit44_out_stream_e <= dotslice_dottile11_dotunit44_in_stream_e;
			end
			dotunit44_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_100 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_101;
// synthesis translate_on
always @(*) begin
	dotslice_dottile11_dotunit45_out_stream_e <= 8'd0;
	dotslice_dottile11_dotunit45_out_stream_w <= 8'd0;
	dotunit45_next_state <= 2'd0;
	dotslice_dottile11_dotunit45_weight_dotunit45_next_value0 <= 8'd0;
	dotslice_dottile11_dotunit45_weight_dotunit45_next_value_ce0 <= 1'd0;
	dotslice_dottile11_dotunit45_sum_dotunit45_next_value1 <= 16'd0;
	dotslice_dottile11_dotunit45_sum_dotunit45_next_value_ce1 <= 1'd0;
	dotunit45_next_state <= dotunit45_state;
	case (dotunit45_state)
		1'd1: begin
			if (dotslice_dottile11_dotunit45_in_stream_w_valid) begin
				dotslice_dottile11_dotunit45_weight_dotunit45_next_value0 <= dotslice_dottile11_dotunit45_in_stream_w;
				dotslice_dottile11_dotunit45_weight_dotunit45_next_value_ce0 <= 1'd1;
				dotunit45_next_state <= 1'd0;
			end
			if (dotslice_dottile11_dotunit45_in_stream_e_valid) begin
				dotslice_dottile11_dotunit45_out_stream_e <= dotslice_dottile11_dotunit45_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile11_dotunit45_in_stream_w_valid) begin
				dotslice_dottile11_dotunit45_sum_dotunit45_next_value1 <= (dotslice_dottile11_dotunit45_sum + (dotslice_dottile11_dotunit45_in_stream_w * dotslice_dottile11_dotunit45_in_weight));
				dotslice_dottile11_dotunit45_sum_dotunit45_next_value_ce1 <= 1'd1;
				dotslice_dottile11_dotunit45_out_stream_w <= dotslice_dottile11_dotunit45_in_stream_w;
			end
			if (dotslice_dottile11_dotunit45_in_stream_e_valid) begin
				dotslice_dottile11_dotunit45_out_stream_e <= dotslice_dottile11_dotunit45_in_stream_e;
			end
			dotunit45_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile11_dotunit45_out_stream_e <= dotslice_dottile11_dotunit45_sum;
			if (dotslice_dottile11_dotunit45_in_stream_w_valid) begin
				dotslice_dottile11_dotunit45_out_stream_w <= dotslice_dottile11_dotunit45_in_stream_w;
			end
			dotunit45_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile11_dotunit45_in_stream_w_valid) begin
				dotslice_dottile11_dotunit45_out_stream_w <= dotslice_dottile11_dotunit45_in_stream_w;
			end
			if (dotslice_dottile11_dotunit45_in_stream_e_valid) begin
				dotslice_dottile11_dotunit45_out_stream_e <= dotslice_dottile11_dotunit45_in_stream_e;
			end
			dotunit45_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_101 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_102;
// synthesis translate_on
always @(*) begin
	dotslice_dottile11_dotunit46_out_stream_e <= 8'd0;
	dotslice_dottile11_dotunit46_out_stream_w <= 8'd0;
	dotunit46_next_state <= 2'd0;
	dotslice_dottile11_dotunit46_weight_dotunit46_next_value0 <= 8'd0;
	dotslice_dottile11_dotunit46_weight_dotunit46_next_value_ce0 <= 1'd0;
	dotslice_dottile11_dotunit46_sum_dotunit46_next_value1 <= 16'd0;
	dotslice_dottile11_dotunit46_sum_dotunit46_next_value_ce1 <= 1'd0;
	dotunit46_next_state <= dotunit46_state;
	case (dotunit46_state)
		1'd1: begin
			if (dotslice_dottile11_dotunit46_in_stream_w_valid) begin
				dotslice_dottile11_dotunit46_weight_dotunit46_next_value0 <= dotslice_dottile11_dotunit46_in_stream_w;
				dotslice_dottile11_dotunit46_weight_dotunit46_next_value_ce0 <= 1'd1;
				dotunit46_next_state <= 1'd0;
			end
			if (dotslice_dottile11_dotunit46_in_stream_e_valid) begin
				dotslice_dottile11_dotunit46_out_stream_e <= dotslice_dottile11_dotunit46_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile11_dotunit46_in_stream_w_valid) begin
				dotslice_dottile11_dotunit46_sum_dotunit46_next_value1 <= (dotslice_dottile11_dotunit46_sum + (dotslice_dottile11_dotunit46_in_stream_w * dotslice_dottile11_dotunit46_in_weight));
				dotslice_dottile11_dotunit46_sum_dotunit46_next_value_ce1 <= 1'd1;
				dotslice_dottile11_dotunit46_out_stream_w <= dotslice_dottile11_dotunit46_in_stream_w;
			end
			if (dotslice_dottile11_dotunit46_in_stream_e_valid) begin
				dotslice_dottile11_dotunit46_out_stream_e <= dotslice_dottile11_dotunit46_in_stream_e;
			end
			dotunit46_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile11_dotunit46_out_stream_e <= dotslice_dottile11_dotunit46_sum;
			if (dotslice_dottile11_dotunit46_in_stream_w_valid) begin
				dotslice_dottile11_dotunit46_out_stream_w <= dotslice_dottile11_dotunit46_in_stream_w;
			end
			dotunit46_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile11_dotunit46_in_stream_w_valid) begin
				dotslice_dottile11_dotunit46_out_stream_w <= dotslice_dottile11_dotunit46_in_stream_w;
			end
			if (dotslice_dottile11_dotunit46_in_stream_e_valid) begin
				dotslice_dottile11_dotunit46_out_stream_e <= dotslice_dottile11_dotunit46_in_stream_e;
			end
			dotunit46_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_102 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_103;
// synthesis translate_on
always @(*) begin
	dotslice_dottile11_dotunit47_out_stream_e <= 8'd0;
	dotslice_dottile11_dotunit47_out_stream_w <= 8'd0;
	dotunit47_next_state <= 2'd0;
	dotslice_dottile11_dotunit47_weight_dotunit47_next_value0 <= 8'd0;
	dotslice_dottile11_dotunit47_weight_dotunit47_next_value_ce0 <= 1'd0;
	dotslice_dottile11_dotunit47_sum_dotunit47_next_value1 <= 16'd0;
	dotslice_dottile11_dotunit47_sum_dotunit47_next_value_ce1 <= 1'd0;
	dotunit47_next_state <= dotunit47_state;
	case (dotunit47_state)
		1'd1: begin
			if (dotslice_dottile11_dotunit47_in_stream_w_valid) begin
				dotslice_dottile11_dotunit47_weight_dotunit47_next_value0 <= dotslice_dottile11_dotunit47_in_stream_w;
				dotslice_dottile11_dotunit47_weight_dotunit47_next_value_ce0 <= 1'd1;
				dotunit47_next_state <= 1'd0;
			end
			if (dotslice_dottile11_dotunit47_in_stream_e_valid) begin
				dotslice_dottile11_dotunit47_out_stream_e <= dotslice_dottile11_dotunit47_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile11_dotunit47_in_stream_w_valid) begin
				dotslice_dottile11_dotunit47_sum_dotunit47_next_value1 <= (dotslice_dottile11_dotunit47_sum + (dotslice_dottile11_dotunit47_in_stream_w * dotslice_dottile11_dotunit47_in_weight));
				dotslice_dottile11_dotunit47_sum_dotunit47_next_value_ce1 <= 1'd1;
				dotslice_dottile11_dotunit47_out_stream_w <= dotslice_dottile11_dotunit47_in_stream_w;
			end
			if (dotslice_dottile11_dotunit47_in_stream_e_valid) begin
				dotslice_dottile11_dotunit47_out_stream_e <= dotslice_dottile11_dotunit47_in_stream_e;
			end
			dotunit47_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile11_dotunit47_out_stream_e <= dotslice_dottile11_dotunit47_sum;
			if (dotslice_dottile11_dotunit47_in_stream_w_valid) begin
				dotslice_dottile11_dotunit47_out_stream_w <= dotslice_dottile11_dotunit47_in_stream_w;
			end
			dotunit47_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile11_dotunit47_in_stream_w_valid) begin
				dotslice_dottile11_dotunit47_out_stream_w <= dotslice_dottile11_dotunit47_in_stream_w;
			end
			if (dotslice_dottile11_dotunit47_in_stream_e_valid) begin
				dotslice_dottile11_dotunit47_out_stream_e <= dotslice_dottile11_dotunit47_in_stream_e;
			end
			dotunit47_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_103 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_104;
// synthesis translate_on
always @(*) begin
	fsm11_next_state <= 2'd0;
	dotslice_dottile11_out_stream_w_valid_fsm11_next_value0 <= 1'd0;
	dotslice_dottile11_out_stream_w_valid_fsm11_next_value_ce0 <= 1'd0;
	dotslice_dottile11_out_stream_e_valid_fsm11_next_value1 <= 1'd0;
	dotslice_dottile11_out_stream_e_valid_fsm11_next_value_ce1 <= 1'd0;
	fsm11_next_state <= fsm11_state;
	case (fsm11_state)
		1'd1: begin
			if (dotslice_dottile11_in_stream_w_valid) begin
				fsm11_next_state <= 1'd0;
			end
			dotslice_dottile11_out_stream_e_valid_fsm11_next_value1 <= dotslice_dottile11_in_stream_e_valid;
			dotslice_dottile11_out_stream_e_valid_fsm11_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile11_out_stream_w_valid_fsm11_next_value0 <= dotslice_dottile11_in_stream_w_valid;
			dotslice_dottile11_out_stream_w_valid_fsm11_next_value_ce0 <= 1'd1;
			dotslice_dottile11_out_stream_e_valid_fsm11_next_value1 <= dotslice_dottile11_in_stream_e_valid;
			dotslice_dottile11_out_stream_e_valid_fsm11_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile11_out_stream_w_valid_fsm11_next_value0 <= dotslice_dottile11_in_stream_w_valid;
			dotslice_dottile11_out_stream_w_valid_fsm11_next_value_ce0 <= 1'd1;
			dotslice_dottile11_out_stream_e_valid_fsm11_next_value1 <= 1'd1;
			dotslice_dottile11_out_stream_e_valid_fsm11_next_value_ce1 <= 1'd1;
			fsm11_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile11_out_stream_w_valid_fsm11_next_value0 <= dotslice_dottile11_in_stream_w_valid;
			dotslice_dottile11_out_stream_w_valid_fsm11_next_value_ce0 <= 1'd1;
			dotslice_dottile11_out_stream_e_valid_fsm11_next_value1 <= dotslice_dottile11_in_stream_e_valid;
			dotslice_dottile11_out_stream_e_valid_fsm11_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_104 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile12_dotunit48_in_stream_w = dotslice_dottile12_in_stream_w[7:0];
assign dotslice_dottile12_dotunit48_in_stream_w_valid = dotslice_dottile12_in_stream_w_valid;
assign dotslice_dottile12_dotunit48_in_stream_e = dotslice_dottile12_in_stream_e[7:0];
assign dotslice_dottile12_dotunit48_in_stream_e_valid = dotslice_dottile12_in_stream_e_valid;
assign dotslice_dottile12_dotunit48_in_weight = dotslice_dottile12_in_weight;
assign dotslice_dottile120 = dotslice_dottile12_dotunit48_out_weight;
assign dotslice_dottile12_dotunit49_in_stream_w = dotslice_dottile12_in_stream_w[15:8];
assign dotslice_dottile12_dotunit49_in_stream_w_valid = dotslice_dottile12_in_stream_w_valid;
assign dotslice_dottile12_dotunit49_in_stream_e = dotslice_dottile12_in_stream_e[15:8];
assign dotslice_dottile12_dotunit49_in_stream_e_valid = dotslice_dottile12_in_stream_e_valid;
assign dotslice_dottile12_dotunit49_in_weight = dotslice_dottile120;
assign dotslice_dottile121 = dotslice_dottile12_dotunit49_out_weight;
assign dotslice_dottile12_dotunit50_in_stream_w = dotslice_dottile12_in_stream_w[23:16];
assign dotslice_dottile12_dotunit50_in_stream_w_valid = dotslice_dottile12_in_stream_w_valid;
assign dotslice_dottile12_dotunit50_in_stream_e = dotslice_dottile12_in_stream_e[23:16];
assign dotslice_dottile12_dotunit50_in_stream_e_valid = dotslice_dottile12_in_stream_e_valid;
assign dotslice_dottile12_dotunit50_in_weight = dotslice_dottile121;
assign dotslice_dottile122 = dotslice_dottile12_dotunit50_out_weight;
assign dotslice_dottile12_dotunit51_in_stream_w = dotslice_dottile12_in_stream_w[31:24];
assign dotslice_dottile12_dotunit51_in_stream_w_valid = dotslice_dottile12_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_105;
// synthesis translate_on
always @(*) begin
	dotslice_dottile12_out_stream_e <= 32'd0;
	dotslice_dottile12_out_stream_e[7:0] <= dotslice_dottile12_dotunit48_out_stream_e;
	dotslice_dottile12_out_stream_e[15:8] <= dotslice_dottile12_dotunit49_out_stream_e;
	dotslice_dottile12_out_stream_e[23:16] <= dotslice_dottile12_dotunit50_out_stream_e;
	dotslice_dottile12_out_stream_e[31:24] <= dotslice_dottile12_dotunit51_out_stream_e;
// synthesis translate_off
	dummy_d_105 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_106;
// synthesis translate_on
always @(*) begin
	dotslice_dottile12_out_stream_w <= 32'd0;
	dotslice_dottile12_out_stream_w[7:0] <= dotslice_dottile12_dotunit48_out_stream_w;
	dotslice_dottile12_out_stream_w[15:8] <= dotslice_dottile12_dotunit49_out_stream_w;
	dotslice_dottile12_out_stream_w[23:16] <= dotslice_dottile12_dotunit50_out_stream_w;
	dotslice_dottile12_out_stream_w[31:24] <= dotslice_dottile12_dotunit51_out_stream_w;
// synthesis translate_off
	dummy_d_106 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile12_dotunit51_in_stream_e = dotslice_dottile12_in_stream_e[31:24];
assign dotslice_dottile12_dotunit51_in_stream_e_valid = dotslice_dottile12_in_stream_e_valid;
assign dotslice_dottile12_dotunit51_in_weight = dotslice_dottile122;
assign dotslice_dottile123 = dotslice_dottile12_dotunit51_out_weight;

// synthesis translate_off
reg dummy_d_107;
// synthesis translate_on
always @(*) begin
	dotslice_dottile12_dotunit48_out_stream_e <= 8'd0;
	dotslice_dottile12_dotunit48_out_stream_w <= 8'd0;
	dotunit48_next_state <= 2'd0;
	dotslice_dottile12_dotunit48_weight_dotunit48_next_value0 <= 8'd0;
	dotslice_dottile12_dotunit48_weight_dotunit48_next_value_ce0 <= 1'd0;
	dotslice_dottile12_dotunit48_sum_dotunit48_next_value1 <= 16'd0;
	dotslice_dottile12_dotunit48_sum_dotunit48_next_value_ce1 <= 1'd0;
	dotunit48_next_state <= dotunit48_state;
	case (dotunit48_state)
		1'd1: begin
			if (dotslice_dottile12_dotunit48_in_stream_w_valid) begin
				dotslice_dottile12_dotunit48_weight_dotunit48_next_value0 <= dotslice_dottile12_dotunit48_in_stream_w;
				dotslice_dottile12_dotunit48_weight_dotunit48_next_value_ce0 <= 1'd1;
				dotunit48_next_state <= 1'd0;
			end
			if (dotslice_dottile12_dotunit48_in_stream_e_valid) begin
				dotslice_dottile12_dotunit48_out_stream_e <= dotslice_dottile12_dotunit48_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile12_dotunit48_in_stream_w_valid) begin
				dotslice_dottile12_dotunit48_sum_dotunit48_next_value1 <= (dotslice_dottile12_dotunit48_sum + (dotslice_dottile12_dotunit48_in_stream_w * dotslice_dottile12_dotunit48_in_weight));
				dotslice_dottile12_dotunit48_sum_dotunit48_next_value_ce1 <= 1'd1;
				dotslice_dottile12_dotunit48_out_stream_w <= dotslice_dottile12_dotunit48_in_stream_w;
			end
			if (dotslice_dottile12_dotunit48_in_stream_e_valid) begin
				dotslice_dottile12_dotunit48_out_stream_e <= dotslice_dottile12_dotunit48_in_stream_e;
			end
			dotunit48_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile12_dotunit48_out_stream_e <= dotslice_dottile12_dotunit48_sum;
			if (dotslice_dottile12_dotunit48_in_stream_w_valid) begin
				dotslice_dottile12_dotunit48_out_stream_w <= dotslice_dottile12_dotunit48_in_stream_w;
			end
			dotunit48_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile12_dotunit48_in_stream_w_valid) begin
				dotslice_dottile12_dotunit48_out_stream_w <= dotslice_dottile12_dotunit48_in_stream_w;
			end
			if (dotslice_dottile12_dotunit48_in_stream_e_valid) begin
				dotslice_dottile12_dotunit48_out_stream_e <= dotslice_dottile12_dotunit48_in_stream_e;
			end
			dotunit48_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_107 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_108;
// synthesis translate_on
always @(*) begin
	dotslice_dottile12_dotunit49_out_stream_e <= 8'd0;
	dotslice_dottile12_dotunit49_out_stream_w <= 8'd0;
	dotunit49_next_state <= 2'd0;
	dotslice_dottile12_dotunit49_weight_dotunit49_next_value0 <= 8'd0;
	dotslice_dottile12_dotunit49_weight_dotunit49_next_value_ce0 <= 1'd0;
	dotslice_dottile12_dotunit49_sum_dotunit49_next_value1 <= 16'd0;
	dotslice_dottile12_dotunit49_sum_dotunit49_next_value_ce1 <= 1'd0;
	dotunit49_next_state <= dotunit49_state;
	case (dotunit49_state)
		1'd1: begin
			if (dotslice_dottile12_dotunit49_in_stream_w_valid) begin
				dotslice_dottile12_dotunit49_weight_dotunit49_next_value0 <= dotslice_dottile12_dotunit49_in_stream_w;
				dotslice_dottile12_dotunit49_weight_dotunit49_next_value_ce0 <= 1'd1;
				dotunit49_next_state <= 1'd0;
			end
			if (dotslice_dottile12_dotunit49_in_stream_e_valid) begin
				dotslice_dottile12_dotunit49_out_stream_e <= dotslice_dottile12_dotunit49_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile12_dotunit49_in_stream_w_valid) begin
				dotslice_dottile12_dotunit49_sum_dotunit49_next_value1 <= (dotslice_dottile12_dotunit49_sum + (dotslice_dottile12_dotunit49_in_stream_w * dotslice_dottile12_dotunit49_in_weight));
				dotslice_dottile12_dotunit49_sum_dotunit49_next_value_ce1 <= 1'd1;
				dotslice_dottile12_dotunit49_out_stream_w <= dotslice_dottile12_dotunit49_in_stream_w;
			end
			if (dotslice_dottile12_dotunit49_in_stream_e_valid) begin
				dotslice_dottile12_dotunit49_out_stream_e <= dotslice_dottile12_dotunit49_in_stream_e;
			end
			dotunit49_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile12_dotunit49_out_stream_e <= dotslice_dottile12_dotunit49_sum;
			if (dotslice_dottile12_dotunit49_in_stream_w_valid) begin
				dotslice_dottile12_dotunit49_out_stream_w <= dotslice_dottile12_dotunit49_in_stream_w;
			end
			dotunit49_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile12_dotunit49_in_stream_w_valid) begin
				dotslice_dottile12_dotunit49_out_stream_w <= dotslice_dottile12_dotunit49_in_stream_w;
			end
			if (dotslice_dottile12_dotunit49_in_stream_e_valid) begin
				dotslice_dottile12_dotunit49_out_stream_e <= dotslice_dottile12_dotunit49_in_stream_e;
			end
			dotunit49_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_108 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_109;
// synthesis translate_on
always @(*) begin
	dotslice_dottile12_dotunit50_out_stream_e <= 8'd0;
	dotslice_dottile12_dotunit50_out_stream_w <= 8'd0;
	dotunit50_next_state <= 2'd0;
	dotslice_dottile12_dotunit50_weight_dotunit50_next_value0 <= 8'd0;
	dotslice_dottile12_dotunit50_weight_dotunit50_next_value_ce0 <= 1'd0;
	dotslice_dottile12_dotunit50_sum_dotunit50_next_value1 <= 16'd0;
	dotslice_dottile12_dotunit50_sum_dotunit50_next_value_ce1 <= 1'd0;
	dotunit50_next_state <= dotunit50_state;
	case (dotunit50_state)
		1'd1: begin
			if (dotslice_dottile12_dotunit50_in_stream_w_valid) begin
				dotslice_dottile12_dotunit50_weight_dotunit50_next_value0 <= dotslice_dottile12_dotunit50_in_stream_w;
				dotslice_dottile12_dotunit50_weight_dotunit50_next_value_ce0 <= 1'd1;
				dotunit50_next_state <= 1'd0;
			end
			if (dotslice_dottile12_dotunit50_in_stream_e_valid) begin
				dotslice_dottile12_dotunit50_out_stream_e <= dotslice_dottile12_dotunit50_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile12_dotunit50_in_stream_w_valid) begin
				dotslice_dottile12_dotunit50_sum_dotunit50_next_value1 <= (dotslice_dottile12_dotunit50_sum + (dotslice_dottile12_dotunit50_in_stream_w * dotslice_dottile12_dotunit50_in_weight));
				dotslice_dottile12_dotunit50_sum_dotunit50_next_value_ce1 <= 1'd1;
				dotslice_dottile12_dotunit50_out_stream_w <= dotslice_dottile12_dotunit50_in_stream_w;
			end
			if (dotslice_dottile12_dotunit50_in_stream_e_valid) begin
				dotslice_dottile12_dotunit50_out_stream_e <= dotslice_dottile12_dotunit50_in_stream_e;
			end
			dotunit50_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile12_dotunit50_out_stream_e <= dotslice_dottile12_dotunit50_sum;
			if (dotslice_dottile12_dotunit50_in_stream_w_valid) begin
				dotslice_dottile12_dotunit50_out_stream_w <= dotslice_dottile12_dotunit50_in_stream_w;
			end
			dotunit50_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile12_dotunit50_in_stream_w_valid) begin
				dotslice_dottile12_dotunit50_out_stream_w <= dotslice_dottile12_dotunit50_in_stream_w;
			end
			if (dotslice_dottile12_dotunit50_in_stream_e_valid) begin
				dotslice_dottile12_dotunit50_out_stream_e <= dotslice_dottile12_dotunit50_in_stream_e;
			end
			dotunit50_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_109 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_110;
// synthesis translate_on
always @(*) begin
	dotslice_dottile12_dotunit51_out_stream_e <= 8'd0;
	dotslice_dottile12_dotunit51_out_stream_w <= 8'd0;
	dotunit51_next_state <= 2'd0;
	dotslice_dottile12_dotunit51_weight_dotunit51_next_value0 <= 8'd0;
	dotslice_dottile12_dotunit51_weight_dotunit51_next_value_ce0 <= 1'd0;
	dotslice_dottile12_dotunit51_sum_dotunit51_next_value1 <= 16'd0;
	dotslice_dottile12_dotunit51_sum_dotunit51_next_value_ce1 <= 1'd0;
	dotunit51_next_state <= dotunit51_state;
	case (dotunit51_state)
		1'd1: begin
			if (dotslice_dottile12_dotunit51_in_stream_w_valid) begin
				dotslice_dottile12_dotunit51_weight_dotunit51_next_value0 <= dotslice_dottile12_dotunit51_in_stream_w;
				dotslice_dottile12_dotunit51_weight_dotunit51_next_value_ce0 <= 1'd1;
				dotunit51_next_state <= 1'd0;
			end
			if (dotslice_dottile12_dotunit51_in_stream_e_valid) begin
				dotslice_dottile12_dotunit51_out_stream_e <= dotslice_dottile12_dotunit51_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile12_dotunit51_in_stream_w_valid) begin
				dotslice_dottile12_dotunit51_sum_dotunit51_next_value1 <= (dotslice_dottile12_dotunit51_sum + (dotslice_dottile12_dotunit51_in_stream_w * dotslice_dottile12_dotunit51_in_weight));
				dotslice_dottile12_dotunit51_sum_dotunit51_next_value_ce1 <= 1'd1;
				dotslice_dottile12_dotunit51_out_stream_w <= dotslice_dottile12_dotunit51_in_stream_w;
			end
			if (dotslice_dottile12_dotunit51_in_stream_e_valid) begin
				dotslice_dottile12_dotunit51_out_stream_e <= dotslice_dottile12_dotunit51_in_stream_e;
			end
			dotunit51_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile12_dotunit51_out_stream_e <= dotslice_dottile12_dotunit51_sum;
			if (dotslice_dottile12_dotunit51_in_stream_w_valid) begin
				dotslice_dottile12_dotunit51_out_stream_w <= dotslice_dottile12_dotunit51_in_stream_w;
			end
			dotunit51_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile12_dotunit51_in_stream_w_valid) begin
				dotslice_dottile12_dotunit51_out_stream_w <= dotslice_dottile12_dotunit51_in_stream_w;
			end
			if (dotslice_dottile12_dotunit51_in_stream_e_valid) begin
				dotslice_dottile12_dotunit51_out_stream_e <= dotslice_dottile12_dotunit51_in_stream_e;
			end
			dotunit51_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_110 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_111;
// synthesis translate_on
always @(*) begin
	fsm12_next_state <= 2'd0;
	dotslice_dottile12_out_stream_w_valid_fsm12_next_value0 <= 1'd0;
	dotslice_dottile12_out_stream_w_valid_fsm12_next_value_ce0 <= 1'd0;
	dotslice_dottile12_out_stream_e_valid_fsm12_next_value1 <= 1'd0;
	dotslice_dottile12_out_stream_e_valid_fsm12_next_value_ce1 <= 1'd0;
	fsm12_next_state <= fsm12_state;
	case (fsm12_state)
		1'd1: begin
			if (dotslice_dottile12_in_stream_w_valid) begin
				fsm12_next_state <= 1'd0;
			end
			dotslice_dottile12_out_stream_e_valid_fsm12_next_value1 <= dotslice_dottile12_in_stream_e_valid;
			dotslice_dottile12_out_stream_e_valid_fsm12_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile12_out_stream_w_valid_fsm12_next_value0 <= dotslice_dottile12_in_stream_w_valid;
			dotslice_dottile12_out_stream_w_valid_fsm12_next_value_ce0 <= 1'd1;
			dotslice_dottile12_out_stream_e_valid_fsm12_next_value1 <= dotslice_dottile12_in_stream_e_valid;
			dotslice_dottile12_out_stream_e_valid_fsm12_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile12_out_stream_w_valid_fsm12_next_value0 <= dotslice_dottile12_in_stream_w_valid;
			dotslice_dottile12_out_stream_w_valid_fsm12_next_value_ce0 <= 1'd1;
			dotslice_dottile12_out_stream_e_valid_fsm12_next_value1 <= 1'd1;
			dotslice_dottile12_out_stream_e_valid_fsm12_next_value_ce1 <= 1'd1;
			fsm12_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile12_out_stream_w_valid_fsm12_next_value0 <= dotslice_dottile12_in_stream_w_valid;
			dotslice_dottile12_out_stream_w_valid_fsm12_next_value_ce0 <= 1'd1;
			dotslice_dottile12_out_stream_e_valid_fsm12_next_value1 <= dotslice_dottile12_in_stream_e_valid;
			dotslice_dottile12_out_stream_e_valid_fsm12_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_111 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile13_dotunit52_in_stream_w = dotslice_dottile13_in_stream_w[7:0];
assign dotslice_dottile13_dotunit52_in_stream_w_valid = dotslice_dottile13_in_stream_w_valid;
assign dotslice_dottile13_dotunit52_in_stream_e = dotslice_dottile13_in_stream_e[7:0];
assign dotslice_dottile13_dotunit52_in_stream_e_valid = dotslice_dottile13_in_stream_e_valid;
assign dotslice_dottile13_dotunit52_in_weight = dotslice_dottile13_in_weight;
assign dotslice_dottile130 = dotslice_dottile13_dotunit52_out_weight;
assign dotslice_dottile13_dotunit53_in_stream_w = dotslice_dottile13_in_stream_w[15:8];
assign dotslice_dottile13_dotunit53_in_stream_w_valid = dotslice_dottile13_in_stream_w_valid;
assign dotslice_dottile13_dotunit53_in_stream_e = dotslice_dottile13_in_stream_e[15:8];
assign dotslice_dottile13_dotunit53_in_stream_e_valid = dotslice_dottile13_in_stream_e_valid;
assign dotslice_dottile13_dotunit53_in_weight = dotslice_dottile130;
assign dotslice_dottile131 = dotslice_dottile13_dotunit53_out_weight;
assign dotslice_dottile13_dotunit54_in_stream_w = dotslice_dottile13_in_stream_w[23:16];
assign dotslice_dottile13_dotunit54_in_stream_w_valid = dotslice_dottile13_in_stream_w_valid;
assign dotslice_dottile13_dotunit54_in_stream_e = dotslice_dottile13_in_stream_e[23:16];
assign dotslice_dottile13_dotunit54_in_stream_e_valid = dotslice_dottile13_in_stream_e_valid;
assign dotslice_dottile13_dotunit54_in_weight = dotslice_dottile131;
assign dotslice_dottile132 = dotslice_dottile13_dotunit54_out_weight;
assign dotslice_dottile13_dotunit55_in_stream_w = dotslice_dottile13_in_stream_w[31:24];
assign dotslice_dottile13_dotunit55_in_stream_w_valid = dotslice_dottile13_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_112;
// synthesis translate_on
always @(*) begin
	dotslice_dottile13_out_stream_e <= 32'd0;
	dotslice_dottile13_out_stream_e[7:0] <= dotslice_dottile13_dotunit52_out_stream_e;
	dotslice_dottile13_out_stream_e[15:8] <= dotslice_dottile13_dotunit53_out_stream_e;
	dotslice_dottile13_out_stream_e[23:16] <= dotslice_dottile13_dotunit54_out_stream_e;
	dotslice_dottile13_out_stream_e[31:24] <= dotslice_dottile13_dotunit55_out_stream_e;
// synthesis translate_off
	dummy_d_112 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_113;
// synthesis translate_on
always @(*) begin
	dotslice_dottile13_out_stream_w <= 32'd0;
	dotslice_dottile13_out_stream_w[7:0] <= dotslice_dottile13_dotunit52_out_stream_w;
	dotslice_dottile13_out_stream_w[15:8] <= dotslice_dottile13_dotunit53_out_stream_w;
	dotslice_dottile13_out_stream_w[23:16] <= dotslice_dottile13_dotunit54_out_stream_w;
	dotslice_dottile13_out_stream_w[31:24] <= dotslice_dottile13_dotunit55_out_stream_w;
// synthesis translate_off
	dummy_d_113 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile13_dotunit55_in_stream_e = dotslice_dottile13_in_stream_e[31:24];
assign dotslice_dottile13_dotunit55_in_stream_e_valid = dotslice_dottile13_in_stream_e_valid;
assign dotslice_dottile13_dotunit55_in_weight = dotslice_dottile132;
assign dotslice_dottile133 = dotslice_dottile13_dotunit55_out_weight;

// synthesis translate_off
reg dummy_d_114;
// synthesis translate_on
always @(*) begin
	dotslice_dottile13_dotunit52_out_stream_e <= 8'd0;
	dotslice_dottile13_dotunit52_out_stream_w <= 8'd0;
	dotunit52_next_state <= 2'd0;
	dotslice_dottile13_dotunit52_weight_dotunit52_next_value0 <= 8'd0;
	dotslice_dottile13_dotunit52_weight_dotunit52_next_value_ce0 <= 1'd0;
	dotslice_dottile13_dotunit52_sum_dotunit52_next_value1 <= 16'd0;
	dotslice_dottile13_dotunit52_sum_dotunit52_next_value_ce1 <= 1'd0;
	dotunit52_next_state <= dotunit52_state;
	case (dotunit52_state)
		1'd1: begin
			if (dotslice_dottile13_dotunit52_in_stream_w_valid) begin
				dotslice_dottile13_dotunit52_weight_dotunit52_next_value0 <= dotslice_dottile13_dotunit52_in_stream_w;
				dotslice_dottile13_dotunit52_weight_dotunit52_next_value_ce0 <= 1'd1;
				dotunit52_next_state <= 1'd0;
			end
			if (dotslice_dottile13_dotunit52_in_stream_e_valid) begin
				dotslice_dottile13_dotunit52_out_stream_e <= dotslice_dottile13_dotunit52_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile13_dotunit52_in_stream_w_valid) begin
				dotslice_dottile13_dotunit52_sum_dotunit52_next_value1 <= (dotslice_dottile13_dotunit52_sum + (dotslice_dottile13_dotunit52_in_stream_w * dotslice_dottile13_dotunit52_in_weight));
				dotslice_dottile13_dotunit52_sum_dotunit52_next_value_ce1 <= 1'd1;
				dotslice_dottile13_dotunit52_out_stream_w <= dotslice_dottile13_dotunit52_in_stream_w;
			end
			if (dotslice_dottile13_dotunit52_in_stream_e_valid) begin
				dotslice_dottile13_dotunit52_out_stream_e <= dotslice_dottile13_dotunit52_in_stream_e;
			end
			dotunit52_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile13_dotunit52_out_stream_e <= dotslice_dottile13_dotunit52_sum;
			if (dotslice_dottile13_dotunit52_in_stream_w_valid) begin
				dotslice_dottile13_dotunit52_out_stream_w <= dotslice_dottile13_dotunit52_in_stream_w;
			end
			dotunit52_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile13_dotunit52_in_stream_w_valid) begin
				dotslice_dottile13_dotunit52_out_stream_w <= dotslice_dottile13_dotunit52_in_stream_w;
			end
			if (dotslice_dottile13_dotunit52_in_stream_e_valid) begin
				dotslice_dottile13_dotunit52_out_stream_e <= dotslice_dottile13_dotunit52_in_stream_e;
			end
			dotunit52_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_114 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_115;
// synthesis translate_on
always @(*) begin
	dotslice_dottile13_dotunit53_out_stream_e <= 8'd0;
	dotslice_dottile13_dotunit53_out_stream_w <= 8'd0;
	dotunit53_next_state <= 2'd0;
	dotslice_dottile13_dotunit53_weight_dotunit53_next_value0 <= 8'd0;
	dotslice_dottile13_dotunit53_weight_dotunit53_next_value_ce0 <= 1'd0;
	dotslice_dottile13_dotunit53_sum_dotunit53_next_value1 <= 16'd0;
	dotslice_dottile13_dotunit53_sum_dotunit53_next_value_ce1 <= 1'd0;
	dotunit53_next_state <= dotunit53_state;
	case (dotunit53_state)
		1'd1: begin
			if (dotslice_dottile13_dotunit53_in_stream_w_valid) begin
				dotslice_dottile13_dotunit53_weight_dotunit53_next_value0 <= dotslice_dottile13_dotunit53_in_stream_w;
				dotslice_dottile13_dotunit53_weight_dotunit53_next_value_ce0 <= 1'd1;
				dotunit53_next_state <= 1'd0;
			end
			if (dotslice_dottile13_dotunit53_in_stream_e_valid) begin
				dotslice_dottile13_dotunit53_out_stream_e <= dotslice_dottile13_dotunit53_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile13_dotunit53_in_stream_w_valid) begin
				dotslice_dottile13_dotunit53_sum_dotunit53_next_value1 <= (dotslice_dottile13_dotunit53_sum + (dotslice_dottile13_dotunit53_in_stream_w * dotslice_dottile13_dotunit53_in_weight));
				dotslice_dottile13_dotunit53_sum_dotunit53_next_value_ce1 <= 1'd1;
				dotslice_dottile13_dotunit53_out_stream_w <= dotslice_dottile13_dotunit53_in_stream_w;
			end
			if (dotslice_dottile13_dotunit53_in_stream_e_valid) begin
				dotslice_dottile13_dotunit53_out_stream_e <= dotslice_dottile13_dotunit53_in_stream_e;
			end
			dotunit53_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile13_dotunit53_out_stream_e <= dotslice_dottile13_dotunit53_sum;
			if (dotslice_dottile13_dotunit53_in_stream_w_valid) begin
				dotslice_dottile13_dotunit53_out_stream_w <= dotslice_dottile13_dotunit53_in_stream_w;
			end
			dotunit53_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile13_dotunit53_in_stream_w_valid) begin
				dotslice_dottile13_dotunit53_out_stream_w <= dotslice_dottile13_dotunit53_in_stream_w;
			end
			if (dotslice_dottile13_dotunit53_in_stream_e_valid) begin
				dotslice_dottile13_dotunit53_out_stream_e <= dotslice_dottile13_dotunit53_in_stream_e;
			end
			dotunit53_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_115 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_116;
// synthesis translate_on
always @(*) begin
	dotslice_dottile13_dotunit54_out_stream_e <= 8'd0;
	dotslice_dottile13_dotunit54_out_stream_w <= 8'd0;
	dotunit54_next_state <= 2'd0;
	dotslice_dottile13_dotunit54_weight_dotunit54_next_value0 <= 8'd0;
	dotslice_dottile13_dotunit54_weight_dotunit54_next_value_ce0 <= 1'd0;
	dotslice_dottile13_dotunit54_sum_dotunit54_next_value1 <= 16'd0;
	dotslice_dottile13_dotunit54_sum_dotunit54_next_value_ce1 <= 1'd0;
	dotunit54_next_state <= dotunit54_state;
	case (dotunit54_state)
		1'd1: begin
			if (dotslice_dottile13_dotunit54_in_stream_w_valid) begin
				dotslice_dottile13_dotunit54_weight_dotunit54_next_value0 <= dotslice_dottile13_dotunit54_in_stream_w;
				dotslice_dottile13_dotunit54_weight_dotunit54_next_value_ce0 <= 1'd1;
				dotunit54_next_state <= 1'd0;
			end
			if (dotslice_dottile13_dotunit54_in_stream_e_valid) begin
				dotslice_dottile13_dotunit54_out_stream_e <= dotslice_dottile13_dotunit54_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile13_dotunit54_in_stream_w_valid) begin
				dotslice_dottile13_dotunit54_sum_dotunit54_next_value1 <= (dotslice_dottile13_dotunit54_sum + (dotslice_dottile13_dotunit54_in_stream_w * dotslice_dottile13_dotunit54_in_weight));
				dotslice_dottile13_dotunit54_sum_dotunit54_next_value_ce1 <= 1'd1;
				dotslice_dottile13_dotunit54_out_stream_w <= dotslice_dottile13_dotunit54_in_stream_w;
			end
			if (dotslice_dottile13_dotunit54_in_stream_e_valid) begin
				dotslice_dottile13_dotunit54_out_stream_e <= dotslice_dottile13_dotunit54_in_stream_e;
			end
			dotunit54_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile13_dotunit54_out_stream_e <= dotslice_dottile13_dotunit54_sum;
			if (dotslice_dottile13_dotunit54_in_stream_w_valid) begin
				dotslice_dottile13_dotunit54_out_stream_w <= dotslice_dottile13_dotunit54_in_stream_w;
			end
			dotunit54_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile13_dotunit54_in_stream_w_valid) begin
				dotslice_dottile13_dotunit54_out_stream_w <= dotslice_dottile13_dotunit54_in_stream_w;
			end
			if (dotslice_dottile13_dotunit54_in_stream_e_valid) begin
				dotslice_dottile13_dotunit54_out_stream_e <= dotslice_dottile13_dotunit54_in_stream_e;
			end
			dotunit54_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_116 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_117;
// synthesis translate_on
always @(*) begin
	dotslice_dottile13_dotunit55_out_stream_e <= 8'd0;
	dotslice_dottile13_dotunit55_out_stream_w <= 8'd0;
	dotunit55_next_state <= 2'd0;
	dotslice_dottile13_dotunit55_weight_dotunit55_next_value0 <= 8'd0;
	dotslice_dottile13_dotunit55_weight_dotunit55_next_value_ce0 <= 1'd0;
	dotslice_dottile13_dotunit55_sum_dotunit55_next_value1 <= 16'd0;
	dotslice_dottile13_dotunit55_sum_dotunit55_next_value_ce1 <= 1'd0;
	dotunit55_next_state <= dotunit55_state;
	case (dotunit55_state)
		1'd1: begin
			if (dotslice_dottile13_dotunit55_in_stream_w_valid) begin
				dotslice_dottile13_dotunit55_weight_dotunit55_next_value0 <= dotslice_dottile13_dotunit55_in_stream_w;
				dotslice_dottile13_dotunit55_weight_dotunit55_next_value_ce0 <= 1'd1;
				dotunit55_next_state <= 1'd0;
			end
			if (dotslice_dottile13_dotunit55_in_stream_e_valid) begin
				dotslice_dottile13_dotunit55_out_stream_e <= dotslice_dottile13_dotunit55_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile13_dotunit55_in_stream_w_valid) begin
				dotslice_dottile13_dotunit55_sum_dotunit55_next_value1 <= (dotslice_dottile13_dotunit55_sum + (dotslice_dottile13_dotunit55_in_stream_w * dotslice_dottile13_dotunit55_in_weight));
				dotslice_dottile13_dotunit55_sum_dotunit55_next_value_ce1 <= 1'd1;
				dotslice_dottile13_dotunit55_out_stream_w <= dotslice_dottile13_dotunit55_in_stream_w;
			end
			if (dotslice_dottile13_dotunit55_in_stream_e_valid) begin
				dotslice_dottile13_dotunit55_out_stream_e <= dotslice_dottile13_dotunit55_in_stream_e;
			end
			dotunit55_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile13_dotunit55_out_stream_e <= dotslice_dottile13_dotunit55_sum;
			if (dotslice_dottile13_dotunit55_in_stream_w_valid) begin
				dotslice_dottile13_dotunit55_out_stream_w <= dotslice_dottile13_dotunit55_in_stream_w;
			end
			dotunit55_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile13_dotunit55_in_stream_w_valid) begin
				dotslice_dottile13_dotunit55_out_stream_w <= dotslice_dottile13_dotunit55_in_stream_w;
			end
			if (dotslice_dottile13_dotunit55_in_stream_e_valid) begin
				dotslice_dottile13_dotunit55_out_stream_e <= dotslice_dottile13_dotunit55_in_stream_e;
			end
			dotunit55_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_117 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_118;
// synthesis translate_on
always @(*) begin
	fsm13_next_state <= 2'd0;
	dotslice_dottile13_out_stream_w_valid_fsm13_next_value0 <= 1'd0;
	dotslice_dottile13_out_stream_w_valid_fsm13_next_value_ce0 <= 1'd0;
	dotslice_dottile13_out_stream_e_valid_fsm13_next_value1 <= 1'd0;
	dotslice_dottile13_out_stream_e_valid_fsm13_next_value_ce1 <= 1'd0;
	fsm13_next_state <= fsm13_state;
	case (fsm13_state)
		1'd1: begin
			if (dotslice_dottile13_in_stream_w_valid) begin
				fsm13_next_state <= 1'd0;
			end
			dotslice_dottile13_out_stream_e_valid_fsm13_next_value1 <= dotslice_dottile13_in_stream_e_valid;
			dotslice_dottile13_out_stream_e_valid_fsm13_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile13_out_stream_w_valid_fsm13_next_value0 <= dotslice_dottile13_in_stream_w_valid;
			dotslice_dottile13_out_stream_w_valid_fsm13_next_value_ce0 <= 1'd1;
			dotslice_dottile13_out_stream_e_valid_fsm13_next_value1 <= dotslice_dottile13_in_stream_e_valid;
			dotslice_dottile13_out_stream_e_valid_fsm13_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile13_out_stream_w_valid_fsm13_next_value0 <= dotslice_dottile13_in_stream_w_valid;
			dotslice_dottile13_out_stream_w_valid_fsm13_next_value_ce0 <= 1'd1;
			dotslice_dottile13_out_stream_e_valid_fsm13_next_value1 <= 1'd1;
			dotslice_dottile13_out_stream_e_valid_fsm13_next_value_ce1 <= 1'd1;
			fsm13_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile13_out_stream_w_valid_fsm13_next_value0 <= dotslice_dottile13_in_stream_w_valid;
			dotslice_dottile13_out_stream_w_valid_fsm13_next_value_ce0 <= 1'd1;
			dotslice_dottile13_out_stream_e_valid_fsm13_next_value1 <= dotslice_dottile13_in_stream_e_valid;
			dotslice_dottile13_out_stream_e_valid_fsm13_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_118 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile14_dotunit56_in_stream_w = dotslice_dottile14_in_stream_w[7:0];
assign dotslice_dottile14_dotunit56_in_stream_w_valid = dotslice_dottile14_in_stream_w_valid;
assign dotslice_dottile14_dotunit56_in_stream_e = dotslice_dottile14_in_stream_e[7:0];
assign dotslice_dottile14_dotunit56_in_stream_e_valid = dotslice_dottile14_in_stream_e_valid;
assign dotslice_dottile14_dotunit56_in_weight = dotslice_dottile14_in_weight;
assign dotslice_dottile140 = dotslice_dottile14_dotunit56_out_weight;
assign dotslice_dottile14_dotunit57_in_stream_w = dotslice_dottile14_in_stream_w[15:8];
assign dotslice_dottile14_dotunit57_in_stream_w_valid = dotslice_dottile14_in_stream_w_valid;
assign dotslice_dottile14_dotunit57_in_stream_e = dotslice_dottile14_in_stream_e[15:8];
assign dotslice_dottile14_dotunit57_in_stream_e_valid = dotslice_dottile14_in_stream_e_valid;
assign dotslice_dottile14_dotunit57_in_weight = dotslice_dottile140;
assign dotslice_dottile141 = dotslice_dottile14_dotunit57_out_weight;
assign dotslice_dottile14_dotunit58_in_stream_w = dotslice_dottile14_in_stream_w[23:16];
assign dotslice_dottile14_dotunit58_in_stream_w_valid = dotslice_dottile14_in_stream_w_valid;
assign dotslice_dottile14_dotunit58_in_stream_e = dotslice_dottile14_in_stream_e[23:16];
assign dotslice_dottile14_dotunit58_in_stream_e_valid = dotslice_dottile14_in_stream_e_valid;
assign dotslice_dottile14_dotunit58_in_weight = dotslice_dottile141;
assign dotslice_dottile142 = dotslice_dottile14_dotunit58_out_weight;
assign dotslice_dottile14_dotunit59_in_stream_w = dotslice_dottile14_in_stream_w[31:24];
assign dotslice_dottile14_dotunit59_in_stream_w_valid = dotslice_dottile14_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_119;
// synthesis translate_on
always @(*) begin
	dotslice_dottile14_out_stream_e <= 32'd0;
	dotslice_dottile14_out_stream_e[7:0] <= dotslice_dottile14_dotunit56_out_stream_e;
	dotslice_dottile14_out_stream_e[15:8] <= dotslice_dottile14_dotunit57_out_stream_e;
	dotslice_dottile14_out_stream_e[23:16] <= dotslice_dottile14_dotunit58_out_stream_e;
	dotslice_dottile14_out_stream_e[31:24] <= dotslice_dottile14_dotunit59_out_stream_e;
// synthesis translate_off
	dummy_d_119 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_120;
// synthesis translate_on
always @(*) begin
	dotslice_dottile14_out_stream_w <= 32'd0;
	dotslice_dottile14_out_stream_w[7:0] <= dotslice_dottile14_dotunit56_out_stream_w;
	dotslice_dottile14_out_stream_w[15:8] <= dotslice_dottile14_dotunit57_out_stream_w;
	dotslice_dottile14_out_stream_w[23:16] <= dotslice_dottile14_dotunit58_out_stream_w;
	dotslice_dottile14_out_stream_w[31:24] <= dotslice_dottile14_dotunit59_out_stream_w;
// synthesis translate_off
	dummy_d_120 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile14_dotunit59_in_stream_e = dotslice_dottile14_in_stream_e[31:24];
assign dotslice_dottile14_dotunit59_in_stream_e_valid = dotslice_dottile14_in_stream_e_valid;
assign dotslice_dottile14_dotunit59_in_weight = dotslice_dottile142;
assign dotslice_dottile143 = dotslice_dottile14_dotunit59_out_weight;

// synthesis translate_off
reg dummy_d_121;
// synthesis translate_on
always @(*) begin
	dotslice_dottile14_dotunit56_out_stream_e <= 8'd0;
	dotslice_dottile14_dotunit56_out_stream_w <= 8'd0;
	dotunit56_next_state <= 2'd0;
	dotslice_dottile14_dotunit56_weight_dotunit56_next_value0 <= 8'd0;
	dotslice_dottile14_dotunit56_weight_dotunit56_next_value_ce0 <= 1'd0;
	dotslice_dottile14_dotunit56_sum_dotunit56_next_value1 <= 16'd0;
	dotslice_dottile14_dotunit56_sum_dotunit56_next_value_ce1 <= 1'd0;
	dotunit56_next_state <= dotunit56_state;
	case (dotunit56_state)
		1'd1: begin
			if (dotslice_dottile14_dotunit56_in_stream_w_valid) begin
				dotslice_dottile14_dotunit56_weight_dotunit56_next_value0 <= dotslice_dottile14_dotunit56_in_stream_w;
				dotslice_dottile14_dotunit56_weight_dotunit56_next_value_ce0 <= 1'd1;
				dotunit56_next_state <= 1'd0;
			end
			if (dotslice_dottile14_dotunit56_in_stream_e_valid) begin
				dotslice_dottile14_dotunit56_out_stream_e <= dotslice_dottile14_dotunit56_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile14_dotunit56_in_stream_w_valid) begin
				dotslice_dottile14_dotunit56_sum_dotunit56_next_value1 <= (dotslice_dottile14_dotunit56_sum + (dotslice_dottile14_dotunit56_in_stream_w * dotslice_dottile14_dotunit56_in_weight));
				dotslice_dottile14_dotunit56_sum_dotunit56_next_value_ce1 <= 1'd1;
				dotslice_dottile14_dotunit56_out_stream_w <= dotslice_dottile14_dotunit56_in_stream_w;
			end
			if (dotslice_dottile14_dotunit56_in_stream_e_valid) begin
				dotslice_dottile14_dotunit56_out_stream_e <= dotslice_dottile14_dotunit56_in_stream_e;
			end
			dotunit56_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile14_dotunit56_out_stream_e <= dotslice_dottile14_dotunit56_sum;
			if (dotslice_dottile14_dotunit56_in_stream_w_valid) begin
				dotslice_dottile14_dotunit56_out_stream_w <= dotslice_dottile14_dotunit56_in_stream_w;
			end
			dotunit56_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile14_dotunit56_in_stream_w_valid) begin
				dotslice_dottile14_dotunit56_out_stream_w <= dotslice_dottile14_dotunit56_in_stream_w;
			end
			if (dotslice_dottile14_dotunit56_in_stream_e_valid) begin
				dotslice_dottile14_dotunit56_out_stream_e <= dotslice_dottile14_dotunit56_in_stream_e;
			end
			dotunit56_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_121 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_122;
// synthesis translate_on
always @(*) begin
	dotslice_dottile14_dotunit57_out_stream_e <= 8'd0;
	dotslice_dottile14_dotunit57_out_stream_w <= 8'd0;
	dotunit57_next_state <= 2'd0;
	dotslice_dottile14_dotunit57_weight_dotunit57_next_value0 <= 8'd0;
	dotslice_dottile14_dotunit57_weight_dotunit57_next_value_ce0 <= 1'd0;
	dotslice_dottile14_dotunit57_sum_dotunit57_next_value1 <= 16'd0;
	dotslice_dottile14_dotunit57_sum_dotunit57_next_value_ce1 <= 1'd0;
	dotunit57_next_state <= dotunit57_state;
	case (dotunit57_state)
		1'd1: begin
			if (dotslice_dottile14_dotunit57_in_stream_w_valid) begin
				dotslice_dottile14_dotunit57_weight_dotunit57_next_value0 <= dotslice_dottile14_dotunit57_in_stream_w;
				dotslice_dottile14_dotunit57_weight_dotunit57_next_value_ce0 <= 1'd1;
				dotunit57_next_state <= 1'd0;
			end
			if (dotslice_dottile14_dotunit57_in_stream_e_valid) begin
				dotslice_dottile14_dotunit57_out_stream_e <= dotslice_dottile14_dotunit57_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile14_dotunit57_in_stream_w_valid) begin
				dotslice_dottile14_dotunit57_sum_dotunit57_next_value1 <= (dotslice_dottile14_dotunit57_sum + (dotslice_dottile14_dotunit57_in_stream_w * dotslice_dottile14_dotunit57_in_weight));
				dotslice_dottile14_dotunit57_sum_dotunit57_next_value_ce1 <= 1'd1;
				dotslice_dottile14_dotunit57_out_stream_w <= dotslice_dottile14_dotunit57_in_stream_w;
			end
			if (dotslice_dottile14_dotunit57_in_stream_e_valid) begin
				dotslice_dottile14_dotunit57_out_stream_e <= dotslice_dottile14_dotunit57_in_stream_e;
			end
			dotunit57_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile14_dotunit57_out_stream_e <= dotslice_dottile14_dotunit57_sum;
			if (dotslice_dottile14_dotunit57_in_stream_w_valid) begin
				dotslice_dottile14_dotunit57_out_stream_w <= dotslice_dottile14_dotunit57_in_stream_w;
			end
			dotunit57_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile14_dotunit57_in_stream_w_valid) begin
				dotslice_dottile14_dotunit57_out_stream_w <= dotslice_dottile14_dotunit57_in_stream_w;
			end
			if (dotslice_dottile14_dotunit57_in_stream_e_valid) begin
				dotslice_dottile14_dotunit57_out_stream_e <= dotslice_dottile14_dotunit57_in_stream_e;
			end
			dotunit57_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_122 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_123;
// synthesis translate_on
always @(*) begin
	dotslice_dottile14_dotunit58_out_stream_e <= 8'd0;
	dotslice_dottile14_dotunit58_out_stream_w <= 8'd0;
	dotunit58_next_state <= 2'd0;
	dotslice_dottile14_dotunit58_weight_dotunit58_next_value0 <= 8'd0;
	dotslice_dottile14_dotunit58_weight_dotunit58_next_value_ce0 <= 1'd0;
	dotslice_dottile14_dotunit58_sum_dotunit58_next_value1 <= 16'd0;
	dotslice_dottile14_dotunit58_sum_dotunit58_next_value_ce1 <= 1'd0;
	dotunit58_next_state <= dotunit58_state;
	case (dotunit58_state)
		1'd1: begin
			if (dotslice_dottile14_dotunit58_in_stream_w_valid) begin
				dotslice_dottile14_dotunit58_weight_dotunit58_next_value0 <= dotslice_dottile14_dotunit58_in_stream_w;
				dotslice_dottile14_dotunit58_weight_dotunit58_next_value_ce0 <= 1'd1;
				dotunit58_next_state <= 1'd0;
			end
			if (dotslice_dottile14_dotunit58_in_stream_e_valid) begin
				dotslice_dottile14_dotunit58_out_stream_e <= dotslice_dottile14_dotunit58_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile14_dotunit58_in_stream_w_valid) begin
				dotslice_dottile14_dotunit58_sum_dotunit58_next_value1 <= (dotslice_dottile14_dotunit58_sum + (dotslice_dottile14_dotunit58_in_stream_w * dotslice_dottile14_dotunit58_in_weight));
				dotslice_dottile14_dotunit58_sum_dotunit58_next_value_ce1 <= 1'd1;
				dotslice_dottile14_dotunit58_out_stream_w <= dotslice_dottile14_dotunit58_in_stream_w;
			end
			if (dotslice_dottile14_dotunit58_in_stream_e_valid) begin
				dotslice_dottile14_dotunit58_out_stream_e <= dotslice_dottile14_dotunit58_in_stream_e;
			end
			dotunit58_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile14_dotunit58_out_stream_e <= dotslice_dottile14_dotunit58_sum;
			if (dotslice_dottile14_dotunit58_in_stream_w_valid) begin
				dotslice_dottile14_dotunit58_out_stream_w <= dotslice_dottile14_dotunit58_in_stream_w;
			end
			dotunit58_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile14_dotunit58_in_stream_w_valid) begin
				dotslice_dottile14_dotunit58_out_stream_w <= dotslice_dottile14_dotunit58_in_stream_w;
			end
			if (dotslice_dottile14_dotunit58_in_stream_e_valid) begin
				dotslice_dottile14_dotunit58_out_stream_e <= dotslice_dottile14_dotunit58_in_stream_e;
			end
			dotunit58_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_123 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_124;
// synthesis translate_on
always @(*) begin
	dotslice_dottile14_dotunit59_out_stream_e <= 8'd0;
	dotslice_dottile14_dotunit59_out_stream_w <= 8'd0;
	dotunit59_next_state <= 2'd0;
	dotslice_dottile14_dotunit59_weight_dotunit59_next_value0 <= 8'd0;
	dotslice_dottile14_dotunit59_weight_dotunit59_next_value_ce0 <= 1'd0;
	dotslice_dottile14_dotunit59_sum_dotunit59_next_value1 <= 16'd0;
	dotslice_dottile14_dotunit59_sum_dotunit59_next_value_ce1 <= 1'd0;
	dotunit59_next_state <= dotunit59_state;
	case (dotunit59_state)
		1'd1: begin
			if (dotslice_dottile14_dotunit59_in_stream_w_valid) begin
				dotslice_dottile14_dotunit59_weight_dotunit59_next_value0 <= dotslice_dottile14_dotunit59_in_stream_w;
				dotslice_dottile14_dotunit59_weight_dotunit59_next_value_ce0 <= 1'd1;
				dotunit59_next_state <= 1'd0;
			end
			if (dotslice_dottile14_dotunit59_in_stream_e_valid) begin
				dotslice_dottile14_dotunit59_out_stream_e <= dotslice_dottile14_dotunit59_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile14_dotunit59_in_stream_w_valid) begin
				dotslice_dottile14_dotunit59_sum_dotunit59_next_value1 <= (dotslice_dottile14_dotunit59_sum + (dotslice_dottile14_dotunit59_in_stream_w * dotslice_dottile14_dotunit59_in_weight));
				dotslice_dottile14_dotunit59_sum_dotunit59_next_value_ce1 <= 1'd1;
				dotslice_dottile14_dotunit59_out_stream_w <= dotslice_dottile14_dotunit59_in_stream_w;
			end
			if (dotslice_dottile14_dotunit59_in_stream_e_valid) begin
				dotslice_dottile14_dotunit59_out_stream_e <= dotslice_dottile14_dotunit59_in_stream_e;
			end
			dotunit59_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile14_dotunit59_out_stream_e <= dotslice_dottile14_dotunit59_sum;
			if (dotslice_dottile14_dotunit59_in_stream_w_valid) begin
				dotslice_dottile14_dotunit59_out_stream_w <= dotslice_dottile14_dotunit59_in_stream_w;
			end
			dotunit59_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile14_dotunit59_in_stream_w_valid) begin
				dotslice_dottile14_dotunit59_out_stream_w <= dotslice_dottile14_dotunit59_in_stream_w;
			end
			if (dotslice_dottile14_dotunit59_in_stream_e_valid) begin
				dotslice_dottile14_dotunit59_out_stream_e <= dotslice_dottile14_dotunit59_in_stream_e;
			end
			dotunit59_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_124 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_125;
// synthesis translate_on
always @(*) begin
	fsm14_next_state <= 2'd0;
	dotslice_dottile14_out_stream_w_valid_fsm14_next_value0 <= 1'd0;
	dotslice_dottile14_out_stream_w_valid_fsm14_next_value_ce0 <= 1'd0;
	dotslice_dottile14_out_stream_e_valid_fsm14_next_value1 <= 1'd0;
	dotslice_dottile14_out_stream_e_valid_fsm14_next_value_ce1 <= 1'd0;
	fsm14_next_state <= fsm14_state;
	case (fsm14_state)
		1'd1: begin
			if (dotslice_dottile14_in_stream_w_valid) begin
				fsm14_next_state <= 1'd0;
			end
			dotslice_dottile14_out_stream_e_valid_fsm14_next_value1 <= dotslice_dottile14_in_stream_e_valid;
			dotslice_dottile14_out_stream_e_valid_fsm14_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile14_out_stream_w_valid_fsm14_next_value0 <= dotslice_dottile14_in_stream_w_valid;
			dotslice_dottile14_out_stream_w_valid_fsm14_next_value_ce0 <= 1'd1;
			dotslice_dottile14_out_stream_e_valid_fsm14_next_value1 <= dotslice_dottile14_in_stream_e_valid;
			dotslice_dottile14_out_stream_e_valid_fsm14_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile14_out_stream_w_valid_fsm14_next_value0 <= dotslice_dottile14_in_stream_w_valid;
			dotslice_dottile14_out_stream_w_valid_fsm14_next_value_ce0 <= 1'd1;
			dotslice_dottile14_out_stream_e_valid_fsm14_next_value1 <= 1'd1;
			dotslice_dottile14_out_stream_e_valid_fsm14_next_value_ce1 <= 1'd1;
			fsm14_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile14_out_stream_w_valid_fsm14_next_value0 <= dotslice_dottile14_in_stream_w_valid;
			dotslice_dottile14_out_stream_w_valid_fsm14_next_value_ce0 <= 1'd1;
			dotslice_dottile14_out_stream_e_valid_fsm14_next_value1 <= dotslice_dottile14_in_stream_e_valid;
			dotslice_dottile14_out_stream_e_valid_fsm14_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_125 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile15_dotunit60_in_stream_w = dotslice_dottile15_in_stream_w[7:0];
assign dotslice_dottile15_dotunit60_in_stream_w_valid = dotslice_dottile15_in_stream_w_valid;
assign dotslice_dottile15_dotunit60_in_stream_e = dotslice_dottile15_in_stream_e[7:0];
assign dotslice_dottile15_dotunit60_in_stream_e_valid = dotslice_dottile15_in_stream_e_valid;
assign dotslice_dottile15_dotunit60_in_weight = dotslice_dottile15_in_weight;
assign dotslice_dottile150 = dotslice_dottile15_dotunit60_out_weight;
assign dotslice_dottile15_dotunit61_in_stream_w = dotslice_dottile15_in_stream_w[15:8];
assign dotslice_dottile15_dotunit61_in_stream_w_valid = dotslice_dottile15_in_stream_w_valid;
assign dotslice_dottile15_dotunit61_in_stream_e = dotslice_dottile15_in_stream_e[15:8];
assign dotslice_dottile15_dotunit61_in_stream_e_valid = dotslice_dottile15_in_stream_e_valid;
assign dotslice_dottile15_dotunit61_in_weight = dotslice_dottile150;
assign dotslice_dottile151 = dotslice_dottile15_dotunit61_out_weight;
assign dotslice_dottile15_dotunit62_in_stream_w = dotslice_dottile15_in_stream_w[23:16];
assign dotslice_dottile15_dotunit62_in_stream_w_valid = dotslice_dottile15_in_stream_w_valid;
assign dotslice_dottile15_dotunit62_in_stream_e = dotslice_dottile15_in_stream_e[23:16];
assign dotslice_dottile15_dotunit62_in_stream_e_valid = dotslice_dottile15_in_stream_e_valid;
assign dotslice_dottile15_dotunit62_in_weight = dotslice_dottile151;
assign dotslice_dottile152 = dotslice_dottile15_dotunit62_out_weight;
assign dotslice_dottile15_dotunit63_in_stream_w = dotslice_dottile15_in_stream_w[31:24];
assign dotslice_dottile15_dotunit63_in_stream_w_valid = dotslice_dottile15_in_stream_w_valid;

// synthesis translate_off
reg dummy_d_126;
// synthesis translate_on
always @(*) begin
	dotslice_dottile15_out_stream_e <= 32'd0;
	dotslice_dottile15_out_stream_e[7:0] <= dotslice_dottile15_dotunit60_out_stream_e;
	dotslice_dottile15_out_stream_e[15:8] <= dotslice_dottile15_dotunit61_out_stream_e;
	dotslice_dottile15_out_stream_e[23:16] <= dotslice_dottile15_dotunit62_out_stream_e;
	dotslice_dottile15_out_stream_e[31:24] <= dotslice_dottile15_dotunit63_out_stream_e;
// synthesis translate_off
	dummy_d_126 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_127;
// synthesis translate_on
always @(*) begin
	dotslice_dottile15_out_stream_w <= 32'd0;
	dotslice_dottile15_out_stream_w[7:0] <= dotslice_dottile15_dotunit60_out_stream_w;
	dotslice_dottile15_out_stream_w[15:8] <= dotslice_dottile15_dotunit61_out_stream_w;
	dotslice_dottile15_out_stream_w[23:16] <= dotslice_dottile15_dotunit62_out_stream_w;
	dotslice_dottile15_out_stream_w[31:24] <= dotslice_dottile15_dotunit63_out_stream_w;
// synthesis translate_off
	dummy_d_127 <= dummy_s;
// synthesis translate_on
end
assign dotslice_dottile15_dotunit63_in_stream_e = dotslice_dottile15_in_stream_e[31:24];
assign dotslice_dottile15_dotunit63_in_stream_e_valid = dotslice_dottile15_in_stream_e_valid;
assign dotslice_dottile15_dotunit63_in_weight = dotslice_dottile152;
assign dotslice_dottile153 = dotslice_dottile15_dotunit63_out_weight;

// synthesis translate_off
reg dummy_d_128;
// synthesis translate_on
always @(*) begin
	dotslice_dottile15_dotunit60_out_stream_e <= 8'd0;
	dotslice_dottile15_dotunit60_out_stream_w <= 8'd0;
	dotunit60_next_state <= 2'd0;
	dotslice_dottile15_dotunit60_weight_dotunit60_next_value0 <= 8'd0;
	dotslice_dottile15_dotunit60_weight_dotunit60_next_value_ce0 <= 1'd0;
	dotslice_dottile15_dotunit60_sum_dotunit60_next_value1 <= 16'd0;
	dotslice_dottile15_dotunit60_sum_dotunit60_next_value_ce1 <= 1'd0;
	dotunit60_next_state <= dotunit60_state;
	case (dotunit60_state)
		1'd1: begin
			if (dotslice_dottile15_dotunit60_in_stream_w_valid) begin
				dotslice_dottile15_dotunit60_weight_dotunit60_next_value0 <= dotslice_dottile15_dotunit60_in_stream_w;
				dotslice_dottile15_dotunit60_weight_dotunit60_next_value_ce0 <= 1'd1;
				dotunit60_next_state <= 1'd0;
			end
			if (dotslice_dottile15_dotunit60_in_stream_e_valid) begin
				dotslice_dottile15_dotunit60_out_stream_e <= dotslice_dottile15_dotunit60_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile15_dotunit60_in_stream_w_valid) begin
				dotslice_dottile15_dotunit60_sum_dotunit60_next_value1 <= (dotslice_dottile15_dotunit60_sum + (dotslice_dottile15_dotunit60_in_stream_w * dotslice_dottile15_dotunit60_in_weight));
				dotslice_dottile15_dotunit60_sum_dotunit60_next_value_ce1 <= 1'd1;
				dotslice_dottile15_dotunit60_out_stream_w <= dotslice_dottile15_dotunit60_in_stream_w;
			end
			if (dotslice_dottile15_dotunit60_in_stream_e_valid) begin
				dotslice_dottile15_dotunit60_out_stream_e <= dotslice_dottile15_dotunit60_in_stream_e;
			end
			dotunit60_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile15_dotunit60_out_stream_e <= dotslice_dottile15_dotunit60_sum;
			if (dotslice_dottile15_dotunit60_in_stream_w_valid) begin
				dotslice_dottile15_dotunit60_out_stream_w <= dotslice_dottile15_dotunit60_in_stream_w;
			end
			dotunit60_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile15_dotunit60_in_stream_w_valid) begin
				dotslice_dottile15_dotunit60_out_stream_w <= dotslice_dottile15_dotunit60_in_stream_w;
			end
			if (dotslice_dottile15_dotunit60_in_stream_e_valid) begin
				dotslice_dottile15_dotunit60_out_stream_e <= dotslice_dottile15_dotunit60_in_stream_e;
			end
			dotunit60_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_128 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_129;
// synthesis translate_on
always @(*) begin
	dotslice_dottile15_dotunit61_out_stream_e <= 8'd0;
	dotslice_dottile15_dotunit61_out_stream_w <= 8'd0;
	dotunit61_next_state <= 2'd0;
	dotslice_dottile15_dotunit61_weight_dotunit61_next_value0 <= 8'd0;
	dotslice_dottile15_dotunit61_weight_dotunit61_next_value_ce0 <= 1'd0;
	dotslice_dottile15_dotunit61_sum_dotunit61_next_value1 <= 16'd0;
	dotslice_dottile15_dotunit61_sum_dotunit61_next_value_ce1 <= 1'd0;
	dotunit61_next_state <= dotunit61_state;
	case (dotunit61_state)
		1'd1: begin
			if (dotslice_dottile15_dotunit61_in_stream_w_valid) begin
				dotslice_dottile15_dotunit61_weight_dotunit61_next_value0 <= dotslice_dottile15_dotunit61_in_stream_w;
				dotslice_dottile15_dotunit61_weight_dotunit61_next_value_ce0 <= 1'd1;
				dotunit61_next_state <= 1'd0;
			end
			if (dotslice_dottile15_dotunit61_in_stream_e_valid) begin
				dotslice_dottile15_dotunit61_out_stream_e <= dotslice_dottile15_dotunit61_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile15_dotunit61_in_stream_w_valid) begin
				dotslice_dottile15_dotunit61_sum_dotunit61_next_value1 <= (dotslice_dottile15_dotunit61_sum + (dotslice_dottile15_dotunit61_in_stream_w * dotslice_dottile15_dotunit61_in_weight));
				dotslice_dottile15_dotunit61_sum_dotunit61_next_value_ce1 <= 1'd1;
				dotslice_dottile15_dotunit61_out_stream_w <= dotslice_dottile15_dotunit61_in_stream_w;
			end
			if (dotslice_dottile15_dotunit61_in_stream_e_valid) begin
				dotslice_dottile15_dotunit61_out_stream_e <= dotslice_dottile15_dotunit61_in_stream_e;
			end
			dotunit61_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile15_dotunit61_out_stream_e <= dotslice_dottile15_dotunit61_sum;
			if (dotslice_dottile15_dotunit61_in_stream_w_valid) begin
				dotslice_dottile15_dotunit61_out_stream_w <= dotslice_dottile15_dotunit61_in_stream_w;
			end
			dotunit61_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile15_dotunit61_in_stream_w_valid) begin
				dotslice_dottile15_dotunit61_out_stream_w <= dotslice_dottile15_dotunit61_in_stream_w;
			end
			if (dotslice_dottile15_dotunit61_in_stream_e_valid) begin
				dotslice_dottile15_dotunit61_out_stream_e <= dotslice_dottile15_dotunit61_in_stream_e;
			end
			dotunit61_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_129 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_130;
// synthesis translate_on
always @(*) begin
	dotslice_dottile15_dotunit62_out_stream_e <= 8'd0;
	dotslice_dottile15_dotunit62_out_stream_w <= 8'd0;
	dotunit62_next_state <= 2'd0;
	dotslice_dottile15_dotunit62_weight_dotunit62_next_value0 <= 8'd0;
	dotslice_dottile15_dotunit62_weight_dotunit62_next_value_ce0 <= 1'd0;
	dotslice_dottile15_dotunit62_sum_dotunit62_next_value1 <= 16'd0;
	dotslice_dottile15_dotunit62_sum_dotunit62_next_value_ce1 <= 1'd0;
	dotunit62_next_state <= dotunit62_state;
	case (dotunit62_state)
		1'd1: begin
			if (dotslice_dottile15_dotunit62_in_stream_w_valid) begin
				dotslice_dottile15_dotunit62_weight_dotunit62_next_value0 <= dotslice_dottile15_dotunit62_in_stream_w;
				dotslice_dottile15_dotunit62_weight_dotunit62_next_value_ce0 <= 1'd1;
				dotunit62_next_state <= 1'd0;
			end
			if (dotslice_dottile15_dotunit62_in_stream_e_valid) begin
				dotslice_dottile15_dotunit62_out_stream_e <= dotslice_dottile15_dotunit62_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile15_dotunit62_in_stream_w_valid) begin
				dotslice_dottile15_dotunit62_sum_dotunit62_next_value1 <= (dotslice_dottile15_dotunit62_sum + (dotslice_dottile15_dotunit62_in_stream_w * dotslice_dottile15_dotunit62_in_weight));
				dotslice_dottile15_dotunit62_sum_dotunit62_next_value_ce1 <= 1'd1;
				dotslice_dottile15_dotunit62_out_stream_w <= dotslice_dottile15_dotunit62_in_stream_w;
			end
			if (dotslice_dottile15_dotunit62_in_stream_e_valid) begin
				dotslice_dottile15_dotunit62_out_stream_e <= dotslice_dottile15_dotunit62_in_stream_e;
			end
			dotunit62_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile15_dotunit62_out_stream_e <= dotslice_dottile15_dotunit62_sum;
			if (dotslice_dottile15_dotunit62_in_stream_w_valid) begin
				dotslice_dottile15_dotunit62_out_stream_w <= dotslice_dottile15_dotunit62_in_stream_w;
			end
			dotunit62_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile15_dotunit62_in_stream_w_valid) begin
				dotslice_dottile15_dotunit62_out_stream_w <= dotslice_dottile15_dotunit62_in_stream_w;
			end
			if (dotslice_dottile15_dotunit62_in_stream_e_valid) begin
				dotslice_dottile15_dotunit62_out_stream_e <= dotslice_dottile15_dotunit62_in_stream_e;
			end
			dotunit62_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_130 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_131;
// synthesis translate_on
always @(*) begin
	dotslice_dottile15_dotunit63_out_stream_e <= 8'd0;
	dotslice_dottile15_dotunit63_out_stream_w <= 8'd0;
	dotunit63_next_state <= 2'd0;
	dotslice_dottile15_dotunit63_weight_dotunit63_next_value0 <= 8'd0;
	dotslice_dottile15_dotunit63_weight_dotunit63_next_value_ce0 <= 1'd0;
	dotslice_dottile15_dotunit63_sum_dotunit63_next_value1 <= 16'd0;
	dotslice_dottile15_dotunit63_sum_dotunit63_next_value_ce1 <= 1'd0;
	dotunit63_next_state <= dotunit63_state;
	case (dotunit63_state)
		1'd1: begin
			if (dotslice_dottile15_dotunit63_in_stream_w_valid) begin
				dotslice_dottile15_dotunit63_weight_dotunit63_next_value0 <= dotslice_dottile15_dotunit63_in_stream_w;
				dotslice_dottile15_dotunit63_weight_dotunit63_next_value_ce0 <= 1'd1;
				dotunit63_next_state <= 1'd0;
			end
			if (dotslice_dottile15_dotunit63_in_stream_e_valid) begin
				dotslice_dottile15_dotunit63_out_stream_e <= dotslice_dottile15_dotunit63_in_stream_e;
			end
		end
		2'd2: begin
			if (dotslice_dottile15_dotunit63_in_stream_w_valid) begin
				dotslice_dottile15_dotunit63_sum_dotunit63_next_value1 <= (dotslice_dottile15_dotunit63_sum + (dotslice_dottile15_dotunit63_in_stream_w * dotslice_dottile15_dotunit63_in_weight));
				dotslice_dottile15_dotunit63_sum_dotunit63_next_value_ce1 <= 1'd1;
				dotslice_dottile15_dotunit63_out_stream_w <= dotslice_dottile15_dotunit63_in_stream_w;
			end
			if (dotslice_dottile15_dotunit63_in_stream_e_valid) begin
				dotslice_dottile15_dotunit63_out_stream_e <= dotslice_dottile15_dotunit63_in_stream_e;
			end
			dotunit63_next_state <= 2'd2;
		end
		2'd3: begin
			dotslice_dottile15_dotunit63_out_stream_e <= dotslice_dottile15_dotunit63_sum;
			if (dotslice_dottile15_dotunit63_in_stream_w_valid) begin
				dotslice_dottile15_dotunit63_out_stream_w <= dotslice_dottile15_dotunit63_in_stream_w;
			end
			dotunit63_next_state <= 1'd0;
		end
		default: begin
			if (dotslice_dottile15_dotunit63_in_stream_w_valid) begin
				dotslice_dottile15_dotunit63_out_stream_w <= dotslice_dottile15_dotunit63_in_stream_w;
			end
			if (dotslice_dottile15_dotunit63_in_stream_e_valid) begin
				dotslice_dottile15_dotunit63_out_stream_e <= dotslice_dottile15_dotunit63_in_stream_e;
			end
			dotunit63_next_state <= 1'd0;
		end
	endcase
// synthesis translate_off
	dummy_d_131 <= dummy_s;
// synthesis translate_on
end

// synthesis translate_off
reg dummy_d_132;
// synthesis translate_on
always @(*) begin
	fsm15_next_state <= 2'd0;
	dotslice_dottile15_out_stream_w_valid_fsm15_next_value0 <= 1'd0;
	dotslice_dottile15_out_stream_w_valid_fsm15_next_value_ce0 <= 1'd0;
	dotslice_dottile15_out_stream_e_valid_fsm15_next_value1 <= 1'd0;
	dotslice_dottile15_out_stream_e_valid_fsm15_next_value_ce1 <= 1'd0;
	fsm15_next_state <= fsm15_state;
	case (fsm15_state)
		1'd1: begin
			if (dotslice_dottile15_in_stream_w_valid) begin
				fsm15_next_state <= 1'd0;
			end
			dotslice_dottile15_out_stream_e_valid_fsm15_next_value1 <= dotslice_dottile15_in_stream_e_valid;
			dotslice_dottile15_out_stream_e_valid_fsm15_next_value_ce1 <= 1'd1;
		end
		2'd2: begin
			dotslice_dottile15_out_stream_w_valid_fsm15_next_value0 <= dotslice_dottile15_in_stream_w_valid;
			dotslice_dottile15_out_stream_w_valid_fsm15_next_value_ce0 <= 1'd1;
			dotslice_dottile15_out_stream_e_valid_fsm15_next_value1 <= dotslice_dottile15_in_stream_e_valid;
			dotslice_dottile15_out_stream_e_valid_fsm15_next_value_ce1 <= 1'd1;
		end
		2'd3: begin
			dotslice_dottile15_out_stream_w_valid_fsm15_next_value0 <= dotslice_dottile15_in_stream_w_valid;
			dotslice_dottile15_out_stream_w_valid_fsm15_next_value_ce0 <= 1'd1;
			dotslice_dottile15_out_stream_e_valid_fsm15_next_value1 <= 1'd1;
			dotslice_dottile15_out_stream_e_valid_fsm15_next_value_ce1 <= 1'd1;
			fsm15_next_state <= 1'd0;
		end
		default: begin
			dotslice_dottile15_out_stream_w_valid_fsm15_next_value0 <= dotslice_dottile15_in_stream_w_valid;
			dotslice_dottile15_out_stream_w_valid_fsm15_next_value_ce0 <= 1'd1;
			dotslice_dottile15_out_stream_e_valid_fsm15_next_value1 <= dotslice_dottile15_in_stream_e_valid;
			dotslice_dottile15_out_stream_e_valid_fsm15_next_value_ce1 <= 1'd1;
		end
	endcase
// synthesis translate_off
	dummy_d_132 <= dummy_s;
// synthesis translate_on
end

always @(posedge sys_clk) begin
	if ((dotslice_dottile0_in_ins_valid & (dotslice_dottile0_in_ins[7:15] == 1'd0))) begin
		case (dotslice_dottile0_in_ins[15:23])
			1'd0: begin
				dotslice_dottile0_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile0_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile0_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile0_state <= 2'd3;
			end
		endcase
		dotslice_dottile0_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile0_out_ins <= dotslice_dottile0_in_ins;
		dotslice_dottile0_out_ins_valid <= dotslice_dottile0_in_ins_valid;
	end
	dotunit0_state <= dotunit0_next_state;
	if (dotslice_dottile0_dotunit0_weight_dotunit0_next_value_ce0) begin
		dotslice_dottile0_dotunit0_weight <= dotslice_dottile0_dotunit0_weight_dotunit0_next_value0;
	end
	if (dotslice_dottile0_dotunit0_sum_dotunit0_next_value_ce1) begin
		dotslice_dottile0_dotunit0_sum <= dotslice_dottile0_dotunit0_sum_dotunit0_next_value1;
	end
	dotunit1_state <= dotunit1_next_state;
	if (dotslice_dottile0_dotunit1_weight_dotunit1_next_value_ce0) begin
		dotslice_dottile0_dotunit1_weight <= dotslice_dottile0_dotunit1_weight_dotunit1_next_value0;
	end
	if (dotslice_dottile0_dotunit1_sum_dotunit1_next_value_ce1) begin
		dotslice_dottile0_dotunit1_sum <= dotslice_dottile0_dotunit1_sum_dotunit1_next_value1;
	end
	dotunit2_state <= dotunit2_next_state;
	if (dotslice_dottile0_dotunit2_weight_dotunit2_next_value_ce0) begin
		dotslice_dottile0_dotunit2_weight <= dotslice_dottile0_dotunit2_weight_dotunit2_next_value0;
	end
	if (dotslice_dottile0_dotunit2_sum_dotunit2_next_value_ce1) begin
		dotslice_dottile0_dotunit2_sum <= dotslice_dottile0_dotunit2_sum_dotunit2_next_value1;
	end
	dotunit3_state <= dotunit3_next_state;
	if (dotslice_dottile0_dotunit3_weight_dotunit3_next_value_ce0) begin
		dotslice_dottile0_dotunit3_weight <= dotslice_dottile0_dotunit3_weight_dotunit3_next_value0;
	end
	if (dotslice_dottile0_dotunit3_sum_dotunit3_next_value_ce1) begin
		dotslice_dottile0_dotunit3_sum <= dotslice_dottile0_dotunit3_sum_dotunit3_next_value1;
	end
	fsm0_state <= fsm0_next_state;
	if (dotslice_dottile0_out_stream_w_valid_fsm0_next_value_ce0) begin
		dotslice_dottile0_out_stream_w_valid <= dotslice_dottile0_out_stream_w_valid_fsm0_next_value0;
	end
	if (dotslice_dottile0_out_stream_e_valid_fsm0_next_value_ce1) begin
		dotslice_dottile0_out_stream_e_valid <= dotslice_dottile0_out_stream_e_valid_fsm0_next_value1;
	end
	if ((dotslice_dottile1_in_ins_valid & (dotslice_dottile1_in_ins[7:15] == 1'd1))) begin
		case (dotslice_dottile1_in_ins[15:23])
			1'd0: begin
				dotslice_dottile1_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile1_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile1_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile1_state <= 2'd3;
			end
		endcase
		dotslice_dottile1_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile1_out_ins <= dotslice_dottile1_in_ins;
		dotslice_dottile1_out_ins_valid <= dotslice_dottile1_in_ins_valid;
	end
	dotunit4_state <= dotunit4_next_state;
	if (dotslice_dottile1_dotunit4_weight_dotunit4_next_value_ce0) begin
		dotslice_dottile1_dotunit4_weight <= dotslice_dottile1_dotunit4_weight_dotunit4_next_value0;
	end
	if (dotslice_dottile1_dotunit4_sum_dotunit4_next_value_ce1) begin
		dotslice_dottile1_dotunit4_sum <= dotslice_dottile1_dotunit4_sum_dotunit4_next_value1;
	end
	dotunit5_state <= dotunit5_next_state;
	if (dotslice_dottile1_dotunit5_weight_dotunit5_next_value_ce0) begin
		dotslice_dottile1_dotunit5_weight <= dotslice_dottile1_dotunit5_weight_dotunit5_next_value0;
	end
	if (dotslice_dottile1_dotunit5_sum_dotunit5_next_value_ce1) begin
		dotslice_dottile1_dotunit5_sum <= dotslice_dottile1_dotunit5_sum_dotunit5_next_value1;
	end
	dotunit6_state <= dotunit6_next_state;
	if (dotslice_dottile1_dotunit6_weight_dotunit6_next_value_ce0) begin
		dotslice_dottile1_dotunit6_weight <= dotslice_dottile1_dotunit6_weight_dotunit6_next_value0;
	end
	if (dotslice_dottile1_dotunit6_sum_dotunit6_next_value_ce1) begin
		dotslice_dottile1_dotunit6_sum <= dotslice_dottile1_dotunit6_sum_dotunit6_next_value1;
	end
	dotunit7_state <= dotunit7_next_state;
	if (dotslice_dottile1_dotunit7_weight_dotunit7_next_value_ce0) begin
		dotslice_dottile1_dotunit7_weight <= dotslice_dottile1_dotunit7_weight_dotunit7_next_value0;
	end
	if (dotslice_dottile1_dotunit7_sum_dotunit7_next_value_ce1) begin
		dotslice_dottile1_dotunit7_sum <= dotslice_dottile1_dotunit7_sum_dotunit7_next_value1;
	end
	fsm1_state <= fsm1_next_state;
	if (dotslice_dottile1_out_stream_w_valid_fsm1_next_value_ce0) begin
		dotslice_dottile1_out_stream_w_valid <= dotslice_dottile1_out_stream_w_valid_fsm1_next_value0;
	end
	if (dotslice_dottile1_out_stream_e_valid_fsm1_next_value_ce1) begin
		dotslice_dottile1_out_stream_e_valid <= dotslice_dottile1_out_stream_e_valid_fsm1_next_value1;
	end
	if ((dotslice_dottile2_in_ins_valid & (dotslice_dottile2_in_ins[7:15] == 2'd2))) begin
		case (dotslice_dottile2_in_ins[15:23])
			1'd0: begin
				dotslice_dottile2_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile2_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile2_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile2_state <= 2'd3;
			end
		endcase
		dotslice_dottile2_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile2_out_ins <= dotslice_dottile2_in_ins;
		dotslice_dottile2_out_ins_valid <= dotslice_dottile2_in_ins_valid;
	end
	dotunit8_state <= dotunit8_next_state;
	if (dotslice_dottile2_dotunit8_weight_dotunit8_next_value_ce0) begin
		dotslice_dottile2_dotunit8_weight <= dotslice_dottile2_dotunit8_weight_dotunit8_next_value0;
	end
	if (dotslice_dottile2_dotunit8_sum_dotunit8_next_value_ce1) begin
		dotslice_dottile2_dotunit8_sum <= dotslice_dottile2_dotunit8_sum_dotunit8_next_value1;
	end
	dotunit9_state <= dotunit9_next_state;
	if (dotslice_dottile2_dotunit9_weight_dotunit9_next_value_ce0) begin
		dotslice_dottile2_dotunit9_weight <= dotslice_dottile2_dotunit9_weight_dotunit9_next_value0;
	end
	if (dotslice_dottile2_dotunit9_sum_dotunit9_next_value_ce1) begin
		dotslice_dottile2_dotunit9_sum <= dotslice_dottile2_dotunit9_sum_dotunit9_next_value1;
	end
	dotunit10_state <= dotunit10_next_state;
	if (dotslice_dottile2_dotunit10_weight_dotunit10_next_value_ce0) begin
		dotslice_dottile2_dotunit10_weight <= dotslice_dottile2_dotunit10_weight_dotunit10_next_value0;
	end
	if (dotslice_dottile2_dotunit10_sum_dotunit10_next_value_ce1) begin
		dotslice_dottile2_dotunit10_sum <= dotslice_dottile2_dotunit10_sum_dotunit10_next_value1;
	end
	dotunit11_state <= dotunit11_next_state;
	if (dotslice_dottile2_dotunit11_weight_dotunit11_next_value_ce0) begin
		dotslice_dottile2_dotunit11_weight <= dotslice_dottile2_dotunit11_weight_dotunit11_next_value0;
	end
	if (dotslice_dottile2_dotunit11_sum_dotunit11_next_value_ce1) begin
		dotslice_dottile2_dotunit11_sum <= dotslice_dottile2_dotunit11_sum_dotunit11_next_value1;
	end
	fsm2_state <= fsm2_next_state;
	if (dotslice_dottile2_out_stream_w_valid_fsm2_next_value_ce0) begin
		dotslice_dottile2_out_stream_w_valid <= dotslice_dottile2_out_stream_w_valid_fsm2_next_value0;
	end
	if (dotslice_dottile2_out_stream_e_valid_fsm2_next_value_ce1) begin
		dotslice_dottile2_out_stream_e_valid <= dotslice_dottile2_out_stream_e_valid_fsm2_next_value1;
	end
	if ((dotslice_dottile3_in_ins_valid & (dotslice_dottile3_in_ins[7:15] == 2'd3))) begin
		case (dotslice_dottile3_in_ins[15:23])
			1'd0: begin
				dotslice_dottile3_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile3_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile3_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile3_state <= 2'd3;
			end
		endcase
		dotslice_dottile3_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile3_out_ins <= dotslice_dottile3_in_ins;
		dotslice_dottile3_out_ins_valid <= dotslice_dottile3_in_ins_valid;
	end
	dotunit12_state <= dotunit12_next_state;
	if (dotslice_dottile3_dotunit12_weight_dotunit12_next_value_ce0) begin
		dotslice_dottile3_dotunit12_weight <= dotslice_dottile3_dotunit12_weight_dotunit12_next_value0;
	end
	if (dotslice_dottile3_dotunit12_sum_dotunit12_next_value_ce1) begin
		dotslice_dottile3_dotunit12_sum <= dotslice_dottile3_dotunit12_sum_dotunit12_next_value1;
	end
	dotunit13_state <= dotunit13_next_state;
	if (dotslice_dottile3_dotunit13_weight_dotunit13_next_value_ce0) begin
		dotslice_dottile3_dotunit13_weight <= dotslice_dottile3_dotunit13_weight_dotunit13_next_value0;
	end
	if (dotslice_dottile3_dotunit13_sum_dotunit13_next_value_ce1) begin
		dotslice_dottile3_dotunit13_sum <= dotslice_dottile3_dotunit13_sum_dotunit13_next_value1;
	end
	dotunit14_state <= dotunit14_next_state;
	if (dotslice_dottile3_dotunit14_weight_dotunit14_next_value_ce0) begin
		dotslice_dottile3_dotunit14_weight <= dotslice_dottile3_dotunit14_weight_dotunit14_next_value0;
	end
	if (dotslice_dottile3_dotunit14_sum_dotunit14_next_value_ce1) begin
		dotslice_dottile3_dotunit14_sum <= dotslice_dottile3_dotunit14_sum_dotunit14_next_value1;
	end
	dotunit15_state <= dotunit15_next_state;
	if (dotslice_dottile3_dotunit15_weight_dotunit15_next_value_ce0) begin
		dotslice_dottile3_dotunit15_weight <= dotslice_dottile3_dotunit15_weight_dotunit15_next_value0;
	end
	if (dotslice_dottile3_dotunit15_sum_dotunit15_next_value_ce1) begin
		dotslice_dottile3_dotunit15_sum <= dotslice_dottile3_dotunit15_sum_dotunit15_next_value1;
	end
	fsm3_state <= fsm3_next_state;
	if (dotslice_dottile3_out_stream_w_valid_fsm3_next_value_ce0) begin
		dotslice_dottile3_out_stream_w_valid <= dotslice_dottile3_out_stream_w_valid_fsm3_next_value0;
	end
	if (dotslice_dottile3_out_stream_e_valid_fsm3_next_value_ce1) begin
		dotslice_dottile3_out_stream_e_valid <= dotslice_dottile3_out_stream_e_valid_fsm3_next_value1;
	end
	if ((dotslice_dottile4_in_ins_valid & (dotslice_dottile4_in_ins[7:15] == 3'd4))) begin
		case (dotslice_dottile4_in_ins[15:23])
			1'd0: begin
				dotslice_dottile4_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile4_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile4_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile4_state <= 2'd3;
			end
		endcase
		dotslice_dottile4_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile4_out_ins <= dotslice_dottile4_in_ins;
		dotslice_dottile4_out_ins_valid <= dotslice_dottile4_in_ins_valid;
	end
	dotunit16_state <= dotunit16_next_state;
	if (dotslice_dottile4_dotunit16_weight_dotunit16_next_value_ce0) begin
		dotslice_dottile4_dotunit16_weight <= dotslice_dottile4_dotunit16_weight_dotunit16_next_value0;
	end
	if (dotslice_dottile4_dotunit16_sum_dotunit16_next_value_ce1) begin
		dotslice_dottile4_dotunit16_sum <= dotslice_dottile4_dotunit16_sum_dotunit16_next_value1;
	end
	dotunit17_state <= dotunit17_next_state;
	if (dotslice_dottile4_dotunit17_weight_dotunit17_next_value_ce0) begin
		dotslice_dottile4_dotunit17_weight <= dotslice_dottile4_dotunit17_weight_dotunit17_next_value0;
	end
	if (dotslice_dottile4_dotunit17_sum_dotunit17_next_value_ce1) begin
		dotslice_dottile4_dotunit17_sum <= dotslice_dottile4_dotunit17_sum_dotunit17_next_value1;
	end
	dotunit18_state <= dotunit18_next_state;
	if (dotslice_dottile4_dotunit18_weight_dotunit18_next_value_ce0) begin
		dotslice_dottile4_dotunit18_weight <= dotslice_dottile4_dotunit18_weight_dotunit18_next_value0;
	end
	if (dotslice_dottile4_dotunit18_sum_dotunit18_next_value_ce1) begin
		dotslice_dottile4_dotunit18_sum <= dotslice_dottile4_dotunit18_sum_dotunit18_next_value1;
	end
	dotunit19_state <= dotunit19_next_state;
	if (dotslice_dottile4_dotunit19_weight_dotunit19_next_value_ce0) begin
		dotslice_dottile4_dotunit19_weight <= dotslice_dottile4_dotunit19_weight_dotunit19_next_value0;
	end
	if (dotslice_dottile4_dotunit19_sum_dotunit19_next_value_ce1) begin
		dotslice_dottile4_dotunit19_sum <= dotslice_dottile4_dotunit19_sum_dotunit19_next_value1;
	end
	fsm4_state <= fsm4_next_state;
	if (dotslice_dottile4_out_stream_w_valid_fsm4_next_value_ce0) begin
		dotslice_dottile4_out_stream_w_valid <= dotslice_dottile4_out_stream_w_valid_fsm4_next_value0;
	end
	if (dotslice_dottile4_out_stream_e_valid_fsm4_next_value_ce1) begin
		dotslice_dottile4_out_stream_e_valid <= dotslice_dottile4_out_stream_e_valid_fsm4_next_value1;
	end
	if ((dotslice_dottile5_in_ins_valid & (dotslice_dottile5_in_ins[7:15] == 3'd5))) begin
		case (dotslice_dottile5_in_ins[15:23])
			1'd0: begin
				dotslice_dottile5_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile5_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile5_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile5_state <= 2'd3;
			end
		endcase
		dotslice_dottile5_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile5_out_ins <= dotslice_dottile5_in_ins;
		dotslice_dottile5_out_ins_valid <= dotslice_dottile5_in_ins_valid;
	end
	dotunit20_state <= dotunit20_next_state;
	if (dotslice_dottile5_dotunit20_weight_dotunit20_next_value_ce0) begin
		dotslice_dottile5_dotunit20_weight <= dotslice_dottile5_dotunit20_weight_dotunit20_next_value0;
	end
	if (dotslice_dottile5_dotunit20_sum_dotunit20_next_value_ce1) begin
		dotslice_dottile5_dotunit20_sum <= dotslice_dottile5_dotunit20_sum_dotunit20_next_value1;
	end
	dotunit21_state <= dotunit21_next_state;
	if (dotslice_dottile5_dotunit21_weight_dotunit21_next_value_ce0) begin
		dotslice_dottile5_dotunit21_weight <= dotslice_dottile5_dotunit21_weight_dotunit21_next_value0;
	end
	if (dotslice_dottile5_dotunit21_sum_dotunit21_next_value_ce1) begin
		dotslice_dottile5_dotunit21_sum <= dotslice_dottile5_dotunit21_sum_dotunit21_next_value1;
	end
	dotunit22_state <= dotunit22_next_state;
	if (dotslice_dottile5_dotunit22_weight_dotunit22_next_value_ce0) begin
		dotslice_dottile5_dotunit22_weight <= dotslice_dottile5_dotunit22_weight_dotunit22_next_value0;
	end
	if (dotslice_dottile5_dotunit22_sum_dotunit22_next_value_ce1) begin
		dotslice_dottile5_dotunit22_sum <= dotslice_dottile5_dotunit22_sum_dotunit22_next_value1;
	end
	dotunit23_state <= dotunit23_next_state;
	if (dotslice_dottile5_dotunit23_weight_dotunit23_next_value_ce0) begin
		dotslice_dottile5_dotunit23_weight <= dotslice_dottile5_dotunit23_weight_dotunit23_next_value0;
	end
	if (dotslice_dottile5_dotunit23_sum_dotunit23_next_value_ce1) begin
		dotslice_dottile5_dotunit23_sum <= dotslice_dottile5_dotunit23_sum_dotunit23_next_value1;
	end
	fsm5_state <= fsm5_next_state;
	if (dotslice_dottile5_out_stream_w_valid_fsm5_next_value_ce0) begin
		dotslice_dottile5_out_stream_w_valid <= dotslice_dottile5_out_stream_w_valid_fsm5_next_value0;
	end
	if (dotslice_dottile5_out_stream_e_valid_fsm5_next_value_ce1) begin
		dotslice_dottile5_out_stream_e_valid <= dotslice_dottile5_out_stream_e_valid_fsm5_next_value1;
	end
	if ((dotslice_dottile6_in_ins_valid & (dotslice_dottile6_in_ins[7:15] == 3'd6))) begin
		case (dotslice_dottile6_in_ins[15:23])
			1'd0: begin
				dotslice_dottile6_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile6_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile6_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile6_state <= 2'd3;
			end
		endcase
		dotslice_dottile6_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile6_out_ins <= dotslice_dottile6_in_ins;
		dotslice_dottile6_out_ins_valid <= dotslice_dottile6_in_ins_valid;
	end
	dotunit24_state <= dotunit24_next_state;
	if (dotslice_dottile6_dotunit24_weight_dotunit24_next_value_ce0) begin
		dotslice_dottile6_dotunit24_weight <= dotslice_dottile6_dotunit24_weight_dotunit24_next_value0;
	end
	if (dotslice_dottile6_dotunit24_sum_dotunit24_next_value_ce1) begin
		dotslice_dottile6_dotunit24_sum <= dotslice_dottile6_dotunit24_sum_dotunit24_next_value1;
	end
	dotunit25_state <= dotunit25_next_state;
	if (dotslice_dottile6_dotunit25_weight_dotunit25_next_value_ce0) begin
		dotslice_dottile6_dotunit25_weight <= dotslice_dottile6_dotunit25_weight_dotunit25_next_value0;
	end
	if (dotslice_dottile6_dotunit25_sum_dotunit25_next_value_ce1) begin
		dotslice_dottile6_dotunit25_sum <= dotslice_dottile6_dotunit25_sum_dotunit25_next_value1;
	end
	dotunit26_state <= dotunit26_next_state;
	if (dotslice_dottile6_dotunit26_weight_dotunit26_next_value_ce0) begin
		dotslice_dottile6_dotunit26_weight <= dotslice_dottile6_dotunit26_weight_dotunit26_next_value0;
	end
	if (dotslice_dottile6_dotunit26_sum_dotunit26_next_value_ce1) begin
		dotslice_dottile6_dotunit26_sum <= dotslice_dottile6_dotunit26_sum_dotunit26_next_value1;
	end
	dotunit27_state <= dotunit27_next_state;
	if (dotslice_dottile6_dotunit27_weight_dotunit27_next_value_ce0) begin
		dotslice_dottile6_dotunit27_weight <= dotslice_dottile6_dotunit27_weight_dotunit27_next_value0;
	end
	if (dotslice_dottile6_dotunit27_sum_dotunit27_next_value_ce1) begin
		dotslice_dottile6_dotunit27_sum <= dotslice_dottile6_dotunit27_sum_dotunit27_next_value1;
	end
	fsm6_state <= fsm6_next_state;
	if (dotslice_dottile6_out_stream_w_valid_fsm6_next_value_ce0) begin
		dotslice_dottile6_out_stream_w_valid <= dotslice_dottile6_out_stream_w_valid_fsm6_next_value0;
	end
	if (dotslice_dottile6_out_stream_e_valid_fsm6_next_value_ce1) begin
		dotslice_dottile6_out_stream_e_valid <= dotslice_dottile6_out_stream_e_valid_fsm6_next_value1;
	end
	if ((dotslice_dottile7_in_ins_valid & (dotslice_dottile7_in_ins[7:15] == 3'd7))) begin
		case (dotslice_dottile7_in_ins[15:23])
			1'd0: begin
				dotslice_dottile7_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile7_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile7_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile7_state <= 2'd3;
			end
		endcase
		dotslice_dottile7_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile7_out_ins <= dotslice_dottile7_in_ins;
		dotslice_dottile7_out_ins_valid <= dotslice_dottile7_in_ins_valid;
	end
	dotunit28_state <= dotunit28_next_state;
	if (dotslice_dottile7_dotunit28_weight_dotunit28_next_value_ce0) begin
		dotslice_dottile7_dotunit28_weight <= dotslice_dottile7_dotunit28_weight_dotunit28_next_value0;
	end
	if (dotslice_dottile7_dotunit28_sum_dotunit28_next_value_ce1) begin
		dotslice_dottile7_dotunit28_sum <= dotslice_dottile7_dotunit28_sum_dotunit28_next_value1;
	end
	dotunit29_state <= dotunit29_next_state;
	if (dotslice_dottile7_dotunit29_weight_dotunit29_next_value_ce0) begin
		dotslice_dottile7_dotunit29_weight <= dotslice_dottile7_dotunit29_weight_dotunit29_next_value0;
	end
	if (dotslice_dottile7_dotunit29_sum_dotunit29_next_value_ce1) begin
		dotslice_dottile7_dotunit29_sum <= dotslice_dottile7_dotunit29_sum_dotunit29_next_value1;
	end
	dotunit30_state <= dotunit30_next_state;
	if (dotslice_dottile7_dotunit30_weight_dotunit30_next_value_ce0) begin
		dotslice_dottile7_dotunit30_weight <= dotslice_dottile7_dotunit30_weight_dotunit30_next_value0;
	end
	if (dotslice_dottile7_dotunit30_sum_dotunit30_next_value_ce1) begin
		dotslice_dottile7_dotunit30_sum <= dotslice_dottile7_dotunit30_sum_dotunit30_next_value1;
	end
	dotunit31_state <= dotunit31_next_state;
	if (dotslice_dottile7_dotunit31_weight_dotunit31_next_value_ce0) begin
		dotslice_dottile7_dotunit31_weight <= dotslice_dottile7_dotunit31_weight_dotunit31_next_value0;
	end
	if (dotslice_dottile7_dotunit31_sum_dotunit31_next_value_ce1) begin
		dotslice_dottile7_dotunit31_sum <= dotslice_dottile7_dotunit31_sum_dotunit31_next_value1;
	end
	fsm7_state <= fsm7_next_state;
	if (dotslice_dottile7_out_stream_w_valid_fsm7_next_value_ce0) begin
		dotslice_dottile7_out_stream_w_valid <= dotslice_dottile7_out_stream_w_valid_fsm7_next_value0;
	end
	if (dotslice_dottile7_out_stream_e_valid_fsm7_next_value_ce1) begin
		dotslice_dottile7_out_stream_e_valid <= dotslice_dottile7_out_stream_e_valid_fsm7_next_value1;
	end
	if ((dotslice_dottile8_in_ins_valid & (dotslice_dottile8_in_ins[7:15] == 4'd8))) begin
		case (dotslice_dottile8_in_ins[15:23])
			1'd0: begin
				dotslice_dottile8_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile8_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile8_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile8_state <= 2'd3;
			end
		endcase
		dotslice_dottile8_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile8_out_ins <= dotslice_dottile8_in_ins;
		dotslice_dottile8_out_ins_valid <= dotslice_dottile8_in_ins_valid;
	end
	dotunit32_state <= dotunit32_next_state;
	if (dotslice_dottile8_dotunit32_weight_dotunit32_next_value_ce0) begin
		dotslice_dottile8_dotunit32_weight <= dotslice_dottile8_dotunit32_weight_dotunit32_next_value0;
	end
	if (dotslice_dottile8_dotunit32_sum_dotunit32_next_value_ce1) begin
		dotslice_dottile8_dotunit32_sum <= dotslice_dottile8_dotunit32_sum_dotunit32_next_value1;
	end
	dotunit33_state <= dotunit33_next_state;
	if (dotslice_dottile8_dotunit33_weight_dotunit33_next_value_ce0) begin
		dotslice_dottile8_dotunit33_weight <= dotslice_dottile8_dotunit33_weight_dotunit33_next_value0;
	end
	if (dotslice_dottile8_dotunit33_sum_dotunit33_next_value_ce1) begin
		dotslice_dottile8_dotunit33_sum <= dotslice_dottile8_dotunit33_sum_dotunit33_next_value1;
	end
	dotunit34_state <= dotunit34_next_state;
	if (dotslice_dottile8_dotunit34_weight_dotunit34_next_value_ce0) begin
		dotslice_dottile8_dotunit34_weight <= dotslice_dottile8_dotunit34_weight_dotunit34_next_value0;
	end
	if (dotslice_dottile8_dotunit34_sum_dotunit34_next_value_ce1) begin
		dotslice_dottile8_dotunit34_sum <= dotslice_dottile8_dotunit34_sum_dotunit34_next_value1;
	end
	dotunit35_state <= dotunit35_next_state;
	if (dotslice_dottile8_dotunit35_weight_dotunit35_next_value_ce0) begin
		dotslice_dottile8_dotunit35_weight <= dotslice_dottile8_dotunit35_weight_dotunit35_next_value0;
	end
	if (dotslice_dottile8_dotunit35_sum_dotunit35_next_value_ce1) begin
		dotslice_dottile8_dotunit35_sum <= dotslice_dottile8_dotunit35_sum_dotunit35_next_value1;
	end
	fsm8_state <= fsm8_next_state;
	if (dotslice_dottile8_out_stream_w_valid_fsm8_next_value_ce0) begin
		dotslice_dottile8_out_stream_w_valid <= dotslice_dottile8_out_stream_w_valid_fsm8_next_value0;
	end
	if (dotslice_dottile8_out_stream_e_valid_fsm8_next_value_ce1) begin
		dotslice_dottile8_out_stream_e_valid <= dotslice_dottile8_out_stream_e_valid_fsm8_next_value1;
	end
	if ((dotslice_dottile9_in_ins_valid & (dotslice_dottile9_in_ins[7:15] == 4'd9))) begin
		case (dotslice_dottile9_in_ins[15:23])
			1'd0: begin
				dotslice_dottile9_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile9_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile9_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile9_state <= 2'd3;
			end
		endcase
		dotslice_dottile9_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile9_out_ins <= dotslice_dottile9_in_ins;
		dotslice_dottile9_out_ins_valid <= dotslice_dottile9_in_ins_valid;
	end
	dotunit36_state <= dotunit36_next_state;
	if (dotslice_dottile9_dotunit36_weight_dotunit36_next_value_ce0) begin
		dotslice_dottile9_dotunit36_weight <= dotslice_dottile9_dotunit36_weight_dotunit36_next_value0;
	end
	if (dotslice_dottile9_dotunit36_sum_dotunit36_next_value_ce1) begin
		dotslice_dottile9_dotunit36_sum <= dotslice_dottile9_dotunit36_sum_dotunit36_next_value1;
	end
	dotunit37_state <= dotunit37_next_state;
	if (dotslice_dottile9_dotunit37_weight_dotunit37_next_value_ce0) begin
		dotslice_dottile9_dotunit37_weight <= dotslice_dottile9_dotunit37_weight_dotunit37_next_value0;
	end
	if (dotslice_dottile9_dotunit37_sum_dotunit37_next_value_ce1) begin
		dotslice_dottile9_dotunit37_sum <= dotslice_dottile9_dotunit37_sum_dotunit37_next_value1;
	end
	dotunit38_state <= dotunit38_next_state;
	if (dotslice_dottile9_dotunit38_weight_dotunit38_next_value_ce0) begin
		dotslice_dottile9_dotunit38_weight <= dotslice_dottile9_dotunit38_weight_dotunit38_next_value0;
	end
	if (dotslice_dottile9_dotunit38_sum_dotunit38_next_value_ce1) begin
		dotslice_dottile9_dotunit38_sum <= dotslice_dottile9_dotunit38_sum_dotunit38_next_value1;
	end
	dotunit39_state <= dotunit39_next_state;
	if (dotslice_dottile9_dotunit39_weight_dotunit39_next_value_ce0) begin
		dotslice_dottile9_dotunit39_weight <= dotslice_dottile9_dotunit39_weight_dotunit39_next_value0;
	end
	if (dotslice_dottile9_dotunit39_sum_dotunit39_next_value_ce1) begin
		dotslice_dottile9_dotunit39_sum <= dotslice_dottile9_dotunit39_sum_dotunit39_next_value1;
	end
	fsm9_state <= fsm9_next_state;
	if (dotslice_dottile9_out_stream_w_valid_fsm9_next_value_ce0) begin
		dotslice_dottile9_out_stream_w_valid <= dotslice_dottile9_out_stream_w_valid_fsm9_next_value0;
	end
	if (dotslice_dottile9_out_stream_e_valid_fsm9_next_value_ce1) begin
		dotslice_dottile9_out_stream_e_valid <= dotslice_dottile9_out_stream_e_valid_fsm9_next_value1;
	end
	if ((dotslice_dottile10_in_ins_valid & (dotslice_dottile10_in_ins[7:15] == 4'd10))) begin
		case (dotslice_dottile10_in_ins[15:23])
			1'd0: begin
				dotslice_dottile10_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile10_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile10_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile10_state <= 2'd3;
			end
		endcase
		dotslice_dottile10_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile10_out_ins <= dotslice_dottile10_in_ins;
		dotslice_dottile10_out_ins_valid <= dotslice_dottile10_in_ins_valid;
	end
	dotunit40_state <= dotunit40_next_state;
	if (dotslice_dottile10_dotunit40_weight_dotunit40_next_value_ce0) begin
		dotslice_dottile10_dotunit40_weight <= dotslice_dottile10_dotunit40_weight_dotunit40_next_value0;
	end
	if (dotslice_dottile10_dotunit40_sum_dotunit40_next_value_ce1) begin
		dotslice_dottile10_dotunit40_sum <= dotslice_dottile10_dotunit40_sum_dotunit40_next_value1;
	end
	dotunit41_state <= dotunit41_next_state;
	if (dotslice_dottile10_dotunit41_weight_dotunit41_next_value_ce0) begin
		dotslice_dottile10_dotunit41_weight <= dotslice_dottile10_dotunit41_weight_dotunit41_next_value0;
	end
	if (dotslice_dottile10_dotunit41_sum_dotunit41_next_value_ce1) begin
		dotslice_dottile10_dotunit41_sum <= dotslice_dottile10_dotunit41_sum_dotunit41_next_value1;
	end
	dotunit42_state <= dotunit42_next_state;
	if (dotslice_dottile10_dotunit42_weight_dotunit42_next_value_ce0) begin
		dotslice_dottile10_dotunit42_weight <= dotslice_dottile10_dotunit42_weight_dotunit42_next_value0;
	end
	if (dotslice_dottile10_dotunit42_sum_dotunit42_next_value_ce1) begin
		dotslice_dottile10_dotunit42_sum <= dotslice_dottile10_dotunit42_sum_dotunit42_next_value1;
	end
	dotunit43_state <= dotunit43_next_state;
	if (dotslice_dottile10_dotunit43_weight_dotunit43_next_value_ce0) begin
		dotslice_dottile10_dotunit43_weight <= dotslice_dottile10_dotunit43_weight_dotunit43_next_value0;
	end
	if (dotslice_dottile10_dotunit43_sum_dotunit43_next_value_ce1) begin
		dotslice_dottile10_dotunit43_sum <= dotslice_dottile10_dotunit43_sum_dotunit43_next_value1;
	end
	fsm10_state <= fsm10_next_state;
	if (dotslice_dottile10_out_stream_w_valid_fsm10_next_value_ce0) begin
		dotslice_dottile10_out_stream_w_valid <= dotslice_dottile10_out_stream_w_valid_fsm10_next_value0;
	end
	if (dotslice_dottile10_out_stream_e_valid_fsm10_next_value_ce1) begin
		dotslice_dottile10_out_stream_e_valid <= dotslice_dottile10_out_stream_e_valid_fsm10_next_value1;
	end
	if ((dotslice_dottile11_in_ins_valid & (dotslice_dottile11_in_ins[7:15] == 4'd11))) begin
		case (dotslice_dottile11_in_ins[15:23])
			1'd0: begin
				dotslice_dottile11_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile11_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile11_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile11_state <= 2'd3;
			end
		endcase
		dotslice_dottile11_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile11_out_ins <= dotslice_dottile11_in_ins;
		dotslice_dottile11_out_ins_valid <= dotslice_dottile11_in_ins_valid;
	end
	dotunit44_state <= dotunit44_next_state;
	if (dotslice_dottile11_dotunit44_weight_dotunit44_next_value_ce0) begin
		dotslice_dottile11_dotunit44_weight <= dotslice_dottile11_dotunit44_weight_dotunit44_next_value0;
	end
	if (dotslice_dottile11_dotunit44_sum_dotunit44_next_value_ce1) begin
		dotslice_dottile11_dotunit44_sum <= dotslice_dottile11_dotunit44_sum_dotunit44_next_value1;
	end
	dotunit45_state <= dotunit45_next_state;
	if (dotslice_dottile11_dotunit45_weight_dotunit45_next_value_ce0) begin
		dotslice_dottile11_dotunit45_weight <= dotslice_dottile11_dotunit45_weight_dotunit45_next_value0;
	end
	if (dotslice_dottile11_dotunit45_sum_dotunit45_next_value_ce1) begin
		dotslice_dottile11_dotunit45_sum <= dotslice_dottile11_dotunit45_sum_dotunit45_next_value1;
	end
	dotunit46_state <= dotunit46_next_state;
	if (dotslice_dottile11_dotunit46_weight_dotunit46_next_value_ce0) begin
		dotslice_dottile11_dotunit46_weight <= dotslice_dottile11_dotunit46_weight_dotunit46_next_value0;
	end
	if (dotslice_dottile11_dotunit46_sum_dotunit46_next_value_ce1) begin
		dotslice_dottile11_dotunit46_sum <= dotslice_dottile11_dotunit46_sum_dotunit46_next_value1;
	end
	dotunit47_state <= dotunit47_next_state;
	if (dotslice_dottile11_dotunit47_weight_dotunit47_next_value_ce0) begin
		dotslice_dottile11_dotunit47_weight <= dotslice_dottile11_dotunit47_weight_dotunit47_next_value0;
	end
	if (dotslice_dottile11_dotunit47_sum_dotunit47_next_value_ce1) begin
		dotslice_dottile11_dotunit47_sum <= dotslice_dottile11_dotunit47_sum_dotunit47_next_value1;
	end
	fsm11_state <= fsm11_next_state;
	if (dotslice_dottile11_out_stream_w_valid_fsm11_next_value_ce0) begin
		dotslice_dottile11_out_stream_w_valid <= dotslice_dottile11_out_stream_w_valid_fsm11_next_value0;
	end
	if (dotslice_dottile11_out_stream_e_valid_fsm11_next_value_ce1) begin
		dotslice_dottile11_out_stream_e_valid <= dotslice_dottile11_out_stream_e_valid_fsm11_next_value1;
	end
	if ((dotslice_dottile12_in_ins_valid & (dotslice_dottile12_in_ins[7:15] == 4'd12))) begin
		case (dotslice_dottile12_in_ins[15:23])
			1'd0: begin
				dotslice_dottile12_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile12_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile12_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile12_state <= 2'd3;
			end
		endcase
		dotslice_dottile12_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile12_out_ins <= dotslice_dottile12_in_ins;
		dotslice_dottile12_out_ins_valid <= dotslice_dottile12_in_ins_valid;
	end
	dotunit48_state <= dotunit48_next_state;
	if (dotslice_dottile12_dotunit48_weight_dotunit48_next_value_ce0) begin
		dotslice_dottile12_dotunit48_weight <= dotslice_dottile12_dotunit48_weight_dotunit48_next_value0;
	end
	if (dotslice_dottile12_dotunit48_sum_dotunit48_next_value_ce1) begin
		dotslice_dottile12_dotunit48_sum <= dotslice_dottile12_dotunit48_sum_dotunit48_next_value1;
	end
	dotunit49_state <= dotunit49_next_state;
	if (dotslice_dottile12_dotunit49_weight_dotunit49_next_value_ce0) begin
		dotslice_dottile12_dotunit49_weight <= dotslice_dottile12_dotunit49_weight_dotunit49_next_value0;
	end
	if (dotslice_dottile12_dotunit49_sum_dotunit49_next_value_ce1) begin
		dotslice_dottile12_dotunit49_sum <= dotslice_dottile12_dotunit49_sum_dotunit49_next_value1;
	end
	dotunit50_state <= dotunit50_next_state;
	if (dotslice_dottile12_dotunit50_weight_dotunit50_next_value_ce0) begin
		dotslice_dottile12_dotunit50_weight <= dotslice_dottile12_dotunit50_weight_dotunit50_next_value0;
	end
	if (dotslice_dottile12_dotunit50_sum_dotunit50_next_value_ce1) begin
		dotslice_dottile12_dotunit50_sum <= dotslice_dottile12_dotunit50_sum_dotunit50_next_value1;
	end
	dotunit51_state <= dotunit51_next_state;
	if (dotslice_dottile12_dotunit51_weight_dotunit51_next_value_ce0) begin
		dotslice_dottile12_dotunit51_weight <= dotslice_dottile12_dotunit51_weight_dotunit51_next_value0;
	end
	if (dotslice_dottile12_dotunit51_sum_dotunit51_next_value_ce1) begin
		dotslice_dottile12_dotunit51_sum <= dotslice_dottile12_dotunit51_sum_dotunit51_next_value1;
	end
	fsm12_state <= fsm12_next_state;
	if (dotslice_dottile12_out_stream_w_valid_fsm12_next_value_ce0) begin
		dotslice_dottile12_out_stream_w_valid <= dotslice_dottile12_out_stream_w_valid_fsm12_next_value0;
	end
	if (dotslice_dottile12_out_stream_e_valid_fsm12_next_value_ce1) begin
		dotslice_dottile12_out_stream_e_valid <= dotslice_dottile12_out_stream_e_valid_fsm12_next_value1;
	end
	if ((dotslice_dottile13_in_ins_valid & (dotslice_dottile13_in_ins[7:15] == 4'd13))) begin
		case (dotslice_dottile13_in_ins[15:23])
			1'd0: begin
				dotslice_dottile13_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile13_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile13_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile13_state <= 2'd3;
			end
		endcase
		dotslice_dottile13_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile13_out_ins <= dotslice_dottile13_in_ins;
		dotslice_dottile13_out_ins_valid <= dotslice_dottile13_in_ins_valid;
	end
	dotunit52_state <= dotunit52_next_state;
	if (dotslice_dottile13_dotunit52_weight_dotunit52_next_value_ce0) begin
		dotslice_dottile13_dotunit52_weight <= dotslice_dottile13_dotunit52_weight_dotunit52_next_value0;
	end
	if (dotslice_dottile13_dotunit52_sum_dotunit52_next_value_ce1) begin
		dotslice_dottile13_dotunit52_sum <= dotslice_dottile13_dotunit52_sum_dotunit52_next_value1;
	end
	dotunit53_state <= dotunit53_next_state;
	if (dotslice_dottile13_dotunit53_weight_dotunit53_next_value_ce0) begin
		dotslice_dottile13_dotunit53_weight <= dotslice_dottile13_dotunit53_weight_dotunit53_next_value0;
	end
	if (dotslice_dottile13_dotunit53_sum_dotunit53_next_value_ce1) begin
		dotslice_dottile13_dotunit53_sum <= dotslice_dottile13_dotunit53_sum_dotunit53_next_value1;
	end
	dotunit54_state <= dotunit54_next_state;
	if (dotslice_dottile13_dotunit54_weight_dotunit54_next_value_ce0) begin
		dotslice_dottile13_dotunit54_weight <= dotslice_dottile13_dotunit54_weight_dotunit54_next_value0;
	end
	if (dotslice_dottile13_dotunit54_sum_dotunit54_next_value_ce1) begin
		dotslice_dottile13_dotunit54_sum <= dotslice_dottile13_dotunit54_sum_dotunit54_next_value1;
	end
	dotunit55_state <= dotunit55_next_state;
	if (dotslice_dottile13_dotunit55_weight_dotunit55_next_value_ce0) begin
		dotslice_dottile13_dotunit55_weight <= dotslice_dottile13_dotunit55_weight_dotunit55_next_value0;
	end
	if (dotslice_dottile13_dotunit55_sum_dotunit55_next_value_ce1) begin
		dotslice_dottile13_dotunit55_sum <= dotslice_dottile13_dotunit55_sum_dotunit55_next_value1;
	end
	fsm13_state <= fsm13_next_state;
	if (dotslice_dottile13_out_stream_w_valid_fsm13_next_value_ce0) begin
		dotslice_dottile13_out_stream_w_valid <= dotslice_dottile13_out_stream_w_valid_fsm13_next_value0;
	end
	if (dotslice_dottile13_out_stream_e_valid_fsm13_next_value_ce1) begin
		dotslice_dottile13_out_stream_e_valid <= dotslice_dottile13_out_stream_e_valid_fsm13_next_value1;
	end
	if ((dotslice_dottile14_in_ins_valid & (dotslice_dottile14_in_ins[7:15] == 4'd14))) begin
		case (dotslice_dottile14_in_ins[15:23])
			1'd0: begin
				dotslice_dottile14_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile14_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile14_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile14_state <= 2'd3;
			end
		endcase
		dotslice_dottile14_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile14_out_ins <= dotslice_dottile14_in_ins;
		dotslice_dottile14_out_ins_valid <= dotslice_dottile14_in_ins_valid;
	end
	dotunit56_state <= dotunit56_next_state;
	if (dotslice_dottile14_dotunit56_weight_dotunit56_next_value_ce0) begin
		dotslice_dottile14_dotunit56_weight <= dotslice_dottile14_dotunit56_weight_dotunit56_next_value0;
	end
	if (dotslice_dottile14_dotunit56_sum_dotunit56_next_value_ce1) begin
		dotslice_dottile14_dotunit56_sum <= dotslice_dottile14_dotunit56_sum_dotunit56_next_value1;
	end
	dotunit57_state <= dotunit57_next_state;
	if (dotslice_dottile14_dotunit57_weight_dotunit57_next_value_ce0) begin
		dotslice_dottile14_dotunit57_weight <= dotslice_dottile14_dotunit57_weight_dotunit57_next_value0;
	end
	if (dotslice_dottile14_dotunit57_sum_dotunit57_next_value_ce1) begin
		dotslice_dottile14_dotunit57_sum <= dotslice_dottile14_dotunit57_sum_dotunit57_next_value1;
	end
	dotunit58_state <= dotunit58_next_state;
	if (dotslice_dottile14_dotunit58_weight_dotunit58_next_value_ce0) begin
		dotslice_dottile14_dotunit58_weight <= dotslice_dottile14_dotunit58_weight_dotunit58_next_value0;
	end
	if (dotslice_dottile14_dotunit58_sum_dotunit58_next_value_ce1) begin
		dotslice_dottile14_dotunit58_sum <= dotslice_dottile14_dotunit58_sum_dotunit58_next_value1;
	end
	dotunit59_state <= dotunit59_next_state;
	if (dotslice_dottile14_dotunit59_weight_dotunit59_next_value_ce0) begin
		dotslice_dottile14_dotunit59_weight <= dotslice_dottile14_dotunit59_weight_dotunit59_next_value0;
	end
	if (dotslice_dottile14_dotunit59_sum_dotunit59_next_value_ce1) begin
		dotslice_dottile14_dotunit59_sum <= dotslice_dottile14_dotunit59_sum_dotunit59_next_value1;
	end
	fsm14_state <= fsm14_next_state;
	if (dotslice_dottile14_out_stream_w_valid_fsm14_next_value_ce0) begin
		dotslice_dottile14_out_stream_w_valid <= dotslice_dottile14_out_stream_w_valid_fsm14_next_value0;
	end
	if (dotslice_dottile14_out_stream_e_valid_fsm14_next_value_ce1) begin
		dotslice_dottile14_out_stream_e_valid <= dotslice_dottile14_out_stream_e_valid_fsm14_next_value1;
	end
	if ((dotslice_dottile15_in_ins_valid & (dotslice_dottile15_in_ins[7:15] == 4'd15))) begin
		case (dotslice_dottile15_in_ins[15:23])
			1'd0: begin
				dotslice_dottile15_state <= 1'd0;
			end
			1'd1: begin
				dotslice_dottile15_state <= 1'd1;
			end
			2'd2: begin
				dotslice_dottile15_state <= 2'd2;
			end
			2'd3: begin
				dotslice_dottile15_state <= 2'd3;
			end
		endcase
		dotslice_dottile15_out_ins_valid <= 1'd0;
	end else begin
		dotslice_dottile15_out_ins <= dotslice_dottile15_in_ins;
		dotslice_dottile15_out_ins_valid <= dotslice_dottile15_in_ins_valid;
	end
	dotunit60_state <= dotunit60_next_state;
	if (dotslice_dottile15_dotunit60_weight_dotunit60_next_value_ce0) begin
		dotslice_dottile15_dotunit60_weight <= dotslice_dottile15_dotunit60_weight_dotunit60_next_value0;
	end
	if (dotslice_dottile15_dotunit60_sum_dotunit60_next_value_ce1) begin
		dotslice_dottile15_dotunit60_sum <= dotslice_dottile15_dotunit60_sum_dotunit60_next_value1;
	end
	dotunit61_state <= dotunit61_next_state;
	if (dotslice_dottile15_dotunit61_weight_dotunit61_next_value_ce0) begin
		dotslice_dottile15_dotunit61_weight <= dotslice_dottile15_dotunit61_weight_dotunit61_next_value0;
	end
	if (dotslice_dottile15_dotunit61_sum_dotunit61_next_value_ce1) begin
		dotslice_dottile15_dotunit61_sum <= dotslice_dottile15_dotunit61_sum_dotunit61_next_value1;
	end
	dotunit62_state <= dotunit62_next_state;
	if (dotslice_dottile15_dotunit62_weight_dotunit62_next_value_ce0) begin
		dotslice_dottile15_dotunit62_weight <= dotslice_dottile15_dotunit62_weight_dotunit62_next_value0;
	end
	if (dotslice_dottile15_dotunit62_sum_dotunit62_next_value_ce1) begin
		dotslice_dottile15_dotunit62_sum <= dotslice_dottile15_dotunit62_sum_dotunit62_next_value1;
	end
	dotunit63_state <= dotunit63_next_state;
	if (dotslice_dottile15_dotunit63_weight_dotunit63_next_value_ce0) begin
		dotslice_dottile15_dotunit63_weight <= dotslice_dottile15_dotunit63_weight_dotunit63_next_value0;
	end
	if (dotslice_dottile15_dotunit63_sum_dotunit63_next_value_ce1) begin
		dotslice_dottile15_dotunit63_sum <= dotslice_dottile15_dotunit63_sum_dotunit63_next_value1;
	end
	fsm15_state <= fsm15_next_state;
	if (dotslice_dottile15_out_stream_w_valid_fsm15_next_value_ce0) begin
		dotslice_dottile15_out_stream_w_valid <= dotslice_dottile15_out_stream_w_valid_fsm15_next_value0;
	end
	if (dotslice_dottile15_out_stream_e_valid_fsm15_next_value_ce1) begin
		dotslice_dottile15_out_stream_e_valid <= dotslice_dottile15_out_stream_e_valid_fsm15_next_value1;
	end
	if (sys_rst) begin
		dotslice_dottile0_out_stream_e_valid <= 1'd0;
		dotslice_dottile0_out_stream_w_valid <= 1'd0;
		dotslice_dottile0_out_ins <= 64'd0;
		dotslice_dottile0_out_ins_valid <= 1'd0;
		dotslice_dottile0_state <= 2'd0;
		dotslice_dottile0_dotunit0_weight <= 8'd0;
		dotslice_dottile0_dotunit0_sum <= 16'd0;
		dotslice_dottile0_dotunit1_weight <= 8'd0;
		dotslice_dottile0_dotunit1_sum <= 16'd0;
		dotslice_dottile0_dotunit2_weight <= 8'd0;
		dotslice_dottile0_dotunit2_sum <= 16'd0;
		dotslice_dottile0_dotunit3_weight <= 8'd0;
		dotslice_dottile0_dotunit3_sum <= 16'd0;
		dotslice_dottile1_out_stream_e_valid <= 1'd0;
		dotslice_dottile1_out_stream_w_valid <= 1'd0;
		dotslice_dottile1_out_ins <= 64'd0;
		dotslice_dottile1_out_ins_valid <= 1'd0;
		dotslice_dottile1_state <= 2'd0;
		dotslice_dottile1_dotunit4_weight <= 8'd0;
		dotslice_dottile1_dotunit4_sum <= 16'd0;
		dotslice_dottile1_dotunit5_weight <= 8'd0;
		dotslice_dottile1_dotunit5_sum <= 16'd0;
		dotslice_dottile1_dotunit6_weight <= 8'd0;
		dotslice_dottile1_dotunit6_sum <= 16'd0;
		dotslice_dottile1_dotunit7_weight <= 8'd0;
		dotslice_dottile1_dotunit7_sum <= 16'd0;
		dotslice_dottile2_out_stream_e_valid <= 1'd0;
		dotslice_dottile2_out_stream_w_valid <= 1'd0;
		dotslice_dottile2_out_ins <= 64'd0;
		dotslice_dottile2_out_ins_valid <= 1'd0;
		dotslice_dottile2_state <= 2'd0;
		dotslice_dottile2_dotunit8_weight <= 8'd0;
		dotslice_dottile2_dotunit8_sum <= 16'd0;
		dotslice_dottile2_dotunit9_weight <= 8'd0;
		dotslice_dottile2_dotunit9_sum <= 16'd0;
		dotslice_dottile2_dotunit10_weight <= 8'd0;
		dotslice_dottile2_dotunit10_sum <= 16'd0;
		dotslice_dottile2_dotunit11_weight <= 8'd0;
		dotslice_dottile2_dotunit11_sum <= 16'd0;
		dotslice_dottile3_out_stream_e_valid <= 1'd0;
		dotslice_dottile3_out_stream_w_valid <= 1'd0;
		dotslice_dottile3_out_ins <= 64'd0;
		dotslice_dottile3_out_ins_valid <= 1'd0;
		dotslice_dottile3_state <= 2'd0;
		dotslice_dottile3_dotunit12_weight <= 8'd0;
		dotslice_dottile3_dotunit12_sum <= 16'd0;
		dotslice_dottile3_dotunit13_weight <= 8'd0;
		dotslice_dottile3_dotunit13_sum <= 16'd0;
		dotslice_dottile3_dotunit14_weight <= 8'd0;
		dotslice_dottile3_dotunit14_sum <= 16'd0;
		dotslice_dottile3_dotunit15_weight <= 8'd0;
		dotslice_dottile3_dotunit15_sum <= 16'd0;
		dotslice_dottile4_out_stream_e_valid <= 1'd0;
		dotslice_dottile4_out_stream_w_valid <= 1'd0;
		dotslice_dottile4_out_ins <= 64'd0;
		dotslice_dottile4_out_ins_valid <= 1'd0;
		dotslice_dottile4_state <= 2'd0;
		dotslice_dottile4_dotunit16_weight <= 8'd0;
		dotslice_dottile4_dotunit16_sum <= 16'd0;
		dotslice_dottile4_dotunit17_weight <= 8'd0;
		dotslice_dottile4_dotunit17_sum <= 16'd0;
		dotslice_dottile4_dotunit18_weight <= 8'd0;
		dotslice_dottile4_dotunit18_sum <= 16'd0;
		dotslice_dottile4_dotunit19_weight <= 8'd0;
		dotslice_dottile4_dotunit19_sum <= 16'd0;
		dotslice_dottile5_out_stream_e_valid <= 1'd0;
		dotslice_dottile5_out_stream_w_valid <= 1'd0;
		dotslice_dottile5_out_ins <= 64'd0;
		dotslice_dottile5_out_ins_valid <= 1'd0;
		dotslice_dottile5_state <= 2'd0;
		dotslice_dottile5_dotunit20_weight <= 8'd0;
		dotslice_dottile5_dotunit20_sum <= 16'd0;
		dotslice_dottile5_dotunit21_weight <= 8'd0;
		dotslice_dottile5_dotunit21_sum <= 16'd0;
		dotslice_dottile5_dotunit22_weight <= 8'd0;
		dotslice_dottile5_dotunit22_sum <= 16'd0;
		dotslice_dottile5_dotunit23_weight <= 8'd0;
		dotslice_dottile5_dotunit23_sum <= 16'd0;
		dotslice_dottile6_out_stream_e_valid <= 1'd0;
		dotslice_dottile6_out_stream_w_valid <= 1'd0;
		dotslice_dottile6_out_ins <= 64'd0;
		dotslice_dottile6_out_ins_valid <= 1'd0;
		dotslice_dottile6_state <= 2'd0;
		dotslice_dottile6_dotunit24_weight <= 8'd0;
		dotslice_dottile6_dotunit24_sum <= 16'd0;
		dotslice_dottile6_dotunit25_weight <= 8'd0;
		dotslice_dottile6_dotunit25_sum <= 16'd0;
		dotslice_dottile6_dotunit26_weight <= 8'd0;
		dotslice_dottile6_dotunit26_sum <= 16'd0;
		dotslice_dottile6_dotunit27_weight <= 8'd0;
		dotslice_dottile6_dotunit27_sum <= 16'd0;
		dotslice_dottile7_out_stream_e_valid <= 1'd0;
		dotslice_dottile7_out_stream_w_valid <= 1'd0;
		dotslice_dottile7_out_ins <= 64'd0;
		dotslice_dottile7_out_ins_valid <= 1'd0;
		dotslice_dottile7_state <= 2'd0;
		dotslice_dottile7_dotunit28_weight <= 8'd0;
		dotslice_dottile7_dotunit28_sum <= 16'd0;
		dotslice_dottile7_dotunit29_weight <= 8'd0;
		dotslice_dottile7_dotunit29_sum <= 16'd0;
		dotslice_dottile7_dotunit30_weight <= 8'd0;
		dotslice_dottile7_dotunit30_sum <= 16'd0;
		dotslice_dottile7_dotunit31_weight <= 8'd0;
		dotslice_dottile7_dotunit31_sum <= 16'd0;
		dotslice_dottile8_out_stream_e_valid <= 1'd0;
		dotslice_dottile8_out_stream_w_valid <= 1'd0;
		dotslice_dottile8_out_ins <= 64'd0;
		dotslice_dottile8_out_ins_valid <= 1'd0;
		dotslice_dottile8_state <= 2'd0;
		dotslice_dottile8_dotunit32_weight <= 8'd0;
		dotslice_dottile8_dotunit32_sum <= 16'd0;
		dotslice_dottile8_dotunit33_weight <= 8'd0;
		dotslice_dottile8_dotunit33_sum <= 16'd0;
		dotslice_dottile8_dotunit34_weight <= 8'd0;
		dotslice_dottile8_dotunit34_sum <= 16'd0;
		dotslice_dottile8_dotunit35_weight <= 8'd0;
		dotslice_dottile8_dotunit35_sum <= 16'd0;
		dotslice_dottile9_out_stream_e_valid <= 1'd0;
		dotslice_dottile9_out_stream_w_valid <= 1'd0;
		dotslice_dottile9_out_ins <= 64'd0;
		dotslice_dottile9_out_ins_valid <= 1'd0;
		dotslice_dottile9_state <= 2'd0;
		dotslice_dottile9_dotunit36_weight <= 8'd0;
		dotslice_dottile9_dotunit36_sum <= 16'd0;
		dotslice_dottile9_dotunit37_weight <= 8'd0;
		dotslice_dottile9_dotunit37_sum <= 16'd0;
		dotslice_dottile9_dotunit38_weight <= 8'd0;
		dotslice_dottile9_dotunit38_sum <= 16'd0;
		dotslice_dottile9_dotunit39_weight <= 8'd0;
		dotslice_dottile9_dotunit39_sum <= 16'd0;
		dotslice_dottile10_out_stream_e_valid <= 1'd0;
		dotslice_dottile10_out_stream_w_valid <= 1'd0;
		dotslice_dottile10_out_ins <= 64'd0;
		dotslice_dottile10_out_ins_valid <= 1'd0;
		dotslice_dottile10_state <= 2'd0;
		dotslice_dottile10_dotunit40_weight <= 8'd0;
		dotslice_dottile10_dotunit40_sum <= 16'd0;
		dotslice_dottile10_dotunit41_weight <= 8'd0;
		dotslice_dottile10_dotunit41_sum <= 16'd0;
		dotslice_dottile10_dotunit42_weight <= 8'd0;
		dotslice_dottile10_dotunit42_sum <= 16'd0;
		dotslice_dottile10_dotunit43_weight <= 8'd0;
		dotslice_dottile10_dotunit43_sum <= 16'd0;
		dotslice_dottile11_out_stream_e_valid <= 1'd0;
		dotslice_dottile11_out_stream_w_valid <= 1'd0;
		dotslice_dottile11_out_ins <= 64'd0;
		dotslice_dottile11_out_ins_valid <= 1'd0;
		dotslice_dottile11_state <= 2'd0;
		dotslice_dottile11_dotunit44_weight <= 8'd0;
		dotslice_dottile11_dotunit44_sum <= 16'd0;
		dotslice_dottile11_dotunit45_weight <= 8'd0;
		dotslice_dottile11_dotunit45_sum <= 16'd0;
		dotslice_dottile11_dotunit46_weight <= 8'd0;
		dotslice_dottile11_dotunit46_sum <= 16'd0;
		dotslice_dottile11_dotunit47_weight <= 8'd0;
		dotslice_dottile11_dotunit47_sum <= 16'd0;
		dotslice_dottile12_out_stream_e_valid <= 1'd0;
		dotslice_dottile12_out_stream_w_valid <= 1'd0;
		dotslice_dottile12_out_ins <= 64'd0;
		dotslice_dottile12_out_ins_valid <= 1'd0;
		dotslice_dottile12_state <= 2'd0;
		dotslice_dottile12_dotunit48_weight <= 8'd0;
		dotslice_dottile12_dotunit48_sum <= 16'd0;
		dotslice_dottile12_dotunit49_weight <= 8'd0;
		dotslice_dottile12_dotunit49_sum <= 16'd0;
		dotslice_dottile12_dotunit50_weight <= 8'd0;
		dotslice_dottile12_dotunit50_sum <= 16'd0;
		dotslice_dottile12_dotunit51_weight <= 8'd0;
		dotslice_dottile12_dotunit51_sum <= 16'd0;
		dotslice_dottile13_out_stream_e_valid <= 1'd0;
		dotslice_dottile13_out_stream_w_valid <= 1'd0;
		dotslice_dottile13_out_ins <= 64'd0;
		dotslice_dottile13_out_ins_valid <= 1'd0;
		dotslice_dottile13_state <= 2'd0;
		dotslice_dottile13_dotunit52_weight <= 8'd0;
		dotslice_dottile13_dotunit52_sum <= 16'd0;
		dotslice_dottile13_dotunit53_weight <= 8'd0;
		dotslice_dottile13_dotunit53_sum <= 16'd0;
		dotslice_dottile13_dotunit54_weight <= 8'd0;
		dotslice_dottile13_dotunit54_sum <= 16'd0;
		dotslice_dottile13_dotunit55_weight <= 8'd0;
		dotslice_dottile13_dotunit55_sum <= 16'd0;
		dotslice_dottile14_out_stream_e_valid <= 1'd0;
		dotslice_dottile14_out_stream_w_valid <= 1'd0;
		dotslice_dottile14_out_ins <= 64'd0;
		dotslice_dottile14_out_ins_valid <= 1'd0;
		dotslice_dottile14_state <= 2'd0;
		dotslice_dottile14_dotunit56_weight <= 8'd0;
		dotslice_dottile14_dotunit56_sum <= 16'd0;
		dotslice_dottile14_dotunit57_weight <= 8'd0;
		dotslice_dottile14_dotunit57_sum <= 16'd0;
		dotslice_dottile14_dotunit58_weight <= 8'd0;
		dotslice_dottile14_dotunit58_sum <= 16'd0;
		dotslice_dottile14_dotunit59_weight <= 8'd0;
		dotslice_dottile14_dotunit59_sum <= 16'd0;
		dotslice_dottile15_out_stream_e_valid <= 1'd0;
		dotslice_dottile15_out_stream_w_valid <= 1'd0;
		dotslice_dottile15_out_ins <= 64'd0;
		dotslice_dottile15_out_ins_valid <= 1'd0;
		dotslice_dottile15_state <= 2'd0;
		dotslice_dottile15_dotunit60_weight <= 8'd0;
		dotslice_dottile15_dotunit60_sum <= 16'd0;
		dotslice_dottile15_dotunit61_weight <= 8'd0;
		dotslice_dottile15_dotunit61_sum <= 16'd0;
		dotslice_dottile15_dotunit62_weight <= 8'd0;
		dotslice_dottile15_dotunit62_sum <= 16'd0;
		dotslice_dottile15_dotunit63_weight <= 8'd0;
		dotslice_dottile15_dotunit63_sum <= 16'd0;
		dotunit0_state <= 2'd0;
		dotunit1_state <= 2'd0;
		dotunit2_state <= 2'd0;
		dotunit3_state <= 2'd0;
		fsm0_state <= 2'd0;
		dotunit4_state <= 2'd0;
		dotunit5_state <= 2'd0;
		dotunit6_state <= 2'd0;
		dotunit7_state <= 2'd0;
		fsm1_state <= 2'd0;
		dotunit8_state <= 2'd0;
		dotunit9_state <= 2'd0;
		dotunit10_state <= 2'd0;
		dotunit11_state <= 2'd0;
		fsm2_state <= 2'd0;
		dotunit12_state <= 2'd0;
		dotunit13_state <= 2'd0;
		dotunit14_state <= 2'd0;
		dotunit15_state <= 2'd0;
		fsm3_state <= 2'd0;
		dotunit16_state <= 2'd0;
		dotunit17_state <= 2'd0;
		dotunit18_state <= 2'd0;
		dotunit19_state <= 2'd0;
		fsm4_state <= 2'd0;
		dotunit20_state <= 2'd0;
		dotunit21_state <= 2'd0;
		dotunit22_state <= 2'd0;
		dotunit23_state <= 2'd0;
		fsm5_state <= 2'd0;
		dotunit24_state <= 2'd0;
		dotunit25_state <= 2'd0;
		dotunit26_state <= 2'd0;
		dotunit27_state <= 2'd0;
		fsm6_state <= 2'd0;
		dotunit28_state <= 2'd0;
		dotunit29_state <= 2'd0;
		dotunit30_state <= 2'd0;
		dotunit31_state <= 2'd0;
		fsm7_state <= 2'd0;
		dotunit32_state <= 2'd0;
		dotunit33_state <= 2'd0;
		dotunit34_state <= 2'd0;
		dotunit35_state <= 2'd0;
		fsm8_state <= 2'd0;
		dotunit36_state <= 2'd0;
		dotunit37_state <= 2'd0;
		dotunit38_state <= 2'd0;
		dotunit39_state <= 2'd0;
		fsm9_state <= 2'd0;
		dotunit40_state <= 2'd0;
		dotunit41_state <= 2'd0;
		dotunit42_state <= 2'd0;
		dotunit43_state <= 2'd0;
		fsm10_state <= 2'd0;
		dotunit44_state <= 2'd0;
		dotunit45_state <= 2'd0;
		dotunit46_state <= 2'd0;
		dotunit47_state <= 2'd0;
		fsm11_state <= 2'd0;
		dotunit48_state <= 2'd0;
		dotunit49_state <= 2'd0;
		dotunit50_state <= 2'd0;
		dotunit51_state <= 2'd0;
		fsm12_state <= 2'd0;
		dotunit52_state <= 2'd0;
		dotunit53_state <= 2'd0;
		dotunit54_state <= 2'd0;
		dotunit55_state <= 2'd0;
		fsm13_state <= 2'd0;
		dotunit56_state <= 2'd0;
		dotunit57_state <= 2'd0;
		dotunit58_state <= 2'd0;
		dotunit59_state <= 2'd0;
		fsm14_state <= 2'd0;
		dotunit60_state <= 2'd0;
		dotunit61_state <= 2'd0;
		dotunit62_state <= 2'd0;
		dotunit63_state <= 2'd0;
		fsm15_state <= 2'd0;
	end
end

endmodule
