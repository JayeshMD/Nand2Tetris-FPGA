//`timescale 1ns / 1ps

//module vga_test(hsync, vsync, rgb, sw, reset, clk);
//    output hsync, vsync;
//    output wire [11:0] rgb;
//    input  wire [11:0] sw;
//    input  wire reset, clk;
    
//    reg [11:0] rgb_reg;
    
//    wire video_on;
    
//    vga_sync VGA_SYNC_UNIT(.x(), .y(), .video_on(video_on), .hsync(hsync), .vsync(vsync), .p_tick(), .reset(reset), .clk(clk));
    
//    always @(posedge clk, posedge reset)
//    begin
//        if(reset)
//            rgb_reg <= 0;
//        else
//            rgb_reg <= sw;
//    end
    
//    assign rgb = video_on ? rgb_reg : 12'b0;
    
//endmodule

module vga_test
	(
		input wire clk, reset,
		input wire [11:0] sw,
		output wire hsync, vsync,
		output wire [11:0] rgb
	);
	
	// register for Basys 2 8-bit RGB DAC 
	reg [11:0] rgb_reg;
	wire [9:0] x,y;
	reg  [9:0] size;
	
	always @(posedge reset, posedge vsync)
	begin
	   if(reset)
	       size <= 0;
	   else
	       size <= size+5;
	end
	// video status output from vga_sync to tell when to route out rgb signal to DAC
	wire video_on;

        // instantiate vga_sync
        vga_sync vga_sync_unit (.clk(clk), .reset(reset), .hsync(hsync), .vsync(vsync),
                                .video_on(video_on), .p_tick(), .x(x), .y(y));
   
        // rgb buffer
        always @(posedge clk, posedge reset)
        if (reset)
            rgb_reg <= 0;
        else
            rgb_reg <= sw;
        
        // output
        //assign rgb = (video_on && (x==0) && (y==0)) ? rgb_reg : 12'b0;
        //assign rgb = (video_on) ? rgb_reg : 12'b0;
        assign rgb = (video_on && (x<50) && (y<50)) ? rgb_reg : 12'b0;
        //assign rgb = (video_on && (x<size) && (y<size)) ? rgb_reg : 12'b0;
        //assign rgb = (video_on && ((x%10==0) || (y%10==0))) ? rgb_reg : 12'b0;
endmodule