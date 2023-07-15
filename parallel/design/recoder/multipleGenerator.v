`include "recoder7.v"
`include "selector7.v"

module multipleGenerator(
    input [6:0] x, y,
    output [3:0] c,
    output [7:0] xy0, xy1, xy2, xy3
);

    wire [3:0] sign, one, two;
    
    recoder7 recoder7_instance(
        .y(y),
        .c(c),
        .sign(sign),
        .one(one),
        .two(two)
    );
    
    selector7 selector7_instance(
        .x(x),
        .sign(sign),
        .one(one),
        .two(two),
        .xy0(xy0),
        .xy1(xy1),
        .xy2(xy2),
        .xy3(xy3)
    );
    
endmodule : multipleGenerator
