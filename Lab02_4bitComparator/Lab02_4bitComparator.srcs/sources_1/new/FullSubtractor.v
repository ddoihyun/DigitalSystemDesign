`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/15 01:08:23
// Design Name: 
// Module Name: FullSubtractor
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


`timescale 1ns / 1ps

module FullSubtractor (
    input A,       // Minuend
    input B,       // Subtrahend
    input Bin,     // Borrow-in
    output D,      // Difference
    output Bout    // Borrow-out
);
    assign D = A ^ B ^ Bin;                     // 차이 계산
    assign Bout = (~A & (B ^ Bin)) | (B & Bin); // Borrow-out 계산
    
endmodule

