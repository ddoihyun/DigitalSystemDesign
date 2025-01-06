`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 2024/06/13 18:05:45
// Design Name:
// Module Name: LabAdd4bit
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


module TopModule(A, B, clk, rst, carry, sum, AN, Seg );

    input [3:0] A;
    input [3:0] B;
    input clk, rst;
    
    output [3:0] sum;
    output carry;
    output [7:0] AN;
    output [7:0] Seg;
    
    
    adder_4bit U1 (.A(A), .B(B), .Cout(carry), .S(sum));

endmodule