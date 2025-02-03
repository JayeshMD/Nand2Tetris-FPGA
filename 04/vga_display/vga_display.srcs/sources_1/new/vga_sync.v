//`timescale 1ns / 1ps

//// Learned from => https://embeddedthoughts.com/2016/07/29/driving-a-vga-monitor-using-an-fpga/

//module vga_sync(x, y, video_on, hsync, vsync, p_tick, reset, clk);

//    output wire [9:0] x, y;  // outputs the current x, y location on the screen
    
//    output wire video_on;    // 0: Means out side the display area, 
//                             // 1: Within dispaly area
                        
//    output wire hsync, vsync; // 0: in video area, 
//                              // hsync = 1: Moving to next line from right to left
//                              // vsync = 1: Moving from lower-right end to top-left 

//    output wire p_tick;       // Each pixel tick corresponding to displaying one pixel
    
//    input wire reset, clk;    // reset==1 : all wires will be set to zero
//                              // clk 100 MHz
                              
//    // Define parameters of the display
//    parameter H_DISPLAY       = 640; // Horizontal display area
//    parameter H_R_BORDER      = 16;  // Horizontal right border
//    parameter H_L_BORDER      = 48;  // Horizontal left border
//    parameter H_RETRACE       = 96;  // Horizontal retrace
//    parameter H_MAX           = H_DISPLAY + H_R_BORDER + H_L_BORDER + H_RETRACE - 1;
//    parameter START_H_RETRACE = H_DISPLAY + H_R_BORDER;
//    parameter END_H_RETRACE   = START_H_RETRACE + H_RETRACE - 1;
    
//    parameter V_DISPLAY       = 480; // Vertical display area
//    parameter V_B_BORDER      = 33 ; // Vertical bottom boder
//    parameter V_T_BORDER      = 10 ; // Vertical top border
//    parameter V_RETRACE       = 2  ; // Vertical retreat
//    parameter V_MAX           = V_DISPLAY + V_B_BORDER + V_T_BORDER + V_RETRACE - 1;
//    parameter START_V_RETRACE = V_DISPLAY + V_B_BORDER;
//    parameter END_V_RETRACE   = START_V_RETRACE + V_RETRACE -1;
    
//    //===================================================================
//    // mod-4 counter to generate 25 MHz signal from input clk of 100 MHz
//    //===================================================================
//    reg  [1:0] pixel_reg; // Counts from 0 to 3 and when equals to 
//                          //zero will be used to tick p_tick
    
//    wire [1:0] pixel_next; // Will be fed back to pixel reg
//    wire pixel_tick;       // will be connected to p_tick;
    
//    always @ (posedge clk or posedge reset)
//    begin
//        if(reset)
//            pixel_reg <=0;
//        else
//            pixel_reg <= pixel_next;
//    end
    
//    assign pixel_next = pixel_reg +1;
//    assign pixel_tick = (pixel_next==0);// pixel_tick will be hing onlyu when pixel_next is zero
    
//    // registers to keep track of pixel locations
//    reg [9:0] v_count_reg, v_count_next, h_count_reg, h_count_next;
    
//    // registers to keep track of hsync and vsync states
//    reg  hsync_reg , vsync_reg;
//    wire hsync_next, vsync_next; 
    
//    always @(posedge clk, posedge reset)
//    begin
//        if(reset)
//            begin
//                hsync_reg   <= 0;
//                vsync_reg   <= 0;
//                h_count_reg <= 0;
//                v_count_reg <= 0;
//             end
//        else
//            begin
//                hsync_reg   <= hsync_next;
//                vsync_reg   <= vsync_next;
//                h_count_reg <= h_count_next;
//                v_count_reg <= v_count_next;
//            end
//    end
    
    
//    // Next ststes of registers
//    always @(*)
//    begin
//        h_count_next = pixel_tick ? (h_count_reg == H_MAX ? 0: h_count_reg+1): h_count_reg;
       
//        v_count_next = pixel_tick ? (v_count_reg == V_MAX ? 0: v_count_reg+1): v_count_reg;
//    end
    
//    assign hsync_next = h_count_reg>= START_H_RETRACE  && h_count_reg<= END_H_RETRACE; 
//    assign vsync_next = v_count_reg>= START_V_RETRACE && v_count_reg<= END_V_RETRACE;
    
