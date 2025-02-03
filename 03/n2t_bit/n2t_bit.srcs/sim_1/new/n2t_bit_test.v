`timescale 1ns / 1ps

module n2t_bit_test();
    reg in, load;
    wire out;
    
    reg clk = 1'b0;
    
    n2t_bit BIT1(out, in , load, clk);
    
    initial
    begin
        forever #10 clk = !clk;
    end
    
    initial
    begin
        $monitor($time, "in=%d, load=%d, out=%d", in, load, out);
    end 
    
    initial
    begin
        in = 1; load=0; #95;
                load=1; #50;
        in = 0; load=0; #100;
                load=1; #50;
                load=0; #50;                
    end
    
    
    
endmodule
