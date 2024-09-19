`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/15 01:18:27
// Design Name: 
// Module Name: 8bitSubtractor
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


module EightBitSubtractor (
    input [7:0] A,   // 8비트 Minuend
    input [7:0] B,   // 8비트 Subtrahend
    input Bin,       // 초기 Borrow-in (보통 0)
    output [7:0] D,  // 8비트 차이
    output Bout      // 최종 Borrow-out
);
    wire [7:0] borrow; // 내부 borrow 신호

    // 각 비트마다 Full Subtractor를 연결
    FullSubtractor FS0 (A[0], B[0], Bin, D[0], borrow[0]);
    FullSubtractor FS1 (A[1], B[1], borrow[0], D[1], borrow[1]);
    FullSubtractor FS2 (A[2], B[2], borrow[1], D[2], borrow[2]);
    FullSubtractor FS3 (A[3], B[3], borrow[2], D[3], borrow[3]);
    FullSubtractor FS4 (A[4], B[4], borrow[3], D[4], borrow[4]);
    FullSubtractor FS5 (A[5], B[5], borrow[4], D[5], borrow[5]);
    FullSubtractor FS6 (A[6], B[6], borrow[5], D[6], borrow[6]);
    FullSubtractor FS7 (A[7], B[7], borrow[6], D[7], Bout); // 최종 borrow-out 출력
    
endmodule

