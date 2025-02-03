`timescale 1ns / 1ps

module n2t_inc16_test();
    reg  [15:0]  in;
    wire [15:0] out;
    
    n2t_inc16 INC1(out, in);
    
    initial
    begin
        $monitor ($time, " in=%b, out=%b", in, out);
    end
    
    initial
    begin
        in=16'b0000000000000000; #100;
        in=16'b0000000011111111; #100;
        in=16'b1010101010101010; #100;
        in=16'b1111111111111111; #100;
    end    
endmodule