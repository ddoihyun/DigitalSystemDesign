`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/23 10:17:18
// Design Name: 
// Module Name: CascadableBCDCounter
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


module BCDcnt_cas(
    output reg [3:0] Q, 
    output TC,  // indicate terminal count
    input inc, reset, clk);
    
    wire fin;  // Q reached terminal value
    
    always @(posedge clk) begin
        if(reset) Q <= 4'd0;        // synchronous reset
        else if(inc) begin
            Q <= Q+1;    
            if(Q == 4'd9)
                Q <= 4'd0;  // Overriding -> Q<=10�� �ƴϰ� Q<=0..
        end    
    end  
    

//    always @(posedge clk) begin
//        if(rstn) Q <= 4'd0;        // synchronous reset
//        else if(inc) begin    
//            if(fin)
//                Q <= Q+1;
//        end    
//    end      
    
       
    assign fin = (Q == 4'd9)? 1'b1:1'b0;
    assign TC = fin & inc;
        
endmodule
