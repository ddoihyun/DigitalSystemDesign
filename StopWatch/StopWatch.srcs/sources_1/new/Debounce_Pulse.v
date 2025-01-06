`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 07:32:23
// Design Name: 
// Module Name: Debounce_Pulse
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


module Debounce_Pulse( output sig,
    input BTN, clk, en, reset );
    
    reg Q1, Q2, Q3;
    
    always @(posedge clk or posedge reset)
        if(reset) Q1 <= 0;
        else if(en) Q1 <= BTN;
   
    always @(posedge clk or posedge reset)
        if(reset) begin
            Q2 <= 0;
            Q3 <= 0;
        end    
        else begin
            Q2 <= Q1;
            Q3 <= Q2;
        end
        
    assign sig = ~Q3 & Q2;
    
endmodule
