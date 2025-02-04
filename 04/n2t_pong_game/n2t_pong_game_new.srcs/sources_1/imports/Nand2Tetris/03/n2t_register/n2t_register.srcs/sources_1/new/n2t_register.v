`timescale 1ns / 1ps

module n2t_register(out, in , load, clk);
    output [15:0] out;
    input [15:0] in;
    
    input load, clk;
    wire [15:0] in_sel;
    
    n2t_mux16 MUX16(in_sel, out, in, load);
    n2t_dff16 DFF16(out, in_sel , clk);
endmodule
