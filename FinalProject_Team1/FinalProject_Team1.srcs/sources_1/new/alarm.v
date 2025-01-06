module alarm(
    input clk, en,
    output speaker );

reg [16:0] counter; //113632�� 00011011101111100000 �� 2���� 17��Ʈ
reg speaker;

always @(posedge clk) begin
    if (counter == 113632) begin
        //A�� 440Hz�̹Ƿ� ���ļ�(440HZ) = Ŭ�� �ֱ�(100MHZ) / ī���� �� �̹Ƿ� ī���� ���� 227264�� ���´�.
        //duty cycle�� 50% �� ���� �ִ� �ð��� ���� �ִ� �ð��� 50%�� ����� ���� �ٽ� ������ ������. 113632
        counter <= 0;
    if (en) begin
        speaker <= ~speaker; end
        // counter�� 113632�� �������� ��, rst ��ư�� ���� ������ speaker�� ���� �ٲ��, �̴� ���ļ��� �ֱ⸦ �����Ѵ�.
    end
    else begin
        counter <= counter + 1;end
        //113632���� �� Ŭ�� 1�� �����Ѵ�.
        end
endmodule