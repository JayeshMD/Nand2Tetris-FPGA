`timescale 1ns / 1ps

module test_memory();

    wire hsync, vsync;
    wire [11:0] rgb;
    
    reg [11:0] sw;
    reg reset, clk;
    
    wire [15:0] out;
    reg  [15:0] in;
    reg  [15:0] in_next;
    reg load, ps2c, ps2d;
    reg [14:0] address;
    wire [14:0] address_next;
    
    initial
    begin
        clk = 1'b0;
        forever #1 clk = !clk;
    end
     
    n2t_memory MEMORY(.out(out), .hsync(hsync), .vsync(vsync), 
                      .rgb(rgb), .in(in), .load(load), .address(address), .sw(sw), 
                      .ps2c(ps2c), .ps2d(ps2d), .reset(reset), .clk(clk));
    
    
    assign address_next = address + 1;
    
    always@(*)
    begin
        case((address_next%32) & (address_next>16383))
            13'h0: in_next <= 16'hffff;
            13'h1: in_next <= 16'h0000;
            default: in_next <= 16'h0000;
    endcase   
    end 
    
    always @(posedge clk, posedge reset)
    begin
        if (reset)
            begin
            address <= 15'h3fff;
            end
        else
            begin
            address <=  address_next;
            in  <=  in_next;
            ps2c <= 1'b1;
            ps2d <= 1'b1;
            load <= 1'b1;
            sw <= 12'b111100001111;
            end
    end
    
    initial
    begin
        reset = 1; #1;
        reset = 0;
    end
    
endmodule
