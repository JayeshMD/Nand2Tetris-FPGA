`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/04/2023 08:05:27 PM
// Design Name: 
// Module Name: n2t_mux8way16
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


module n2t_mux8way16(out, a, b, c, d, e, f, g, h, sel);
    output [15:0] out;
    input  [15:0] a, b, c, d, e, f, g, h;
    input  [2:0] sel;
    
    wire [15:0] w1, w2;
    
    n2t_mux4way16 MUX4WAY161(w1, a, b, c, d, sel[1:0]);
    n2t_mux4way16 MUX4WAY162(w2, e, f, g, h, sel[1:0]);
    
    n2t_mux16 MUX161(out, w1, w2, sel[2]);
    
endmodule
