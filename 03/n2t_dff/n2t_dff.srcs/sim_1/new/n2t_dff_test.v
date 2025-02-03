`timescale 1ns / 1ps

module n2t_dff_test();
    reg in;
    wire out;
    
    reg clk = 1'b0;
    
    n2t_dff DFF1(out, in , clk);
    
    initial
    begin
        forever  #10 clk = !clk;
    end
    
    initial
    begin
        $monitor ($time, " in=%b, clk=%b, out=%b", in, clk, out);
    end
    
    initial
    begin
        in=0; #100;
        in=1; #50;
        in=0; #105;
        in=1; #25;
        #10; $finish;        
    end
    
endmodule
