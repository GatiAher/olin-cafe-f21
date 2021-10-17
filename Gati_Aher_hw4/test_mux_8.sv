module test_mux_8;

logic [0:7] data;
logic [0:2] select;
logic answer;
wire out;

mux_8 UUT(.data(data), .select(select), .out(out));

initial begin
  $dumpvars(0, UUT);
  $dumpfile("mux_8.vcd");

  $display("data select | out");
  data = 8'b10101010;
  for (int i = 0; i < 8; i = i + 1) begin
    select = i;
    answer = data[i];
    #1 $display("%b %b | %b | %b", data, select, out, answer);
  end
end


endmodule
