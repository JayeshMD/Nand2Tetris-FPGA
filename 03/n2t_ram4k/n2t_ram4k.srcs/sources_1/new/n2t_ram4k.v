`timescale 1ns / 1ps

module n2t_ram4k(out, in, load, address, clk);
    output [15:0] out;
    input  [15:0] in;
    input  [11:0]  address;
    input  load, clk;
    
    wire a,b,c,d,e,f,g,h;
    wire [15:0] out1, out2, out3, out4, out5, out6, out7, out8;
    
    n2t_dmux8way DMUX8WAY(a,b,c,d,e,f,g,h, load, address[11:9]);
    
    n2t_ram512 RAM5121(out1, in , a, address[8:0],clk);
    n2t_ram512 RAM5122(out2, in , b, address[8:0],clk);
    n2t_ram512 RAM5123(out3, in , c, address[8:0],clk);
    n2t_ram512 RAM5124(out4, in , d, address[8:0],clk);
    n2t_ram512 RAM5125(out5, in , e, address[8:0],clk);
    n2t_ram512 RAM5126(out6, in , f, address[8:0],clk);
    n2t_ram512 RAM5127(out7, in , g, address[8:0],clk);
    n2t_ram512 RAM5128(out8, in , h, address[8:0],clk);
    
    n2t_mux8way16 MUX8WAY16(out, out1, out2, out3, out4, out5, out6, out7, out8, address[11:9]);
    
endmodule