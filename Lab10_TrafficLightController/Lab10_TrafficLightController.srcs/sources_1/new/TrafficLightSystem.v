//`timescale 1ns / 1ps
////////////////////////////////////////////////////////////////////////////////////
//// Company: 
//// Engineer: 
//// 
//// Create Date: 2024/10/16 03:24:05
//// Design Name: 
//// Module Name: TrafficLightSystem
//// Project Name: 
//// Target Devices: 
//// Tool Versions: 
//// Description: 
//// 
//// Dependencies: 
//// 
//// Revision:
//// Revision 0.01 - File Created
//// Additional Comments:
//// 
////////////////////////////////////////////////////////////////////////////////////


//module TrafficLightSystem(
//    input clk, reset,         // 클럭과 리셋 입력
//    input button,               // BTND 버튼 (농로 차량 감지용)
//    output LED16_B, LED16_G, LED16_R, 
//    output LED17_B, LED17_G, LED17_R
//);

//    wire x;          // 디바운스된 버튼 신호
//    wire en10Hz, en_10MHz, en_100MHz;     // 10Hz 클럭 인에이블 (신호 전환 속도 조절)
//    wire [1:0] hwy, fwy;  // 교통 신호 상태

//    // 10Hz 신호 생성 (ClockEnableGenerator 사용)
//    ClockEnableGenerator clk_gen (
//        .clk(clk), 
//        .reset(reset), 
//        .eo_10Hz(en_10Hz), 
//        .eo_100Hz(), .eo_1kHz(), .eo_10kHz(), .eo_100kHz(), 
//        .eo_1MHz(), .eo_10MHz(en_10MHz), .eo_100MHz(en_100MHz)
//    );
    
//    // 버튼 신호 동기화
//    reg button_sync1, button_sync2;
//    always @(posedge clk or posedge reset) begin
//        if (reset) begin
//            button_sync1 <= 0;
//            button_sync2 <= 0;
//        end else begin
//            button_sync1 <= button;
//            button_sync2 <= button_sync1;
//        end
//    end
    
//    wire button_stable = button_sync2;

//    // 버튼 입력 디바운스 처리 및 펄스 생성
//    Debounce_Pulse_Generator debounce (
//        .clk(clk), 
//        .reset(reset), 
//        .en(en_10Hz),  // 10Hz로 버튼 입력 확인
//        .button(button_stable), 
//        .x(x)
//    );

//    // 교통 신호 제어 FSM
//    TLC_FSM traffic_fsm (
//        .hwy(hwy), 
//        .fwy(fwy), 
//        .x(x), 
//        .clk(clk), 
//        .reset(reset), 
//        .en(en_10Hz)  // 10Hz 주기로 상태 전환
//    );
    
//    assign LED16_R = x;  // 버튼 눌림 시 확인용 출력


////     LED 제어기: 고속도로 신호 출력과 연동
////    ColorLedDriver led_hwy (
////        .LED_R(LED17_R), 
////        .LED_G(LED17_G), 
////        .LED_B(LED17_B), 
////        .color(hwy)  // 고속도로 신호에 따라 LED 색상 설정
////    );
    
////    ColorLedDriver led_fwy (
////        .LED_R(LED16_R), 
////        .LED_G(LED16_G), 
////        .LED_B(LED16_B), 
////        .color(fwy)  // 농로 신호에 따라 LED 색상 설정
////    );

//endmodule

