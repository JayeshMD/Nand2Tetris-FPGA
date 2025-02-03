`timescale 1ns / 1ps

module n2t_cpu_test();
    reg [15:0] inM, instruction; 
    reg reset, clk;
   

    wire [15:0] outM; 
    wire writeM;
    wire [14:0] addressM, pc;
    
    n2t_cpu CPU(outM, writeM, addressM, pc, inM, instruction, reset, clk);
    
    initial
    begin
        clk = 1'b0;
        forever #1 clk = !clk;
    end
    
    initial
    begin
        $monitor($time, "inM=%h, instruction=%h, reset=%h, outM=%h, writeM=%h, addressM=%h, pc=%h",
                         inM   , instruction   , reset   , outM   , writeM   , addressM   , pc);
    end 
    
    
    initial
    begin
    reset = 1'b1; #2;
    
    inM = 16'b0; reset = 1'b0;   
    instruction =16'b0011000000111001;#2; // @12345

    instruction =16'b1110110000010000;#2; // D=A

    instruction =16'b0101101110100000;#2; // @23456

    instruction =16'b1110000111110000;#2; // AD=A-D

    instruction =16'b0000001111101011;#2; // @1003

    instruction =16'b1110001100001000;#2; // M=D

    instruction =16'b0000001111101100;#2; // @1004

    instruction =16'b1110001110011000;#2; // MD=D-1

    instruction =16'b0000001111101000;#2; // @1000

    instruction =16'b1111010011110000;    // AD=D-M
    inM =16'd11111;#2;

    instruction =16'b0000000000001110;#2; // @14

    instruction =16'b1110001100000100;#2; // D;jlt

    instruction =16'b0000001111100111;#2; // @999

    instruction =16'b1111110111100000;#2; // A=M+1

    instruction =16'b1110001100101000;#2; // AM=D

    instruction =16'b0000000000010101;#2; // @21

    instruction =16'b1110011111000010;#2; // D+1;jeq

    instruction =16'b0000000000000010;#2; // @2

    instruction =16'b1110000010111000;#2; // AMD=D+A

    instruction =16'b1111110111001000;#2; // M=M+1

    instruction =16'b1111110010101000;#2; // AM=M-1

    instruction =16'b0000001111101000;#2; // @1000

    instruction =16'b1110111010010000;#2; // D=-1

    instruction =16'b1110001100000001;#2; // D;JGT

    instruction =16'b1110001100000010;#2; // D;JEQ

    instruction =16'b1110001100000011;#2; // D;JGE

    instruction =16'b1110001100000100;#2; // D;JLT

    instruction =16'b1110001100000101;#2; // D;JNE

    instruction =16'b1110001100000110;#2; // D;JLE

    instruction =16'b1110001100000111;#2; // D;JMP

    instruction =16'b1110101010010000;#2; // D=0

    instruction =16'b1110001100000001;#2; // D;JGT

    instruction =16'b1110001100000010;#2; // D;JEQ

    instruction =16'b1110001100000011;#2; // D;JGE

    instruction =16'b1110001100000100;#2; // D;JLT

    instruction =16'b1110001100000101;#2; // D;JNE

    instruction =16'b1110001100000110;#2; // D;JLE

    instruction =16'b1110001100000111;#2; // D;JMP

    instruction =16'b1110111111010000;#2; // D=1

    instruction =16'b1110001100000001;#2; // D;JGT

    instruction =16'b1110001100000010;#2; // D;JEQ

    instruction =16'b1110001100000011;#2; // D;JGE

    instruction =16'b1110001100000100;#2; // D;JLT

    instruction =16'b1110001100000101;#2; // D;JNE

    instruction =16'b1110001100000110;#2; // D;JLE

    instruction =16'b1110001100000111;#2; // D;JMP

    reset =1'b1;#2;

    instruction =16'b0111111111111111; // @32767
    reset=1'b0;#2;

    end

endmodule
