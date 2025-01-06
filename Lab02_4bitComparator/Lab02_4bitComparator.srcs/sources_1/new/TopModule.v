`timescale 1ns / 1ps

module TopModule (
    input [7:0] A,          // 8��Ʈ �Է� A
    input [7:0] B,          // 8��Ʈ �Է� B
    input En,               // Enable ��ȣ
    output reg GT,          // Greater than ��ȣ
    output reg LT,          // Less than ��ȣ
    output reg EQ           // Equal ��ȣ
);
    wire [7:0] D;     // 8��Ʈ ���� (A - B)
    wire Bout;        // ���� Borrow-out

    // 8��Ʈ Subtractor �ν��Ͻ�ȭ
    EightBitSubtractor U1 (
        .A(A),
        .B(B),
        .Bin(1'b0),    // �ʱ� Borrow-in ���� 0
        .D(D),         // ���� ���
        .Bout(Bout)    // Borrow-out ���
    );

   // �� ���� ����
    always @(*) begin
        // ����Ʈ �� ����
        GT = 1'b0;  // Greater than �⺻��
        LT = 1'b0;  // Less than �⺻��
        EQ = 1'b0;  // Equal �⺻��

        // Enable ��ȣ�� Ȱ��ȭ�Ǿ��� ���� �� ���� ����
        if (En == 1'b1) begin
            // EQ Ȯ�� (A == B)
            if (D == 8'b00000000) begin
                EQ = 1'b1;
            end
            // LT Ȯ�� (A < B)
            else if (Bout == 1'b1) begin
                LT = 1'b1;
            end
            // GT Ȯ�� (A > B)
            else begin
                GT = 1'b1;
            end
        end
    end

endmodule
