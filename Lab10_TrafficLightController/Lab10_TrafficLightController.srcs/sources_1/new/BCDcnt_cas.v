`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/14 09:59:45
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

module BCDcnt_cas(
    output reg [3:0] Q, 
    output TC,  // indicate terminal count
    input inc, reset, clk);
    
    wire fin;  // Q reached terminal value
    
    always @(posedge clk) begin
        if(reset) Q <= 4'd0;        // synchronous reset
        else if(inc) begin
            if(fin) Q <= 4'd0;
            else Q <= Q+1;
        end    
    end    
    
    assign fin = (Q == 4'd9)? 1'b1:1'b0;
    assign TC = fin & inc;
        
endmodule
