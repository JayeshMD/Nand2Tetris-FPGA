`timescale 1ns / 1ps

module n2t_add16(sum, a, b);
    input [15:0] a,b;
    output [15:0] sum;
    
    wire [15:0] c;
    
    n2t_halfadder  HA0 (sum[0],  c[0],  a[0],  b[0]);
    n2t_fulladder  FA1 (sum[1],  c[1],  a[1],  b[1],  c[0]);
    n2t_fulladder  FA2 (sum[2],  c[2],  a[2],  b[2],  c[1]);
    n2t_fulladder  FA3 (sum[3],  c[3],  a[3],  b[3],  c[2]);
    n2t_fulladder  FA4 (sum[4],  c[4],  a[4],  b[4],  c[3]);
    n2t_fulladder  FA5 (sum[5],  c[5],  a[5],  b[5],  c[4]);
    n2t_fulladder  FA6 (sum[6],  c[6],  a[6],  b[6],  c[5]);
    n2t_fulladder  FA7 (sum[7],  c[7],  a[7],  b[7],  c[6]);
    n2t_fulladder  FA8 (sum[8],  c[8],  a[8],  b[8],  c[7]);
    n2t_fulladder  FA9 (sum[9],  c[9],  a[9],  b[9],  c[8]);
    n2t_fulladder  FA10(sum[10], c[10], a[10], b[10], c[9]);
    n2t_fulladder  FA11(sum[11], c[11], a[11], b[11], c[10]);
    n2t_fulladder  FA12(sum[12], c[12], a[12], b[12], c[11]);
    n2t_fulladder  FA13(sum[13], c[13], a[13], b[13], c[12]);
    n2t_fulladder  FA14(sum[14], c[14], a[14], b[14], c[13]);
    n2t_fulladder  FA15(sum[15], c[15], a[15], b[15], c[14]);
    
endmodule
