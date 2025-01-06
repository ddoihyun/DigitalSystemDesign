`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/11/13 16:09:48
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

module TopModule (
    input clk,
    input reset,
    input coin_50,
    input coin_100,
    output dispense,
    output remain,
    output ssA,
    output ssB,
    output ssC,
    output ssD,
    output ssE,
    output ssF,
    output ssG,
    output ssDP,
    output AN7,
    output AN6,
    output AN5,
    output AN4,
    output AN3,
    output AN2,
    output AN1,
    output AN0
);
    wire coin_50_pulse, coin_100_pulse;
    wire [2:0] state;
    wire en_10Hz;

    ClockEnableGenerator clk_gen (
        .clk(clk), 
        .reset(reset), 
        .eo_10Hz(en_10Hz), 
        .eo_100Hz(), .eo_1kHz(), .eo_10kHz(), .eo_100kHz(), 
        .eo_1MHz(), .eo_10MHz(), .eo_100MHz()
    );

    debounce_pulse debounce_50 (
        .clk(clk),
        .reset(reset),
        .en(en_10Hz),
        .btn(coin_50),
        .pulse(coin_50_pulse)
    );

    debounce_pulse debounce_100 (
        .clk(clk),
        .reset(reset),
        .en(en_10Hz),
        .btn(coin_100),
        .pulse(coin_100_pulse)
    );

    Controller controller (
        .clk(clk),
        .reset(reset),
        .en(en_10Hz),
        .coin_50_pulse(coin_50_pulse),
        .coin_100_pulse(coin_100_pulse),
        .state(state)
    );

    wire [7:0] sum;
    Datapath datapath (
        .clk(clk),
        .reset(reset),
        .en(en_10Hz),
        .state(state),
        .dispense(dispense),
        .remain(remain),
        .sum(sum)  // Added sum output
    );

    // Convert sum to BCD (hundreds, tens, ones)
    wire [3:0] hundreds, tens, ones;
    BCD_Converter bcd_converter (
        .binary(sum),
        .hundreds(hundreds),
        .tens(tens),
        .ones(ones)
    );

    // Display sum on three segments (AN2 for hundreds, AN1 for tens, AN0 for ones)
    ss_drive seven_segment_display (
        .clk(clk),
        .rst(reset),
        .data7(4'b1111), // unused
        .data6(4'b1111), // unused
        .data5(4'b1111), // unused
        .data4(4'b1111), // unused
        .data3(4'b1111), // unused
        .data2(hundreds),
        .data1(tens),
        .data0(ones),
        .mask(8'b0000_0111),
        .ssA(ssA),
        .ssB(ssB),
        .ssC(ssC),
        .ssD(ssD),
        .ssE(ssE),
        .ssF(ssF),
        .ssG(ssG),
        .ssDP(ssDP),
        .AN7(AN7),
        .AN6(AN6),
        .AN5(AN5),
        .AN4(AN4),
        .AN3(AN3),
        .AN2(AN2),
        .AN1(AN1),
        .AN0(AN0)
    );
endmodule

