module mux32(data, select, out);

input wire [0:31] data;
input wire [0:4] select;
output logic out;

wire out_a, out_b;

mux_16 MUX_A(
  .data({data[0], data[2], data[4], data[6], data[8], data[10], data[12], data[14], data[16], data[18], data[20], data[22], data[24], data[26], data[28], data[30]}),
  .select(select[0:3]),
  .out(out_a)
);

mux_16 MUX_B(
  .data({data[1], data[3], data[5], data[7], data[9], data[11], data[13], data[15], data[17], data[19], data[21], data[23], data[25], data[27], data[29], data[31]}),
  .select(select[0:3]),
  .out(out_b)
);

assign out = select[4] ? out_b : out_a;

endmodule