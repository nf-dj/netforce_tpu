// non-pipelined

module fp8_e4m3_adder(
    input  [7:0] a,
    input  [7:0] b,
    output reg [7:0] sum
);

    // Extract sign, exponent, and fraction bits
    wire sign_a = a[7];
    wire [3:0] exp_a = a[6:3];
    wire [2:0] frac_a = a[2:0];

    wire sign_b = b[7];
    wire [3:0] exp_b = b[6:3];
    wire [2:0] frac_b = b[2:0];

    // Reconstruct the significands with the implicit leading 1 for normalized numbers
    wire [4:0] significand_a = (exp_a != 0) ? {1'b1, frac_a} : {1'b0, frac_a};
    wire [4:0] significand_b = (exp_b != 0) ? {1'b1, frac_b} : {1'b0, frac_b};

    // Compute exponent difference
    wire [4:0] exp_diff;
    wire exp_a_gt_exp_b;
    assign exp_a_gt_exp_b = (exp_a >= exp_b);
    assign exp_diff = exp_a_gt_exp_b ? (exp_a - exp_b) : (exp_b - exp_a);

    // Align significands
    reg [9:0] aligned_significand_a; // 10 bits
    reg [9:0] aligned_significand_b; // 10 bits

    // Sum variables
    reg [9:0] sum_significand;  // 10 bits
    reg sum_sign;
    reg [4:0] sum_exp; // 5 bits to handle exponent overflow

    always @(*) begin
        // Align significands based on exponent difference
        if (exp_a_gt_exp_b) begin
            aligned_significand_a = significand_a << 5; // Shift left by 5 bits
            aligned_significand_b = significand_b << 5;
            aligned_significand_b = aligned_significand_b >> exp_diff;
            sum_exp = exp_a;
        end else begin
            aligned_significand_a = significand_a << 5;
            aligned_significand_b = significand_b << 5;
            aligned_significand_a = aligned_significand_a >> exp_diff;
            sum_exp = exp_b;
        end

        if (sign_a == sign_b) begin
            // Same signs, perform addition
            sum_significand = aligned_significand_a + aligned_significand_b;
            sum_sign = sign_a;
        end else begin
            // Different signs, perform subtraction
            if (aligned_significand_a >= aligned_significand_b) begin
                sum_significand = aligned_significand_a - aligned_significand_b;
                sum_sign = sign_a;
            end else begin
                sum_significand = aligned_significand_b - aligned_significand_a;
                sum_sign = sign_b;
            end
        end

        // Normalize result
        if (sum_significand[9]) begin
            // Overflow, shift right and increment exponent
            sum_significand = sum_significand >> 1;
            sum_exp = sum_exp + 1;
        end else begin
            // Normalize to ensure MSB is 1 in bits [8:0]
            while (sum_significand[8] == 0 && sum_exp > 0) begin
                sum_significand = sum_significand << 1;
                sum_exp = sum_exp - 1;
            end
        end

        // Handle exponent overflow or underflow
        if (sum_exp >= 16) begin
            // Exponent overflow, set to maximum value
            sum_exp = 15;
            sum_significand = 10'b1111111111; // Max significand
        end else if (sum_exp == 0 && sum_significand[8:0] == 0) begin
            // Result is zero
            sum = 8'b0;
        end else begin
            // Normalized number
            sum = {sum_sign, sum_exp[3:0], sum_significand[7:5]};
        end
    end

endmodule

