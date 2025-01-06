`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/15 20:30:27
// Design Name: 
// Module Name: tb_ClockEnableGenerator
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

module tb_ClockEnableGenerator();

    // Testbench에서 사용할 신호 선언
    reg clk;
    reg reset;
    wire eo_10Hz, eo_100Hz, eo_1KHz, eo_10KHz, eo_100KHz, eo_1MHz, eo_10MHz, eo_100MHz;

    // DUT (Device Under Test) 인스턴스화
    ClockEnableGenerator uut (
        .clk(clk),
        .reset(reset),
        .eo_10Hz(eo_10Hz),
        .eo_100Hz(eo_100Hz),
        .eo_1KHz(eo_1KHz),
        .eo_10KHz(eo_10KHz),
        .eo_100KHz(eo_100KHz),
        .eo_1MHz(eo_1MHz),
        .eo_10MHz(eo_10MHz),  
        .eo_100MHz(eo_100MHz)
    );

    // 클럭 생성: 10ns 주기의 클럭 (100MHz 클럭)
    always #5 clk = ~clk;

    // 초기 설정 및 테스트 시나리오 작성
    initial begin
        // 초기 신호값 설정
        clk = 0;
        reset = 1;  // 초기화 상태
        #20;        // 리셋 신호 유지

        reset = 0;  // 리셋 해제
        #100000;    // 충분한 시간 동안 시뮬레이션 실행

        $finish;    // 시뮬레이션 종료
    end

    // 각 출력 신호를 모니터링하여 변화 시 출력
    initial begin
        $monitor("Time = %0t | eo_10Hz = %b | eo_100Hz = %b | eo_1KHz = %b | eo_10KHz = %b | eo_100KHz = %b | eo_1MHz = %b | eo_10MHz = %b | eo_100MHz = %b", 
                  $time, eo_10Hz, eo_100Hz, eo_1KHz, eo_10KHz, eo_100KHz, eo_1MHz, eo_10MHz, eo_100MHz);
    end

endmodule

