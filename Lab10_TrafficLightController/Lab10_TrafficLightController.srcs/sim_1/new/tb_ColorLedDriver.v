`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/15 21:22:08
// Design Name: 
// Module Name: tb_ColorLedDriver
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

`define YELLOW 2'd0
`define RED 2'd1
`define GREEN 2'd2

module tb_ColorLedDriver();
    // Testbench에서 사용할 신호 선언
    reg [1:0] color;        // 입력: 색상 제어 신호
    wire LED_R, LED_G, LED_B;  // 출력: LED 상태

    // DUT (Device Under Test) 인스턴스화
    ColorLedDriver uut (
        .LED_R(LED_R),
        .LED_G(LED_G),
        .LED_B(LED_B),
        .color(color)
    );

    // 테스트 시나리오 작성
    initial begin
        // 1. YELLOW 테스트 (`color = 2'd0`)
        color = `YELLOW;
        #10;  // 10ns 대기
        
        // 2. RED 테스트 (`color = 2'd1`)
        color = `RED;
        #10;  // 10ns 대기

        // 3. GREEN 테스트 (`color = 2'd2`)
        color = `GREEN;
        #10;  // 10ns 대기

        // 4. 시뮬레이션 종료
        $finish;
    end

    // 모니터링: 주요 신호들을 출력
    initial begin
        $monitor("Time = %0t | Color = %b | LED_R = %b | LED_G = %b | LED_B = %b", 
                  $time, color, LED_R, LED_G, LED_B);
    end
endmodule
