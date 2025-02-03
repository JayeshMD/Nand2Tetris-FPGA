`timescale 1ns / 1ps

module n2t_dff(out, in, clk);
    output out;
    input in, clk;
    
    reg out;
       
    always @(posedge clk)
    begin
        out<=in;
    end
    
endmodule
