`timescale 1ns / 1ps

module n2t_bit(out, in , load, clk);
    output out;
    input in, load, clk;
    
    n2t_mux MUX(in_sel, out, in, load);
    n2t_dff DFF1(out, in_sel , clk);
endmodule
