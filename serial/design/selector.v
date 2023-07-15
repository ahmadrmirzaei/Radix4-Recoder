module selector # (
    parameter WIDTH = 8
)(
    input one, neg,
    input [WIDTH-1:0] x, x_bar,
    input [WIDTH:0] x_shift,
    output [WIDTH+1:0] x_out
);

    wire [WIDTH+1:0] extended_x = $signed(x);
    wire [WIDTH+1:0] extended_x_bar = $signed(x_bar);
    
    assign x_out = one ? (neg ? extended_x_bar : extended_x) : x_shift;
    
endmodule : selector
