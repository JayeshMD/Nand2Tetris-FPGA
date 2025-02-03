`timescale 1ns / 1ps

module n2t_dmux_test();
    reg in, sel;
    wire a, b;
    
    n2t_dmux DMUX1(a, b, in, sel);
    
    initial
    begin
        $monitor ($time,"\t in= %b, sel=%b, a=%b, b=%b", in, sel, a, b);
    end
    
    initial 
    begin
        in = 1'b0; sel= 1'b0; #10;
        in = 1'b1; sel= 1'b0; #10;
        in = 1'b0; sel= 1'b1; #10;
        in = 1'b1; sel= 1'b1; #10;
        #10; $finish;
    end
    
endmodule