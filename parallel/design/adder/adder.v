`include "adder16.v"

module adder(
    input [3:0] c,
    input [7:0] e, f, g, h,
    output [16:0] vs, vc
);

    wire [16:0] xz0 = {6'b010101, !e[7], e[7], e[7], e};
    wire [16:0] xz1 = {6'b0, !f[7], f, 1'b0, c[0]};
    wire [16:0] xz2 = {4'b0, !g[7], g, 1'b0, c[1], 2'b0};
    wire [16:0] xz3 = {2'b0, !h[7], h, 1'b0, c[2], 4'b0};
    wire [16:0] xz4 = {10'b0, c[3], 6'b0};
    
    wire [16:0] mid0, mid1, mid2, mid3;
    
    adder16 adder16_instance0(
        .x(xz0),
        .y(xz1),
        .z(xz2),
        .vs(mid0),
        .vc(mid1)
    );
    
    adder16 adder16_instance1(
        .x(xz3),
        .y(xz4),
        .z(mid0),
        .vs(mid2),
        .vc(mid3)
    );
    
    adder16 adder16_instance2(
        .x(mid1),
        .y(mid2),
        .z(mid3),
        .vs(vs),
        .vc(vc)
    );
    
endmodule : adder
