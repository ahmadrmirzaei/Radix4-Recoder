module regXY # (
    parameter WIDTH = 10
)(
    input clk, rst,
    input zero,
    input [WIDTH-1:0] x,
    output reg [WIDTH-1:0] xy
);

    always @(posedge clk, posedge rst) begin
        if (rst) xy <= 0;
        else if (zero) xy <= 0;
        else xy <= x;
    end
    
endmodule : regXY
