`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/02 04:07:57
// Design Name: 
// Module Name: tb_adder_half
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


module tb_adder_half(
    );
    reg A, B;
    wire Cout, S;
    adder_half uut1(
        .A(A), 
        .B(B), 
        .Cout(Cout), 
        .S(S));
        
    initial begin
        A=0; B=0;
        #100 A=0; B=0;
        #100 A=0; B=1;
        #100 A=1; B=0;
        #100 A=1; B=1;
        #100 $finish;
    end
        
endmodule
