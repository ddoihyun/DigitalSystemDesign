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


module LabAdd4bit(A, B, clk, rst, AN, Seg );

    input [3:0] A;
    input [3:0] B;
    input clk, rst;
    
//    output [3:0] S;
//    output Cout;
    
    output [7:0] AN;
    output [7:0] Seg;
    
    wire [3:0] carry, sum;
    assign carry[3:1] = 3'b000;
    
    adder_4bit U1 (.A(A), .B(B), .Cout(carry[0]), .S(sum));
    Dsp7Seg U2 (.X0(A), .X1(B), .X2(carry), .X3(sum), .clk(clk), .rst(rst), .AN(AN), .dsp(Seg));

endmodule