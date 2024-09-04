// switch

module sw_tile #(
    parameter int TILE_NO = 0,
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
    parameter int NUM_TILES = 16,  // 16*32=512
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

// mem

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

// dot

module dot_unit (
    input clk,
    input [1:0] state,
    input [7:0] stream_in_w,
    input stream_in_w_valid,
    output reg [7:0] stream_out_e,
    output reg [7:0] stream_out_w,
    input [7:0] stream_in_e,
    input stream_in_e_valid,
    input [7:0] in_weight,
    output reg [7:0] out_weight
);

    localparam STATE_PASS = 0;
    localparam STATE_LOAD_WEIGHT = 1;
    localparam STATE_MUL = 2;
    localparam STATE_READ_SUM = 3;

    reg [7:0] weight;
    reg [15:0] sum;

    initial begin
        weight = 0;
        sum = 0;
    end

    always @(posedge clk) begin
        case (state)
            STATE_PASS: begin
                if (stream_in_w_valid) begin
                    stream_out_w <= stream_in_w;
                end
                if (stream_in_e_valid) begin
                    stream_out_e <= stream_in_e;
                end
            end
            STATE_LOAD_WEIGHT: begin
                if (stream_in_w_valid) begin
                    weight <= stream_in_w;
                end
                if (stream_in_e_valid) begin
                    stream_out_e <= stream_in_e;
                end
            end
            STATE_MUL: begin
                if (stream_in_w_valid) begin
                    sum <= sum + stream_in_w * in_weight;
                    stream_out_w <= stream_in_w;
                end
                if (stream_in_e_valid) begin
                    stream_out_e <= stream_in_e;
                end
            end
            STATE_READ_SUM: begin
                stream_out_e <= sum;
                if (stream_in_w_valid) begin
                    stream_out_w <= stream_in_w;
                end
            end
        endcase
    end
endmodule

