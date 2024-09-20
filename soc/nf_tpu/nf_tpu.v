// internal memory

module mem_tile #(
    parameter TILE_NO = 0,
    parameter INS_WIDTH = 64,
    parameter LANE_WIDTH = 32,
    parameter MEM_DEPTH = 1024
) (
    input wire clk,
    input [LANE_WIDTH-1:0] stream_in,
    input stream_in_valid,
    output reg [LANE_WIDTH-1:0] stream_out,
    output reg stream_out_valid,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid
);

    localparam STATE_PASS = 0;
    localparam STATE_READ = 1;
    localparam STATE_WRITE = 2;

    localparam OP_PASS = 0;
    localparam OP_READ = 1;
    localparam OP_WRITE = 2;

    reg [LANE_WIDTH-1:0] bram[0:MEM_DEPTH-1];
    reg [15:0] addr;
    reg [15:0] len;
    reg [7:0] state;
    wire [7:0] ins_tile_no = ins_in[15:8];
    wire [7:0] ins_op = ins_in[23:16];
    wire [15:0] ins_addr = ins_in[39:24];
    wire [15:0] ins_len = ins_in[55:40];

    initial begin
        state = STATE_PASS;
        ins_out_valid = 0;
        stream_out_valid = 0;
        len = 0;
    end

    always @(posedge clk) begin
        if (ins_in_valid && ins_in[15:8]==TILE_NO) begin
            case (ins_in[23:16])
                OP_PASS: begin
                    state <= STATE_PASS;
                    len <= 0;
                    addr <= 0;
                end
                OP_READ: begin
                    state <= STATE_READ;
                    addr <= ins_in[39:24];
                    len <= ins_in[55:40];
                end
                OP_WRITE: begin
                    state <= STATE_WRITE;
                    addr <= ins_in[39:24];
                    len <= ins_in[55:40];
                end
            endcase
            ins_out <= 0;
            ins_out_valid <= 0;
        end else begin
            ins_out <= ins_in;
            ins_out_valid <= ins_in_valid;
        end
        case (state)
            STATE_PASS: begin
                stream_out_valid <= stream_in_valid;
                stream_out <= stream_in;
            end
            STATE_READ: begin
                stream_out <= bram[addr];
                stream_out_valid <= 1;
                if (len > 0) begin
                    addr <= addr + 1;
                    len <= len - 1;
                end else begin
                    state <= STATE_PASS;
                end
            end
            STATE_WRITE: begin
                if (stream_in_valid) begin
                    bram[addr] <= stream_in;
                    if (len > 0) begin
                        addr <= addr + 1;
                        len <= len - 1;
                    end else begin
                        state <= STATE_PASS;
                    end
                end
            end
        endcase
    end
endmodule

module mem_slice #(
    parameter NUM_TILES  = 16,   // 16*32=512
    parameter DATA_WIDTH = 512,
    parameter INS_WIDTH  = 64
) (
    input wire clk,
    input [DATA_WIDTH-1:0] stream_in_w,
    input [NUM_TILES-1:0] stream_in_w_valid,
    output [DATA_WIDTH-1:0] stream_out_e,
    output [NUM_TILES-1:0] stream_out_e_valid,
    input [DATA_WIDTH-1:0] stream_in_e,
    input [NUM_TILES-1:0] stream_in_e_valid,
    output [DATA_WIDTH-1:0] stream_out_w,
    output [NUM_TILES-1:0] stream_out_w_valid,
    input [INS_WIDTH-1:0] ins_in_w,
    input [INS_WIDTH-1:0] ins_in_e,
    input ins_in_valid_w,
    input ins_in_valid_e
);

    wire [INS_WIDTH-1:0] ins_inter_w[0:NUM_TILES-1];
    wire ins_valid_inter_w[0:NUM_TILES-1];

    wire [INS_WIDTH-1:0] ins_inter_e[0:NUM_TILES-1];
    wire ins_valid_inter_e[0:NUM_TILES-1];

    genvar i;
    generate
        for (i = 0; i < NUM_TILES; i = i + 1) begin : tiles
            mem_tile #(
                .TILE_NO(i)
            ) tile_w (
                .clk(clk),
                .stream_in(stream_in_w[i*32+:32]),
                .stream_in_valid(stream_in_w_valid[i]),
                .stream_out(stream_out_w[i*32+:32]),
                .stream_out_valid(stream_out_w_valid[i]),
                .ins_in(i == 0 ? ins_in_w : ins_inter_w[i-1]),
                .ins_in_valid(i == 0 ? ins_in_valid_w : ins_valid_inter_w[i-1]),
                .ins_out(ins_inter_w[i]),
                .ins_out_valid(ins_valid_inter_w[i])
            );

            mem_tile #(
                .TILE_NO(i)
            ) tile_e (
                .clk(clk),
                .stream_in(stream_in_e[i*32+:32]),
                .stream_in_valid(stream_in_e_valid[i]),
                .stream_out(stream_out_e[i*32+:32]),
                .stream_out_valid(stream_out_e_valid[i]),
                .ins_in(i == 0 ? ins_in_e : ins_inter_e[i-1]),
                .ins_in_valid(i == 0 ? ins_in_valid_e : ins_valid_inter_e[i-1]),
                .ins_out(ins_inter_e[i]),
                .ins_out_valid(ins_valid_inter_e[i])
            );
        end
    endgenerate

endmodule

module mem_id #(
    parameter ID_NO_W  = 3,
    parameter ID_NO_E  = 4,
    parameter INS_WIDTH = 64
)(
    input wire clk,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,
    output wire [INS_WIDTH-1:0] slice_ins_out_w,
    output wire [INS_WIDTH-1:0] slice_ins_out_e,
    output wire slice_ins_out_valid_w,
    output wire slice_ins_out_valid_e
);

    initial begin
        ins_out_valid = 0;
    end

    assign slice_ins_out_valid_w = ins_in_valid && ins_in[7:0] == ID_NO_W;
    assign slice_ins_out_valid_e = ins_in_valid && ins_in[7:0] == ID_NO_E;
    assign slice_ins_out_w = ins_in;
    assign slice_ins_out_e = ins_in;

    always @(posedge clk) begin
        if (slice_ins_out_valid_w || slice_ins_out_valid_e) begin
            ins_out <= 0;
            ins_out_valid <= 0;
        end else begin
            ins_out <= ins_in;
            ins_out_valid <= ins_in_valid;
        end
    end

endmodule

// routing switch

