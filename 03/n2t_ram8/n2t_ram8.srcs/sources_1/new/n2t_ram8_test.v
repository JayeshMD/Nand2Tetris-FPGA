`timescale 1ns / 1ps

module n2t_ram8_test();
    reg [15:0] in;
    reg load, clk;
    reg [2:0] address;
    
    wire [15:0] out;
    
    n2t_ram8 RAM8(out, in, load, address, clk);
    
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
        in = 16'b0000000000000000; load=1; address = 3'b000;#10;
        in = 16'b1111111111111111; load=0; address = 3'b000;#10;
        in = 16'b0000000000000001; load=1; address = 3'b001;#10;
        in = 16'b1111111111111111; load=0; address = 3'b001;#10;
        in = 16'b0000000000000010; load=1; address = 3'b010;#10;
        in = 16'b1111111111111111; load=0; address = 3'b010;#10;
        in = 16'b0000000000000100; load=1; address = 3'b011;#10;
        in = 16'b1111111111111111; load=0; address = 3'b011;#10;            
        in = 16'b0000000000001000; load=1; address = 3'b100;#10;
        in = 16'b1111111111111111; load=0; address = 3'b100;#10;
        in = 16'b0000000000010000; load=1; address = 3'b101;#10;
        in = 16'b1111111111111111; load=0; address = 3'b101;#10;
        in = 16'b0000000000100000; load=1; address = 3'b110;#10;
        in = 16'b1111111111111111; load=0; address = 3'b110;#10;             
        in = 16'b0000000001000000; load=1; address = 3'b111;#10;
        in = 16'b1111111111111111; load=0; address = 3'b111;#10;
        in = 16'b0000000010000000; load=1; address = 3'b000;#10;
        in = 16'b1111111111111111; load=0; address = 3'b000;#10;               
        in = 16'b0000000100000000; load=1; address = 3'b001;#10;
        in = 16'b1111111111111111; load=0; address = 3'b001;#10;
        in = 16'b0000001000000000; load=1; address = 3'b010;#10;
        in = 16'b1111111111111111; load=0; address = 3'b010;#10;
        in = 16'b0000010000000000; load=1; address = 3'b011;#10;
        in = 16'b1111111111111111; load=0; address = 3'b011;#10;
        in = 16'b0000100000000000; load=1; address = 3'b100;#10;
        in = 16'b1111111111111111; load=0; address = 3'b100;#10;       
        in = 16'b0001000000000000; load=1; address = 3'b101;#10;
        in = 16'b1111111111111111; load=0; address = 3'b101;#10;
        in = 16'b0010000000000000; load=1; address = 3'b110;#10;
        in = 16'b1111111111111111; load=0; address = 3'b110;#10;
        in = 16'b0100000000000000; load=1; address = 3'b111;#10;
        in = 16'b1111111111111111; load=0; address = 3'b111;#10;
        in = 16'b1111111111111111; load=0; address = 3'b000;#10;               
        in = 16'b1111111111111111; load=0; address = 3'b001;#10;
        in = 16'b1111111111111111; load=0; address = 3'b010;#10;
        in = 16'b1111111111111111; load=0; address = 3'b011;#10;
        in = 16'b1111111111111111; load=0; address = 3'b100;#10;
        in = 16'b1111111111111111; load=0; address = 3'b101;#10;
        in = 16'b1111111111111111; load=0; address = 3'b110;#10;
        in = 16'b1111111111111111; load=0; address = 3'b111;#10;                                                            
    end
endmodule
