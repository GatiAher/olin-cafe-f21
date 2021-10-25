module slt(a, b, out);
parameter N = 32;
input wire signed [N-1:0] a, b;
output logic out;

// Using only *structural* combinational logic, make a module that computes if a is less than b!
// Note: this assumes that the two inputs are signed: aka should be interpreted as two's complement.

// Copy any other modules you use into this folder and update the Makefile accordingly.
logic signed [N-1:0] diff;
logic same_pos;
logic same_neg;
logic mixed;

logic c_out;

sub32 DIFFERENCE(
    .a(a),
    .b(b),
    .diff(diff),
    .c_out(c_out) // unused
);

always_comb begin : compare
    same_pos = ~a[N-1] & ~b[N-1] & diff[N-1];
    same_neg = a[N-1] & b[N-1] & diff[N-1];
    mixed = a[N-1] & ~b[N-1];

    out = same_pos | same_neg | mixed;    
end

endmodule