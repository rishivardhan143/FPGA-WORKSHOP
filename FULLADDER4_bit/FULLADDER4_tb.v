
`timescale 1ns/1ps

module tb_full_adder4;

reg [3:0] A, B;
reg Cin;

wire [3:0] Sum;
wire Cout;

// Instantiate the 4-bit full adder
full_adder4 DUT (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Sum(Sum),
    .Cout(Cout)
);

initial begin
    // Test case 1
    A = 4'b0101; B = 4'b0011; Cin = 0;
    #10;

    // Test case 2
    A = 4'b1111; B = 4'b0001; Cin = 0;
    #10;

    // Test case 3
    A = 4'b1010; B = 4'b0101; Cin = 1;
    #10;

    // Test case 4
    A = 4'b1111; B = 4'b1111; Cin = 1;
    #10;

    // Test case 5
    A = 4'b0000; B = 4'b0000; Cin = 0;
    #10;

    $finish;
end

initial begin
    $monitor("Time=%0t A=%b B=%b Cin=%b Sum=%b Cout=%b",
             $time, A, B, Cin, Sum, Cout);
end

endmodule
