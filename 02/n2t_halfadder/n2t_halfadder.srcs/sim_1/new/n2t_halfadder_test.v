`timescale 1ns / 1ps

module n2t_halfadder_test();
    reg a,b;
    wire sum, carry;
    
    n2t_halfadder HA1(sum,carry,a,b);
    
    initial
    begin
        $monitor ($time, " a=%b, b=%b, sum=%b, carry=%b", a,b,sum,carry);
    end
    
    initial
    begin
        a=1'b0; b=1'b0; #100;
        a=1'b0; b=1'b1; #100;
        a=1'b1; b=1'b0; #100;
        a=1'b1; b=1'b1; #100;
    end    
endmodule
