`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2023 11:38:57 AM
// Design Name: 
// Module Name: n2t_mux16
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module n2t_mux16(out, a,b,sel);
    output [15:0] out;
    input  [15:0] a,b;
    input sel;
    
    wire [15:0] s0;
    wire [15:0] ns0, w1, w2;
    
    
    assign s0 = {sel,sel,sel,sel,sel,sel,sel,sel,sel,sel,sel,sel,sel,sel,sel,sel};
    
    
    n2t_not16 NOT1(ns0, s0);
    
    n2t_and16 AND1( w1, ns0,  a);
    n2t_and16 AND2( w2,  s0,  b);
    n2t_or16  OR1 ( out,   w1, w2);
endmodule