module fp8_e4m3_multiplier(
    input [7:0] a,
    input [7:0] b,
    output reg [7:0] result
);

    wire sign_a, sign_b, sign_result;
    wire [3:0] exponent_a, exponent_b;
    wire [3:0] mantissa_a, mantissa_b;
    wire [7:0] mantissa_product;
    wire [5:0] exponent_sum;
    wire [5:0] exponent_adjusted;
    wire normalize_shift;
    wire is_zero;
    wire is_overflow;

    // Extract components
    assign sign_a = a[7];
    assign sign_b = b[7];
    assign exponent_a = a[6:3];
    assign exponent_b = b[6:3];
    assign mantissa_a = {1'b1, a[2:0]};  // Always treat as normalized
    assign mantissa_b = {1'b1, b[2:0]};  // Always treat as normalized

    // Compute sign
    assign sign_result = sign_a ^ sign_b;

    // Multiply mantissas
    assign mantissa_product = mantissa_a * mantissa_b;

    // Add exponents and subtract bias
    assign exponent_sum = {1'b0, exponent_a} + {1'b0, exponent_b} - 6'd7;

    // Normalize
    assign normalize_shift = mantissa_product[7];

    // Adjust exponent based on normalization
    assign exponent_adjusted = normalize_shift ? exponent_sum + 6'd1 : exponent_sum;

    // Determine if result is zero
    assign is_zero = (a == 8'b0) | (b == 8'b0);

    // Determine if there's an overflow
    assign is_overflow = exponent_adjusted > 6'd15;

    always @(*) begin
        if (is_zero) begin
            result = 8'b0;
        end else if (is_overflow) begin
            // Exponent overflow, set to maximum value
            result = {sign_result, 4'b1111, 3'b111}; // Represents ±480.0
        end else if (normalize_shift) begin
            if (exponent_sum == 6'd15) begin
                // Exponent is at maximum, cannot shift further
                // Clamp mantissa to [6:4] without increasing exponent
                result = {sign_result, 4'd15, mantissa_product[6:4]};
            end else begin
                // Normal normalization shift
                result = {sign_result, exponent_adjusted[3:0], mantissa_product[6:4]};
            end
        end else begin
            // No normalization needed
            result = {sign_result, exponent_sum[3:0], mantissa_product[5:3]};
        end
    end

endmodule


module fp8_e4m3_fma(
    input  [7:0] a,        // First operand for multiplication
    input  [7:0] b,        // Second operand for multiplication
    input  [7:0] c,        // Operand to be added
    output [7:0] result     // Fused multiply-add result
);
    // Intermediate wire to hold the multiplication result
    wire [7:0] product;

    // Intermediate wire to hold the addition result
    wire [7:0] sum;

    // Instantiate the multiplier module
    fp8_e4m3_multiplier multiplier_inst (
        .a(a),
        .b(b),
        .result(product)
    );

    // Instantiate the adder module
    fp8_e4m3_adder adder_inst (
        .a(product),
        .b(c),
        .sum(sum)
    );

    // Assign the final FMA result
    assign result = sum;

endmodule

// pipelined

module fp8_e4m3_pipelined_adder(
    input         clk,
    input         rst,
    input  [7:0]  a,
    input  [7:0]  b,
    output reg [7:0]  sum
);

    // Stage 1: Input Registration and Extraction
    reg sign_a_stage1, sign_b_stage1;
    reg [3:0] exp_a_stage1, exp_b_stage1;
    reg [2:0] frac_a_stage1, frac_b_stage1;

    // Zero detection
    reg zero_a_stage1, zero_b_stage1;
    reg both_zero_stage1;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sign_a_stage1 <= 0;
            sign_b_stage1 <= 0;
            exp_a_stage1  <= 0;
            exp_b_stage1  <= 0;
            frac_a_stage1 <= 0;
            frac_b_stage1 <= 0;
            zero_a_stage1 <= 1;
            zero_b_stage1 <= 1;
            both_zero_stage1 <= 1;
        end else begin
            sign_a_stage1 <= a[7];
            sign_b_stage1 <= b[7];
            exp_a_stage1  <= a[6:3];
            exp_b_stage1  <= b[6:3];
            frac_a_stage1 <= a[2:0];
            frac_b_stage1 <= b[2:0];
            zero_a_stage1 <= (a == 8'b0);
            zero_b_stage1 <= (b == 8'b0);
            both_zero_stage1 <= zero_a_stage1 & zero_b_stage1;
        end
    end

    // Pipeline registers for 'both_zero_stage1'
    reg both_zero_stage2, both_zero_stage3, both_zero_stage4, both_zero_stage5, both_zero_stage6;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            both_zero_stage2 <= 0;
            both_zero_stage3 <= 0;
            both_zero_stage4 <= 0;
            both_zero_stage5 <= 0;
            both_zero_stage6 <= 0;
        end else begin
            both_zero_stage2 <= both_zero_stage1;
            both_zero_stage3 <= both_zero_stage2;
            both_zero_stage4 <= both_zero_stage3;
            both_zero_stage5 <= both_zero_stage4;
            both_zero_stage6 <= both_zero_stage5;
        end
    end

    // Stage 2: Significand Reconstruction and Exponent Difference
    reg [4:0] significand_a_stage2, significand_b_stage2;
    reg [4:0] exp_diff_stage2;
    reg       exp_a_gt_exp_b_stage2;
    reg [3:0] sum_exp_stage2;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            significand_a_stage2 <= 0;
            significand_b_stage2 <= 0;
            exp_diff_stage2      <= 0;
            exp_a_gt_exp_b_stage2 <= 0;
            sum_exp_stage2       <= 0;
        end else begin
            // Reconstruct significands
            significand_a_stage2 <= (exp_a_stage1 != 0) ? {1'b1, frac_a_stage1} : {1'b0, frac_a_stage1};
            significand_b_stage2 <= (exp_b_stage1 != 0) ? {1'b1, frac_b_stage1} : {1'b0, frac_b_stage1};
            
            // Compute exponent difference
            if (exp_a_stage1 >= exp_b_stage1) begin
                exp_diff_stage2      <= exp_a_stage1 - exp_b_stage1;
                exp_a_gt_exp_b_stage2 <= 1;
                sum_exp_stage2       <= exp_a_stage1;
            end else begin
                exp_diff_stage2      <= exp_b_stage1 - exp_a_stage1;
                exp_a_gt_exp_b_stage2 <= 0;
                sum_exp_stage2       <= exp_b_stage1;
            end
        end
    end

    // Stage 3: Significand Alignment
    reg [9:0] aligned_significand_a_stage3, aligned_significand_b_stage3;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            aligned_significand_a_stage3 <= 0;
            aligned_significand_b_stage3 <= 0;
        end else begin
            if (exp_a_gt_exp_b_stage2) begin
                aligned_significand_a_stage3 <= {significand_a_stage2, 5'b00000}; // Shift left by 5
                aligned_significand_b_stage3 <= significand_b_stage2 >> exp_diff_stage2;
            end else begin
                aligned_significand_a_stage3 <= significand_a_stage2 >> exp_diff_stage2;
                aligned_significand_b_stage3 <= {significand_b_stage2, 5'b00000}; // Shift left by 5
            end
        end
    end

    // Stage 4: Addition/Subtraction
    reg [9:0] sum_significand_stage4;
    reg       sum_sign_stage4;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum_significand_stage4 <= 0;
            sum_sign_stage4        <= 0;
        end else begin
            if (sign_a_stage1 == sign_b_stage1) begin
                // Same signs, perform addition
                sum_significand_stage4 <= aligned_significand_a_stage3 + aligned_significand_b_stage3;
                sum_sign_stage4        <= sign_a_stage1;
            end else begin
                // Different signs, perform subtraction
                if (aligned_significand_a_stage3 >= aligned_significand_b_stage3) begin
                    sum_significand_stage4 <= aligned_significand_a_stage3 - aligned_significand_b_stage3;
                    sum_sign_stage4        <= sign_a_stage1;
                end else begin
                    sum_significand_stage4 <= aligned_significand_b_stage3 - aligned_significand_a_stage3;
                    sum_sign_stage4        <= sign_b_stage1;
                end
            end
        end
    end

    // Stage 5: Normalization and Overflow Handling
    reg [9:0] sum_significand_stage5;
    reg [4:0] sum_exp_stage5;
    reg       overflow_stage5;

    integer i;

    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum_significand_stage5 <= 0;
            sum_exp_stage5        <= 0;
            overflow_stage5       <= 0;
        end else begin
            sum_significand_stage5 <= sum_significand_stage4;
            sum_exp_stage5        <= sum_exp_stage2;
            overflow_stage5       <= 0;

            // Normalize
            if (sum_significand_stage5[9]) begin
                // Overflow in significand, shift right and increment exponent
                sum_significand_stage5 <= sum_significand_stage5 >> 1;
                sum_exp_stage5        <= sum_exp_stage5 + 1;
            end else begin
                // Normalize to ensure MSB is 1 in bit [8]
                for (i = 0; i < 5; i = i + 1) begin
                    if (sum_significand_stage5[8] == 0 && sum_exp_stage5 > 0) begin
                        sum_significand_stage5 <= sum_significand_stage5 << 1;
                        sum_exp_stage5        <= sum_exp_stage5 - 1;
                    end else begin
                        i = 5; // Exit loop
                    end
                end
            end

            // Handle exponent overflow
            if (sum_exp_stage5 >= 16) begin
                // Exponent overflow, set to maximum value
                sum_exp_stage5  <= 15;
                sum_significand_stage5 <= 10'b1111111111; // Max significand
                overflow_stage5 <= 1;
            end

            // Handle sum_significand zero
            if (sum_significand_stage5 == 0) begin
                sum_exp_stage5 <= 0;
                overflow_stage5 <= 0;
            end
        end
    end

    // Stage 6: Output Registration
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            sum <= 8'b0;
        end else begin
            if (both_zero_stage6) begin
                // Both inputs were zero
                sum <= 8'b0;
            end else if (sum_significand_stage5 == 0) begin
                // Result is zero after normalization
                sum <= 8'b0;
            end else if (overflow_stage5) begin
                // Exponent overflow
                sum <= {sum_sign_stage4, 4'b1111, 3'b111};
            end else begin
                // Normalized number
                sum <= {sum_sign_stage4, sum_exp_stage5[3:0], sum_significand_stage5[7:5]};
            end
        end
    end

    // Debugging: Print internal signals at each cycle
    always @(posedge clk) begin
        if (!rst) begin
            $display("Time: %0t | Stage1: sign_a=%b sign_b=%b exp_a=%b exp_b=%b frac_a=%b frac_b=%b | Stage2: signif_a=%b signif_b=%b exp_diff=%b exp_a_gt_exp_b=%b sum_exp=%b | Stage3: align_a=%b align_b=%b | Stage4: sum_significand=%b sum_sign=%b | Stage5: norm_significand=%b norm_exp=%b overflow=%b | Stage6: sum=%b, both_zero=%b",
                     $time,
                     sign_a_stage1, sign_b_stage1, exp_a_stage1, exp_b_stage1, frac_a_stage1, frac_b_stage1,
                     significand_a_stage2, significand_b_stage2, exp_diff_stage2, exp_a_gt_exp_b_stage2, sum_exp_stage2,
                     aligned_significand_a_stage3, aligned_significand_b_stage3,
                     sum_significand_stage4, sum_sign_stage4,
                     sum_significand_stage5, sum_exp_stage5, overflow_stage5,
                     sum, both_zero_stage6);
        end
    end

endmodule

