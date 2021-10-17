module mux_16(data, select, out);

input wire [0:15] data;
input wire [0:3] select;
output logic out;

wire out_a, out_b;

mux_8 MUX_A(
  .data({data[0], data[2], data[4], data[6], data[8], data[10], data[12], data[14]}),
  .select(select[0:2]),
  .out(out_a)
);

mux_8 MUX_B(
  .data({data[1], data[3], data[5], data[7], data[9], data[11], data[13], data[15]}),
  .select(select[0:2]),
  .out(out_b)
);

assign out = select[3] ? out_b : out_a;

endmodule