module dot_tile #(
    parameter TILE_NO = 0,
    parameter INS_WIDTH = 64,
    parameter LANE_WIDTH = 32
)(
    input clk,
    input [LANE_WIDTH-1:0] stream_in_w,
    input stream_in_w_valid,
    output [LANE_WIDTH-1:0] stream_out_e,
    output reg stream_out_e_valid,
    output [LANE_WIDTH-1:0] stream_out_w,
    output reg stream_out_w_valid,
    input [LANE_WIDTH-1:0] stream_in_e,
    input stream_in_e_valid,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid
);

    localparam STATE_PASS = 0;
    localparam STATE_LOAD_WEIGHT = 1;
    localparam STATE_MUL = 2;
    localparam STATE_READ_SUM = 3;

    localparam OP_PASS = 0;
    localparam OP_LOAD_WEIGHT = 1;
    localparam OP_MUL = 2;
    localparam OP_READ_SUM = 3;

    reg [1:0] state;
    wire [7:0] weight_inter[4];

    initial begin
        state = STATE_PASS;
        ins_out_valid = 0;
        stream_out_e_valid = 0;
        stream_out_w_valid = 0;
    end

    genvar i;
    generate
        for (i = 0; i < 4; i = i + 1) begin : dots
            dot_unit unit (
                .clk(clk),
                .state(state),
                .stream_in_w(stream_in_w[i*8+:8]),
                .stream_in_w_valid(stream_in_w_valid),
                .stream_out_e(stream_out_e[i*8+:8]),
                .stream_out_w(stream_out_w[i*8+:8]),
                .stream_in_e(stream_in_e[i*8+:8]),
                .stream_in_e_valid(stream_in_e_valid),
                .in_weight(i==0?in_weight:weight_inter[i-1]),
                .out_weight(weight_inter[i])
            );
        end
    endgenerate

    always @(posedge clk) begin
        case (state)
            STATE_PASS: begin
                stream_out_w_valid <= stream_in_w_valid;
                stream_out_e_valid <= stream_in_e_valid;
            end
            STATE_LOAD_WEIGHT: begin
                if (stream_in_w_valid) begin
                    state <= STATE_PASS;
                end
                stream_out_e_valid <= stream_in_e_valid;
            end
            STATE_MUL: begin
                stream_out_w_valid <= stream_in_w_valid;
                stream_out_e_valid <= stream_in_e_valid;
            end
            STATE_READ_SUM: begin
                stream_out_w_valid <= stream_in_w_valid;
                stream_out_e_valid <= 1;
                state <= STATE_PASS;
            end
        endcase
        if (ins_in_valid && ins_in[15:8]==TILE_NO) begin
            case (ins_in[23:16])
                OP_PASS: begin
                    state <= STATE_PASS;
                end
                OP_LOAD_WEIGHT: begin
                    state <= STATE_LOAD_WEIGHT;
                end
                OP_MUL: begin
                    state <= STATE_MUL;
                end
                OP_READ_SUM: begin
                    state <= STATE_READ_SUM;
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
    parameter DATA_WIDTH = 512,
    parameter NUM_TILES = 16,
    parameter INS_WIDTH = 64
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
                .TILE_NO(i)
            ) tile (
                .clk(clk),
                .stream_in_w(stream_in_w[i*32+:32]),
                .stream_in_w_valid(stream_in_w_valid[i]),
                .stream_out_e(stream_out_e[i*32+:32]),
                .stream_out_e_valid(stream_out_e_valid[i]),
                .stream_out_w(stream_out_w[i*32+:32]),
                .stream_out_w_valid(stream_out_w_valid[i]),
                .stream_in_e(stream_in_e[i*32+:32]),
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

// vec

module vec_unit (
    input clk,
    input [1:0] state,
    input [7:0] stream_in_w,
    input stream_in_valid_w,
    output reg [7:0] stream_out_e,
    input [7:0] stream_in_e,
    input stream_in_valid_e,
    output reg [7:0] stream_out_w,
    input [7:0] in_weight,
    output reg [7:0] out_weight
);

    localparam STATE_PASS = 0;
    localparam STATE_LOAD = 1;
    localparam STATE_ADD = 2;
    localparam STATE_REVERT = 3;

    reg [7:0] const_b;
    reg [15:0] sum;

    always @(posedge clk) begin
        case (state)
            STATE_PASS: begin
                stream_out_w <= stream_in_w;
                stream_out_e <= stream_in_e;
            end
            STATE_LOAD: begin
                if (stream_in_valid_w) begin
                    const_b <= stream_in_w;
                end
            end
            STATE_ADD: begin
                if (stream_in_valid_e) begin
                    stream_out_e <= stream_in_e + const_b;
                end
            end
            STATE_REVERT: begin
                stream_out_e <= stream_in_w;
            end
        endcase
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

// dram 

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

module dram_if #(
    parameter ID_NO  = 1,
    parameter DATA_WIDTH = 512,
    parameter ADDR_WIDTH = 32,
    parameter BURST_LEN_MAX = 256,
    parameter INS_WIDTH = 64
) (
    input wire clk,

    output reg [ADDR_WIDTH-1:0] axi_araddr,
    output reg [7:0] axi_arlen,
    output reg axi_arvalid,
    input wire axi_arready,

    input wire [DATA_WIDTH-1:0] axi_rdata,
    input wire axi_rvalid,
    output reg axi_rready,

    output reg [ADDR_WIDTH-1:0] axi_awaddr,
    output reg [7:0] axi_awlen,
    output reg axi_awvalid,
    input wire axi_awready,

    output reg [DATA_WIDTH-1:0] axi_wdata,
    output reg axi_wvalid,
    input wire axi_wready,

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
        axi_araddr = 0;
        axi_arlen = 0;
        burst_counter = 0;
        axi_arvalid = 0;
        axi_rready = 0;
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

    wire [63:0] test = axi_rdata[63:0];

    always @(posedge clk) begin
        case (state)
            STATE_IDLE: begin
                ins_out_valid <= 0;
                dram_ins_in_valid <= 0;
                sw_data_out_valid <= 0;
                ins_out <= 0;
                sw_data_out <= 0;
                axi_wvalid <= 0;
                if (fifo_ins_out_valid) begin
                    case (fifo_ins_out[15:8])
                        OP_NOP: state <= STATE_IDLE;
                        OP_READ_INS: begin
                            state <= STATE_READ_INS;
                            axi_araddr <= fifo_ins_out[47:16];
                            axi_arlen  <= fifo_ins_out[55:48];
                            burst_counter <= fifo_ins_out[55:48];
                            axi_arvalid <= 1;
                            axi_rready <= 1;
                        end
                        OP_READ_DATA: begin
                            state <= STATE_READ_DATA;
                            axi_araddr <= fifo_ins_out[47:16];
                            axi_arlen  <= fifo_ins_out[55:48];
                            burst_counter <= fifo_ins_out[55:48];
                            axi_arvalid <= 1;
                            axi_rready <= 1;
                        end
                        OP_WRITE_DATA: begin
                            state <= STATE_WRITE_DATA;
                            axi_awaddr <= fifo_ins_out[47:16];
                            axi_awlen  <= fifo_ins_out[55:48];
                            burst_counter <= fifo_ins_out[55:48];
                            axi_awvalid <= 1;
                        end
                    endcase
                end
            end
            STATE_READ_INS: begin
                if (axi_arvalid && axi_arready) begin
                    axi_arvalid <= 0;
                end
                if (axi_rvalid) begin
                    if (axi_rdata[7:0] == 0) begin
                        dram_ins_in <= axi_rdata[63:0];
                        dram_ins_in_valid <= 1;
                        ins_out <= 0;
                        ins_out_valid <= 0;
                    end else begin
                        ins_out <= axi_rdata[63:0];
                        ins_out_valid <= 1;
                        dram_ins_in <= 0;
                        dram_ins_in_valid <= 0;
                    end
                    if (burst_counter == 0) begin
                        state <= STATE_IDLE;
                        axi_rready <= 0;
                    end else begin
                        burst_counter <= burst_counter - 1;
                    end
                end
            end
            STATE_READ_DATA: begin
                if (axi_arvalid && axi_arready) begin
                    axi_arvalid <= 0;
                end
                if (axi_rvalid) begin
                    sw_data_out <= axi_rdata;
                    sw_data_out_valid <= 1;
                    if (burst_counter == 0) begin
                        state <= STATE_IDLE;
                        axi_rready <= 0;
                    end else begin
                        burst_counter <= burst_counter - 1;
                    end
                end
            end
            STATE_WRITE_DATA: begin
                if (axi_awvalid && !axi_awready) begin
                    axi_awvalid <= 0;
                end
                if (sw_data_in_valid) begin
                    axi_wdata <= sw_data_in;
                    axi_wvalid <= 1;
                    if (burst_counter == 0) begin
                        state <= STATE_IDLE;
                    end else begin
                        burst_counter <= burst_counter - 1;
                    end
                end
            end
        endcase
        if (fifo_ins_in_valid) begin
            ins_out <= 0;
            ins_out_valid <= 0;
        end else begin
            ins_out <= ins_in;
            ins_out_valid <= ins_in_valid;
        end
    end
endmodule

// pcie

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


module pcie_if #(
    parameter ID_NO  = 0,
    parameter DATA_WIDTH = 512,
    parameter INS_WIDTH = 64,
    parameter PCIE_WIDTH = 64
) (
    input wire clk,

    input [PCIE_WIDTH-1:0] rx_tdata,
    input rx_tvalid,
    input rx_tlast,
    output rx_tready,

    output [PCIE_WIDTH-1:0] tx_tdata,
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

    reg [PCIE_WIDTH-1:0] rx_conv_data_in;
    reg rx_conv_data_in_valid;

    wire [PCIE_WIDTH-1:0] fifo_data_out;
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

// top

module npu #(
    parameter DATA_WIDTH = 512,
    parameter PCIE_WIDTH = 64,
    parameter ADDR_WIDTH = 32,
    parameter INS_WIDTH  = 64,
    parameter NUM_TILES  = 16
) (
    input wire clk,
    input wire reset,

    output reg [ADDR_WIDTH-1:0] dram_araddr,
    output reg [7:0] dram_arlen,
    output reg dram_arvalid,
    input wire dram_arready,

    input wire [DATA_WIDTH-1:0] dram_rdata,
    input wire dram_rvalid,
    output reg dram_rready,

    output reg [ADDR_WIDTH-1:0] dram_awaddr,
    output reg [7:0] dram_awlen,
    output reg dram_awvalid,
    input wire dram_awready,

    output reg [DATA_WIDTH-1:0] dram_wdata,
    output reg dram_wvalid,
    input wire dram_wready,

    input [PCIE_WIDTH-1:0] pcie0_rx_tdata,
    input pcie0_rx_tvalid,
    input pcie0_rx_tlast,
    input pcie0_rx_tkeep,
    output pcie0_rx_tready,

    output [PCIE_WIDTH-1:0] pcie0_tx_tdata,
    output pcie_tx_tvalid,
    output pcie0_tx_tlast,
    output pcie0_tx_tkeep,
    input pcie0_tx_tready
);
    wire [DATA_WIDTH-1:0] dram_sw_data_out;
    wire dram_sw_data_out_valid;
    wire [DATA_WIDTH-1:0] pcie_sw_data_out;
    wire pcie_sw_data_out_valid;
    wire [INS_WIDTH-1:0] ins_inter[0:7];
    wire ins_valid_inter[0:7];
    wire [DATA_WIDTH-1:0] sw_data_in;
    wire sw_data_in_valid;
    wire [DATA_WIDTH-1:0] sw_data_out;
    wire sw_data_out_valid;
    wire [PCIE_WIDTH-1:0] pcie0_in;
    wire pcie0_in_valid;
    //wire io_out_valid;
    wire [INS_WIDTH-1:0] slice_ins[0:7];
    wire slice_ins_valid[0:7];
    wire [DATA_WIDTH-1:0] stream_inter_w[0:5];
    wire [DATA_WIDTH-1:0] stream_inter_e[0:5];
    wire [NUM_TILES-1:0] stream_valid_inter_w[0:5];
    wire [NUM_TILES-1:0] stream_valid_inter_e[0:5];

    assign sw_data_in_valid = dram_sw_data_out_valid || pcie_sw_data_out_valid;
    assign sw_data_in = dram_sw_data_out_valid ? dram_sw_data_out : pcie_sw_data_out;

    pcie_if #(
        .ID_NO(0)
    ) pcie0_if (
        .clk(clk),
        .rx_tdata(pcie0_rx_tdata),
        .rx_tvalid(pcie0_rx_tvalid),
        .rx_tlast(pcie0_r_tlast),
        .rx_tready(pcie0_rx_tready),
        .tx_tdata(pcie0_tx_tdata),
        .tx_tvalid(pcie0_tx_tvalid),
        .tx_tlast(pcie0_tx_tlast),
        .tx_tready(pcie0_tx_tready),
        .ins_out(ins_inter[0]),
        .ins_out_valid(ins_valid_inter[0]),
        .sw_data_out(pcie_sw_data_out),
        .sw_data_out_valid(pcie_sw_data_out_valid),
        .sw_data_in(sw_data_out),
        .sw_data_in_valid(sw_data_out_valid)
    );

    dram_if #(
        .ID_NO(1)
    ) dram_if1 (
        .clk(clk),
        .axi_araddr(dram_araddr),
        .axi_arlen(dram_arlen),
        .axi_arvalid(dram_arvalid),
        .axi_arready(dram_arready),
        .axi_rdata(dram_rdata),
        .axi_rvalid(dram_rvalid),
        .axi_rready(dram_rready),
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
