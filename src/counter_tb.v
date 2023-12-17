`timescale 1ns/1ns
`include "counter.v"

module counter_tb; 
    
    reg clk, enable, reset; 
    wire [7:0] out; 
    // 实例化计数器c1
    counter c1(.out(out), .clk(clk), .enable(enable), .reset(reset));
    initial begin
        // 默认初始化enable为1(高电平)
        enable = 1;
    end
    initial begin
        clk             = 0;
        // 这里为每10ns翻转一次,ns单位是代码最上方那个决定的
        forever #10 clk = ~clk;
    end
    initial begin
        reset = 1;
        // reset在15ns以后为0
        #15 reset = 0;
        // 500ns后结束;$finish是verilog的一个"内置函数"
        #500 $finish;
    end
    initial
    begin            
        $dumpfile("counter_tb.vcd"); //生成的vcd文件名称
        $dumpvars(0, counter_tb);    //tb模块名称
    end 
endmodule