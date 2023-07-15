`include "selector.v"

module selector7(
    input [6:0] x,
    input [3:0] sign, one, two,
    output [7:0] xy0, xy1, xy2, xy3
);

    selector selector_instance0(
        .x(x),
        .sign(sign[0]),
        .one(one[0]),
        .two(two[0]),
        .xy(xy0)
    );
    
    selector selector_instance1(
        .x(x),
        .sign(sign[1]),
        .one(one[1]),
        .two(two[1]),
        .xy(xy1)
    );
    
    selector selector_instance2(
        .x(x),
        .sign(sign[2]),
        .one(one[2]),
        .two(two[2]),
        .xy(xy2)
    );
    
    selector selector_instance3(
        .x(x),
        .sign(sign[3]),
        .one(one[3]),
        .two(two[3]),
        .xy(xy3)
    );

endmodule : selector7
