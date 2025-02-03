`timescale 1ns / 1ps

module n2t_not16(out, a);
    output [15:0] out;
    input [15:0] a;
    
    not(out[0],a[0]);
    not(out[1],a[1]);
    not(out[2],a[2]);
    not(out[3],a[3]);
    not(out[4],a[4]);
    not(out[5],a[5]);
    not(out[6],a[6]);
    not(out[7],a[7]);
    not(out[8],a[8]);
    not(out[9],a[9]);
    not(out[10],a[10]);
    not(out[11],a[11]);
    not(out[12],a[12]);
    not(out[13],a[13]);
    not(out[14],a[14]);
    not(out[15],a[15]);
endmodule
