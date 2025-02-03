`timescale 1ns / 1ps

module n2t_mux4way16(out, a, b, c, d, sel);
    output [15:0] out;
    input [15:0] a, b, c, d;
    input [1:0] sel;
    
    wire [15:0] w1, w2, w3;
    
    n2t_mux16 MUX161(w1, a, b, sel[0]);
    n2t_mux16 MUX162(w2, c, d, sel[0]);
    n2t_mux16 MUX163(out, w1, w2, sel[1]);
    
endmodule
