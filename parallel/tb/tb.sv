`include "../design/top.v"

module tb;

    reg [6:0] x, y;
    wire [17:0] xy;

    top top_instance(
        .x(x),
        .y(y),
        .p(xy)
    );

    initial begin
        x = 7'd2;
        y = 7'd3;
        #10;
        x = 7'd27;
        y = -7'd56;
        #10;
        $finish;
    end

endmodule : tb
