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
            if (sum_significand[8] == 0 && sum_exp > 0) begin
                if (sum_significand[7] == 1) begin
                    sum_significand = sum_significand << 1;
                    sum_exp = sum_exp - 1;
                end else if (sum_significand[6] == 1) begin
                    sum_significand = sum_significand << 2;
                    sum_exp = sum_exp - 2;
                end else if (sum_significand[5] == 1) begin
                    sum_significand = sum_significand << 3;
                    sum_exp = sum_exp - 3;
                end else if (sum_significand[4] == 1) begin
                    sum_significand = sum_significand << 4;
                    sum_exp = sum_exp - 4;
                end else if (sum_significand[3] == 1) begin
                    sum_significand = sum_significand << 5;
                    sum_exp = sum_exp - 5;
                end else if (sum_significand[2] == 1) begin
                    sum_significand = sum_significand << 6;
                    sum_exp = sum_exp - 6;
                end else if (sum_significand[1] == 1) begin
                    sum_significand = sum_significand << 7;
                    sum_exp = sum_exp - 7;
                end else if (sum_significand[0] == 1) begin
                    sum_significand = sum_significand << 8;
                    sum_exp = sum_exp - 8;
                end else begin
                    sum_significand = 10'b0;
                    sum_exp = 0;
                end
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

module fp8_relu(
    input [7:0] a,
    output [7:0] result
);

    wire sign = a[7];

    assign result = sign ? 8'b0 : a;

endmodule

// pipelined

module fp8_e4m3_pipelined_adder(
    input wire clk,
    input wire rst,
    input wire [7:0] a,
    input wire [7:0] b,
    output reg [7:0] sum
);
    // Stage 1: Input registration and alignment
    reg sign_a, sign_b;
    reg [3:0] exp_a, exp_b;
    reg [2:0] frac_a, frac_b;
    reg [9:0] aligned_significand_a, aligned_significand_b;
    reg [4:0] sum_exp;
    reg exp_a_gt_exp_b;
    reg [4:0] exp_diff;

    // Stage 2: Addition/Subtraction
    reg [9:0] sum_significand;
    reg sum_sign;

    // Stage 3: Normalization
    reg [9:0] normalized_significand;
    reg [4:0] normalized_exp;

    // Pipeline registers
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            // Reset all pipeline registers
            {sign_a, sign_b, exp_a, exp_b, frac_a, frac_b} <= 0;
            {aligned_significand_a, aligned_significand_b, sum_exp} <= 0;
            {sum_significand, sum_sign} <= 0;
            {normalized_significand, normalized_exp} <= 0;
            sum <= 0;
        end else begin
            // Stage 1: Input registration and alignment
            sign_a <= a[7];
            exp_a <= a[6:3];
            frac_a <= a[2:0];
            sign_b <= b[7];
            exp_b <= b[6:3];
            frac_b <= b[2:0];

            exp_a_gt_exp_b <= (a[6:3] >= b[6:3]);
            exp_diff <= (a[6:3] >= b[6:3]) ? (a[6:3] - b[6:3]) : (b[6:3] - a[6:3]);

            if (exp_a_gt_exp_b) begin
                aligned_significand_a <= {1'b1, a[2:0], 6'b0};
                aligned_significand_b <= {1'b1, b[2:0], 6'b0} >> exp_diff;
                sum_exp <= a[6:3];
            end else begin
                aligned_significand_a <= {1'b1, a[2:0], 6'b0} >> exp_diff;
                aligned_significand_b <= {1'b1, b[2:0], 6'b0};
                sum_exp <= b[6:3];
            end

            // Stage 2: Addition/Subtraction
            if (sign_a == sign_b) begin
                sum_significand <= aligned_significand_a + aligned_significand_b;
                sum_sign <= sign_a;
            end else if (aligned_significand_a >= aligned_significand_b) begin
                sum_significand <= aligned_significand_a - aligned_significand_b;
                sum_sign <= sign_a;
            end else begin
                sum_significand <= aligned_significand_b - aligned_significand_a;
                sum_sign <= sign_b;
            end

            // Stage 3: Normalization
            if (sum_significand[9]) begin
                normalized_significand <= sum_significand >> 1;
                normalized_exp <= sum_exp + 1;
            end else if (sum_significand[8] == 0 && sum_exp > 0) begin
                if (sum_significand[7]) begin
                    normalized_significand <= sum_significand << 1;
                    normalized_exp <= sum_exp - 1;
                end else if (sum_significand[6]) begin
                    normalized_significand <= sum_significand << 2;
                    normalized_exp <= sum_exp - 2;
                end else if (sum_significand[5]) begin
                    normalized_significand <= sum_significand << 3;
                    normalized_exp <= sum_exp - 3;
                end else if (sum_significand[4]) begin
                    normalized_significand <= sum_significand << 4;
                    normalized_exp <= sum_exp - 4;
                end else if (sum_significand[3]) begin
                    normalized_significand <= sum_significand << 5;
                    normalized_exp <= sum_exp - 5;
                end else if (sum_significand[2]) begin
                    normalized_significand <= sum_significand << 6;
                    normalized_exp <= sum_exp - 6;
                end else if (sum_significand[1]) begin
                    normalized_significand <= sum_significand << 7;
                    normalized_exp <= sum_exp - 7;
                end else if (sum_significand[0]) begin
                    normalized_significand <= sum_significand << 8;
                    normalized_exp <= sum_exp - 8;
                end else begin
                    normalized_significand <= 10'b0;
                    normalized_exp <= 0;
                end
            end else begin
                normalized_significand <= sum_significand;
                normalized_exp <= sum_exp;
            end

            // Stage 4: Final result assembly
            if (normalized_exp >= 16) begin
                sum <= {sum_sign, 4'b1111, 3'b111}; // Max value
            end else if (normalized_exp == 0 && normalized_significand == 0) begin
                sum <= 8'b0; // Zero
            end else begin
                sum <= {sum_sign, normalized_exp[3:0], normalized_significand[7:5]};
            end
        end
    end
endmodule
