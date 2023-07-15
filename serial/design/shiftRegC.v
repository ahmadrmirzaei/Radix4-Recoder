module shiftRegC # (
    parameter WIDTH = 8  
)(
    input clk, rst,
    input c_in,
    input [WIDTH-1:0] y,
    output reg c_out,
    output [1:0] m
);
    
    reg [WIDTH-1:0] regs;
    assign m = regs[1:0];

    always @(posedge clk, posedge rst) begin
        if (rst) begin
            c_out <= 0;
            regs <= y;
        end
        else begin
            c_out <= c_in;
            regs <= {2'b0, regs[WIDTH-1:2]};
        end
    end
    
endmodule : shiftRegC
