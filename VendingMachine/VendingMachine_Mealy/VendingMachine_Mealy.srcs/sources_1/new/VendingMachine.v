`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/13 19:49:09
// Design Name: 
// Module Name: VendingMachine
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

//`default_nettype none

module VendingMachine( input wire CLK100MHZ, rst, BTN50, BTN100,
           output wire LED1_candy, LED2_change );
           
    wire sel1,sel2, ld;
    wire LED1clr, LED2clr, LED1set, LED2set;
    wire EQ200, GE150;
    wire sum;
    
   datapath u1(CLK100MHZ, rst, sel1, sel2, LED1set, LED1clr, LED2set, LED2clr, ld,
                    EQ200, GE150, LED1_candy, LED2_change, sum );
                    
   controller_mealy u2(CLK100MHZ,rst, GE150, EQ200, BTN50_pulse, BTN100_pulse, 
                   ld, sel1, sel2, LED1set, LED1clr, LED2set, LED2clr);
endmodule
