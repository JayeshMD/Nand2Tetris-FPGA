`timescale 1ns / 1ps

module n2t_dmux8way_test();
    reg in;
    reg [2:0] sel;
    wire a, b, c, d,e,f,g,h;
    
    n2t_dmux8way DMUX8way1(a, b, c,d,e,f,g,h, in, sel);
    
    initial
    begin
        $monitor ($time,"\t in= %b, sel=%b, a=%b, b=%b, c=%b, d=%b,e=%b,f=%b,g=%b,h=%b", in, sel, a, b, c, d,e,f,g,h);
    end
    
    initial 
    begin
        in = 1'b0; sel= 3'b000; #10;
        in = 1'b1; sel= 3'b000; #10;
        
        in = 1'b0; sel= 3'b001; #10;
        in = 1'b1; sel= 3'b001; #10;
        
        in = 1'b0; sel= 3'b010; #10;
        in = 1'b1; sel= 3'b010; #10;
        
        in = 1'b0; sel= 3'b011; #10;
        in = 1'b1; sel= 3'b011; #10;
        
        in = 1'b0; sel= 3'b100; #10;
        in = 1'b1; sel= 3'b100; #10;
        
        in = 1'b0; sel= 3'b101; #10;
        in = 1'b1; sel= 3'b101; #10;
        
        in = 1'b0; sel= 3'b110; #10;
        in = 1'b1; sel= 3'b110; #10;
        
        in = 1'b0; sel= 3'b111; #10;
        in = 1'b1; sel= 3'b111; #10;
        #10; $finish;
    end
    
endmodule