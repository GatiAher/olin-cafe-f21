module test_mux_16;

logic [0:15] data;
logic [0:3] select;
logic answer;
wire out;

mux_16 UUT(.data(data), .select(select), .out(out));

initial begin
  $dumpvars(0, UUT);
  $dumpfile("mux_16.vcd");

  $display("data select | out");
  data = 16'b1010101010101010;
  for (int i = 0; i < 16; i = i + 1) begin
    select = i;
    answer = data[i];
    #1 $display("%b %b | %b | %b", data, select, out, answer);
  end
end


endmodule
