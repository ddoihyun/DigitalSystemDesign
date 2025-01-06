`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/15 20:38:57
// Design Name: 
// Module Name: tb_Debounce_Pulse_Generator
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

module tb_Debounce_Pulse_Generator();

    // Testbench에서 사용할 신호 선언
    reg clk;
    reg reset;
    reg en;
    reg button;
    wire x;

    // DUT (Device Under Test) 인스턴스화
    Debounce_Pulse_Generator uut (
        .clk(clk),
        .reset(reset),
        .en(en),
        .button(button),
        .x(x)
    );

    // 10ns 주기의 클럭 생성 (100MHz)
    always #5 clk = ~clk;

    // 초기 설정 및 테스트 시나리오 작성
    initial begin
        // 초기 신호 설정
        clk = 0;
        reset = 1;
        en = 0;
        button = 0;

        // 1. Reset 신호 테스트
        #20 reset = 0;  // 리셋 해제
        #10 en = 1;     // Enable 신호 활성화

        // 2. 버튼 눌림 시뮬레이션
        #30 button = 1;  // 버튼 눌림 (button = 1)
        #20 button = 0;  // 버튼 떼기 (button = 0)

        // 3. 노이즈 테스트 (짧은 시간 동안 빠르게 눌림/떼기)
        #15 button = 1;
        #5 button = 0;
        #5 button = 1;
        #10 button = 0;

        // 4. 다시 버튼 눌림 테스트
        #50 button = 1;
        #30 button = 0;

        // 5. 시뮬레이션 종료
        #100 $finish;
    end

    // 모니터링: 중요한 신호의 변화를 시간과 함께 출력
    initial begin
        $monitor("Time = %0t | clk = %b | reset = %b | en = %b | button = %b | x = %b", 
                  $time, clk, reset, en, button, x);
    end

endmodule

