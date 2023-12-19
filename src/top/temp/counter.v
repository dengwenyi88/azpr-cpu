// 这是一个8位的计数器counter.v
module counter(out, clk, enable,reset);
    output[7:0]  out; 
    input clk, reset, enable;
    reg[7:0] out;
    // clk上升沿触发
    always @ (posedge clk) begin
        if(reset) begin
            // 如果reset为true
            // 8'b0是8位宽,b代表二进制的0
            out <= 8'b0;
        end else if(enable) begin
            // 如果enbale为true
            // out增加1
            out <= out + 1;
        end
    end
endmodule
