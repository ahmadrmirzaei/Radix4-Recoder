`include "regX.v"
`include "selector.v"
`include "regXY.v"
`include "shiftRegC.v"
`include "recoder.v"
`include "controller.v"

module top # (
    parameter X_WIDTH = 8,
    parameter Y_WIDTH = 8
)(
    input clk, rst,
    input [X_WIDTH-1:0] x_in,
    input [Y_WIDTH-1:0] y_in,
    output answering,
    output [X_WIDTH+1:0] xy
);
    
    wire [X_WIDTH-1:0] x, x_bar;
    wire [X_WIDTH:0] x_shift;
    wire [X_WIDTH+1:0] selected;
    
    wire [1:0] m;
    wire c_in, c_out;
    wire one, neg, zero;
    
    regX #(
        .WIDTH(X_WIDTH)
    ) regX_instance(
        .clk(clk),
        .rst(rst),
        .x(x_in),
        .x_out(x),
        .x_bar(x_bar),
        .x_shift(x_shift)
    );
    
    selector #(
        .WIDTH(X_WIDTH)
    ) selector_instance(
        .one(one),
        .neg(neg),
        .x(x),
        .x_bar(x_bar),
        .x_shift(x_shift),
        .x_out(selected)
    );
    
    regXY #(
        .WIDTH(X_WIDTH+2)
    ) regXY_instance(
        .clk(clk),
        .rst(rst),
        .zero(zero),
        .x(selected),
        .xy(xy)
    );
    
    shiftRegC #(
        .WIDTH(Y_WIDTH)
    ) shiftRegC_instance(
        .clk(clk),
        .rst(rst),
        .c_in(c_in),
        .y(y_in),
        .c_out(c_out),
        .m(m)
    );
 
    recoder recoder_instance(
        .clk(clk),
        .rst(rst),
        .c_in(c_out),
        .m(m),
        .c_out(c_in),
        .one(one),
        .neg(neg),
        .zero(zero)
    );
    
    controller #(
        .Y_WIDTH(Y_WIDTH)
    ) controller_instance(
        .clk(clk),
        .rst(rst),
        .answering(answering)
    );
endmodule : top
