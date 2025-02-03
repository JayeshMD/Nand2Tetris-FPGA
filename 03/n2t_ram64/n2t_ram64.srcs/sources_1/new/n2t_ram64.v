`timescale 1ns / 1ps

module n2t_ram64(out, in, load, address, clk);
    output [15:0] out;
    input  [15:0] in;
    input  [5:0]  address;
    input  load, clk;
    
    wire a,b,c,d,e,f,g,h;
    wire [15:0] out1, out2, out3, out4, out5, out6, out7, out8;
    
    n2t_dmux8way DMUX8WAY(a,b,c,d,e,f,g,h, load, address[5:3]);
    
    n2t_ram8 RAM81(out1, in , a, address[2:0],clk);
    n2t_ram8 RAM82(out2, in , b, address[2:0],clk);
    n2t_ram8 RAM83(out3, in , c, address[2:0],clk);
    n2t_ram8 RAM84(out4, in , d, address[2:0],clk);
    n2t_ram8 RAM85(out5, in , e, address[2:0],clk);
    n2t_ram8 RAM86(out6, in , f, address[2:0],clk);
    n2t_ram8 RAM87(out7, in , g, address[2:0],clk);
    n2t_ram8 RAM88(out8, in , h, address[2:0],clk);
    
    n2t_mux8way16 MUX8WAY16(out, out1, out2, out3, out4, out5, out6, out7, out8, address[5:3]);
    
endmodule
