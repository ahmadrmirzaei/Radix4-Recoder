`include "recoder.v"

module recoder7(
    input [6:0] y,
    output [3:0] c, sign, one, two
);
    
    wire [8:0] extended_y = {y[6], y, 1'b0};
    
    genvar i;
    generate
        for(i=0; i<4; i = i+1) begin
            wire [2:0] y_in = {extended_y[2*i+2], extended_y[2*i+1], extended_y[2*i]};
            recoder recoder_instance(
                .y(y_in),
                .c(c[i]),
                .sign(sign[i]),
                .one(one[i]),
                .two(two[i])
            );
        end
    endgenerate
endmodule : recoder7
