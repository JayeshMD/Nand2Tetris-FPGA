`timescale 1ns / 1ps

module n2t_dff16(out, in, clk);
    output [15:0] out;
    input  [15:0] in;
    input clk;
    
    reg [15:0] out;
       
    always @(posedge clk)
    begin
        out<=in;
    end
    
endmodule
