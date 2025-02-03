`timescale 1ns / 1ps

module n2t_ram512_test();
    reg [15:0] in;
    reg load, clk;
    reg [11:0] address;
    
    wire [15:0] out;
    
    integer i;

    n2t_ram4k RAM4k(out, in, load, address, clk);
    
    initial
    begin
        clk = 1'b0;
        forever #5 clk = !clk;
    end
    
    initial
    begin
        $monitor($time, "in=%d, load=%d, address=%d, out=%d", in, load, address, out);
    end 
    
    initial
    begin
        for(i=0;i<4096; i = i+1) 
        begin
            in <= i+10;       load=1'b1; address<= i; #10;
            in <= 16'd0;   load=1'b0; address<= i; #10;     
        end 
        for(i=0;i<4096; i = i+1) 
        begin
            in <= 16'b0;       load=1'b0; address<= i; #10;     
        end                                           
    end
endmodule
