module n2t_computer(hsync, vsync, rgb, LED, sw, ps2c, ps2d, reset, clk);
    output hsync, vsync;
    output [11:0] rgb;
    output [11:0] LED;
    
    input [11:0] sw;
    input ps2c, ps2d, reset, clk; 

    wire [15:0] instruction, pc, outM, inM;
    wire [14:0] addressM;
    wire writeM;
    
    //
    
    
    assign LED = rgb;
    
    n2t_rom32k ROM32K(.out(instruction), .address(pc));
    
    
    n2t_cpu CPU(.outM(outM), .writeM(writeM)           , .addressM(addressM), .pc(pc), 
                .inM(inM),   .instruction(instruction), .reset(reset),       .clk(clk));
    
    n2t_memory MEMORY(.out(inM)    , .hsync(hsync)     , .vsync(vsync), .rgb(rgb)    , .in(outM), 
                      .load(writeM), .address(addressM), .sw(sw)      , .ps2c(ps2c)  , .ps2d(ps2d),          
                      .reset(reset), .clk(clk));
    
endmodule
