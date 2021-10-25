/*
  Outputs a pulse generator with a period of "ticks".
  out should go high for one cycle ever "ticks" clocks.
*/
module pulse_generator(clk, rst, ena, ticks, out);

parameter N = 8;
input wire clk, rst, ena;
input wire [N-1:0] ticks;
output logic out;

logic [N-1:0] counter;
logic counter_comparator;

always_ff @(posedge clk, posedge rst) begin : pulse
  if (rst) begin
    // reset counter at will
    counter <= 0;
  end else begin
    // increment counter
    // reset counter when it goes too high
    counter <= (counter < ticks) ? counter + 1 : 0;
  end

  out <= (ena & (counter == ticks-1)) ? 1 : 0;
end

endmodule
