// Generates "triangle" waves (counts from 0 to 2^N-1, then back down again)
// The triangle should increment/decrement only if the ena signal is high, and hold its value otherwise.
module triangle_generator(clk, rst, ena, out);

parameter N = 8;
input wire clk, rst, ena;
output logic [N-1:0] out;

typedef enum logic {COUNTING_UP, COUNTING_DOWN} state_t;
state_t state;

always_ff @(posedge clk, posedge rst) begin : pulse
  if (rst) begin
      state <= COUNTING_UP;
      out <= 0;
  end

  // if enable is high, increment/decrement logic
  if (ena) begin
    if (state == COUNTING_UP) begin
        out <= out + 1'b1;
    end

    if (state == COUNTING_DOWN) begin
        out <= out - 1'b1;
    end

    // state logic
    if (&{out[N-1:1], ~out[0]}) begin
        state <= COUNTING_DOWN;
    end

    if (&{~(out[N-1:1]), out[0]}) begin
        state <= COUNTING_UP;
    end
  end else begin
    // do not do anything to counter
  end

end

endmodule