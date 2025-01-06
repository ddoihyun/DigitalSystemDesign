`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/10 03:13:17
// Design Name: 
// Module Name: TFF
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module TFF(
    output reg q,
    input clk, reset, t
    );
    
    always @(posedge clk) begin
        if(reset)
            q <= 0;
        else
            if(t)
                q <= ~q;
            else
                q <= q;
    end               
endmodule
