module mux_8(data, select, out);

input wire [0:7] data;
input wire [0:2] select;
output logic out;

wire out_a, out_b;

mux_4 MUX_A(
  .data({data[0], data[2], data[4], data[6]}),
  .select(select[0:1]),
  .out(out_a)
);

mux_4 MUX_B(
  .data({data[1], data[3], data[5], data[7]}),
  .select(select[0:1]),
  .out(out_b)
);

assign out = select[2] ? out_b : out_a;

endmodule