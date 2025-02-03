`timescale 1ns / 1ps

module n2t_or8way_test();
    reg [7:0] a;
    wire out;
    
    n2t_or8way OR8WAY1(out, a);
    
    initial
    begin
        $monitor ($time,"\t a=%b, out=%b", a, out);
    end
    
    initial 
    begin
        a=8'b00000000; #10;
        a=8'b01010010; #10;
        a=8'b00011111; #10;
        a=8'b11100011; #10;
        #10; $finish;
    end
    
endmodule