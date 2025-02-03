`timescale 1ns / 1ps

module n2t_dmux4way_test();
    reg in;
    reg [1:0] sel;
    wire a, b, c, d;
    
    n2t_dmux4way DMUX4way1(a, b, c,d, in, sel);
    
    initial
    begin
        $monitor ($time,"\t in= %b, sel=%b, a=%b, b=%b, c=%b, d=%b", in, sel, a, b, c, d);
    end
    
    initial 
    begin
        in = 1'b0; sel= 2'b00; #10;
        in = 1'b1; sel= 2'b00; #10;
        
        in = 1'b0; sel= 2'b01; #10;
        in = 1'b1; sel= 2'b01; #10;
        
        in = 1'b0; sel= 2'b10; #10;
        in = 1'b1; sel= 2'b10; #10;
        
        in = 1'b0; sel= 2'b11; #10;
        in = 1'b1; sel= 2'b11; #10;
        #10; $finish;
    end
    
endmodule