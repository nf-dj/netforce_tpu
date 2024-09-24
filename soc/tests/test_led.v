module led_control(
    input wire clk,
    output reg led0,
    output reg led1
);

    initial begin
        led0 = 1'b0;
        led1 = 1'b1;
    end

endmodule
