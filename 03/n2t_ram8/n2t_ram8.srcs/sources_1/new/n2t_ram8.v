`timescale 1ns / 1ps

module n2t_ram8(out, in, load, address, clk);
    input [15:0] in;
    input load, clk;
    input [2:0] address;
    
    output [15:0] out;
    
    wire a,b,c,d,e,f,g,h;
    wire [15:0] out1, out2, out3, out4, out5, out6, out7, out8;
    
    n2t_dmux8way DMUX8WAY(a,b,c,d,e,f,g,h, load, address);
    
    n2t_register REGISTER1(out1, in , a, clk);
    n2t_register REGISTER2(out2, in , b, clk);
    n2t_register REGISTER3(out3, in , c, clk);
    n2t_register REGISTER4(out4, in , d, clk);
    n2t_register REGISTER5(out5, in , e, clk);
    n2t_register REGISTER6(out6, in , f, clk);
    n2t_register REGISTER7(out7, in , g, clk);
    n2t_register REGISTER8(out8, in , h, clk);
    
    n2t_mux8way16 MUX8WAY16(out, out1, out2, out3, out4, out5, out6, out7, out8, address);
    
    
endmodule
