`timescale 1ns / 1ps

module n2t_and(out, a, b);
    output out; 
    input a,b;
    
    wire w1;
    
    nand(w1, a, b);
    n2t_not NOT1(out, w1);   
endmodule
