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
        end else if (sum_exp == 0) begin
            // Denormalized number
            sum = {sum_sign, 4'b0000, sum_significand[7:5]};
        end else begin
            // Normalized number
            sum = {sum_sign, sum_exp[3:0], sum_significand[7:5]};
        end
    end

endmodule
