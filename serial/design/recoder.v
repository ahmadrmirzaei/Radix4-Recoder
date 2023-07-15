module recoder(
    input clk, rst,
    input c_in,
    input [1:0] m,
    output c_out,
    output reg one, neg, zero
);
    
    assign c_out = (m[1] & c_in) | (m[1] & m[0]);
    
    always @(posedge clk, posedge rst) begin
        if (rst) begin
            one <= 0;
            neg <= 0;
            zero <= 0;
        end
        else begin
            one <= m[0] ^ c_in;
            neg <= c_out;
            zero <= (m[1] & m[0] & c_in) | (!m[1] & !m[0] & !c_in);
        end
    end
        
endmodule : recoder
