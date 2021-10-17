/*
  a 1 bit addder that we can daisy chain for 
  ripple carry adders
*/

module gen_prop_4(a, b, c_in, c_out);

input  wire [3:0] a, b;
input wire c_in;
output logic c_out;

wire G3, G2, G1, G0, P3, P2, P1, P0, G_out, P_out;

assign P0 = a[0] | b[0];
assign P1 = a[1] | b[1];
assign P2 = a[2] | b[2];
assign P3 = a[3] | b[3];

assign G0 = a[0] & b[0];
assign G1 = a[1] & b[1];
assign G2 = a[2] & b[2];
assign G3 = a[3] & b[3];

assign P_out = P0 & P1 & P2 & P3;
assign G_out = G3 | (P3 & (G2 | (P2 & (G1 | (P1 & G0)))));
assign c_out = G_out | (P_out & c_in); 

endmodule