module sw_tile #(
    parameter TILE_NO = 0,
    parameter INS_WIDTH = 64
) (
    input wire clk,
    input [31:0] stream_in,
    input stream_in_valid,
    output reg [31:0] stream_out,
    output reg stream_out_valid,
    input [31:0] data_in,
    input data_in_valid,
    output reg [31:0] data_out,
    output reg data_out_valid,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid
);

    localparam STATE_PASS = 0;
    localparam STATE_DRAM_IN = 1;
    localparam STATE_DRAM_OUT = 2;

    reg [7:0] state;

    initial begin
        state = STATE_PASS;
        ins_out_valid = 0;
        stream_out_valid = 0;
        data_out_valid = 0;
    end

    wire [7:0] ins_tile_no = ins_in[15:8];
    wire [7:0] ins_state = ins_in[23:16];

    always @(posedge clk) begin
        if (state == STATE_PASS) begin
            stream_out <= stream_in;
            stream_out_valid <= stream_in_valid;
        end else if (state == STATE_DRAM_IN) begin
            stream_out <= data_in;
            stream_out_valid <= data_in_valid;
        end else if (state == STATE_DRAM_OUT) begin
            data_out <= stream_in;
            data_out_valid <= stream_in_valid;
            stream_out <= 0;
        end
        if (ins_in_valid && ins_tile_no == TILE_NO) begin
            state <= ins_state;
            ins_out <= 0;
            ins_out_valid <= 0;
        end else begin
            ins_out <= ins_in;
            ins_out_valid <= ins_in_valid;
        end
    end

endmodule

module sw_slice #(
    parameter NUM_TILES = 16,  // 16*32=512
    parameter DATA_WIDTH = 512,
    parameter INS_WIDTH = 64
) (
    input wire clk,
    input [DATA_WIDTH-1:0] stream_in,
    input [NUM_TILES-1:0] stream_in_valid,
    output [DATA_WIDTH-1:0] stream_out,
    output [NUM_TILES-1:0] stream_out_valid,
    input [DATA_WIDTH-1:0] data_in,
    input data_in_valid,
    output [DATA_WIDTH-1:0] data_out,
    output data_out_valid,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid
);

    wire [INS_WIDTH-1:0] ins_inter[NUM_TILES-1:0];
    wire ins_valid_inter[NUM_TILES-1:0];
    wire intermediate_or[NUM_TILES-1:0];
    wire tile_data_out_valid[NUM_TILES-1:0];

    genvar i;
    generate
        for (i = 0; i < NUM_TILES; i = i + 1) begin : tiles
            sw_tile #(
                .TILE_NO(i)
            ) tile (
                .clk(clk),
                .stream_in(stream_in[i*32+:32]),
                .stream_in_valid(stream_in_valid[i]),
                .stream_out(stream_out[i*32+:32]),
                .stream_out_valid(stream_out_valid[i]),
                .data_in(data_in[i*32+:32]),
                .data_in_valid(data_in_valid),
                .data_out(data_out[i*32+:32]),
                .data_out_valid(tile_data_out_valid[i]),
                .ins_in(i == 0 ? ins_in : ins_inter[i-1]),
                .ins_in_valid(i == 0 ? ins_in_valid : ins_valid_inter[i-1]),
                .ins_out(ins_inter[i]),
                .ins_out_valid(ins_valid_inter[i])
            );

            assign intermediate_or[i] = (i==0 ? 0 : intermediate_or[i-1]) | tile_data_out_valid[i];
        end
    endgenerate

    assign data_out_valid = intermediate_or[NUM_TILES-1];

endmodule

module sw_id #(
    parameter ID_NO  = 2,
    parameter INS_WIDTH = 64
) (
    input wire clk,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,
    output wire [INS_WIDTH-1:0] slice_ins_out,
    output wire slice_ins_out_valid
);

    initial begin
        ins_out_valid = 0;
    end

    assign slice_ins_out_valid = ins_in_valid && ins_in[7:0] == ID_NO;
    assign slice_ins_out = ins_in;

    always @(posedge clk) begin
        if (slice_ins_out_valid) begin
            ins_out <= 0;
            ins_out_valid <= 0;
        end else begin
            ins_out <= ins_in;
            ins_out_valid <= ins_in_valid;
        end
    end

endmodule

// dot product compute

