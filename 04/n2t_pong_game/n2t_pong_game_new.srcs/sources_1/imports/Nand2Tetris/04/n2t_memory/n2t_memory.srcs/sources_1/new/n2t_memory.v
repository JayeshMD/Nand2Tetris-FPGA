`timescale 1ns / 1ps

module n2t_memory(out, hsync, vsync, rgb, in, load, address, sw, ps2c, ps2d, reset, clk);
    output wire [15:0] out;
    output wire hsync, vsync;
    output wire [11:0] rgb;
    
    
    input wire [15:0] in;
    input wire ps2c, ps2d,  load, reset, clk;
    input wire [11:0] sw; 
    input wire [14:0] address;
    
    //                                   __________
    // Memory => 15'b 000 0000 0000 0000 |        |
    //                                   |  RAM   |
    //                                   |        |
    //           15'b 011 1111 1111 1111 |________|
    //           15'b 100 0000 0000 0000 |        |
    //                                   | Screen |
    //           15'b 101 1111 1111 1111 |________|
    //           15'b 110 0000 0000 0000 |Keyboard|
    //                                   ----------
    
    // Internal wires
    wire [15:0] ram_out, scr_out, key_out, peri_out;
    wire loadRAM, loadPERI,loadSCR, loadKEY;           // loadKEY is dummy. Hence unused.
    
    n2t_dmux DMUX1(loadRAM, loadPERI, load    , address[14]); 
    n2t_dmux DMUX2(loadSCR, loadKEY,  loadPERI, address[13]);
    
    n2t_ram16k  RAM16K(.out(ram_out), .in(in), .load(loadRAM), .address(address[13:0]), .clk(clk));
    
    n2t_screen  SCREEN(.out(scr_out), .hsync(hsync)  , .vsync(vsync), .rgb(rgb), 
                       .in(in)      , .load(loadSCR) , .address(address[12:0]), 
                       .sw(sw)      , .reset(reset)  , .clk(clk));
    
    n2t_keyboard KEYBOARD(.ascii_code(key_out), .ps2c(ps2c), .ps2d(ps2d), 
                          .reset(reset)       , .clk(clk));
   
   
    n2t_mux16 MUX161(.out(peri_out), .a(scr_out), .b(key_out),  .sel(address[13]));
    n2t_mux16 MUX162(.out(out)     , .a(ram_out), .b(peri_out), .sel(address[14]));    
    
endmodule
