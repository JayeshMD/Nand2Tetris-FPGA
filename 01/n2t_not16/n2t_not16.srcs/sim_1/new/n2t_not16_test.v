`timescale 1ns / 1ps

module n2t_not16_test();
    reg  [15:0] a;
    wire [15:0] out;
    
    n2t_not16 NOT16(out, a);
    
    initial
    begin
        $monitor ($time,"\t a=%b, out=%b", a, out);
    end
    
    initial 
    begin
        a=16'b0000000000000000; #10;
        a=16'b0101010101010101; #10;
        a=16'b1010101010101010; #10;
        a=16'b1111111100000000; #10;
        a=16'b0000000011111111; #10;
        a=16'b1111000011110000; #10;
        a=16'b0000111100001111; #10;
        a=16'b1111111111111111; #10;    
        #10; $finish;
    end
    
endmodule