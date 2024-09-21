// internal memory

module mem_tile #(
    parameter TILE_NO = 0,
    parameter INS_WIDTH = 16,
    parameter MEM_DEPTH = 1024*2,
) (
    input wire clk,
    input [15:0] stream_in_w,
    input stream_in_w_valid,
    output reg [15:0] stream_out_w,
    output reg stream_out_w_valid,
    input [15:0] stream_in_e,
    input stream_in_e_valid,
    output reg [15:0] stream_out_e,
    output reg stream_out_e_valid,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid
);

    localparam STATE_IDLE = 0;
    localparam STATE_WAIT_ADDR = 1;
    localparam STATE_WAIT_LEN = 2;
    localparam STATE_PASS = 3;
    localparam STATE_READ_16 = 4;
    localparam STATE_READ_8 = 5;
    localparam STATE_READ_4 = 6;
    localparam STATE_WRITE_16 = 7;
    localparam STATE_WRITE_8 = 8;

    localparam OP_PASS = 0;
    localparam OP_READ_16 = 1;
    localparam OP_READ_8 = 2;
    localparam OP_READ_4 = 3;
    localparam OP_WRITE_16 = 4;
    localparam OP_WRITE_8 = 5;

    (* ram_style = "block" *) reg [15:0] bram[0:MEM_DEPTH-1];

    reg dir;
    reg [15:0] addr;
    reg [15:0] len;
    reg [3:0] state;
    reg [2:0] operation;
    reg byte_counter;
    reg [1:0] nibble_counter;
    reg [15:0] read_buffer;
    reg [15:0] write_buffer;

    wire [15:0] stream_in;
    wire stream_in_valid;

    assign stream_in = dir ? stream_in_e : stream_in_w;
    assign stream_in_valid = dir ? stream_in_e_valid : stream_in_w_valid;

    initial begin
        state = STATE_IDLE;
        ins_out_valid = 0;
        stream_out_w_valid = 0;
        stream_out_e_valid = 0;
        len = 0;
        addr = 0;
        operation = OP_PASS;
        byte_counter = 0;
        nibble_counter = 0;
    end

    (* syn_ramstyle = "block_ram" *)
    (* syn_implementation = "EBR" *)
    always @(posedge clk) begin
        if (state == STATE_WRITE_16 && stream_in_valid) begin
            bram[addr] <= stream_in;
        end else if (state == STATE_WRITE_8 && stream_in_valid && byte_counter == 1) begin
            bram[addr] <= write_buffer;
        end
    end

    always @(posedge clk) begin
        if (state == STATE_READ_16 || state == STATE_READ_8 || state == STATE_READ_4) begin
            read_buffer <= bram[addr];
        end
    end

    always @(posedge clk) begin
        stream_out_w_valid <= 0;
        stream_out_e_valid <= 0;

        case (state)
            STATE_IDLE: begin
                if (ins_in_valid && ins_in[7:0] == TILE_NO) begin
                    operation <= ins_in[14:12];
                    dir <= ins_in[15];
                    if (ins_in[14:12] == OP_PASS) begin
                        state <= STATE_PASS;
                    end else begin
                        state <= STATE_WAIT_ADDR;
                    end
                    ins_out_valid <= 0;
                end else begin
                    ins_out <= ins_in;
                    ins_out_valid <= ins_in_valid;
                end
            end
            STATE_WAIT_ADDR: begin
                if (ins_in_valid) begin
                    addr <= ins_in;
                    state <= STATE_WAIT_LEN;
                end
            end
            STATE_WAIT_LEN: begin
                if (ins_in_valid) begin
                    len <= ins_in;
                    case (operation)
                        OP_READ_16: state <= STATE_READ_16;
                        OP_READ_8: state <= STATE_READ_8;
                        OP_READ_4: state <= STATE_READ_4;
                        OP_WRITE_16: state <= STATE_WRITE_16;
                        OP_WRITE_8: state <= STATE_WRITE_8;
                        default: state <= STATE_IDLE;
                    endcase
                    byte_counter <= 0;
                    nibble_counter <= 0;
                end
            end
            STATE_PASS: begin
                stream_out_w_valid <= stream_in_w_valid;
                stream_out_w <= stream_in_w;
                stream_out_e_valid <= stream_in_e_valid;
                stream_out_e <= stream_in_e;
                if (!ins_in_valid) begin
                    state <= STATE_IDLE;
                end
            end
            STATE_READ_16: begin
                if (dir) begin
                    stream_out_e <= read_buffer;
                    stream_out_e_valid <= 1;
                end else begin
                    stream_out_w <= read_buffer;
                    stream_out_w_valid <= 1;
                end
                if (len > 0) begin
                    addr <= addr + 1;
                    len <= len - 1;
                end else begin
                    state <= STATE_IDLE;
                end
            end
            STATE_READ_8: begin
                if (byte_counter == 0) begin
                    if (dir) begin
                        stream_out_e <= {8'b0, read_buffer[7:0]};
                        stream_out_e_valid <= 1;
                    end else begin
                        stream_out_w <= {8'b0, read_buffer[7:0]};
                        stream_out_w_valid <= 1;
                    end
                    byte_counter <= 1;
                end else begin
                    if (dir) begin
                        stream_out_e <= {8'b0, read_buffer[15:8]};
                        stream_out_e_valid <= 1;
                    end else begin
                        stream_out_w <= {8'b0, read_buffer[15:8]};
                        stream_out_w_valid <= 1;
                    end
                    byte_counter <= 0;
                    addr <= addr + 1;
                    if (len > 0) begin
                        len <= len - 1;
                    end else begin
                        state <= STATE_IDLE;
                    end
                end
            end
            STATE_READ_4: begin
                case (nibble_counter)
                    0: begin
                        if (dir) begin
                            stream_out_e <= {12'b0, read_buffer[3:0]};
                            stream_out_e_valid <= 1;
                        end else begin
                            stream_out_w <= {12'b0, read_buffer[3:0]};
                            stream_out_w_valid <= 1;
                        end
                        nibble_counter <= 1;
                    end
                    1: begin
                        if (dir) begin
                            stream_out_e <= {12'b0, read_buffer[7:4]};
                            stream_out_e_valid <= 1;
                        end else begin
                            stream_out_w <= {12'b0, read_buffer[7:4]};
                            stream_out_w_valid <= 1;
                        end
                        nibble_counter <= 2;
                    end
                    2: begin
                        if (dir) begin
                            stream_out_e <= {12'b0, read_buffer[11:8]};
                            stream_out_e_valid <= 1;
                        end else begin
                            stream_out_w <= {12'b0, read_buffer[11:8]};
                            stream_out_w_valid <= 1;
                        end
                        nibble_counter <= 3;
                    end
                    3: begin
                        if (dir) begin
                            stream_out_e <= {12'b0, read_buffer[15:12]};
                            stream_out_e_valid <= 1;
                        end else begin
                            stream_out_w <= {12'b0, read_buffer[15:12]};
                            stream_out_w_valid <= 1;
                        end
                        nibble_counter <= 0;
                        addr <= addr + 1;
                        if (len > 0) begin
                            len <= len - 1;
                        end else begin
                            state <= STATE_IDLE;
                        end
                    end
                endcase
            end
            STATE_WRITE_16: begin
                if (stream_in_valid) begin
                    if (len > 0) begin
                        addr <= addr + 1;
                        len <= len - 1;
                    end else begin
                        state <= STATE_IDLE;
                    end
                end
            end
            STATE_WRITE_8: begin
                if (stream_in_valid) begin
                    if (byte_counter == 0) begin
                        write_buffer[7:0] <= stream_in[7:0];
                        byte_counter <= 1;
                    end else begin
                        write_buffer[15:8] <= stream_in[7:0];
                        byte_counter <= 0;
                        if (len > 0) begin
                            addr <= addr + 1;
                            len <= len - 1;
                        end else begin
                            state <= STATE_IDLE;
                        end
                    end
                end
            end
            default: state <= STATE_IDLE;
        endcase
    end
endmodule

module mem_slice #(
    parameter NUM_TILES  = 8,   // 16*8=128
    parameter DATA_WIDTH = 128,
    parameter INS_WIDTH  = 16,
) (
    input wire clk,
    input [DATA_WIDTH-1:0] stream_in_w,
    input [NUM_TILES-1:0] stream_in_w_valid,
    output [DATA_WIDTH-1:0] stream_out_w,
    output [NUM_TILES-1:0] stream_out_w_valid,
    input [DATA_WIDTH-1:0] stream_in_e,
    input [NUM_TILES-1:0] stream_in_e_valid,
    output [DATA_WIDTH-1:0] stream_out_e,
    output [NUM_TILES-1:0] stream_out_e_valid,
    input [INS_WIDTH-1:0] ins_in_w,
    input [INS_WIDTH-1:0] ins_in_e,
    input ins_in_valid_w,
    input ins_in_valid_e,
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
            ) tile (
                .clk(clk),
                .stream_in_w(stream_in_w[i*16+:16]),
                .stream_in_w_valid(stream_in_w_valid[i]),
                .stream_out_w(stream_out_w[i*16+:16]),
                .stream_out_w_valid(stream_out_w_valid[i]),
                .stream_in_e(stream_in_e[i*16+:16]),
                .stream_in_e_valid(stream_in_e_valid[i]),
                .stream_out_e(stream_out_e[i*16+:16]),
                .stream_out_e_valid(stream_out_e_valid[i]),
                .ins_in(i == 0 ? ins_in_w : ins_inter_w[i-1]),
                .ins_in_valid(i == 0 ? ins_in_valid_w : ins_valid_inter_w[i-1]),
                .ins_out(ins_inter_w[i]),
                .ins_out_valid(ins_valid_inter_w[i])
            );
        end
    endgenerate

endmodule

module mem_id #(
    parameter ID_NO  = 3,
    parameter INS_WIDTH = 64,
    parameter SLICE_INS_WIDTH = 16,
)(
    input wire clk,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,
    output wire [SLICE_INS_WIDTH-1:0] slice_ins_out,
    output wire slice_ins_out_valid,
);

    initial begin
        ins_out_valid = 0;
    end

    assign slice_ins_out_valid = ins_in_valid && ins_in[7:0] == ID_NO;
    assign slice_ins_out = ins_in[31:16];

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

// routing switch

module sw_tile #(
    parameter TILE_NO = 0,
    parameter LANE_WIDTH = 16,
    parameter IO_WIDTH = 64,
    parameter SLICE_INS_WIDTH = 16
) (
    input wire clk,
    input [LANE_WIDTH-1:0] stream_in,
    input stream_in_valid,
    output reg [LANE_WIDTH-1:0] stream_out,
    output reg stream_out_valid,
    input [IO_WIDTH-1:0] io_up_in,
    input [IO_WIDTH/LANE_WIDTH-1:0] io_up_in_valid,
    output reg [IO_WIDTH-1:0] io_up_out,
    output reg [IO_WIDTH/LANE_WIDTH-1:0] io_up_out_valid,
    input [IO_WIDTH-1:0] io_down_in,
    input [IO_WIDTH/LANE_WIDTH-1:0] io_down_in_valid,
    output reg [IO_WIDTH-1:0] io_down_out,
    output reg [IO_WIDTH/LANE_WIDTH-1:0] io_down_out_valid,
    input [SLICE_INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [SLICE_INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid
);

    localparam STATE_PASS = 0;
    localparam STATE_DRAM_IN = 1;
    localparam STATE_DRAM_OUT = 2;

    reg [7:0] out_state;
    reg [7:0] in_state;

    initial begin
        out_state = 0;
        in_state = 0;
        ins_out_valid = 0;
        stream_out_valid = 0;
        io_up_out_valid = 0;
        io_down_out_valid = 0;
    end

    wire [7:0] ins_tile_no = ins_in[7:0];
    wire [7:0] ins_op = ins_in[15:8];

    always @(posedge clk) begin
        io_up_out_valid <= io_up_in_valid;
        io_up_out <= io_up_in;
        io_down_out_valid <= io_down_in_valid;
        io_down_out <= io_down_in;
        if (out_state==8'hff  && in_state==8'hff) begin
            stream_out_valid <= stream_in_valid;
            stream_out <= stream_in;
        end else begin
            if (out_state!=0) begin
                if (out_state[6]) begin
                    io_up_out_valid[out_state[2:0]] <= stream_in_valid;
                    io_up_out[out_state[2:0]*16+:16] <= stream_in;
                end else begin
                    io_down_out_valid[out_state[2:0]] <= stream_in_valid;
                    io_down_out[out_state[2:0]*16+:16] <= stream_in;
                end
            end
            if (in_state!=0) begin
                if (in_state[6]) begin
                    stream_out_valid <= io_up_in_valid[in_state[2:0]];
                    stream_out <= io_up_in[in_state[2:0]*16+:16];
                end else begin
                    stream_out_valid <= io_down_in_valid[in_state[2:0]];
                    stream_out <= io_down_in[in_state[2:0]*16+:16];
                end
            end
        end
        if (ins_in_valid && ins_tile_no == TILE_NO) begin
            if (ins_op==8'hff) begin
                out_state <= 8'hff;
                in_state <= 8'hff;
            end else begin
                if (ins_op[7])
                    out_state <= ins_op[6:0];
                else
                    in_state <= ins_op[6:0];
            end
            ins_out <= 0;
            ins_out_valid <= 0;
        end else begin
            ins_out <= ins_in;
            ins_out_valid <= ins_in_valid;
        end
    end

endmodule

module sw_slice #(
    parameter NUM_TILES = 8,  // 16*8=128
    parameter LANE_WIDTH = 16,
    parameter IO_WIDTH = 64,
    parameter SLICE_INS_WIDTH = 16
) (
    input wire clk,
    input [DATA_WIDTH-1:0] stream_in,
    input [NUM_TILES-1:0] stream_in_valid,
    output [DATA_WIDTH-1:0] stream_out,
    output [NUM_TILES-1:0] stream_out_valid,
    input [IO_WIDTH-1:0] io_up_in,
    input [IO_WIDTH/LANE_WIDTH-1:0] io_up_in_valid,
    output [IO_WIDTH-1:0] io_down_out,
    output [IO_WIDTH/LANE_WIDTH-1:0] io_down_out_valid,
    input [SLICE_INS_WIDTH-1:0] ins_in,
    input ins_in_valid
);

    wire [SLICE_INS_WIDTH-1:0] ins_inter[NUM_TILES-1:0];
    wire ins_valid_inter[NUM_TILES-1:0];
    wire [IO_WIDTH-1:0] io_up_inter[NUM_TILES-1:0];
    wire [IO_WIDTH/LANE_WIDTH-1:0] io_up_valid_inter[NUM_TILES-1:0];
    wire [IO_WIDTH-1:0] io_down_inter[NUM_TILES-1:0];
    wire [IO_WIDTH/LANE_WIDTH-1:0] io_down_valid_inter[NUM_TILES-1:0];

    genvar i;
    generate
        for (i = 0; i < NUM_TILES; i = i + 1) begin : tiles
            sw_tile #(
                .TILE_NO(i)
            ) tile (
                .clk(clk),
                .stream_in(stream_in[i*LANE_WIDTH+:LANE_WIDTH]),
                .stream_in_valid(stream_in_valid[i]),
                .stream_out(stream_out[i*LANE_WIDTH+:LANE_WIDTH]),
                .stream_out_valid(stream_out_valid[i]),
                .io_up_in(i==0?io_up_in:io_up_inter[i-1]),
                .io_up_in_valid(i==0?io_up_in_valid:io_up_valid_inter[i-1]),
                .io_up_out(io_up_inter[i]),
                .io_up_out_valid(io_up_valid_inter[i]),
                .io_down_out(i==0?io_down_out:io_down_inter[i-1]),
                .io_down_out_valid(i==0?io_down_out_valid:io_down_valid_inter[i-1]),
                .io_down_in(io_down_inter[i]),
                .io_down_in_valid(io_down_valid_inter[i]),
                .ins_in(i == 0 ? ins_in : ins_inter[i-1]),
                .ins_in_valid(i == 0 ? ins_in_valid : ins_valid_inter[i-1]),
                .ins_out(ins_inter[i]),
                .ins_out_valid(ins_valid_inter[i])
            );
        end
    endgenerate

endmodule

module sw_id #(
    parameter ID_NO  = 2,
    parameter INS_WIDTH = 64,
    parameter SLICE_INS_WIDTH = 16,
) (
    input wire clk,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,
    output wire [SLICE_INS_WIDTH-1:0] slice_ins_out,
    output wire slice_ins_out_valid
);

    initial begin
        ins_out_valid = 0;
    end

    assign slice_ins_out_valid = ins_in_valid && ins_in[7:0] == ID_NO;
    assign slice_ins_out = ins_in[31:16];

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
    localparam signed [15:0] MIN_VALUE = -16'sd32768;
    localparam signed [15:0] MAX_VALUE = 16'sd32767;

    wire signed [15:0] a_extended;
    assign a_extended = {{8{a[7]}}, a};  // Sign extension

    wire b_sign;
    wire [2:0] b_exp;

    assign b_sign = b[3];
    assign b_exp = b[2:0];

    reg signed [16:0] intermediate_result;
    reg signed [15:0] shifted_a;

    always @(*) begin
        if (b == 4'b0000) begin
            intermediate_result = {1'b0, c};
        end else begin
            if (b_exp == 3'b001) shifted_a = a_extended;
            else if (b_exp == 3'b010) shifted_a = a_extended << 1;
            else if (b_exp == 3'b011) shifted_a = a_extended << 2;
            else if (b_exp == 3'b100) shifted_a = a_extended << 3;
            else if (b_exp == 3'b101) shifted_a = a_extended << 4;
            else if (b_exp == 3'b110) shifted_a = a_extended << 5;
            else if (b_exp == 3'b111) shifted_a = a_extended << 6;
            else shifted_a = a_extended;

            intermediate_result = b_sign ? (c - shifted_a) : (c + shifted_a);
        end

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
    parameter SLICE_INS_WIDTH = 16,
    parameter IS_LAST_SUM = 1
) (
    input wire clk,
    input wire rst,
    input wire [1:0] state,
    input [SLICE_INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [SLICE_INS_WIDTH-1:0] ins_out,
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
        if (ins_in_valid && ins_in[7:0]==TILE_NO) begin
            case (ins_in[15:8])
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
    parameter SLICE_INS_WIDTH = 16,
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
    input [SLICE_INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
);

    wire [SLICE_INS_WIDTH-1:0] ins_inter[0:NUM_TILES-1];
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
    parameter INS_WIDTH = 64,
    parameter SLICE_INS_WIDTH = 16,
)(
    input wire clk,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,
    output wire [SLICE_INS_WIDTH-1:0] slice_ins_out,
    output wire slice_ins_out_valid,
);

    initial begin
        ins_out_valid = 0;
    end

    assign slice_ins_out_valid = ins_in_valid && ins_in[7:0] == ID_NO;
    assign slice_ins_out = ins_in[31:16];

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

module vec_tile #(
    parameter TILE_NO = 0,
    parameter SLICE_INS_WIDTH = 16,
)(
    input clk,
    input [15:0] stream_in_w,
    input stream_in_valid_w,
    output reg [15:0] stream_out_e,
    output reg stream_out_valid_e,
    input [15:0] stream_in_e,
    input stream_in_valid_e,
    output reg [15:0] stream_out_w,
    output reg stream_out_valid_w,
    input [SLICE_INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [SLICE_INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,
);

    localparam STATE_PASS = 0;
    localparam STATE_LOAD = 1;
    localparam STATE_ACTIVE = 2;

    localparam OP_PASS = 0;
    localparam OP_LOAD = 1;
    localparam OP_ACTIVE = 2;

    reg [1:0] state;
    reg enable_relu;
    reg [3:0] scale_param;
    reg [8:0] add_param;

    wire [15:0] relu_out;
    wire [15:0] scaled_out;
    wire [15:0] final_out;

    assign relu_out = enable_relu ? (stream_in_e[15] ? 16'd0 : stream_in_e) : stream_in_e;

    assign scaled_out = relu_out >> scale_param;

    assign final_out = scaled_out + {{7{add_param[8]}}, add_param};

    initial begin
        state = STATE_PASS;
        enable_relu = 0;
        scale_param = 0;
        add_param = 0;
        ins_out_valid = 0;
        stream_out_valid_w = 0;
        stream_out_valid_e = 0;
    end

    always @(posedge clk) begin
        case (state)
            STATE_PASS: begin
                stream_out_valid_w <= stream_in_valid_w;
                stream_out_valid_e <= stream_in_valid_e;
            end
            STATE_LOAD: begin
                if (stream_in_valid_w) begin
                    enable_relu <= stream_in_w[0];
                    scale_param <= stream_in_w[7:4];
                    add_param <= stream_in_w[15:8];
                end
                stream_out_valid_w <= 0;
                stream_out_valid_e <= stream_in_valid_e;
            end
            STATE_ACTIVE: begin
                if (stream_in_valid_e) begin
                    stream_out_e <= final_out;
                    stream_out_valid_e <= 1;
                end else begin
                    stream_out_valid_e <= 0;
                end
                stream_out_valid_w <= stream_in_valid_w;
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
                OP_ACTIVE: begin
                    state <= STATE_ACTIVE;
                end
            endcase
            ins_out_valid <= 0;
        end else begin
            ins_out <= ins_in;
            ins_out_valid <= ins_in_valid;
        end
    end

endmodule

// TODO: check this (synth)
module vec_slice #(
    parameter DATA_WIDTH = 128, // 16*8
    parameter NUM_TILES = 8,
    parameter SLICE_INS_WIDTH = 16,
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
    input [SLICE_INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
);

    wire [SLICE_INS_WIDTH-1:0] ins_inter[0:NUM_TILES-1];
    wire ins_valid_inter[0:NUM_TILES-1];

    genvar i;
    generate
        for (i = 0; i < NUM_TILES; i = i + 1) begin : tiles
            vec_tile #(
                .TILE_NO(i)
            ) tile (
                .clk(clk),
                .stream_in_w(stream_in_w[i*16+:16]),
                .stream_in_valid_w(stream_in_w_valid[i]),
                .stream_out_e(stream_out_e[i*16+:16]),
                .stream_out_valid_e(stream_out_e_valid[i]),
                .stream_in_e(stream_in_e[i*16+:16]),
                .stream_in_valid_e(stream_in_e_valid[i]),
                .stream_out_w(stream_out_w[i*16+:16]),
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
    parameter INS_WIDTH = 32,
    parameter SLICE_INS_WIDTH = 16,
)(
    input wire clk,
    input [INS_WIDTH-1:0] ins_in,
    input ins_in_valid,
    output reg [INS_WIDTH-1:0] ins_out,
    output reg ins_out_valid,
    output wire [SLICE_INS_WIDTH-1:0] slice_ins_out,
    output wire slice_ins_out_valid
);

    initial begin
        ins_out_valid = 0;
    end

    assign slice_ins_out_valid = ins_in_valid && ins_in[7:0] == ID_NO;
    assign slice_ins_out = ins_in[31:16];

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
    parameter INS_WIDTH = 64,
    parameter SLICE_INS_WIDTH = 16,
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
    wire [SLICE_INS_WIDTH-1:0] slice_ins[0:7];
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
        .ID_NO(3),
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
        .ID_NO(4),
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
        .ID_NO(5)
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
        .ID_NO(6)
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
        .ID_NO(7)
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
