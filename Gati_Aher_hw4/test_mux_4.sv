module test_mux_4;

logic [0:3] data;
logic [0:1] select;
logic answer;
wire out;

mux_4 UUT(.data(data), .select(select), .out(out));

initial begin
  $dumpvars(0, UUT);
  $dumpfile("mux_4.vcd");

  $display("data select | out");
  data = 8'b1010;
  for (int i = 0; i < 4; i = i + 1) begin
    select = i;
    answer = data[i];
    #1 $display("%b %b | %b | %b", data, select, out, answer);
  end
end


endmodule
