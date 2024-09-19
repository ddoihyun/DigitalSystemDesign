`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/02 10:22:14
// Design Name: 
// Module Name: tb_adder
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


module tb_adder(
    );
    
    reg a0, b0, c0;
    wire s, carryout;
    
    
    adder uut( .a(a0), .b(b0), .c(c0), .sum(s), .cout(carryout) );
    adder  (a0, b0, c0, s, carryout);
    
    initial begin // Simulation에만 가능(testbench) => initial begin or always @(condition)
        a0=0; b0=0; c0=0;
        
        #5 a0=1;
        #5 b0=1;
        #5 c0=1;
        
        #5 a0=0; b0=0;
        #5 b0=1;
        $stop;
    end
    
endmodule
