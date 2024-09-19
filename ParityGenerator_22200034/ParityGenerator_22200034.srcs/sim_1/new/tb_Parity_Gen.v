`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/09 11:17:58
// Design Name: 
// Module Name: tb_Parity_Gen
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

module tb_Parity_Gen;  // Testbench 모듈 이름

    // DUT의 입력과 출력을 위한 레지스터 및 와이어 선언
    reg PRT;  // 짝수(1) 또는 홀수(0) 패리티 선택
    reg [6:0] data;  // 7비트 데이터 입력
    wire parity;  // 패리티 출력

    // DUT 인스턴스화
    Parity_Gen dut (
        .parity(parity),  // 출력 연결
        .PRT(PRT),  // 입력 연결
        .data(data)  // 입력 연결
    );

    // 테스트 시나리오
    initial begin
        // 시뮬레이션 결과 출력
        $monitor("Time = %0d, PRT = %b, Data = %b, Parity = %b", $time, PRT, data, parity);

        // 짝수 패리티 테스트
        PRT = 1;  // 짝수 패리티 선택
        data = 7'b0000000;  // 모든 비트가 0인 경우
        #10;
        
        data = 7'b0000001;  // 1개의 비트가 1인 경우
        #10;
        
        data = 7'b0000111;  // 3개의 비트가 1인 경우
        #10;

        data = 7'b1111111;  // 모든 비트가 1인 경우
        #10;
        
        // 홀수 패리티 테스트
        PRT = 0;  // 홀수 패리티 선택
        data = 7'b0000000;  // 모든 비트가 0인 경우
        #10;
        
        data = 7'b0000001;  // 1개의 비트가 1인 경우
        #10;
        
        data = 7'b0000111;  // 3개의 비트가 1인 경우
        #10;

        data = 7'b1111111;  // 모든 비트가 1인 경우
        #10;

        $finish;  // 시뮬레이션 종료
    end

endmodule

