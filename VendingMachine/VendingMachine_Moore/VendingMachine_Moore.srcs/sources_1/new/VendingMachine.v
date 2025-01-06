`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/13 20:06:02
// Design Name: 
// Module Name: Controller
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

module VendingMachine(
    input wire clk, rst, BTN50, BTN100,
    output wire LED1, LED2
);

    wire ld, sel1, sel2;
    wire LED1set, LED1clr, LED2set, LED2clr;
    wire EQ200, GE150;
    wire [7:0] sum;

    // Controller 인스턴스화
    controller_moore controller (
        .clk(clk),
        .rst(rst),
        .GE150(GE150),
        .EQ200(EQ200),
        .BTN50(BTN50),
        .BTN100(BTN100),
        .ld(ld),
        .sel1(sel1),
        .sel2(sel2),
        .LED1set(LED1set),
        .LED1clr(LED1clr),
        .LED2set(LED2set),
        .LED2clr(LED2clr)
    );

    // Datapath 인스턴스화
    datapath datapath (
        .clk(clk),
        .rst(rst),
        .sel1(sel1),
        .sel2(sel2),
        .LED1set(LED1set),
        .LED1clr(LED1clr),
        .LED2set(LED2set),
        .LED2clr(LED2clr),
        .ld(ld),
        .EQ200(EQ200),
        .GE150(GE150),
        .LED1(LED1),
        .LED2(LED2),
        .sum(sum)
    );

endmodule
