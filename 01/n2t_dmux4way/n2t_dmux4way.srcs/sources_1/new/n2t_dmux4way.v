`timescale 1ns / 1ps

module n2t_dmux4way(a,b,c,d, in, sel);
    output a,b,c,d;
    input in;
    input [1:0] sel;
    
    n2t_dmux DMUX1(l , u, in, sel[1]);
    n2t_dmux DMUX2(a , b, l , sel[0]);
    n2t_dmux DMUX3(c , d, u , sel[0]);
endmodule
