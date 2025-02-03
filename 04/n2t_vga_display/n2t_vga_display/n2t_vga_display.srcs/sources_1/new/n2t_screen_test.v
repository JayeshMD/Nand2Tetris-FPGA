module n2t_screen_test(LED, hsync, vsync, rgb, sw, reset, clk);
    output wire [15:0] LED;
    output wire hsync, vsync;
    output wire [11:0] rgb;
    input  wire [11:0] sw;
    input  wire reset, clk;
    
    wire [15:0] in, out; 
    reg  [15:0]in_next;
    wire load;
    wire [12:0] address, address_next;
    
    
    
    reg [15:0] in_reg;
    reg [12:0] address_reg;
    
    
    n2t_screen SCREEN (.out(out),   .hsync(hsync),     .vsync(vsync), .rgb(rgb),     .in(in), 
                       .load(load), .address(address), .sw(sw),       .reset(reset), .clk(clk));
         
    assign LED = out;//{3'b000, address};    // Test the signal on LED
                
    assign in = in_reg;
    assign load = 1'b1;
    assign address = address_reg;
    assign address_next = address_reg + 1;

    
    always@(*)
    begin
//        case((address_next%32==0) & (address_next<4000))
//            13'd1: in_next <= 16'h0001;
//            default: in_next <= 16'hffff;
//        endcase
        in_next= address_next;   
    end 
    
    //assign in_next = (address_next <2) ? 16'b1010101010101001: 16'b0;//1111111111111111;
    
    always @(posedge clk)
    begin
        address_reg <=  address_next;
        in_reg      <=  in_next;
    end
    
endmodule
