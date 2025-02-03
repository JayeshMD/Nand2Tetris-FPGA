`timescale 1ns / 1ps

module n2t_not(out, in);
    output out;
    input in;
    
    nand(out, in, in);
endmodule