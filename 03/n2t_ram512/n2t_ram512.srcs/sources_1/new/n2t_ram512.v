`timescale 1ns / 1ps

module n2t_ram512(out, in, load, address, clk);
    output [15:0] out;
    input  [15:0] in;
    input  [8:0]  address;
    input  load, clk;
    
    wire a,b,c,d,e,f,g,h;
    wire [15:0] out1, out2, out3, out4, out5, out6, out7, out8;
    
    n2t_dmux8way DMUX8WAY(a,b,c,d,e,f,g,h, load, address[8:6]);
    
    n2t_ram64 RAM641(out1, in , a, address[5:0],clk);
    n2t_ram64 RAM642(out2, in , b, address[5:0],clk);
    n2t_ram64 RAM643(out3, in , c, address[5:0],clk);
    n2t_ram64 RAM644(out4, in , d, address[5:0],clk);
    n2t_ram64 RAM645(out5, in , e, address[5:0],clk);
    n2t_ram64 RAM646(out6, in , f, address[5:0],clk);
    n2t_ram64 RAM647(out7, in , g, address[5:0],clk);
    n2t_ram64 RAM648(out8, in , h, address[5:0],clk);
    
    n2t_mux8way16 MUX8WAY16(out, out1, out2, out3, out4, out5, out6, out7, out8, address[8:6]);
    
endmodule
