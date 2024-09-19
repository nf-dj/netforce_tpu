module bitnet_fma(
    input [7:0] a,    // 8-bit input
    input [1:0] b,    // 2-bit control input (0: pass c, 1: add, -1: subtract)
    input [15:0] c,   // 16-bit input
    output reg [15:0] result // 16-bit clamped output
);

    // Constants for 16-bit signed min and max values
    localparam signed [15:0] MIN_VALUE = -16'sd32768;
    localparam signed [15:0] MAX_VALUE = 16'sd32767;

    // Extend the 8-bit input to 16 bits
    wire signed [15:0] a_extended;
    assign a_extended = {{8{a[7]}}, a};  // Sign extension

    // Intermediate result (17 bits to detect overflow)
    reg signed [16:0] intermediate_result;

    always @(*) begin
        case(b)
            2'b00: intermediate_result = {1'b0, c};  // Pass through
            2'b01: intermediate_result = c + a_extended;  // Addition
            2'b11: intermediate_result = c - a_extended;  // Subtraction
            default: intermediate_result = {1'b0, c};  // Default to pass through
        endcase

        // Clamping logic
        if (intermediate_result > MAX_VALUE)
            result = MAX_VALUE;
        else if (intermediate_result < MIN_VALUE)
            result = MIN_VALUE;
        else
            result = intermediate_result[15:0];
    end

endmodule


module bitnet_fma_pipelined (
    input  wire        clk,    // Clock signal
    input  wire        reset,  // Synchronous reset
    input  wire [7:0]  a,      // 8-bit input
    input  wire [15:0] b,      // 16-bit input
    output reg  [16:0] sum     // 17-bit sum to include carry-out
);

    // -----------------------------------
    // Stage 1: Add lower 8 bits
    // -----------------------------------
    reg [8:0] stage1_sum; // 8-bit sum + carry

    always @(posedge clk) begin
        if (reset) begin
            stage1_sum <= 9'd0;
        end else begin
            stage1_sum <= a + b[7:0];
        end
    end

    // -----------------------------------
    // Stage 2: Add upper 8 bits with carry
    // -----------------------------------
    reg [8:0] stage2_sum; // 8-bit sum + carry

    always @(posedge clk) begin
        if (reset) begin
            stage2_sum <= 9'd0;
        end else begin
            stage2_sum <= b[15:8] + stage1_sum[8]; // Adding carry from Stage 1
        end
    end

    // -----------------------------------
    // Combine Results
    // -----------------------------------
    always @(posedge clk) begin
        if (reset) begin
            sum <= 17'd0;
        end else begin
            sum <= {stage2_sum[8], stage2_sum[7:0], stage1_sum[7:0]};
        end
    end

endmodule

/*module bitnet_fma (
    input  wire        clk,    // Clock signal
    input  wire        reset,  // Synchronous reset
    input  wire [7:0]  a,      // 8-bit input
    input  wire [15:0] b,      // 16-bit input
    output reg  [16:0] sum     // 17-bit sum to include carry-out
);

    // -----------------------------------
    // Stage 1: Add Lower 4 Bits
    // -----------------------------------
    reg [4:0] stage1_sum; // 4-bit sum + carry

    always @(posedge clk) begin
        if (reset) begin
            stage1_sum <= 5'd0;
        end else begin
            stage1_sum <= a[3:0] + b[3:0];
        end
    end

    // -----------------------------------
    // Stage 2: Add Middle Lower 4 Bits with Carry
    // -----------------------------------
    reg [4:0] stage2_sum; // 4-bit sum + carry

    always @(posedge clk) begin
        if (reset) begin
            stage2_sum <= 5'd0;
        end else begin
            // Add upper 4 bits of 'a' and lower 4 bits of 'b', plus carry from Stage 1
            stage2_sum <= a[7:4] + b[7:4] + stage1_sum[4];
        end
    end

    // -----------------------------------
    // Stage 3: Add Upper Lower 4 Bits of 'b' with Carry
    // -----------------------------------
    reg [4:0] stage3_sum; // 4-bit sum + carry

    always @(posedge clk) begin
        if (reset) begin
            stage3_sum <= 5'd0;
        end else begin
            // Add upper 4 bits of 'b' and carry from Stage 2
            stage3_sum <= b[11:8] + stage2_sum[4];
        end
    end

    // -----------------------------------
    // Stage 4: Add Upper 4 Bits of 'b' with Carry
    // -----------------------------------
    reg [4:0] stage4_sum; // 4-bit sum + carry

    always @(posedge clk) begin
        if (reset) begin
            stage4_sum <= 5'd0;
        end else begin
            // Add upper 4 bits of 'b' and carry from Stage 3
            stage4_sum <= b[15:12] + stage3_sum[4];
        end
    end

    // -----------------------------------
    // Combine Results to Form Final Sum
    // -----------------------------------
    always @(posedge clk) begin
        if (reset) begin
            sum <= 17'd0;
        end else begin
            sum <= {stage4_sum[4], stage4_sum[3:0], stage3_sum[3:0], stage2_sum[3:0], stage1_sum[3:0]};
        end
    end

endmodule*/
