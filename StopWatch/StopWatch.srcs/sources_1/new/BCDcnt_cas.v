`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 07:21:15
// Design Name: 
// Module Name: BCDcnt_cas
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


module BCDcnt_cas( output TC, reg [3:0] Q,
    input inc, clk, reset );
    
    wire fin;
    
    always @(posedge clk or posedge reset)
        if(reset) Q <= 4'b0000;
        else if(inc)
            if(fin) Q <= 4'b0000;
            else Q <= Q+1;
        
    assign fin = (Q == 4'd9)? 1:0;
    assign TC = fin & inc;
      
endmodule
