`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2024/09/02 04:36:13
// Design Name: 
// Module Name: tb_adder_4bit
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


module tb_adder_4bit(
    );
    
    reg [3:0] A;
    reg [3:0] B;
    reg Cin;
    wire [3:0] S;
    wire Cout;
    
    adder_4bit uut( .A(A), .B(B), .Cin(Cin), .Cout(Cout), .S(S) );
    
    always #10 A=A+1'b1;
    always #160 B=B+1'b1;
    always #2560 Cin=~Cin;
    
//    initial begin
//        A=4'h0; B=4'h0; Cin=0;
//        #5120 $finish;
//    end


 initial begin
        // Initialize inputs
        Cin = 0;

        // Test case 1: 1 + 3
        A = 4'd1; B = 4'd3; #10;
        $display("A = %d, B = %d, Cin = %d -> Sum = %d, Cout = %d", A, B, Cin, S, Cout);

        // Test case 2: 4 + 3
        A = 4'd4; B = 4'd3; #10;
        $display("A = %d, B = %d, Cin = %d -> Sum = %d, Cout = %d", A, B, Cin, S, Cout);

        // Test case 3: 7 + 7
        A = 4'd7; B = 4'd7; #10;
        $display("A = %d, B = %d, Cin = %d -> Sum = %d, Cout = %d", A, B, Cin, S, Cout);

        // Test case 4: 8 + 9
        A = 4'd8; B = 4'd9; #10;
        $display("A = %d, B = %d, Cin = %d -> Sum = %d, Cout = %d", A, B, Cin, S, Cout);

        $finish;
    end
        
endmodule
