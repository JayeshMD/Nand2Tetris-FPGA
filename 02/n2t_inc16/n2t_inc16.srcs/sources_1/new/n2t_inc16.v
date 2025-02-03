`timescale 1ns / 1ps

module n2t_inc16(out, in);
    output [15:0] out;
    input  [15:0] in;
    
    reg [15:0] one = 16'b0000000000000001;
    
    n2t_add16 ADD161(out,in,one);
    
endmodule
