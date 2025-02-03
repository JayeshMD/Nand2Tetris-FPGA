`timescale 1ns / 1ps

module n2t_not_test();
    reg a, b;
    wire out;
    
    n2t_xor XOR1(out, a, b);
    
    initial
    begin
        $monitor ($time,"\t a=%b, b=%b,out=%b", a, b, out);
    end
    
    initial 
    begin
        a=1'b0; b=1'b0; #10;
        a=1'b0; b=1'b1; #10;
        a=1'b1; b=1'b0; #10;
        a=1'b1; b=1'b1; #10;
        #10; $finish;
    end
    
endmodule