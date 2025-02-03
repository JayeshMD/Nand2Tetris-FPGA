`timescale 1ns / 1ps

module n2t_alu_test();
    reg [15:0] x,y;
    reg zx, nx, zy, ny, f, no;
    
    wire [15:0] out;
    wire zr, ng;
    
    n2t_alu ALU(out, zr, ng, x, y, zx, nx, zy, ny, f, no);
    
    initial
    begin
        $monitor ($time, "x=%b, y=%b, zx=%b, nx=%b, zy=%b, ny=%b, f=%b. no=%b ,out=%b, zr=%b, ng=%b", x, y, zx, nx, zy, ny, f, no, out, zr, ng);
    end
    
    initial
    begin
        x = 16'b0000000000000000;  // x = 0
        y = 16'b1111111111111111;  // y = -1

        // Compute 0
        zx =1'b1;
        nx =1'b0;
        zy =1'b1;
        ny =1'b0;
        f  =1'b1;
        no =1'b0;#10;

// Compute 1
        zx =1'b1;
        nx =1'b1;
        zy =1'b1;
        ny =1'b1;
        f  =1'b1;
        no =1'b1;#10;

// Compute -1
        zx =1'b1;
        nx =1'b1;
        zy =1'b1;
        ny =1'b0;
        f  =1'b1;
        no =1'b0;#10;

// Compute x
        zx =1'b0;
        nx =1'b0;
        zy =1'b1;
        ny =1'b1;
        f  =1'b0;
        no =1'b0;#10;

// Compute y
        zx =1'b1;
        nx =1'b1;
        zy =1'b0;
        ny =1'b0;
        f  =1'b0;
        no =1'b0;#10;

// Compute !x
        zx =1'b0;
        nx =1'b0;
        zy =1'b1;
        ny =1'b1;
        f  =1'b0;
        no =1'b1;#10;

// Compute !y
        zx =1'b1;
        nx =1'b1;
        zy =1'b0;
        ny =1'b0;
        f  =1'b0;
        no =1'b1;#10;

// Compute -x
        zx =1'b0;
        nx =1'b0;
        zy =1'b1;
        ny =1'b1;
        f  =1'b1;
        no =1'b1;#10;

// Compute -y
        zx =1'b1;
        nx =1'b1;
        zy =1'b0;
        ny =1'b0;
        f  =1'b1;
        no =1'b1;#10;

// Compute x + 1
        zx =1'b0;
        nx =1'b1;
        zy =1'b1;
        ny =1'b1;
        f  =1'b1;
        no =1'b1;#10;

// Compute y + 1
        zx =1'b1;
        nx =1'b1;
        zy =1'b0;
        ny =1'b1;
        f  =1'b1;
        no =1'b1;#10;

// Compute x - 1
        zx =1'b0;
        nx =1'b0;
        zy =1'b1;
        ny =1'b1;
        f  =1'b1;
        no =1'b0;#10;

// Compute y - 1
        zx =1'b1;
        nx =1'b1;
        zy =1'b0;
        ny =1'b0;
        f  =1'b1;
        no =1'b0;#10;

// Compute x + y
        zx =1'b0;
        nx =1'b0;
        zy =1'b0;
        ny =1'b0;
        f  =1'b1;
        no =1'b0;#10;

// Compute x - y
        zx =1'b0;
        nx =1'b1;
        zy =1'b0;
        ny =1'b0;
        f  =1'b1;
        no =1'b1;#10;

// Compute y - x
        zx =1'b0;
        nx =1'b0;
        zy =1'b0;
        ny =1'b1;
        f  =1'b1;
        no =1'b1;#10;

// Compute x & y
        zx =1'b0;
        nx =1'b0;
        zy =1'b0;
        ny =1'b0;
        f  =1'b0;
        no =1'b0;#10;

// Compute x | y
        zx =1'b0;
        nx =1'b1;
        zy =1'b0;
        ny =1'b1;
        f  =1'b0;
        no =1'b1;#10;

        x =16'b0000000000010001;  // x = 17
        y =16'b0000000000000011;  // y =  3

// Compute 0
        zx =1'b1;
        nx =1'b0;
        zy =1'b1;
        ny =1'b0;
        f  =1'b1;
        no =1'b0;#10;

// Compute 1
        zx =1'b1;
        nx =1'b1;
        zy =1'b1;
        ny =1'b1;
        f  =1'b1;
        no =1'b1;#10;

// Compute -1
        zx =1'b1;
        nx =1'b1;
        zy =1'b1;
        ny =1'b0;
        f  =1'b1;
        no =1'b0;#10;

// Compute x
        zx =1'b0;
        nx =1'b0;
        zy =1'b1;
        ny =1'b1;
        f  =1'b0;
        no =1'b0;#10;

// Compute y
        zx =1'b1;
        nx =1'b1;
        zy =1'b0;
        ny =1'b0;
        f  =1'b0;
        no =1'b0;#10;

// Compute !x
        zx =1'b0;
        nx =1'b0;
        zy =1'b1;
        ny =1'b1;
        f  =1'b0;
        no =1'b1;#10;

// Compute !y
        zx =1'b1;
        nx =1'b1;
        zy =1'b0;
        ny =1'b0;
        f  =1'b0;
        no =1'b1;#10;

// Compute -x
        zx =1'b0;
        nx =1'b0;
        zy =1'b1;
        ny =1'b1;
        f  =1'b1;
        no =1'b1;#10;

// Compute -y
        zx =1'b1;
        nx =1'b1;
        zy =1'b0;
        ny =1'b0;
        f  =1'b1;
        no =1'b1;#10;

// Compute x + 1
        zx =1'b0;
        nx =1'b1;
        zy =1'b1;
        ny =1'b1;
        f  =1'b1;
        no =1'b1;#10;

// Compute y + 1
        zx =1'b1;
        nx =1'b1;
        zy =1'b0;
        ny =1'b1;
        f  =1'b1;
        no =1'b1;#10;

// Compute x - 1
        zx =1'b0;
        nx =1'b0;
        zy =1'b1;
        ny =1'b1;
        f  =1'b1;
        no =1'b0;#10;

// Compute y - 1
        zx =1'b1;
        nx =1'b1;
        zy =1'b0;
        ny =1'b0;
        f  =1'b1;
        no =1'b0;#10;

// Compute x + y
        zx =1'b0;
        nx =1'b0;
        zy =1'b0;
        ny =1'b0;
        f  =1'b1;
        no =1'b0;#10;

// Compute x - y
        zx =1'b0;
        nx =1'b1;
        zy =1'b0;
        ny =1'b0;
        f  =1'b1;
        no =1'b1;#10;

// Compute y - x
        zx =1'b0;
        nx =1'b0;
        zy =1'b0;
        ny =1'b1;
        f  =1'b1;
        no =1'b1;#10;

// Compute x & y
        zx =1'b0;
        nx =1'b0;
        zy =1'b0;
        ny =1'b0;
        f  =1'b0;
        no =1'b0;#10;

// Compute x | y
        zx=1'b0;
        nx=1'b1;
        zy=1'b0;
        ny=1'b1;
        f =1'b0;
        no=1'b1;#10;
    end
endmodule
