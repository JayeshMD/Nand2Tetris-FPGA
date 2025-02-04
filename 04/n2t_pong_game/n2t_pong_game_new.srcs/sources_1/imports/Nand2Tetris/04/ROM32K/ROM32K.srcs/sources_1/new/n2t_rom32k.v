module n2t_rom32k(out, address);
    output wire [15:0] out;
    input  wire [15:0] address;
        
    reg [15:0] rom32k [32767:0];
    
    initial
    begin
        $readmemb("n2t_ROM32K.mem", rom32k);         
    end
    assign out = rom32k[address];
    
endmodule
