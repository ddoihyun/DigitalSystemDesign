`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 07:46:50
// Design Name: 
// Module Name: T_FF
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


module T_FF( output Q, nQ,
    input T, clk, reset );
    
    reg Q;
    
    always @(posedge clk or posedge reset)
        if(reset) Q <= 0;
        else if(T) Q <= nQ;
        
    assign nQ = ~Q;    
    
endmodule
