`timescale 1ns / 1ps

module n2t_pc(out, in, load, inc, reset, clk);
    output [15:0] out;
    input  [15:0] in;
    input  load, inc, reset, clk;
    
    wire [15:0] inc_in, o1, o2, o3;
    
    reg [15:0] zero = 16'b0;
    reg true = 1'b1;
    
    
    n2t_inc16 INC16(inc_in, out);
    
    n2t_mux16 MUX161(o1, out, inc_in, inc );
    n2t_mux16 MUX162(o2,  o1, in    , load);
    n2t_mux16 MUX163(o3,  o2, zero  , reset);
    
    n2t_register REGISTER(out, o3 , true, clk);
    
endmodule
