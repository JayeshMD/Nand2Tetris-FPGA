module n2t_screen(out, hsync, vsync, rgb, in, load, address, sw, reset, clk);
    output wire [15:0] out;  // nand2tetris std
    output wire hsync, vsync;
    output wire [11:0] rgb;
    
    input  wire [15:0] in;
    input  wire load;
    input  wire [12:0] address;
    input  wire [11:0] sw;
    input  wire reset, clk;
    
    wire video_on;
    wire [9:0] x,y;
    
    // 8192 ~ 8KRAM
    reg [15:0] screen_memory [8191:0];
    
    wire [12:0] mem_idx;         
    wire [3:0]  bit_idx;
    wire [15:0] current_screen_memory;
    wire on_small_screen;
           
    wire p_tick;
    
    always @(posedge clk)
    begin
        if (load)
            screen_memory[address] <= in;   
    end
    
    assign out = screen_memory[address];
    
    //
    
    
    n2t_vga_controller VGA_CONTROLLER(.hsync(hsync), .vsync(vsync), .video_on(video_on), .x(x), .y(y), 
                                      .p_tick(p_tick), .reset(reset), .clk(clk));
                                      
    assign on_small_screen = (x>=64) && (x<=575) && (y>=112) && (y<=367);
    
    
    //assign  mem_idx_next = (on_small_screen && bit_idx == 4'b1111) ? mem_idx + 1: mem_idx;
    assign mem_idx               = ((y-112)*32) + ((x-64)/16);
    assign bit_idx               = x%16;   
    assign current_screen_memory = screen_memory[mem_idx];  
    
                  
    assign rgb = (video_on && on_small_screen && (current_screen_memory[bit_idx]==1'b1))? 
                 sw: 12'b0;// colorful 
     
endmodule
