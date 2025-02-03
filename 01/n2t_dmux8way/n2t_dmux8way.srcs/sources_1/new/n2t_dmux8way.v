`timescale 1ns / 1ps

module n2t_dmux8way(a,b,c,d,e,f,g,h,in,sel);
    output a,b,c,d,e,f,g,h;
    input in;
    input [2:0] sel;
    
    
    wire w1,w2,w3,w4;
    n2t_dmux4way DMUX4WAY(w1,w2,w3,w4,in,sel[1:0]);
    
    n2t_dmux DMUX1(a,e,w1, sel[2]);
    n2t_dmux DMUX2(b,f,w2, sel[2]);
    n2t_dmux DMUX3(c,g,w3, sel[2]);
    n2t_dmux DMUX4(d,h,w4, sel[2]);
endmodule
