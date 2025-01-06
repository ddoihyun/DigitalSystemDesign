`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/17 07:25:30
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


module ClockEnableGenerator( output en_10Hz,en_1KHz, 
    input clk, reset);
    
    wire [6:0] tc;
    
    BCDcnt_cas en10MHz( .TC(tc[1]), .inc(1'b1), .clk(clk), .reset(reset) );
    BCDcnt_cas en1MHz( .TC(tc[2]), .inc(tc[1]), .clk(clk), .reset(reset) );
    BCDcnt_cas en100kHz( .TC(tc[3]), .inc(tc[2]), .clk(clk), .reset(reset) );
    BCDcnt_cas en10kHz( .TC(tc[4]), .inc(tc[3]), .clk(clk), .reset(reset) );
    BCDcnt_cas en1kHz( .TC(tc[5]), .inc(tc[4]), .clk(clk), .reset(reset) );
    BCDcnt_cas en100Hz( .TC(tc[6]), .inc(tc[5]), .clk(clk), .reset(reset) );
    BCDcnt_cas en10Hz( .TC(en_10Hz), .inc(tc[6]), .clk(clk), .reset(reset) );

endmodule
