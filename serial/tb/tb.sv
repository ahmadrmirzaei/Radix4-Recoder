`include "../design/top.v"

module tb;
    
    parameter X_WIDTH = 8;
    parameter Y_WIDTH = 8;
    
    parameter XY_WIDTH = X_WIDTH + 2;
    parameter PERIOD = $ceil((Y_WIDTH+1) / 2) + 2;

    reg clk, rst;
    reg [X_WIDTH-1:0] x;
    reg [Y_WIDTH-1:0] y;

    wire answering;
    wire [XY_WIDTH-1:0] xy;

    top #(
    .X_WIDTH(X_WIDTH),
    .Y_WIDTH(Y_WIDTH)
    ) top_instance(
        .clk(clk),
        .rst(rst),
        .x_in(x),
        .y_in(y),
        .answering(answering),
        .xy(xy)
    );

    task pulse_rst;
        rst = 1;
        @(posedge clk);
        rst = 0;
    endtask

    task recode (
        input int period,
        input [X_WIDTH-1:0] x_in,
        input [Y_WIDTH-1:0] y_in
    );
        begin
            x = x_in;
            y = y_in;
            pulse_rst();
            repeat (period) @(posedge clk);
        end
    endtask

    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    initial begin
        recode(PERIOD+2, 8'b00011101, 8'b00011011);
        recode(PERIOD+2, 8'b00001010, 8'b00001010);
        recode(PERIOD+2, 8'b00000100, 8'b00000011);
        $finish;
    end

endmodule : tb
