module selector(
    input [6:0] x,
    input sign, one, two,
    output [7:0] xy
);

    wire [7:0] extended_x = $signed(x);
    wire [7:0] shifted_x = x << 1;
    wire [7:0] mid = one ? extended_x : two ? shifted_x : 8'b0;
    assign xy = sign ? ~mid : mid;

endmodule : selector
