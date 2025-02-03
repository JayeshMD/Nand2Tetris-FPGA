module n2t_vga_controller(hsync, vsync, video_on, x, y, p_tick, reset, clk);
    
    output wire hsync, vsync;
    output wire video_on;
    output wire [9:0] x, y;
    output wire p_tick;
    input  wire reset, clk;
    
    // Display parameter
    parameter H_DISPLAY       = 640;
    parameter H_R_BLIND       = 16;
    parameter H_RETRACE       = 96;
    parameter H_L_BLIND       = 48;
    parameter H_RETRACE_START = H_DISPLAY + H_R_BLIND ;
    parameter H_RETRACE_END   = H_DISPLAY + H_R_BLIND + H_RETRACE - 1;
    parameter H_MAX           = H_DISPLAY + H_R_BLIND + H_RETRACE + H_L_BLIND - 1;
    
    parameter V_DISPLAY       = 480;
    parameter V_B_BLIND       = 33;
    parameter V_RETRACE       = 2;
    parameter V_T_BLIND       = 10;
    parameter V_RETRACE_START = V_DISPLAY + V_B_BLIND;
    parameter V_RETRACE_END   = V_DISPLAY + V_B_BLIND + V_RETRACE - 1;
    parameter V_MAX           = V_DISPLAY + V_B_BLIND + V_RETRACE + V_T_BLIND - 1;
    
    // Generate p_tick at 25 MHz using clk is 100MHz
    reg [1:0] clk_count;
    wire [1:0] clk_count_next;
    wire pixel_tick;
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            clk_count <=0;
        else
            clk_count <= clk_count_next;
    end
    
    assign clk_count_next = clk_count + 1;
    
    assign pixel_tick = (clk_count==0);
    
    // Keep track of current location max(H_max, V_MAX) = 800, i.e. log_2(800)~9.64 => 10 bits
    reg [9:0] h, v; 
    wire [9:0] h_next, v_next;
    reg  hsync_reg,  vsync_reg; 
    wire hsync_next, vsync_next, is_video;
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            begin
                h <= 0;
                v <= 0;
                hsync_reg <=0;
                vsync_reg <=0;    
            end
        else
            begin
                h <= h_next;
                v <= v_next;
                hsync_reg <= hsync_next;
                vsync_reg <= vsync_next;
            end
    end
    
    
    assign h_next =  pixel_tick                 ?(h==H_MAX ? 0: (h+1)): h;
    assign v_next = (pixel_tick && (h == H_MAX))?(v==V_MAX ? 0: (v+1)): v; 
    assign hsync_next = (h>=H_RETRACE_START) && (h<=H_RETRACE_END);
    assign vsync_next = (v>=V_RETRACE_START) && (v<=V_RETRACE_END);
    
    assign is_video = (h< H_DISPLAY) && (v<V_DISPLAY);
    
    // Output 
    assign hsync  = hsync_reg;
    assign vsync  = vsync_reg;
    assign p_tick = pixel_tick;
    assign video_on = is_video;
    
    assign x = h;
    assign y = v; 
    
endmodule
