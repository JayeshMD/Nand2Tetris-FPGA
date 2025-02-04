`timescale 1ns / 1ps

module n2t_halfadder(sum, carry,a,b);
    output sum,carry;
    input a,b;
    
    xor XOR1(sum,a,b);
    and AND1(carry,a,b);
endmodule
