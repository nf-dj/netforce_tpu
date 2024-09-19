module bitnet_fma(
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
            case(b_exp)
                3'b000: shifted_a = a_extended;
                3'b001: shifted_a = a_extended << 1;
                3'b010: shifted_a = a_extended << 2;
                3'b011: shifted_a = a_extended << 3;
                3'b100: shifted_a = a_extended << 4;
                3'b101: shifted_a = a_extended << 5;
                3'b110: shifted_a = a_extended << 6;
                3'b111: shifted_a = a_extended << 7;
            endcase

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

/*module bitnet_fma (
    input  wire        clk,    // Clock signal
    input  wire        reset,  // Synchronous reset
    input  wire [7:0]  a,      // 8-bit input
    input  wire [1:0]  b,      // 2-bit control input (00: pass c, 01: add, 11: subtract)
    input  wire [15:0] c,      // 16-bit input
    output reg  [15:0] result  // 16-bit clamped output
);

    // -----------------------------------
    // Pipeline Stage 1: Input Registration and Sign Extension
    // -----------------------------------
    reg signed [15:0] a_extended_stage1;
    reg [1:0]          b_stage1;
    reg signed [15:0] c_stage1;

    always @(posedge clk) begin
        if (reset) begin
            a_extended_stage1 <= 16'sd0;
            b_stage1           <= 2'b00;
            c_stage1           <= 16'sd0;
        end else begin
            a_extended_stage1 <= {{8{a[7]}}, a}; // Sign extension of 'a'
            b_stage1           <= b;
            c_stage1           <= c;
        end
    end

    // -----------------------------------
    // Pipeline Stage 2: Perform Lower 8-bit Operation
    // -----------------------------------
    reg signed [8:0] intermediate_lower_stage2; // 8-bit sum + carry

    always @(posedge clk) begin
        if (reset) begin
            intermediate_lower_stage2 <= 9'sd0;
        end else begin
            case (b_stage1)
                2'b00: intermediate_lower_stage2 <= {1'b0, c_stage1[7:0]};                // Pass through lower 8 bits
                2'b01: intermediate_lower_stage2 <= c_stage1[7:0] + a_extended_stage1[7:0]; // Add lower 8 bits
                2'b11: intermediate_lower_stage2 <= c_stage1[7:0] - a_extended_stage1[7:0]; // Subtract lower 8 bits
                default: intermediate_lower_stage2 <= {1'b0, c_stage1[7:0]};             // Default to pass through
            endcase
        end
    end

    // -----------------------------------
    // Pipeline Stage 3: Perform Upper 8-bit Operation with Carry
    // -----------------------------------
    reg signed [8:0] intermediate_upper_stage3; // 8-bit sum + carry

    always @(posedge clk) begin
        if (reset) begin
            intermediate_upper_stage3 <= 9'sd0;
        end else begin
            case (b_stage1)
                2'b00: intermediate_upper_stage3 <= {1'b0, c_stage1[15:8]};                // Pass through upper 8 bits
                2'b01: intermediate_upper_stage3 <= c_stage1[15:8] + a_extended_stage1[15:8] + intermediate_lower_stage2[8]; // Add upper 8 bits with carry
                2'b11: intermediate_upper_stage3 <= c_stage1[15:8] - a_extended_stage1[15:8] - (~intermediate_lower_stage2[8] + 1'b1); // Subtract upper 8 bits with borrow
                default: intermediate_upper_stage3 <= {1'b0, c_stage1[15:8]};             // Default to pass through
            endcase
        end
    end

    // -----------------------------------
    // Pipeline Stage 4: Combine Results and Clamp
    // -----------------------------------
    reg signed [16:0] intermediate_result_stage4; // 17-bit for clamping
    reg [15:0]        clamped_result_stage4;

    // Define signed minimum and maximum values for 16-bit
    localparam signed [15:0] MIN_VALUE = -16'sd32768;
    localparam signed [15:0] MAX_VALUE = 16'sd32767;

    always @(posedge clk) begin
        if (reset) begin
            intermediate_result_stage4 <= 17'sd0;
            clamped_result_stage4      <= 16'sd0;
        end else begin
            // Combine upper and lower results
            intermediate_result_stage4 <= {intermediate_upper_stage3[8], intermediate_upper_stage3[7:0], intermediate_lower_stage2[7:0]};
            
            // Clamping logic
            if (intermediate_result_stage4 > MAX_VALUE)
                clamped_result_stage4 <= MAX_VALUE;
            else if (intermediate_result_stage4 < MIN_VALUE)
                clamped_result_stage4 <= MIN_VALUE;
            else
                clamped_result_stage4 <= intermediate_result_stage4[15:0];
        end
    end

    // -----------------------------------
    // Pipeline Stage 5: Register Final Result
    // -----------------------------------
    always @(posedge clk) begin
        if (reset) begin
            result <= 16'sd0;
        end else begin
            result <= clamped_result_stage4;
        end
    end

endmodule*/
