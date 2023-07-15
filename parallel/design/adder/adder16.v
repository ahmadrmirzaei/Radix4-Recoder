`include "fullAdder.v"

module adder16(
    input [16:0] x, y, z,
    output [16:0] vs,
    output [16:0] vc
);

    assign vc[0] = 1'b0;
    assign vs[16] = vs[15];

    genvar i;
    generate
        for (i = 0; i < 16; i = i + 1) begin
            fullAdder fullAdder_instance(
                .a(x[i]),
                .b(y[i]),
                .c_in(z[i]),
                .s(vs[i]),
                .c_out(vc[i+1])
            );
        end
    endgenerate
    
endmodule : adder16
