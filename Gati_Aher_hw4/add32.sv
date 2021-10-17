/*
  a 32 bit CLA adder block
*/

module add32(a, b, c_in, sum, c_out);

input  wire [31:0] a, b;
input wire c_in;
output logic [31:0] sum;
output logic c_out;

wire carry3;
wire carry7;
wire carry11;
wire carry15;
wire carry19;
wire carry23;
wire carry27;


adder_cla_4 ADDER_CLA_4_A(
  .a(a[3:0]),
  .b(b[3:0]),
  .c_in(c_in),
  .sum(sum[3:0]),
  .c_out(carry3)
);

adder_cla_4 ADDER_CLA_B(
  .a(a[7:4]),
  .b(b[7:4]),
  .c_in(carry3),
  .sum(sum[7:4]),
  .c_out(carry7)
);

adder_cla_4 ADDER_CLA_C(
  .a(a[11:8]),
  .b(b[11:8]),
  .c_in(carry7),
  .sum(sum[11:8]),
  .c_out(carry11)
);
adder_cla_4 ADDER_CLA_D(
  .a(a[15:12]),
  .b(b[15:12]),
  .c_in(carry11),
  .sum(sum[15:12]),
  .c_out(carry15)
);

adder_cla_4 ADDER_CLA_E(
  .a(a[19:16]),
  .b(b[19:16]),
  .c_in(carry15),
  .sum(sum[19:16]),
  .c_out(carry19)
);

adder_cla_4 ADDER_CLA_F(
  .a(a[23:20]),
  .b(b[23:20]),
  .c_in(carry19),
  .sum(sum[23:20]),
  .c_out(carry23)
);

adder_cla_4 ADDER_CLA_G(
  .a(a[27:24]),
  .b(b[27:24]),
  .c_in(carry23),
  .sum(sum[27:24]),
  .c_out(carry27)
);

adder_cla_4 ADDER_CLA_H(
  .a(a[31:28]),
  .b(b[31:28]),
  .c_in(carry27),
  .sum(sum[31:28]),
  .c_out(c_out)
);

endmodule
