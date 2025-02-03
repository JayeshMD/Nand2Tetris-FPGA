`timescale 1ns / 1ps

module n2t_register_test();
    reg [15:0] in; 
    reg load;
    wire [15:0] out;
    
    reg clk = 1'b0;
    
    n2t_register REGISTER1(out, in , load, clk);
    
    
    
    
    
    
endmodule
