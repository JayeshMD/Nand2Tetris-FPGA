`timescale 1ns / 1ps

module n2t_dmux(a, b, in, sel);
    output a,   b;
    input in, sel;
    
    wire nsel;
    not(nsel, sel);
    
    and(a, in, nsel);
    and(b, in,  sel);
endmodule
