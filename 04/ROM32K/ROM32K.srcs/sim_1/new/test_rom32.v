`timescale 1ns / 1ps

module test_rom32();
    reg [15:0] address;
    
    wire [15:0] out;
    
    n2t_rom32k ROM32(out, address);
    
    integer i;
    
    initial
    begin
        $monitor($time, " address=%b, out=%b", address, out);
    end 
    
    initial
    begin
        for (i = 0; i < 30; i = i + 1) begin
			address = i; #2;
		end
        
    end
    
endmodule
