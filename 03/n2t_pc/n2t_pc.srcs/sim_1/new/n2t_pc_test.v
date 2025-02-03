`timescale 1ns / 1ps

module n2t_pc_test();
    reg [15:0] in;
    reg load, inc, reset, clk;
    
    wire [15:0] out;

    n2t_pc PC(out, in, load, inc, reset, clk);
    
    initial
    begin
        clk = 1'b0;
        forever #5 clk = !clk;
    end
    
    initial
    begin
        $monitor($time, "in=%d, load=%d, out=%d", in, load, out);
    end 
    
    initial
    begin
        in <= 16'b1010101010101010;    load=1'b1; inc<= 1'b0; reset<=1'b0;#10;
        in <= 16'b1111111111111111;    load=1'b0; inc<= 1'b0; reset<=1'b0;#10;
        in <= 16'b0000000011111111;    load=1'b0; inc<= 1'b0; reset<=1'b0;#10; 
        in <= 16'b0000000011111111;    load=1'b1; inc<= 1'b0; reset<=1'b0;#10;
        in <= 16'b0000000011111111;    load=1'b0; inc<= 1'b0; reset<=1'b0;#10; 
        in <= 16'b0000000011111111;    load=1'b0; inc<= 1'b1; reset<=1'b0;#10; 
        in <= 16'b1010101010101010;    load=1'b1; inc<= 1'b1; reset<=1'b0;#10;                                     
        in <= 16'b1100110011001100;    load=1'b1; inc<= 1'b1; reset<=1'b1;#10;
        in <= 16'b1111000011110000;    load=1'b0; inc<= 1'b1; reset<=1'b1;#10;
        in <= 16'b1111000011110000;    load=1'b1; inc<= 1'b0; reset<=1'b1;#10; 
        in <= 16'b1111000011110000;    load=1'b0; inc<= 1'b1; reset<=1'b0;#10;  
        in <= 16'b1111000011110000;    load=1'b0; inc<= 1'b1; reset<=1'b0;#10;
        in <= 16'b1111000011110000;    load=1'b0; inc<= 1'b1; reset<=1'b0;#10;
        in <= 16'b1111000011110000;    load=1'b1; inc<= 1'b1; reset<=1'b0;#10;
        in <= 16'b1111000011110000;    load=1'b0; inc<= 1'b1; reset<=1'b0;#10;                                           
    end
endmodule
