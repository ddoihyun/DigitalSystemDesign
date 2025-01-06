`timescale 1ns / 1ps

module debounce_pulse_gen(
    input clk,
    input rst,
    input btn,
    input en,
    output reg pulse
);
    reg [2:0] shift_reg;
    
    always @(posedge clk) begin
        if (rst)
            shift_reg <= 3'b000;
        else if(en)
            shift_reg <= {shift_reg[1:0], btn};
    end
    
    always @(posedge clk) begin
        if (rst)
            pulse <= 0;
        else
            pulse <= (shift_reg[2:1] == 2'b01);
    end
endmodule
