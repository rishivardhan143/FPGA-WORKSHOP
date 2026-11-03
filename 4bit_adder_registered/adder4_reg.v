// 4-bit adder with the 4-bit sum stored in four D flip-flops.
// The 5th carry bit is intentionally discarded.
module adder4_reg (
    input  wire       clk,
    input  wire [3:0] a,
    input  wire [3:0] b,
    output reg  [3:0] sum_q
);

wire [3:0] sum_comb;
assign sum_comb = a + b;

always @(posedge clk) begin
    sum_q <= sum_comb;
end

endmodule
