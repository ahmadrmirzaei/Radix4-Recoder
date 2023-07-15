module regX # (
    parameter WIDTH = 8
)(
    input clk, rst,
    input [WIDTH-1:0] x,
    output reg [WIDTH-1:0] x_out, x_bar,
    output reg [WIDTH:0] x_shift
);
    
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            x_out <= 0;
            x_bar <= 0;
            x_shift <= 0;
        end
        else begin
            x_out <= x;
            x_bar <= ~x;
            x_shift <= x << 1;
        end
    end
    
endmodule : regX
