module adder_half(
    input A,
    input B,
    output Cout,
    output S
    );
    
    and al(Cout, A, B);
    xor xl(S, A, B);
    
endmodule
    