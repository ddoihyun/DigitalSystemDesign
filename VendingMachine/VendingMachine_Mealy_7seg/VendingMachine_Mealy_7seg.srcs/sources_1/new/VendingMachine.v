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
           output wire LED1_candy, LED2_change,
           output wire ssA, ssB, ssC, ssD, ssE, ssF, ssG, ssDP,
           output wire AN0, AN1, AN2, AN3, AN4, AN5, AN6, AN7);
           
    wire sel1,sel2, ld;
    wire LED1clr, LED2clr, LED1set, LED2set;
    wire EQ200, GE150;
    wire [7:0] sum;
    
    wire BTN50_pulse, BTN100_pulse;
    wire en_10Hz;
    reg [7:0] SUM;
    
    ClockEnableGen clk_gen (
        .clk(CLK100MHZ), 
        .reset(rst), 
        .eo_10Hz(en_10Hz)
    );
    
    debounce_pulse_gen debounce_50 (
        .clk(CLK100MHZ),
        .rst(rst),
        .en(en_10Hz),
        .btn(BTN50),
        .pulse(BTN50_pulse)
    );
    
    debounce_pulse_gen debounce_100 (
        .clk(CLK100MHZ),
        .rst(rst),
        .en(en_10Hz),
        .btn(BTN100),
        .pulse(BTN100_pulse)
    );
    
   datapath u1(CLK100MHZ, rst, sel1, sel2, en_10Hz, LED1set, LED1clr, LED2set, LED2clr, ld,
                    EQ200, GE150, LED1_candy, LED2_change, sum );
                    
   controller_mealy u2(CLK100MHZ,rst, GE150, EQ200, BTN50_pulse, BTN100_pulse, en_10Hz,
                   ld, sel1, sel2, LED1set, LED1clr, LED2set, LED2clr);
           
    always @(posedge CLK100MHZ)
        if(en_10Hz && !LED1_candy) SUM <= sum;
                           
   wire [3:0] hundreds, tens, ones;
   BCD_Converter bcd_converter ( .binary(SUM), .hundreds(hundreds), .tens(tens), .ones(ones) );
               
   ss_drive seven_segment_display ( .clk(CLK100MHZ), .rst(rst),
       .data7(4'b1111), .data6(4'b1111), .data5(4'b1111), .data4(4'b1111), .data3(4'b1111), // unused
       .data2(hundreds), .data1(tens), .data0(ones), .mask(8'b0000_0111),
       .ssA(ssA), .ssB(ssB), .ssC(ssC), .ssD(ssD), .ssE(ssE), .ssF(ssF), .ssG(ssG), .ssDP(ssDP),
       .AN7(AN7), .AN6(AN6), .AN5(AN5), .AN4(AN4), .AN3(AN3), .AN2(AN2),.AN1(AN1), .AN0(AN0) );               
endmodule