module fp4_fma(
    input [7:0] a,    // 8-bit input
    input [3:0] b,    // 4-bit input (FP4 E3M0 format)
    input [15:0] c,   // 16-bit input
    output reg [15:0] result // 16-bit clamped output
);
    // Constants for 16-bit signed min and max values
    localparam signed [15:0] MIN_VALUE = -16'sd32768;
    localparam signed [15:0] MAX_VALUE = 16'sd32767;

    // Extend the 8-bit input to 16 bits
    wire signed [15:0] a_extended;
    assign a_extended = {{8{a[7]}}, a};  // Sign extension

    // Decode FP4 E3M0
    wire b_sign;
    wire [2:0] b_exp;

    assign b_sign = b[3];
    assign b_exp = b[2:0];

    // Intermediate result (17 bits to detect overflow)
    reg signed [16:0] intermediate_result;
    reg signed [15:0] shifted_a;

    always @(*) begin
        if (b == 4'b0000) begin
            intermediate_result = {1'b0, c};  // Pass through if b is zero
        end else begin
            // Shift a_extended based on b_exp
            if (b_exp == 3'b001) shifted_a = a_extended;
            else if (b_exp == 3'b010) shifted_a = a_extended << 1;
            else if (b_exp == 3'b011) shifted_a = a_extended << 2;
            else if (b_exp == 3'b100) shifted_a = a_extended << 3;
            else if (b_exp == 3'b101) shifted_a = a_extended << 4;
            else if (b_exp == 3'b110) shifted_a = a_extended << 5;
            else if (b_exp == 3'b111) shifted_a = a_extended << 6;
            else shifted_a = a_extended;

            // Add or subtract based on b_sign
            intermediate_result = b_sign ? (c - shifted_a) : (c + shifted_a);
        end

        // Clamping logic
        if (intermediate_result > MAX_VALUE)
            result = MAX_VALUE;
        else if (intermediate_result < MIN_VALUE)
            result = MIN_VALUE;
        else
            result = intermediate_result[15:0];
    end
endmodule

module dot_tile #(
    parameter TILE_NO = 0,
    parameter INS_WIDTH = 64,
    parameter IS_LAST_SUM = 1
) (
    input wire clk,
    input wire rst,
    input wire [1:0] state,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,
    input wire [15:0] stream_in_e,
    input wire stream_in_e_valid,
    output reg [15:0] stream_out_w,
    output reg stream_out_w_valid,
    input wire [15:0] stream_in_w,
    input wire stream_in_w_valid,
    output reg [15:0] stream_out_e,
    output reg stream_out_e_valid,
    input wire [15:0] stream_in_n,
    input wire stream_in_n_valid,
    output reg [15:0] stream_out_s,
    output reg stream_out_s_valid
);
    localparam STATE_PASS = 0;
    localparam STATE_LOAD_WEIGHT = 1;
    localparam STATE_LOAD_SUM = 2;
    localparam STATE_MUL = 3;

    localparam OP_PASS = 0;
    localparam OP_LOAD_WEIGHT = 1;
    localparam OP_LOAD_SUM = 2;
    localparam OP_MUL = 3;

    reg [7:0] weight;
    wire [15:0] fma_result;

    fp4_fma fma (
        .a(weight),
        .b(stream_in_e[3:0]),
        .c(stream_in_n),
        .result(fma_result)
    );

    always @(posedge clk) begin
        case (state)
            STATE_PASS: begin
                stream_out_w <= stream_in_e;
                stream_out_w_valid <= stream_in_e_valid;
                stream_out_e <= stream_in_w;
                stream_out_e_valid <= stream_in_w_valid;
                stream_out_s <= 0;
                stream_out_s_valid <= 0;
            end
            STATE_LOAD_WEIGHT: begin
                if (stream_in_e_valid) begin
                    weight <= stream_in_e[7:0];
                    state <= STATE_PASS;
                end
                stream_out_w <= 0;
                stream_out_w_valid <= 0;
                stream_out_e <= stream_in_w;
                stream_out_e_valid <= stream_in_w_valid;
                stream_out_s <= 0;
                stream_out_s_valid <= 0;
            end
            STATE_LOAD_SUM: begin
                if (stream_in_e_valid) begin
                    sum <= stream_in_e;
                    state <= STATE_PASS;
                end
                stream_out_w <= 0;
                stream_out_w_valid <= 0;
                stream_out_e <= stream_in_w;
                stream_out_e_valid <= stream_in_w_valid;
                stream_out_s <= 0;
                stream_out_s_valid <= 0;
            end
            STATE_MUL: begin
                stream_out_e <= stream_in_e;
                stream_out_e_valid <= stream_in_e_valid;
                stream_out_s <= 0;
                stream_out_s_valid <= 1;
                if (IS_LAST_SUM) begin
                    if (stream_in_e_valid) begin
                        stream_out_e <= fma_result;
                        stream_out_e_valid <= 1;
                    end
                end else begin
                    if (stream_in_e_valid) begin
                        stream_out_s <= fma_result;
                        stream_out_s_valid <= 1;
                    end
                end
            end
        endcase
        if (ins_in_valid && ins_in[15:8]==TILE_NO) begin
            case (ins_in[23:16])
                OP_LOAD_WEIGHT: begin
                    state <= STATE_LOAD_WEIGHT;
                end
                OP_MUL: begin
                    state <= STATE_MUL;
                end
            endcase
            ins_out_valid <= 0;
        end else begin
            ins_out <= ins_in;
            ins_out_valid <= ins_in_valid;
        end
    end

endmodule

module dot_slice #(
    parameter DATA_WIDTH = 128, // 16*8
    parameter NUM_TILES = 8,
    parameter INS_WIDTH = 64,
    parameter LAST_TILE_NO = 0,
)(
    input clk,
    input [DATA_WIDTH-1:0] stream_in_w,
    input [NUM_TILES-1:0] stream_in_w_valid,
    output [DATA_WIDTH-1:0] stream_out_e,
    output [NUM_TILES-1:0] stream_out_e_valid,
    output [DATA_WIDTH-1:0] stream_out_w,
    output [NUM_TILES-1:0] stream_out_w_valid,
    input [DATA_WIDTH-1:0] stream_in_e,
    input [NUM_TILES-1:0] stream_in_e_valid,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid
);

    wire [INS_WIDTH-1:0] ins_inter[0:NUM_TILES-1];
    wire ins_valid_inter[0:NUM_TILES-1];

    genvar i;
    generate
        for (i = 0; i < NUM_TILES; i = i + 1) begin : tiles
            dot_tile #(
                .TILE_NO(i),
                .IS_LAST_SUM(i==LAST_TILE_NO)
            ) tile (
                .clk(clk),
                .stream_in_w(stream_in_w[i*16+:16]),
                .stream_in_w_valid(stream_in_w_valid[i]),
                .stream_out_e(stream_out_e[i*16+:16]),
                .stream_out_e_valid(stream_out_e_valid[i]),
                .stream_out_w(stream_out_w[i*16+:16]),
                .stream_out_w_valid(stream_out_w_valid[i]),
                .stream_in_e(stream_in_e[i*16+:16]),
                .stream_in_e_valid(stream_in_e_valid[i]),
                .ins_in(i==0?ins_in:ins_inter[i-1]),
                .ins_in_valid(i==0?ins_in_valid:ins_valid_inter[i-1]),
                .ins_out(ins_inter[i]),
                .ins_out_valid(ins_valid_inter[i])
            );
        end
    endgenerate

endmodule

module dot_id #(
    parameter ID_NO  = 6,
    parameter INS_WIDTH = 64
)(
    input wire clk,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,
    output wire [INS_WIDTH-1:0] slice_ins_out,
    output wire slice_ins_out_valid
);

    initial begin
        ins_out_valid = 0;
    end

    assign slice_ins_out_valid = ins_in_valid && ins_in[7:0] == ID_NO;
    assign slice_ins_out = ins_in;

    always @(posedge clk) begin
        if (slice_ins_out_valid) begin
            ins_out <= 0;
            ins_out_valid <= 0;
        end else begin
            ins_out <= ins_in;
            ins_out_valid <= ins_in_valid;
        end
    end

endmodule

// TODO: check this (synth)
module dot_block #(
    parameter DATA_WIDTH = 128, // 16*8
    parameter NUM_TILES = 8,
    parameter INS_WIDTH = 64,
    parameter NUM_SLICES = 8,
    parameter START_ID_NO = 8,
)(
    input clk,
    input [DATA_WIDTH-1:0] stream_in_w,
    input [NUM_TILES-1:0] stream_in_w_valid,
    output [DATA_WIDTH-1:0] stream_out_e,
    output [NUM_TILES-1:0] stream_out_e_valid,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
);
    wire [INS_WIDTH-1:0] ins_inter[0:NUM_SLICES-2];
    wire ins_valid_inter[0:NUM_SLICES-2];

    wire [INS_WIDTH-1:0] slice_ins[0:NUM_SLICES-1];
    wire slice_ins_valid[0:NUM_SLICES-1];

    wire [DATA_WIDTH-1:0] stream_inter_w[0:NUM_SLICES-1];
    wire [DATA_WIDTH-1:0] stream_inter_e[0:NUM_SLICES-1];
    wire [NUM_TILES-1:0] stream_valid_inter_w[0:NUM_SLICES-1];
    wire [NUM_TILES-1:0] stream_valid_inter_e[0:NUM_SLICES-1];

    genvar i;
    generate
        for (i = 0; i < NUM_SLICES; i = i + 1) begin : slices
            dot_id #(
                .ID_NO(START_ID_NO+i)
            ) id (
                .clk(clk),
                .ins_in(i==0?ins_in:ins_inter[i-1]),
                .ins_in_valid(i==0?ins_in_valid:ins_valid_inter[i-1]),
                .ins_out(ins_inter[i]),
                .ins_out_valid(ins_valid_inter[i]),
                .slice_ins_out(slice_ins[i]),
                .slice_ins_out_valid(slice_ins_valid[i])
            );

            dot_slice #(
                .LAST_TILE_NO(i)
            ) slice (
                .clk(clk),
                .stream_in_w(i==0?stream_in_w:stream_inter_w[i-1]),
                .stream_in_w_valid(i==0?stream_in_w_valid:stream_valid_inter_w[i-1]),
                .stream_out_e(i==0?stream_out_e:stream_inter_e[i-1]),
                .stream_out_e_valid(i==0?stream_out_e_valid:stream_valid_inter_e[i-1]),
                .stream_out_w(stream_inter_w[i]),
                .stream_out_w_valid(stream_inter_w_valid[i]),
                .stream_in_e(i<=NUM_SLICES-1?stream_inter_e[i]:0),
                .stream_in_e_valid(i<=NUM_SLICES-1?stream_inter_e_valid[i]:0),
                .ins_in(slice_ins[i]),
                .ins_in_valid(slice_ins_valid[i]),
            );
        end
    endgenerate

endmodule

// pointwise compute

module int16_relu(
    input wire signed [15:0] x,
    output wire [15:0] y
);
    assign y = x[15] ? 16'b0 : x;
endmodule

module vec_unit (
    input wire clk,
    input wire rst,
    input wire [2:0] state,
    input wire [7:0] stream_in_w,
    input wire stream_in_valid_w,
    output reg [7:0] stream_out_e,
    input wire [7:0] stream_in_e,
    input wire stream_in_valid_e,
    output reg [7:0] stream_out_w,
    input wire [7:0] in_weight,
    output reg [7:0] out_weight
);
    localparam STATE_PASS = 0;
    localparam STATE_REVERT = 1;
    localparam STATE_LOAD = 2;
    localparam STATE_ADD = 3;
    localparam STATE_RELU = 4;

    reg [7:0] const_b;
    wire [7:0] add_result;
    wire [7:0] relu_result;

    fp8_relu relu (
        //.clk(clk),
        //.rst(rst),
        .a(stream_in_e),
        .result(relu_result)
    );

    reg [7:0] stream_in_w_reg [2:0];
    reg [7:0] stream_in_e_reg [2:0];
    reg [2:0] state_reg [2:0];
    reg stream_in_valid_w_reg [2:0];
    reg stream_in_valid_e_reg [2:0];

    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            const_b <= 8'b0;
            stream_out_e <= 8'b0;
            stream_out_w <= 8'b0;
            out_weight <= 8'b0;
            for (i = 0; i < 3; i = i + 1) begin
                stream_in_w_reg[i] <= 8'b0;
                stream_in_e_reg[i] <= 8'b0;
                state_reg[i] <= 3'b0;
                stream_in_valid_w_reg[i] <= 1'b0;
                stream_in_valid_e_reg[i] <= 1'b0;
            end
        end else begin
            // Shift pipeline registers
            for (i = 2; i > 0; i = i - 1) begin
                stream_in_w_reg[i] <= stream_in_w_reg[i-1];
                stream_in_e_reg[i] <= stream_in_e_reg[i-1];
                state_reg[i] <= state_reg[i-1];
                stream_in_valid_w_reg[i] <= stream_in_valid_w_reg[i-1];
                stream_in_valid_e_reg[i] <= stream_in_valid_e_reg[i-1];
            end

            // Input stage
            stream_in_w_reg[0] <= stream_in_w;
            stream_in_e_reg[0] <= stream_in_e;
            state_reg[0] <= state;
            stream_in_valid_w_reg[0] <= stream_in_valid_w;
            stream_in_valid_e_reg[0] <= stream_in_valid_e;

            // Output stage
            case (state_reg[2])
                STATE_PASS: begin
                    stream_out_w <= stream_in_w_reg[2];
                    stream_out_e <= stream_in_e_reg[2];
                end
                STATE_REVERT: begin
                    stream_out_e <= stream_in_w_reg[2];
                end
                STATE_LOAD: begin
                    if (stream_in_valid_w_reg[2]) begin
                        const_b <= stream_in_w_reg[2];
                    end
                end
                STATE_ADD: begin
                    if (stream_in_valid_e_reg[2]) begin
                        stream_out_e <= add_result;
                    end
                end
                STATE_RELU: begin
                    if (stream_in_valid_e_reg[2]) begin
                        stream_out_e <= relu_result;
                    end
                end
                default: begin
                    stream_out_w <= stream_in_w_reg[2];
                    stream_out_e <= stream_in_e_reg[2];
                end
            endcase
        end
    end
endmodule

module vec_tile #(
    parameter TILE_NO = 0,
    parameter INS_WIDTH = 64,
    parameter LANE_WIDTH = 32
)(
    input clk,
    input [LANE_WIDTH-1:0] stream_in_w,
    input stream_in_valid_w,
    output reg [LANE_WIDTH-1:0] stream_out_e,
    output reg stream_out_valid_e,
    input [LANE_WIDTH-1:0] stream_in_e,
    input stream_in_valid_e,
    output reg [LANE_WIDTH-1:0] stream_out_w,
    output reg stream_out_valid_w,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid
);

    localparam STATE_PASS = 0;
    localparam STATE_LOAD = 1;
    localparam STATE_ADD = 2;
    localparam STATE_REVERT = 3;

    localparam OP_PASS = 0;
    localparam OP_LOAD = 1;
    localparam OP_ADD = 2;
    localparam OP_REVERT = 3;

    reg [1:0] state;
    wire [7:0] weight_inter[4];

    initial begin
        state = STATE_PASS;
        ins_out_valid = 0;
        stream_out_valid_w = 0;
        stream_out_valid_e = 0;
    end

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : dots
            vec_unit unit (
                .clk(clk),
                .state(state),
                .stream_in_w(stream_in_w[i*8+:8]),
                .stream_in_valid_w(stream_in_valid_w),
                .stream_out_e(stream_out_e[i*8+:8]),
                .stream_in_e(stream_in_e[i*8+:8]),
                .stream_in_valid_e(stream_in_valid_e),
                .stream_out_w(stream_out_w[i*8+:8])
            );
        end
    endgenerate

    always @(posedge clk) begin
        case (state)
            STATE_PASS: begin
                stream_out_valid_w <= stream_in_valid_w;
                stream_out_valid_e <= stream_in_valid_e;
            end
            STATE_LOAD: begin
                stream_out_valid_w <= 0;
                stream_out_valid_e <= stream_in_valid_e;
            end
            STATE_ADD: begin
                stream_out_valid_w <= stream_in_valid_w;
                stream_out_valid_e <= stream_in_valid_e;
            end
            STATE_REVERT: begin
                stream_out_valid_w <= 0;
                stream_out_valid_e <= stream_in_valid_w;
            end
        endcase
        if (ins_in_valid && ins_in[15:8]==TILE_NO) begin
            case (ins_in[23:16])
                OP_PASS: begin
                    state <= STATE_PASS;
                end
                OP_LOAD: begin
                    state <= STATE_LOAD;
                end
                OP_ADD: begin
                    state <= STATE_ADD;
                end
                OP_REVERT: begin
                    state <= STATE_REVERT;
                end
            endcase
            ins_out_valid <= 0;
        end else begin
            ins_out <= ins_in;
            ins_out_valid <= ins_in_valid;
        end
    end

endmodule

module vec_slice #(
    parameter DATA_WIDTH = 512,
    parameter NUM_TILES = 16,
    parameter INS_WIDTH = 64
)(
    input clk,
    input [DATA_WIDTH-1:0] stream_in_w,
    input [NUM_TILES-1:0] stream_in_w_valid,
    output [DATA_WIDTH-1:0] stream_out_e,
    input [NUM_TILES-1:0] stream_out_e_valid,
    input [DATA_WIDTH-1:0] stream_in_e,
    input [NUM_TILES-1:0] stream_in_e_valid,
    output [DATA_WIDTH-1:0] stream_out_w,
    input [NUM_TILES-1:0] stream_out_w_valid,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid
);

    wire [INS_WIDTH-1:0] ins_inter[0:NUM_TILES-1];
    wire ins_valid_inter[0:NUM_TILES-1];

    genvar i;
    generate
        for (i = 0; i < NUM_TILES; i = i + 1) begin : tiles
            vec_tile #(
                .TILE_NO(i)
            ) tile (
                .clk(clk),
                .stream_in_w(stream_in_w[i*32+:32]),
                .stream_in_valid_w(stream_in_w_valid[i]),
                .stream_out_e(stream_out_e[i*32+:32]),
                .stream_out_valid_e(stream_out_e_valid[i]),
                .stream_in_e(stream_in_e[i*32+:32]),
                .stream_in_valid_e(stream_in_e_valid[i]),
                .stream_out_w(stream_out_w[i*32+:32]),
                .stream_out_valid_w(stream_out_w_valid[i]),
                .ins_in(i==0?ins_in:ins_inter[i-1]),
                .ins_in_valid(i==0?ins_in_valid:ins_valid_inter[i-1]),
                .ins_out(ins_inter[i]),
                .ins_out_valid(ins_valid_inter[i])
            );
        end
    endgenerate

