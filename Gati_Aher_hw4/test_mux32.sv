module test_mux32;

logic [0:31] data;
logic [0:4] select;
logic answer;
wire out;

mux32 UUT(.data(data), .select(select), .out(out));

initial begin
  $dumpvars(0, UUT);
  $dumpfile("mux_16.vcd");

  $display("data select | out");
  data = 32'b10101010101010101010101010101010;
  for (int i = 0; i < 32; i = i + 1) begin
    select = i;
    answer = data[i];
    #1 $display("%b %b | %b | %b", data, select, out, answer);
  end

  $display("data select | out");
  data = 32'b00001111000011110000111100001111;
  for (int i = 0; i < 32; i = i + 1) begin
    select = i;
    answer = data[i];
    #1 $display("%b %b | %b | %b", data, select, out, answer);
  end

end


endmodule
