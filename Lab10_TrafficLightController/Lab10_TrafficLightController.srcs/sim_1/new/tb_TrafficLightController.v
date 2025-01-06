`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/15 21:58:42
// Design Name: 
// Module Name: tb_TrafficLightController
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


module tb_TrafficLightController();
    // Testbench에서 사용할 신호 선언
    reg clk;
    reg reset;
    reg button;
    wire LED16_R, LED16_G, LED16_B;  // fwy 색상 LED 출력
    wire LED17_R, LED17_G, LED17_B;  // hwy 색상 LED 출력

    // DUT (Device Under Test) 인스턴스화
    TrafficLightController uut (
        .LED16_R(LED16_R), .LED16_G(LED16_G), .LED16_B(LED16_B),
        .LED17_R(LED17_R), .LED17_G(LED17_G), .LED17_B(LED17_B),
        .reset(reset), .clk(clk), .button(button)
    );

    // 10ns 주기의 클럭 생성 (100MHz)
    always #5 clk = ~clk;

    // 초기 설정 및 테스트 시나리오 작성
    initial begin
        // 초기 신호값 설정
        clk = 0;
        reset = 1;
        button = 0;

        // 1. Reset 신호 테스트: 초기화 상태에서 LED가 적절히 초기화되는지 확인
        #20 reset = 0;  // 리셋 해제

        // 2. 버튼 눌림 테스트 (버튼 누름으로 상태 변화 유도)
        #30 button = 1;  // 버튼 누름
        #10 button = 0;  // 버튼 뗌

        // 3. 일정 시간 후 다시 버튼 누름 테스트
        #100 button = 1;
        #10 button = 0;

        // 4. 여러 번의 버튼 신호 입력 (노이즈 상황 시뮬레이션)
        #50 button = 1;
        #5 button = 0;
        #5 button = 1;
        #5 button = 0;

        // 5. 시뮬레이션 종료
        #500 $finish;
    end

    // 모니터링: 주요 신호를 출력
    initial begin
        $monitor("Time = %0t | LED16_R = %b | LED16_G = %b | LED16_B = %b | LED17_R = %b | LED17_G = %b | LED17_B = %b", 
                  $time, LED16_R, LED16_G, LED16_B, LED17_R, LED17_G, LED17_B);
    end
endmodule