endmodule

module vec_id #(
    parameter ID_NO  = 5,
    parameter INS_WIDTH = 64
)(
    input wire clk,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,
    output wire [INS_WIDTH-1:0] slice_ins_out,
    output wire slice_ins_out_valid
);

    initial begin
        ins_out_valid = 0;
    end

    assign slice_ins_out_valid = ins_in_valid && ins_in[7:0] == ID_NO;
    assign slice_ins_out = ins_in;

    always @(posedge clk) begin
        if (slice_ins_out_valid) begin
            ins_out <= 0;
            ins_out_valid <= 0;
        end else begin
            ins_out <= ins_in;
            ins_out_valid <= ins_in_valid;
        end
    end

endmodule

// stream io

module fifo_512_to_64 (
    input wire clk,
    input wire [511:0] data_in,
    input wire wr_en,
    input wire rd_en,
    output reg [63:0] data_out,
    output reg data_out_valid,
    output wire fifo_full,
    output wire fifo_empty
);

parameter FIFO_DEPTH = 64;
parameter INPUT_WIDTH = 512;
parameter OUTPUT_WIDTH = 64;
parameter PTR_BITS = $clog2(FIFO_DEPTH);

reg [INPUT_WIDTH-1:0] fifo_mem [0:FIFO_DEPTH-1];
reg [PTR_BITS-1:0] wr_ptr = 0;
reg [PTR_BITS-1:0] rd_ptr = 0;
reg [2:0] rd_shift = 0;

