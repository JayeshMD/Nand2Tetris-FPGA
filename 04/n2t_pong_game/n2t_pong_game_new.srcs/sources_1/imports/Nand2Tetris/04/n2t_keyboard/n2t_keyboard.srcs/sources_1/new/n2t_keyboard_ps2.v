module n2t_keyboard_ps2(key_code, rx_done_tick, ps2c, ps2d, reset, clk);
    
    output wire [7:0] key_code;  // {0000 0000 kkkk kkkk}, here k is bit from key stroke 
    output wire rx_done_tick;
    
    input ps2c, ps2d, reset, clk;
    
    //////////////////////////////////////////////////////////////////////
    // ps2c is sampkey_code at clk frequency and for neg-edge is detected to 
    // update state of rx_reg.
    //////////////////////////////////////////////////////////////////////
    
    // detect neg pulse
    reg  [7:0] filter_reg; 
    wire [7:0] filter_reg_next;
    reg  ps2c_fil;
    wire ps2c_fil_next;
    wire neg_edge, pos_edge;
    
    always @(posedge clk, posedge reset)
    begin    
        if(reset) 
            begin
            filter_reg <= 8'b0;
            ps2c_fil   <= 1'b0;
            end
        else
            begin
            filter_reg <= filter_reg_next;
            ps2c_fil   <= ps2c_fil_next;
            end
    end                                            
    
    assign filter_reg_next = {ps2c, filter_reg[7:1]};
    
    assign ps2c_fil_next =  (filter_reg==8'b11111111) ? 1'b1:
                           ((filter_reg==8'b00000000) ? 1'b0: ps2c_fil);
    
    assign neg_edge = (( ps2c_fil) & (~ps2c_fil_next));
    assign pos_edge = ((~ps2c_fil) & ( ps2c_fil_next));
    
    ///////////////////////////////////////////////////////////////////////////////////
    // Get ps2d bits.
    ///////////////////////////////////////////////////////////////////////////////////
    
    reg  [10:0] ps2d_reg;
    wire [10:0] ps2d_reg_next;

    always @(posedge clk, posedge reset)
    begin
        if(reset)
            begin
            ps2d_reg <= 11'b0;
            end
        else
            begin
            ps2d_reg <= ps2d_reg_next;
            end
    end 
    
    assign ps2d_reg_next = neg_edge ? {ps2d, ps2d_reg[10:1]} : ps2d_reg;       
    //assign key_code = ps2d_reg[8:1];
    
    ///////////////////////////////////////////////////////////////////////////////////
    // Generate rx_done_tick
    //////////////////////////////////////////////////////////////////////////////////
        
    reg [3:0] count;
    wire [3:0] count_next;
    
    reg rx_tick;
    wire rx_tick_next;
    
    parameter pulses = 4'b1010;
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            begin
            count <= pulses;
            rx_tick <= 1'b1;
            end
        else
            begin
            count <= count_next;
            rx_tick <= rx_tick_next;
            end
    end
    
    assign count_next = pos_edge ? ( (count==pulses) ? 4'b0: (count+1)): count;
    
    assign rx_tick_next = (count==pulses) ? 1'b0: 1'b1; 
    
    assign rx_done_tick = (~rx_tick) & (rx_tick_next);
    
    ///////////////////////////////////////////////////////////////////////////////////
    // Store the number at the end of read (rx_done_tick)
    //////////////////////////////////////////////////////////////////////////////////
    
    reg  [7:0] key_code_reg;
    wire [7:0] key_code_next;
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            key_code_reg <= 8'b0;
        else
            key_code_reg <= key_code_next;
    end
    
    assign key_code_next = rx_done_tick ? ps2d_reg[8:1]: key_code_reg; 
    
    //////////////////////////////////////////////////////////////////////////////////////
    // Store previous key 
    //////////////////////////////////////////////////////////////////////////////////////
    
    reg  [7:0] key_previous;
    wire [7:0] key_previous_next;
    
    always @(posedge clk, posedge reset)
    begin
        if(reset)
            key_previous <= 8'b0;
        else
            key_previous <= key_previous_next;
    end
    
    assign key_previous_next = rx_done_tick ? key_code_reg: key_previous;
    
    //////////////////////////////////////////////////////////////////////////////////////
    // Final output: Show 0 if previous key is E0 otherwise show key_code_reg content
     //////////////////////////////////////////////////////////////////////////////////////
    
    assign key_code = ((key_previous == 8'hF0)|| (key_code_reg==8'hF0) || 
                                                 (key_code_reg==8'hE0)) ? 8'b0:key_code_reg;
    
endmodule
