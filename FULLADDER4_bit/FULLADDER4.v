
`timescale 1ns/1ps

// 1-bit Full Adder
module full_adder (
    input A,
    input B,
    input Cin,
    output Sum,
    output Cout
);

assign Sum  = A ^ B ^ Cin;
assign Cout = (A & B) | (B & Cin) | (A & Cin);

endmodule


// 4-bit Ripple Carry Adder
module full_adder4 (
    input  [3:0] A,
    input  [3:0] B,
    input        Cin,
    output [3:0] Sum,
    output       Cout
);

wire C1, C2, C3;

// Four 1-bit full adders connected in series
full_adder FA0 (
    .A(A[0]), .B(B[0]), .Cin(Cin),
    .Sum(Sum[0]), .Cout(C1)
);

full_adder FA1 (
    .A(A[1]), .B(B[1]), .Cin(C1),
    .Sum(Sum[1]), .Cout(C2)
);

full_adder FA2 (
    .A(A[2]), .B(B[2]), .Cin(C2),
    .Sum(Sum[2]), .Cout(C3)
);

full_adder FA3 (
    .A(A[3]), .B(B[3]), .Cin(C3),
    .Sum(Sum[3]), .Cout(Cout)
);

endmodule
