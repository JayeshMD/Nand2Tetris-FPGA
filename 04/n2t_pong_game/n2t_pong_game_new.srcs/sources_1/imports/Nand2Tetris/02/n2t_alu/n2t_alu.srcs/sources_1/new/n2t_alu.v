`timescale 1ns / 1ps

// Implementation: the ALU logic manipulates the x and y inputs
// and operates on the resulting values, as follows:
// if (zx == 1) set x = 0        // 16-bit constant
// if (nx == 1) set x = !x       // bitwise not
// if (zy == 1) set y = 0        // 16-bit constant
// if (ny == 1) set y = !y       // bitwise not
// if (f == 1)  set out = x + y  // integer 2's complement addition
// if (f == 0)  set out = x & y  // bitwise and
// if (no == 1) set out = !out   // bitwise not
// if (out == 0) set zr = 1
// if (out < 0) set ng = 1

module n2t_alu(out, zr, ng, x, y, zx, nx, zy, ny, f, no);

    output [15:0] out;
    output zr, ng;
    
    input [15:0] x, y;
    
    input zx, nx, zy, ny, f, no;
    
    reg [15:0] zero= 16'b0000000000000000;
    
    
    wire [15:0] wzx, wzy, nx0, nx1, ny0, ny1, wnx, wny, f0, f1, wf0, wf1;
    wire nzr0, nzr1, nzr;
    
    n2t_mux16 MUX161(nx0, x, zero, zx); 
    n2t_mux16 MUX162(ny0, y, zero, zy);
    
    n2t_not16 NOT161(nx1, nx0);
    n2t_not16 NOT162(ny1, ny0);
    
    n2t_mux16 MUX163(wnx, nx0, nx1, nx);
    n2t_mux16 MUX164(wny, ny0, ny1, ny);
    
    n2t_and16 AND161(f0, wnx, wny);
    n2t_add16 ADD161(f1, wnx, wny);
    
    n2t_mux16 MUX165(wf0, f0, f1, f);   
    
    n2t_not16 NOT163(wf1, wf0);
    
    n2t_mux16 MUX166(out, wf0, wf1, no);
    
    n2t_or8way OR161(nzr0, out[7:0]);
    n2t_or8way OR162(nzr1, out[15:8]);
    
    or(nzr, nzr0, nzr1);
    
    not(zr, nzr);
    
    assign ng = out[15];
        
endmodule
