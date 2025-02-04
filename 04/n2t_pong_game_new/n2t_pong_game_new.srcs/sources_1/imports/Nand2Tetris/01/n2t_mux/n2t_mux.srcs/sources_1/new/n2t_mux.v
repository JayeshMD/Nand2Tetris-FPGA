`timescale 1ns / 1ps


module n2t_mux(out, a, b, sel);
    input a, b, sel;
    output out;
    
    wire w1, w2, nsel;
    
    not(nsel, sel);
    and(w1, a, nsel);
    and(w2, b,  sel);
    or(out, w1, w2);
    
endmodule