initial begin
    data_out_valid = 0;
end

assign fifo_empty = (wr_ptr == rd_ptr) && (rd_shift == 0);
assign fifo_full = ((wr_ptr + 1'b1) == rd_ptr);
assign fifo_length = wr_ptr >= rd_ptr ? (wr_ptr - rd_ptr) : (FIFO_DEPTH + wr_ptr - rd_ptr);

always @(posedge clk) begin
    if (wr_en && !fifo_full) begin
        fifo_mem[wr_ptr] <= data_in;
        wr_ptr <= wr_ptr + 1'b1;
    end
end

always @(posedge clk) begin
    if (rd_en && !fifo_empty) begin
        data_out <= fifo_mem[rd_ptr][rd_shift*OUTPUT_WIDTH +: OUTPUT_WIDTH];
        rd_shift <= rd_shift + 1'b1;
        data_out_valid <= 1;
        if (rd_shift == ((INPUT_WIDTH / OUTPUT_WIDTH) - 1)) begin
            rd_shift <= 0;
            rd_ptr <= rd_ptr + 1'b1;
        end
    end else begin
        data_out_valid <= 0;
    end
end

endmodule

module conv_64_to_512 (
    input clk,
    input [63:0] data_in,
    input data_in_valid,
    output reg [511:0] data_out,
    output reg data_out_valid
);

reg [63:0] buffer[7:0];
reg [2:0] count;

initial begin
    count = 0;
    data_out_valid = 0;
    data_out = 0;
end

always @(posedge clk) begin
    if (data_in_valid) begin
        buffer[count] <= data_in;
        if (count == 7) begin
            data_out <= {buffer[7], buffer[6], buffer[5], buffer[4], 
                             buffer[3], buffer[2], buffer[1], buffer[0]};
            data_out_valid <= 1;
            count <= 0;
        end else begin
            count <= count + 1;
            data_out_valid <= 0;
        end
    end else begin
        data_out_valid <= 0;
    end
end

endmodule

module stream_io #(
    parameter ID_NO  = 0,
    parameter DATA_WIDTH = 512,
    parameter INS_WIDTH = 64,
    parameter STREAM_WIDTH = 64
) (
    input wire clk,

    input [STREAM_WIDTH-1:0] rx_tdata,
    input rx_tvalid,
    input rx_tlast,
    output rx_tready,

    output [STREAM_WIDTH-1:0] tx_tdata,
    output tx_tvalid,
    output reg tx_tlast,
    input tx_tready,

    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,

    output reg [DATA_WIDTH-1:0] sw_data_out,
    output reg sw_data_out_valid,

    input [DATA_WIDTH-1:0] sw_data_in,
    input sw_data_in_valid
);
    localparam RX_STATE_INS = 0;
    localparam RX_STATE_DATA = 1;
    localparam RX_STATE_NOP = 2;

    localparam TX_STATE_PASS = 0;
    localparam TX_STATE_DATA = 1;

    localparam OP_READ_DATA = 1;
    localparam OP_WRITE_DATA = 2;
    localparam OP_NOP = 3;

    reg [1:0] rx_state;
    reg [15:0] rx_len;
    reg [1:0] tx_state;
    reg [15:0] tx_len;

    reg [STREAM_WIDTH-1:0] rx_conv_data_in;
    reg rx_conv_data_in_valid;

    wire [STREAM_WIDTH-1:0] fifo_data_out;
    wire fifo_data_out_valid;

    assign rx_tready = rx_state == RX_STATE_INS || rx_state == RX_STATE_DATA;

    initial begin
        rx_state = RX_STATE_INS;
        rx_len = 0;
        tx_tlast = 1;
        tx_state = TX_STATE_PASS;
        tx_len = 0;
        ins_out_valid = 0;
        ins_out = 0;
        rx_conv_data_in = 0;
        rx_conv_data_in_valid = 0;
    end

    fifo_512_to_64 tx_fifo (
        .clk(clk),
        .data_in(sw_data_in),
        .wr_en(sw_data_in_valid),
        .data_out(tx_tdata),
        .data_out_valid(tx_tvalid),
        .rd_en(tx_tready)
    );

    conv_64_to_512 rx_conv (
        .clk(clk),
        .data_in(rx_conv_data_in),
        .data_in_valid(rx_conv_data_in_valid),
        .data_out(sw_data_out),
        .data_out_valid(sw_data_out_valid)
    );

    always @(posedge clk) begin
        if (rx_state == RX_STATE_INS) begin
            rx_conv_data_in_valid <= 0;
            if (rx_tvalid) begin
                if (rx_tdata[7:0] == 0) begin
                    if (rx_tdata[15:8] == OP_READ_DATA) begin
                        rx_state <= RX_STATE_DATA;
                        rx_len <= rx_tdata[31:16];
                    end else if (rx_tdata[15:8] == OP_WRITE_DATA) begin
                        tx_state <= TX_STATE_DATA;
                        tx_len <= rx_tdata[31:16];
                    end else if (rx_tdata[15:8] == OP_NOP) begin
                        rx_state <= RX_STATE_NOP;
                        rx_len <= rx_tdata[31:16];
                    end
                    ins_out <= 0;
                    ins_out_valid <= 0;
                end else begin
                    ins_out <= rx_tdata;
                    ins_out_valid <= 1;
                end
            end else begin
                ins_out <= 0;
                ins_out_valid <= 0;
            end
        end else if (rx_state == RX_STATE_DATA) begin
            if (rx_tvalid) begin
                rx_conv_data_in <= rx_tdata;
                rx_conv_data_in_valid <= 1;
                if (rx_len == 0) begin
                    rx_state <= RX_STATE_INS;
                end else begin
                    rx_len <= rx_len - 1;
                end
            end else begin
                rx_conv_data_in_valid <= 0;
            end
        end else if (rx_state == RX_STATE_NOP) begin
            if (rx_len == 0) begin
                rx_state <= RX_STATE_INS;
            end else begin
                rx_len <= rx_len - 1;
            end
        end
        if (tx_state == TX_STATE_DATA) begin
            if (tx_tvalid) begin // XXX: check this
                if (tx_len == 0) begin
                    tx_state <= TX_STATE_PASS;
                    tx_tlast <= 1;
                end else begin
                    tx_len <= tx_len - 1;
                    tx_tlast <= 0;
                end
            end
        end
    end

endmodule

// dram io

module id_fifo #(
    parameter INS_WIDTH = 64,
    parameter DEPTH = 128,
    parameter LOG_DEPTH = 7
)(
    input wire clk,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,
    input wire ins_out_ready
);

    reg [INS_WIDTH-1:0] fifo[DEPTH-1:0];
    reg [LOG_DEPTH-1:0] write_ptr;
    reg [LOG_DEPTH-1:0] read_ptr;
    wire fifo_full;
    wire fifo_empty;
    reg [7:0] repeat_count;
    reg [1:0] state;

    initial begin
        write_ptr = 0;
        read_ptr = 0;
        ins_out_valid = 0;
    end

    assign fifo_full  = (write_ptr + 1'b1 == read_ptr);
    assign fifo_empty = (write_ptr == read_ptr);
    assign fifo_length = write_ptr >= read_ptr ? (write_ptr - read_ptr) : (DEPTH + write_ptr - read_ptr);

    always @(posedge clk) begin
        if (!fifo_full && ins_in_valid) begin
            fifo[write_ptr] <= ins_in;
            write_ptr <= write_ptr + 1;
        end
        if (ins_out_ready) begin
            if (!fifo_empty) begin
                ins_out <= fifo[read_ptr];
                read_ptr <= read_ptr + 1;
                ins_out_valid <= 1;
            end else begin
                ins_out_valid <= 0;
                ins_out <= 0;
            end
        end
    end

endmodule

module dram_io #(
    parameter ID_NO  = 1,
    parameter DATA_WIDTH = 512,
    parameter ADDR_WIDTH = 32,
    parameter BURST_LEN_MAX = 256,
    parameter INS_WIDTH = 64
) (
    input wire clk,
    input wire rst,

    output reg [ADDR_WIDTH-1:0] wb_adr_o,
    output reg [DATA_WIDTH-1:0] wb_dat_o,
    input wire [DATA_WIDTH-1:0] wb_dat_i,
    output reg wb_we_o,
    output reg [DATA_WIDTH/8-1:0] wb_sel_o,
    output reg wb_stb_o,
    output reg wb_cyc_o,
    input wire wb_ack_i,

    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,

    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,

    output reg [DATA_WIDTH-1:0] sw_data_out,
    output reg sw_data_out_valid,

    input [DATA_WIDTH-1:0] sw_data_in,
    input sw_data_in_valid
);

    localparam STATE_IDLE = 0;
    localparam STATE_READ_INS = 1;
    localparam STATE_READ_DATA = 2;
    localparam STATE_WRITE_DATA = 3;

    localparam OP_NOP = 0;
    localparam OP_READ_INS = 1;
    localparam OP_READ_DATA = 2;
    localparam OP_WRITE_DATA = 3;

    reg [2:0] state;
    reg [7:0] burst_counter;

    wire [INS_WIDTH-1:0] fifo_ins_out;
    wire fifo_ins_out_valid;
    reg dram_ins_in_valid;
    reg [INS_WIDTH-1:0] dram_ins_in;
    wire fifo_ins_out_ready = state == STATE_IDLE;

    wire fifo_ins_in_valid = (ins_in_valid && ins_in[7:0] == ID_NO) || dram_ins_in_valid;
    wire [INS_WIDTH-1:0] fifo_ins_in = (ins_in_valid && ins_in[7:0] == ID_NO) ? ins_in : dram_ins_in;

    initial begin
        state = STATE_IDLE;
        wb_adr_o = 0;
        burst_counter = 0;
        wb_stb_o = 0;
        wb_cyc_o = 0;
        wb_we_o = 0;
        wb_sel_o = {(DATA_WIDTH/8){1'b1}};
        ins_out_valid = 0;
        dram_ins_in_valid = 0;
        dram_ins_in = 0;
        sw_data_out_valid = 0;
    end

    id_fifo fifo (
        .clk(clk),
        .ins_in(fifo_ins_in),
        .ins_in_valid(fifo_ins_in_valid),
        .ins_out(fifo_ins_out),
        .ins_out_valid(fifo_ins_out_valid),
        .ins_out_ready(fifo_ins_out_ready)
    );

    always @(posedge clk) begin
        if (rst) begin
            state <= STATE_IDLE;
            wb_stb_o <= 0;
            wb_cyc_o <= 0;
            wb_we_o <= 0;
            ins_out_valid <= 0;
            dram_ins_in_valid <= 0;
            sw_data_out_valid <= 0;
        end else begin
            case (state)
                STATE_IDLE: begin
                    ins_out_valid <= 0;
                    dram_ins_in_valid <= 0;
                    sw_data_out_valid <= 0;
                    ins_out <= 0;
                    sw_data_out <= 0;
                    wb_stb_o <= 0;
                    wb_cyc_o <= 0;
                    if (fifo_ins_out_valid) begin
                        case (fifo_ins_out[15:8])
                            OP_NOP: state <= STATE_IDLE;
                            OP_READ_INS: begin
                                state <= STATE_READ_INS;
                                wb_adr_o <= fifo_ins_out[47:16];
                                burst_counter <= fifo_ins_out[55:48];
                                wb_stb_o <= 1;
                                wb_cyc_o <= 1;
                                wb_we_o <= 0;
                            end
                            OP_READ_DATA: begin
                                state <= STATE_READ_DATA;
                                wb_adr_o <= fifo_ins_out[47:16];
                                burst_counter <= fifo_ins_out[55:48];
                                wb_stb_o <= 1;
                                wb_cyc_o <= 1;
                                wb_we_o <= 0;
                            end
                            OP_WRITE_DATA: begin
                                state <= STATE_WRITE_DATA;
                                wb_adr_o <= fifo_ins_out[47:16];
                                burst_counter <= fifo_ins_out[55:48];
                                wb_stb_o <= 1;
                                wb_cyc_o <= 1;
                                wb_we_o <= 1;
                            end
                        endcase
                    end
                end
                STATE_READ_INS: begin
                    if (wb_ack_i) begin
                        if (wb_dat_i[7:0] == 0) begin
                            dram_ins_in <= wb_dat_i[63:0];
                            dram_ins_in_valid <= 1;
                            ins_out <= 0;
                            ins_out_valid <= 0;
                        end else begin
                            ins_out <= wb_dat_i[63:0];
                            ins_out_valid <= 1;
                            dram_ins_in <= 0;
                            dram_ins_in_valid <= 0;
                        end
                        if (burst_counter == 0) begin
                            state <= STATE_IDLE;
                            wb_stb_o <= 0;
                            wb_cyc_o <= 0;
                        end else begin
                            burst_counter <= burst_counter - 1;
                            wb_adr_o <= wb_adr_o + (DATA_WIDTH / 8);
                        end
                    end
                end
                STATE_READ_DATA: begin
                    if (wb_ack_i) begin
                        sw_data_out <= wb_dat_i;
                        sw_data_out_valid <= 1;
                        if (burst_counter == 0) begin
                            state <= STATE_IDLE;
                            wb_stb_o <= 0;
                            wb_cyc_o <= 0;
                        end else begin
                            burst_counter <= burst_counter - 1;
                            wb_adr_o <= wb_adr_o + (DATA_WIDTH / 8);
                        end
                    end
                end
                STATE_WRITE_DATA: begin
                    if (sw_data_in_valid) begin
                        wb_dat_o <= sw_data_in;
                        if (wb_ack_i) begin
                            if (burst_counter == 0) begin
                                state <= STATE_IDLE;
                                wb_stb_o <= 0;
                                wb_cyc_o <= 0;
                                wb_we_o <= 0;
                            end else begin
                                burst_counter <= burst_counter - 1;
                                wb_adr_o <= wb_adr_o + (DATA_WIDTH / 8);
                            end
                        end
                    end
                end
            endcase
        end
        
        if (fifo_ins_in_valid) begin
            ins_out <= 0;
            ins_out_valid <= 0;
        end else begin
            ins_out <= ins_in;
            ins_out_valid <= ins_in_valid;
        end
    end
endmodule

// top

module nf_tpu #(
    parameter DATA_WIDTH = 512,
    parameter STREAM_WIDTH = 64,
    parameter ADDR_WIDTH = 32,
    parameter INS_WIDTH  = 64,
    parameter NUM_TILES  = 16
) (
    input wire clk,
    input wire reset,

    input wire [STREAM_WIDTH-1:0] sink_data,
    input wire sink_valid,
    input wire sink_last,
    output reg sink_ready,

    output reg [STREAM_WIDTH-1:0] source_data,
    output reg source_valid,
    output reg source_last,
    input wire source_ready,

    output reg [ADDR_WIDTH-1:0] dram_addr,
    output reg [DATA_WIDTH-1:0] dram_dat_w,
    input wire [DATA_WIDTH-1:0] dram_dat_r,
    output reg dram_we,
    output reg [DATA_WIDTH/8-1:0] dram_sel,
    output reg dram_stb,
    output reg dram_cyc,
    input wire dram_ack
);
    wire [DATA_WIDTH-1:0] dram_sw_data_out;
    wire dram_sw_data_out_valid;
    wire [DATA_WIDTH-1:0] stream_sw_data_out;
    wire stream_sw_data_out_valid;
    wire [INS_WIDTH-1:0] ins_inter[0:7];
    wire ins_valid_inter[0:7];
    wire [DATA_WIDTH-1:0] sw_data_in;
    wire sw_data_in_valid;
    wire [DATA_WIDTH-1:0] sw_data_out;
    wire sw_data_out_valid;
    wire [STREAM_WIDTH-1:0] stream_in;
    wire stream_in_valid;
    //wire io_out_valid;
    wire [INS_WIDTH-1:0] slice_ins[0:7];
    wire slice_ins_valid[0:7];
    wire [DATA_WIDTH-1:0] stream_inter_w[0:5];
    wire [DATA_WIDTH-1:0] stream_inter_e[0:5];
    wire [NUM_TILES-1:0] stream_valid_inter_w[0:5];
    wire [NUM_TILES-1:0] stream_valid_inter_e[0:5];

    assign sw_data_in_valid = dram_sw_data_out_valid || stream_sw_data_out_valid;
    assign sw_data_in = dram_sw_data_out_valid ? dram_sw_data_out : stream_sw_data_out;

    stream_io #(
        .ID_NO(0)
    ) stream (
        .clk(clk),
        .rx_tdata(sink_data),
        .rx_tvalid(sink_valid),
        .rx_tlast(sink_last),
        .rx_tready(sink_ready),
        .tx_tdata(source_data),
        .tx_tvalid(source_valid),
        .tx_tlast(source_last),
        .tx_tready(source_ready),
        .ins_out(ins_inter[0]),
        .ins_out_valid(ins_valid_inter[0]),
        .sw_data_out(stream_sw_data_out),
        .sw_data_out_valid(stream_sw_data_out_valid),
        .sw_data_in(sw_data_out),
        .sw_data_in_valid(sw_data_out_valid)
    );

    dram_io #(
        .ID_NO(1)
    ) dram (
        .clk(clk),
        .wb_adr_o(dram_addr),
        .wb_dat_o(dram_dat_w),
        .wb_dat_i(dram_dat_r),
        .wb_we_o(dram_we),
        .wb_sel_o(dram_sel),
        .wb_stb_o(dram_stb),
        .wb_cyc_o(dram_cyc),
        .wb_ack_i(dram_ack),
        .ins_in(ins_inter[0]),
        .ins_in_valid(ins_valid_inter[0]),
        .ins_out(ins_inter[1]),
        .ins_out_valid(ins_valid_inter[1]),
        .sw_data_out(dram_sw_data_out),
        .sw_data_out_valid(dram_sw_data_out_valid),
        .sw_data_in(sw_data_out),
        .sw_data_in_valid(sw_data_out_valid)
    );

    sw_id #(
        .ID_NO(2)
    ) sw_id1 (
        .clk(clk),
        .ins_in(ins_inter[1]),
        .ins_in_valid(ins_valid_inter[1]),
        .ins_out(ins_inter[2]),
        .ins_out_valid(ins_valid_inter[2]),
        .slice_ins_out(slice_ins[0]),
        .slice_ins_out_valid(slice_ins_valid[0])
    );

    sw_slice sw_slice1 (
        .clk(clk),
        .stream_in(stream_inter_e[0]),
        .stream_in_valid(stream_valid_inter_e[0]),
        .stream_out(stream_inter_w[0]),
        .stream_out_valid(stream_valid_inter_w[0]),
        .data_in(sw_data_in),
        .data_in_valid(sw_data_in_valid),
        .data_out(sw_data_out),
        .data_out_valid(sw_data_out_valid),
        .ins_in(slice_ins[0]),
        .ins_in_valid(slice_ins_valid[0])
    );

    mem_id #(
        .ID_NO_W(3),
        .ID_NO_E(4)
    ) mem_id1 (
        .clk(clk),
        .ins_in(ins_inter[2]),
        .ins_in_valid(ins_valid_inter[2]),
        .ins_out(ins_inter[3]),
        .ins_out_valid(ins_valid_inter[3]),
        .slice_ins_out_w(slice_ins[1]),
        .slice_ins_out_valid_w(slice_ins_valid[1]),
        .slice_ins_out_e(slice_ins[2]),
        .slice_ins_out_valid_e(slice_ins_valid[2])
    );

    mem_slice mem_slice1 (
        .clk(clk),
        .stream_in_w(stream_inter_w[0]),
        .stream_in_w_valid(stream_valid_inter_w[0]),
        .stream_out_e(stream_inter_e[0]),
        .stream_out_e_valid(stream_valid_inter_e[0]),
        .stream_out_w(stream_inter_w[1]),
        .stream_out_w_valid(stream_valid_inter_w[1]),
        .stream_in_e(stream_inter_e[1]),
        .stream_in_e_valid(stream_valid_inter_e[1]),
        .ins_in_w(slice_ins[1]),
        .ins_in_valid_w(slice_ins_valid[1]),
        .ins_in_e(slice_ins[2]),
        .ins_in_valid_e(slice_ins_valid[2])
    );

    mem_id #(
        .ID_NO_W(5),
        .ID_NO_E(6)
    ) mem_id2 (
        .clk(clk),
        .ins_in(ins_inter[3]),
        .ins_in_valid(ins_valid_inter[3]),
        .ins_out(ins_inter[4]),
        .ins_out_valid(ins_valid_inter[4]),
        .slice_ins_out_w(slice_ins[3]),
        .slice_ins_out_valid_w(slice_ins_valid[3]),
        .slice_ins_out_e(slice_ins[4]),
        .slice_ins_out_valid_e(slice_ins_valid[4])
    );

    mem_slice mem_slice2 (
        .clk(clk),
        .stream_in_w(stream_inter_w[1]),
        .stream_in_w_valid(stream_valid_inter_w[1]),
        .stream_out_e(stream_inter_e[1]),
        .stream_out_e_valid(stream_valid_inter_e[1]),
        .stream_out_w(stream_inter_w[2]),
        .stream_out_w_valid(stream_valid_inter_w[2]),
        .stream_in_e(stream_inter_e[2]),
        .stream_in_e_valid(stream_valid_inter_e[2]),
        .ins_in_w(slice_ins[3]),
        .ins_in_valid_w(slice_ins_valid[3]),
        .ins_in_e(slice_ins[4]),
        .ins_in_valid_e(slice_ins_valid[4])
    );

    vec_id #(
        .ID_NO(7)
    ) vec_id1 (
        .clk(clk),
        .ins_in(ins_inter[4]),
        .ins_in_valid(ins_valid_inter[4]),
        .ins_out(ins_inter[5]),
        .ins_out_valid(ins_valid_inter[5]),
        .slice_ins_out(slice_ins[5]),
        .slice_ins_out_valid(slice_ins_valid[5])
    );

    vec_slice vec_slice1 (
        .clk(clk),
        .stream_in_w(stream_inter_w[2]),
        .stream_in_w_valid(stream_valid_inter_w[2]),
        .stream_out_e(stream_inter_e[2]),
        .stream_out_e_valid(stream_valid_inter_e[2]),
        .stream_out_w(stream_inter_w[3]),
        .stream_out_w_valid(stream_valid_inter_w[3]),
        .stream_in_e(stream_inter_e[3]),
        .stream_in_e_valid(stream_valid_inter_e[3]),
        .ins_in(slice_ins[5]),
        .ins_in_valid(slice_ins_valid[5])
    );

    dot_id #(
        .ID_NO(8)
    ) dot_id1 (
        .clk(clk),
        .ins_in(ins_inter[5]),
        .ins_in_valid(ins_valid_inter[5]),
        .ins_out(ins_inter[6]),
        .ins_out_valid(ins_valid_inter[6]),
        .slice_ins_out(slice_ins[6]),
        .slice_ins_out_valid(slice_ins_valid[6])
    );

    dot_slice dot_slice1 (
        .clk(clk),
        .stream_in_w(stream_inter_w[3]),
        .stream_in_w_valid(stream_valid_inter_w[3]),
        .stream_out_e(stream_inter_e[3]),
        .stream_out_e_valid(stream_valid_inter_e[3]),
        .stream_out_w(stream_inter_w[4]),
        .stream_out_w_valid(stream_valid_inter_w[4]),
        .stream_in_e(stream_inter_e[4]),
        .stream_in_e_valid(stream_valid_inter_e[4]),
        .ins_in(slice_ins[6]),
        .ins_in_valid(slice_ins_valid[6])
    );

    dot_id #(
        .ID_NO(9)
    ) dot_id2 (
        .clk(clk),
        .ins_in(ins_inter[6]),
        .ins_in_valid(ins_valid_inter[6]),
        .ins_out(ins_inter[7]),
        .ins_out_valid(ins_valid_inter[7]),
        .slice_ins_out(slice_ins[7]),
        .slice_ins_out_valid(slice_ins_valid[7])
    );

    dot_slice dot_slice2 (
        .clk(clk),
        .stream_in_w(stream_inter_w[4]),
        .stream_in_w_valid(stream_valid_inter_w[4]),
        .stream_out_e(stream_inter_e[4]),
        .stream_out_e_valid(stream_valid_inter_e[4]),
        .stream_in_e_valid(0),
        .ins_in(slice_ins[7]),
        .ins_in_valid(slice_ins_valid[7])
    );

endmodule
