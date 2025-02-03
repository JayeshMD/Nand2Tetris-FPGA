`timescale 1ns / 1ps

module n2t_or(out, a, b);
    output out;
    input a,b;
    
    wire na, nb;
    
    n2t_not NOT1(na, a);
    n2t_not NOT2(nb, b);
    
    nand(out, na, nb);
    
endmodule
