`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/10 03:22:34
// Design Name: 
// Module Name: ClockEnableGenerator
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


// clock divider와 같은 역할을 함(10ns -> 1s / 10ns -> 100KHz)
module ClockEnableGenerator(
    input clk, reset,
    output eo_10Hz, eo_1K, eo_100K, eo_100M);
    
    wire tc0, tc1, tc2, tc3, tc4, tc5, tc6, tc7;
    wire [3:0] Q100M;
    
    BCDcnt_cas u0 (.TC(tc0), .inc(1'b1), .reset(reset), .clk(clk) );
    BCDcnt_cas u1 (.TC(tc1), .inc(tc0), .reset(reset), .clk(clk) );
    BCDcnt_cas u2 (.TC(tc2), .inc(tc1), .reset(reset), .clk(clk) );
    BCDcnt_cas u3 (.TC(tc3), .inc(tc2), .reset(reset), .clk(clk) );
    BCDcnt_cas u4 (.TC(tc4), .inc(tc3), .reset(reset), .clk(clk) );
    BCDcnt_cas u5 (.TC(tc5), .inc(tc4), .reset(reset), .clk(clk) );
    BCDcnt_cas u6 (.TC(tc6), .inc(tc5), .reset(reset), .clk(clk) );
    BCDcnt_cas u7 (.Q(Q100M), . TC(tc7), .inc(tc6), .reset(reset), .clk(clk) );
    
    assign eo_10Hz = tc0;
    assign eo_1K = tc2;
    assign eo_100K = tc4;
    assign eo_100M = tc7;
    
endmodule
