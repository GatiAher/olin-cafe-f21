module shift_left_logical(in, shamt, out);

parameter N = 32; // only used as a constant! Don't feel like you need to a shifter for arbitrary N.

input wire [N-1:0] in;            // the input number that will be shifted left. Fill in the remainder with zeros.
input wire [$clog2(N)-1:0] shamt; // the amount to shift by (think of it as a decimal number from 0 to 31). 
output logic [N-1:0] out;


genvar i;
generate;
    for(i=0; i<N; i++) begin
        mux32 MUX(
            .in0((N-1-i >= 0) ? in[N-1-i] : 1'b0),
            .in1((N-2-i >= 0) ? in[N-2-i] : 1'b0), 
            .in2((N-3-i >= 0) ? in[N-3-i] : 1'b0),
            .in3((N-4-i >= 0) ? in[N-4-i] : 1'b0),
            .in4((N-5-i >= 0) ? in[N-5-i] : 1'b0),
            .in5((N-6-i >= 0) ? in[N-6-i] : 1'b0),
            .in6((N-7-i >= 0) ? in[N-7-i] : 1'b0),
            .in7((N-8-i >= 0) ? in[N-8-i] : 1'b0),
            .in8((N-9-i >= 0) ? in[N-9-i] : 1'b0),
            .in9((N-10-i >= 0) ? in[N-10-i] : 1'b0),
            .in10((N-11-i >= 0) ? in[N-11-i] : 1'b0),
            .in11((N-12-i >= 0) ? in[N-12-i] : 1'b0), 
            .in12((N-13-i >= 0) ? in[N-13-i] : 1'b0),
            .in13((N-14-i >= 0) ? in[N-14-i] : 1'b0),
            .in14((N-15-i >= 0) ? in[N-15-i] : 1'b0),
            .in15((N-16-i >= 0) ? in[N-16-i] : 1'b0),
            .in16((N-17-i >= 0) ? in[N-17-i] : 1'b0),
            .in17((N-18-i >= 0) ? in[N-18-i] : 1'b0),
            .in18((N-19-i >= 0) ? in[N-19-i] : 1'b0),
            .in19((N-20-i >= 0) ? in[N-20-i] : 1'b0),
            .in20((N-21-i >= 0) ? in[N-21-i] : 1'b0),
            .in21((N-22-i >= 0) ? in[N-22-i] : 1'b0), 
            .in22((N-23-i >= 0) ? in[N-23-i] : 1'b0),
            .in23((N-24-i >= 0) ? in[N-24-i] : 1'b0),
            .in24((N-25-i >= 0) ? in[N-25-i] : 1'b0),
            .in25((N-26-i >= 0) ? in[N-26-i] : 1'b0),
            .in26((N-27-i >= 0) ? in[N-27-i] : 1'b0),
            .in27((N-28-i >= 0) ? in[N-28-i] : 1'b0),
            .in28((N-29-i >= 0) ? in[N-29-i] : 1'b0),
            .in29((N-30-i >= 0) ? in[N-30-i] : 1'b0),
            .in30((N-31-i >= 0) ? in[N-31-i] : 1'b0),
            .in31((N-32-i >= 0) ? in[N-32-i] : 1'b0),
            .switch(shamt),
            .out(out[N-1-i])
    );
    end
endgenerate

endmodule
