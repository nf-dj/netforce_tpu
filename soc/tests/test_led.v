module led_control(
    output reg led0,
    output reg led1,
    output reg led2
);

    initial begin
        led0 = 1'b1;
        led1 = 1'b1;
        led2 = 1'b1;
    end

endmodule
