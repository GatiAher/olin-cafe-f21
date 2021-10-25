/*
  a 32 bit subtraction block
*/
module sub32(a, b, diff, c_out);

input wire [31:0] a, b;
output logic [31:0] diff;
output logic c_out;

logic [31:0] b_twos_comp;
logic carry;

add32 ADDERTWOSCOMP(
  .a(a),
  .b(~b),
  .c_in(1'b1),
  .sum(diff),
  .c_out(c_out) // unused
);

endmodule