`timescale 1ns / 1ps

module n2t_mux_test();
    reg a, b, sel;
    wire out;
    
    n2t_mux MUX1(out, a, b, sel);
    
    initial
    begin
        $monitor ($time,"\t a=%b, b=%b, sel=%b, out=%b", a, b, sel, out);
    end
    
    initial 
    begin
        a=1'b0; b=1'b0; sel= 1'b0; #10;
        a=1'b0; b=1'b1; sel= 1'b0; #10;
        a=1'b1; b=1'b0; sel= 1'b0; #10;
        a=1'b1; b=1'b1; sel= 1'b0; #10;
        a=1'b0; b=1'b0; sel= 1'b1; #10;
        a=1'b0; b=1'b1; sel= 1'b1; #10;
        a=1'b1; b=1'b0; sel= 1'b1; #10;
        a=1'b1; b=1'b1; sel= 1'b1; #10;     
        #10; $finish;
    end
    
endmodule