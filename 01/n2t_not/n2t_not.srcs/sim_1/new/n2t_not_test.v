`timescale 1ns / 1ps

module n2t_not_test();
    reg in;
    wire out;
    
    n2t_not NOT1(out, in);
    
    initial
    begin
        $monitor ($time,"\t in=%b, out=%b", in, out);
    end
    
    initial 
    begin
        in=1'b0; #10;
        in=1'b1; #10;
        #10; $finish;
    end
    
endmodule
