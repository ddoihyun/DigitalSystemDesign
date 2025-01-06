`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/14 14:44:51
// Design Name: 
// Module Name: test
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

module test( );
reg CLK100MHZ, rst, BTN1, BTN2;
wire LED1, LED2;

VendingMachine uut (CLK100MHZ, rst, BTN1, BTN2,
               LED1, LED2  );

always #5 CLK100MHZ = ~CLK100MHZ;

initial begin
  CLK100MHZ = 0;
  rst = 0;
  BTN1 = 0;
  BTN2 = 0;
  #10 rst =1;
  #10 rst = 0;
  #20 BTN1 = 1;
  #10 BTN1 = 0;
  #50 BTN2 = 1;
  #10 BTN2 = 0;
  #50 BTN2 = 1;
  #10 BTN2 = 0;
  #50 BTN2 = 1;
  #10 BTN2 = 0;
  #50 $stop;
  end
    
endmodule

