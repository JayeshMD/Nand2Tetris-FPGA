`timescale 1ns / 1ps

module n2t_xor(out, a, b);
    output out;
    input a, b;
    
    wire na, nb, c, d;
    
    n2t_not NOT1(na, a);
    n2t_not NOT2(nb, b);
    
    n2t_and AND1(c, na,  b);
    n2t_and AND2(d,  a, nb);
    
    n2t_or OR1(out, c, d);
endmodule
