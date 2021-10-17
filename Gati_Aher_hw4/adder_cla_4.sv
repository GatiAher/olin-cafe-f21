/*
  a 4 bit CLA adder block
*/

module adder_cla_4(a, b, c_in, sum, c_out);

input  wire [3:0] a, b;
input wire c_in;
output logic [3:0] sum;
output logic c_out;

wire G3, G2, G1, G0, P3, P2, P1, P0, G_out, P_out;

adder_rc_4 ADDER_RC_4(
  .a(a),
  .b(b),
  .c_in(c_in),
  .sum(sum)
);

gen_prop_4 GEN_PROP_4(
  .a(a),
  .b(b),
  .c_in(c_in),
  .c_out(c_out)
);

endmodule
