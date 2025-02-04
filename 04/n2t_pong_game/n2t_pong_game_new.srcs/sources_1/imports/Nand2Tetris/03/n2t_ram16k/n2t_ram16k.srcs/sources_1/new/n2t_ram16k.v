module n2t_ram16k(out, in, load, address, clk);
    output [15:0] out;
    input  [15:0] in;
    input  [13:0]  address;
    input  load, clk;
    
    reg [15:0] ram_memory [16383:0];
    
    always @(posedge clk)
    begin
        if (load)
            ram_memory[address] <= in;   
    end
    
    
    assign out = ram_memory[address];
    
    
//// This implementation is not possible on basys 3 fpga 
//    wire a,b,c,d;
//    wire [15:0] out1, out2, out3, out4;
    
//    n2t_dmux4way DMUX4WAY(a,b,c,d, load, address[13:12]);
    
//    n2t_ram4k RAM4k1(out1, in , a, address[11:0],clk);
//    n2t_ram4k RAM4k2(out2, in , b, address[11:0],clk);
//    n2t_ram4k RAM4k3(out3, in , c, address[11:0],clk);
//    n2t_ram4k RAM4k4(out4, in , d, address[11:0],clk);
    
//    n2t_mux4way16 MUX4WAY16(out, out1, out2, out3, out4, address[13:12]);
    
endmodule