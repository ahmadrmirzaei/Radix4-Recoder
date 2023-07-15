module recoder(
    input [2:0] y,
    output c, sign, one, two
);

    assign sign = y[2];
    assign c = sign;
    assign one = y[1] ^ y[0];
    assign two = (!y[2] & y[1] & y[0]) | (y[2] & !y[1] & !y[0]);
    
endmodule : recoder
