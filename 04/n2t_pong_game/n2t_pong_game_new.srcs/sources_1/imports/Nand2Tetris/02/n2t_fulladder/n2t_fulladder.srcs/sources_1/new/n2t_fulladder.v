`timescale 1ns / 1ps

module n2t_fulladder(sum,carry,a,b,c);
    output sum, carry;
    input a,b,c;
    
    wire c1,c2, s1;
    
    n2t_halfadder HA1(s1 , c1,  a, b);
    n2t_halfadder HA2(sum, c2, s1, c);
    
    or OR1(carry, c1, c2);
endmodule
