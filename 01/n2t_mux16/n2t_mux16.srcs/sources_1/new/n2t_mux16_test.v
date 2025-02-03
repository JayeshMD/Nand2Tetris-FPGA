`timescale 1ns / 1ps

module n2t_mux16_test();
    reg  [15:0] a, b;
    reg  sel;
    wire [15:0] out;
    
    n2t_mux16 MUX16(out, a, b, sel);
    
    initial
    begin
        $monitor ($time,"\t a=%b, b=%b, sel=%b, out=%b", a, b, sel, out);
    end
    
    initial 
    begin
        a=16'b0000000000000000; b=16'b0000000000000000; sel= 1'b0;#10;
        a=16'b0101010101010101; b=16'b0000000000000000; sel= 1'b0;#10;
        a=16'b1010101010101010; b=16'b0000000000000000; sel= 1'b0;#10;
        a=16'b1111111100000000; b=16'b0000000000000000; sel= 1'b0;#10;
        a=16'b0000000011111111; b=16'b0000000000000000; sel= 1'b0;#10;
        a=16'b1111000011110000; b=16'b0000000000000000; sel= 1'b0;#10;
        a=16'b0000111100001111; b=16'b0000000000000000; sel= 1'b0;#10;
        a=16'b1111111111111111; b=16'b0000000000000000; sel= 1'b0;#10;
        a=16'b0000000000000000; b=16'b1111111111111111; sel= 1'b1;#10;
        a=16'b0101010101010101; b=16'b1111111111111111; sel= 1'b1;#10;#10;
        a=16'b1010101010101010; b=16'b1111111111111111; sel= 1'b1;#10;#10;
        a=16'b1111111100000000; b=16'b1111111111111111; sel= 1'b1;#10;#10;
        a=16'b0000000011111111; b=16'b1111111111111111; sel= 1'b1;#10;#10;
        a=16'b1111000011110000; b=16'b1111111111111111; sel= 1'b1;#10;#10;
        a=16'b0000111100001111; b=16'b1111111111111111; sel= 1'b1;#10;#10;
        a=16'b1111111111111111; b=16'b1111111111111111; sel= 1'b1;#10;#10;
        a=16'b1010101010101010; b=16'b0101010101010101; sel= 1'b1;#10;#10;  
        #10; $finish;
    end
    
endmodule