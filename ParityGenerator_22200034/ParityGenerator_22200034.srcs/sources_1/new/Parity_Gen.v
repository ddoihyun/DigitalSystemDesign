`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/09 10:31:48
// Design Name: 
// Module Name: Parity_Gen
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


module Parity_Gen(
    output wire [7:0] Result, 
    input wire PRT,             // PRT 입력: 짝수 패리티(1) 또는 홀수 패리티(0)
    input wire [6:0] data       // 7비트 데이터 입력
);

    // 7비트 데이터의 XOR 연산 결과 계산
    wire res;
    assign res = ^data;
    
    wire parity = (PRT == 0)? res : ~res;
    
    assign Result[7:1] = data; // 상위 7비트에 data 할당
    assign Result[0] = parity;    // 하위 1비트에 parity 할당

endmodule

