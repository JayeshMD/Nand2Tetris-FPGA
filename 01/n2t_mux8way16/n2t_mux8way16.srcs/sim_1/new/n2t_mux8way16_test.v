`timescale 1ns / 1ps

module n2t_mux8way16_test();
    reg  [15:0] a, b, c, d, e, f, g, h;
    reg  [2:0]  sel; 
    wire [15:0] out;
    
    n2t_mux8way16 MUX8WAY16(out, a, b, c, d, e, f, g, h, sel);
    
    initial
    begin
        $monitor ($time,"\t a=%b, b=%b, c=%b, d=%b, e=%b, f=%b, g=%b, h=%b, sel=%b, out=%b", a, b, c, d, e, f, g, h, sel, out);
    end
    
    initial 
    begin
        a=16'b0000000000000000; b=16'b0000000011111111; 
        c=16'b0101010101010101; d=16'b1010101010101010; 
        e=16'b1100110011001100; f=16'b0011001100110011;
        g=16'b1111000011110000; h=16'b0000111100001111;
        
        sel= 3'b000;#10;          sel= 3'b001;#10;
        sel= 3'b010;#10;          sel= 3'b011;#10;
        sel= 3'b100;#10;          sel= 3'b101;#10;
        sel= 3'b110;#10;          sel= 3'b111;#10;
    
        #10; $finish;
    end
    
endmodule