//    assign video_on = (h_count_reg < H_DISPLAY) && (v_count_reg < V_DISPLAY);
    
         
//    // output signal 
//    assign hsync = hsync_reg;
//    assign vsync = vsync_reg;
//    assign x = h_count_reg;
//    assign y = v_count_reg;
//    assign p_tick = pixel_tick;
//endmodule


module vga_sync

	(
		input wire clk, reset,
		output wire hsync, vsync, video_on, p_tick,
		output wire [9:0] x, y
	);
	
	// constant declarations for VGA sync parameters
	localparam H_DISPLAY       = 640; // horizontal display area
	localparam H_L_BORDER      =  48; // horizontal left border
	localparam H_R_BORDER      =  16; // horizontal right border
	localparam H_RETRACE       =  96; // horizontal retrace
	localparam H_MAX           = H_DISPLAY + H_L_BORDER + H_R_BORDER + H_RETRACE - 1;
	localparam START_H_RETRACE = H_DISPLAY + H_R_BORDER;
	localparam END_H_RETRACE   = H_DISPLAY + H_R_BORDER + H_RETRACE - 1;
	
	localparam V_DISPLAY       = 480; // vertical display area
	localparam V_T_BORDER      =  10; // vertical top border
	localparam V_B_BORDER      =  33; // vertical bottom border
	localparam V_RETRACE       =   2; // vertical retrace
	localparam V_MAX           = V_DISPLAY + V_T_BORDER + V_B_BORDER + V_RETRACE - 1;
    localparam START_V_RETRACE = V_DISPLAY + V_B_BORDER;
	localparam END_V_RETRACE   = V_DISPLAY + V_B_BORDER + V_RETRACE - 1;
	
	// mod-4 counter to generate 25 MHz pixel tick
	reg [1:0] pixel_reg;
	wire [1:0] pixel_next;
	wire pixel_tick;
	
	always @(posedge clk, posedge reset)
		if(reset)
		  pixel_reg <= 0;
		else
		  pixel_reg <= pixel_next;
	
	assign pixel_next = pixel_reg + 1; // increment pixel_reg 
	
	assign pixel_tick = (pixel_reg == 0); // assert tick 1/4 of the time
	
	// registers to keep track of current pixel location
	reg [9:0] h_count_reg, h_count_next, v_count_reg, v_count_next;
	
	// register to keep track of vsync and hsync signal states
	reg vsync_reg, hsync_reg;
	wire vsync_next, hsync_next;
 
	// infer registers
	always @(posedge clk, posedge reset)
		if(reset)
		    begin
                    v_count_reg <= 0;
                    h_count_reg <= 0;
                    vsync_reg   <= 0;
                    hsync_reg   <= 0;
		    end
		else
		    begin
                    v_count_reg <= v_count_next;
                    h_count_reg <= h_count_next;
                    vsync_reg   <= vsync_next;
                    hsync_reg   <= hsync_next;
		    end
			
	// next-state logic of horizontal vertical sync counters
	always @*
		begin
		h_count_next = pixel_tick ? 
		               h_count_reg == H_MAX ? 0 : h_count_reg + 1
			       : h_count_reg;
		
		v_count_next = pixel_tick && h_count_reg == H_MAX ? 
		               (v_count_reg == V_MAX ? 0 : v_count_reg + 1) 
			       : v_count_reg;
		end
		
        // hsync and vsync are active low signals
        // hsync signal asserted during horizontal retrace
        assign hsync_next = h_count_reg >= START_H_RETRACE
                            && h_count_reg <= END_H_RETRACE;
   
        // vsync signal asserted during vertical retrace
        assign vsync_next = v_count_reg >= START_V_RETRACE 
                            && v_count_reg <= END_V_RETRACE;

        // video only on when pixels are in both horizontal and vertical display region
        assign video_on = (h_count_reg < H_DISPLAY) 
                          && (v_count_reg < V_DISPLAY);

        // output signals
        assign hsync  = hsync_reg;
        assign vsync  = vsync_reg;
        assign x      = h_count_reg;
        assign y      = v_count_reg;
        assign p_tick = pixel_tick;
endmodule