`timescale 1ns/1ps
module adder4_reg (
    input wire clk,
    input wire [3:0] a,
    input wire [3:0] b,
    output reg [3:0] sum_q
);
    always @(posedge clk)
        sum_q <= a + b; // 4-bit result; carry-out is discarded
endmodule
