module controller # (
    parameter Y_WIDTH = 8
)(
    input clk, rst,
    output answering
);

    integer finish_num;
    
    integer counter;
    localparam [1:0] IDLE = 2'd0, WORKING=2'd1, ANSWERING=2'd2;
    reg [1:0] state, next_state;
    
    assign answering = state == ANSWERING;
    
    always @(posedge clk, posedge rst) begin
        if (rst)        state <= IDLE;
        else            state <= next_state;
    end
    
    always @(state, counter) begin
        case (state)
            IDLE:       next_state = WORKING;
            WORKING:    next_state = ANSWERING;
            ANSWERING:  next_state = (counter==finish_num) ? IDLE : ANSWERING;
            default:    next_state = IDLE;
        endcase
    end
    
    always @(posedge clk) begin
        case (state)
            IDLE: begin
                counter <= 0;
                finish_num <= $ceil((Y_WIDTH+1) / 2);
            end
            WORKING:    counter <= counter + 1;
            ANSWERING:  counter <= counter + 1;
            default:    counter <= 0;
        endcase
    end
endmodule : controller
