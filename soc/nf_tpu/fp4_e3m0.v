module fp4_e3m0_adder (
    input  [3:0] a,
    input  [3:0] b,
    output reg [3:0] sum
);

    // Extract the sign and exponent bits
    wire sign_a = a[3];
    wire [2:0] exp_a = a[2:0];
    
    wire sign_b = b[3];
    wire [2:0] exp_b = b[2:0];
    
    reg [3:0] result_sign_exp;
    
    always @(*) begin
        // Check if signs are the same or different
        if (sign_a == sign_b) begin
            // Same sign: add the exponents
            result_sign_exp[3] = sign_a;  // The result's sign is the same as both inputs
            result_sign_exp[2:0] = exp_a + exp_b;  // Add the exponents
        end else begin
            // Different signs: perform subtraction of exponents
            if (exp_a >= exp_b) begin
                result_sign_exp[3] = sign_a;  // Result takes the sign of the larger magnitude
                result_sign_exp[2:0] = exp_a - exp_b;  // Subtract exponents
            end else begin
                result_sign_exp[3] = sign_b;  // Result takes the sign of the larger magnitude
                result_sign_exp[2:0] = exp_b - exp_a;  // Subtract exponents
            end
        end
        
        // Handle overflow (when the exponent exceeds 3 bits)
        if (result_sign_exp[2:0] > 3'b111) begin
            result_sign_exp[2:0] = 3'b111;  // Saturate the exponent to the maximum value
        end
        
        sum = result_sign_exp;  // Assign the final result to the output
    end

endmodule

