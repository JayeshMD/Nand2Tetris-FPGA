`timescale 1ns / 1ps

module n2t_fulladder_test();
    reg a,b,c;
    wire sum, carry;
    
    n2t_fulladder FA1(sum,carry,a,b,c);
    
    initial
    begin
        $monitor ($time, " a=%b, b=%b, c=%b, sum=%b, carry=%b", a,b,c,sum,carry);
    end
    
    initial
    begin
        a=1'b0; b=1'b0; c=1'b0;#100;
        a=1'b0; b=1'b1; c=1'b0;#100;
        a=1'b1; b=1'b0; c=1'b0;#100;
        a=1'b1; b=1'b1; c=1'b0;#100;
        a=1'b0; b=1'b0; c=1'b1;#100;
        a=1'b0; b=1'b1; c=1'b1;#100;
        a=1'b1; b=1'b0; c=1'b1;#100;
        a=1'b1; b=1'b1; c=1'b1;#100;
    end    
endmodule
