`timescale 1ns / 1ps

module n2t_or8way(out, in);
    output out;
    input [7:0] in;
    
    wire [6:0] w;
    
    or(w[0], in[0], in[1]);
    or(w[1], w[0], in[2]);
    or(w[2], w[1], in[3]);
    or(w[3], w[2], in[4]);
    or(w[4], w[3], in[5]);
    or(w[5], w[4], in[6]);
    or(out, w[5], in[7]);

endmodule
