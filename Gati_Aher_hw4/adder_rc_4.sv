/*
  a 4 bit adder daisy chaining 4
  1 bit adders
*/

module adder_rc_4(a, b, c_in, sum);

input  wire [3:0] a, b;
input wire c_in;
output logic [3:0] sum;

wire carry0;
wire carry1;
wire carry2;
wire carry3;

adder_1 ADDER_A(
  .a(a[0]),
  .b(b[0]),
  .c_in(c_in),
  .sum(sum[0]),
  .c_out(carry0)
);

adder_1 ADDER_B(
  .a(a[1]),
  .b(b[1]),
  .c_in(carry0),
  .sum(sum[1]),
  .c_out(carry1)
);

adder_1 ADDER_C(
  .a(a[2]),
  .b(b[2]),
  .c_in(carry1),
  .sum(sum[2]),
  .c_out(carry2)
);

adder_1 ADDER_D(
  .a(a[3]),
  .b(b[3]),
  .c_in(carry2),
  .sum(sum[3]),
  .c_out(carry3) // should be unused
);

endmodule
