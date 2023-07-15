`include "adder/adder.v"
`include "recoder/multipleGenerator.v"

module top(
    input [6:0] x, y,
    output [17:0] p
);

    wire [3:0] c;
    wire [7:0] xy0, xy1, xy2, xy3;
    wire signed [16:0] vs, vc;
    
    multipleGenerator multipleGenerator_instance(
        .x(x),
        .y(y),
        .c(c),
        .xy0(xy0),
        .xy1(xy1),
        .xy2(xy2),
        .xy3(xy3)
    );
    
    adder adder_instance(
        .c(c),
        .e(xy0),
        .f(xy1),
        .g(xy2),
        .h(xy3),
        .vs(vs),
        .vc(vc)
    );
    
    assign p = vs + vc;
    
endmodule : top
