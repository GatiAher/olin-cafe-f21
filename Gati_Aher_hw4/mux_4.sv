module mux_4(data, select, out);

input wire [0:3] data;
input wire [0:1] select;
output logic out;

wire out_a, out_b;

assign out_a = select[0] ? data[2] : data[0];
assign out_b = select[0] ? data[3] : data[1];

assign out = select[1] ? out_b : out_a;

endmodule