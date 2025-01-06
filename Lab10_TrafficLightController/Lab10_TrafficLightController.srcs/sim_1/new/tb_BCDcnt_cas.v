`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/10/15 20:23:50
// Design Name: 
// Module Name: tb_BCDcnt_cas
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

module tb_BCDcnt_cas_();

    // Testbench에서 사용할 신호 선언
    reg clk;
    reg reset;
    reg inc;
    wire [3:0] Q;
    wire TC;

    // DUT (Device Under Test) 인스턴스화
    BCDcnt_cas uut (
        .Q(Q),
        .TC(TC),
        .inc(inc),
        .reset(reset),
        .clk(clk)
    );

    // 10ns 주기의 클럭 생성
    always #5 clk = ~clk;

    // Test 시나리오 작성
    initial begin
        // 초기 신호 설정
        clk = 0;
        reset = 0;
        inc = 0;

        // 1. Reset 테스트: 리셋 후 Q가 0인지 확인
        reset = 1;
        #10;  // 리셋 동안 10ns 대기
        reset = 0;

        // 2. Increment 테스트: Q가 0에서 9까지 증가하는지 확인
        inc = 1;
        #100;  // 10개의 클럭 주기 동안 증가시키기

        // 3. TC (Terminal Count) 테스트: Q가 9에서 0으로 리셋되는지 확인
        #10;  // 추가 클럭 주기 대기 (Q가 9에서 0으로 돌아가는지)
        
        // 4. Increment 멈춤 테스트: inc = 0일 때 Q가 유지되는지 확인
        inc = 0;
        #50;  // 5개의 클럭 주기 대기

        // 5. 다시 Increment 테스트: Q가 정상적으로 다시 증가하는지 확인
        inc = 1;
        #50;

        // 6. Test 완료, 시뮬레이션 종료
        $finish;
    end

    // Q와 TC의 변화를 모니터링
    initial begin
        $monitor("Time = %0t | Q = %0d | TC = %b | Reset = %b | Inc = %b", 
                  $time, Q, TC, reset, inc);
    end

endmodule
