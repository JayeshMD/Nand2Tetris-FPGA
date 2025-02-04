//////////////////////////////////////////////////////////////////////////////////
//   Instruction bits
//   b15 b14 b13 b12 b11 b10 b9 b8 b7 b6 b5 b4 b3 b2 b1 b0
//   ===============Type of instruction bit====================
//   b15 => 0: A-instruction, 1 : C-instruction
//
//   ==========Only used while A-instruction for data==========
//   b14 => used only for A-instruction     
//   b13 => used only for A-instruction     
//   
//   ===============Computation bits====================
//   b12 => 0: Choose A-register fokr claculation
//          1: Choose M for calculation. M is the data in RAM[A-register]
//   b11-b6 => control bits for ALU
//
//   ===============Destination bits=====================
//   b5 => 1: destination is A-registor
//   b4 => 1: destination is D-Register
//   b3 => 1: Destination M[A-register]
//
//   ==============Jump bits=============================
//   b2 => Jump at out<0
//   b1 => Jump at out=0
//   b0 => Jump at out>0
//////////////////////////////////////////////////////////////////////////////////


module n2t_cpu(outM, writeM, addressM, pc, inM, instruction, reset, clk);
    output wire [15:0] outM;
    output wire writeM;
    output wire [14:0] addressM;
    output wire [15:0] pc;
    
    input wire [15:0] inM;
    input wire [15:0] instruction;
    input wire reset, clk;
    
    // Internal wires
    wire [15:0] Ain, A, D, ALUout, AM;
    wire n15, loadA, zr, ng;
    
    /////////////////////////////////////////////////////////////////////////
    // Loading of A-register
    /////////////////////////////////////////////////////////////////////////
    
    // Input to A-register 
    n2t_mux16 MUX161(.out(Ain), .a(instruction), .b(ALUout), .sel(instruction[15]));
    
    // Load-bit for A-register
    not(n15, instruction[15]);
    or(loadA, instruction[5], n15);
    
    // Load A-register
    n2t_register REGISTER_A(.out(A), .in(Ain) , .load(loadA), .clk(clk));
    
    /////////////////////////////////////////////////////////////////////////
    // Loading of D-register
    /////////////////////////////////////////////////////////////////////////
    
    // Load bit for D-register
    and(loadD, instruction[15], instruction[4]);
    n2t_register REGISTER_D(.out(D), .in(ALUout) , .load(loadD), .clk(clk));
    
    
    /////////////////////////////////////////////////////////////////////////
    // outM will be theoutput of ALU.
    ////////////////////////////////////////////////////////////////////////
    
    assign outM = ALUout;
    
    
    /////////////////////////////////////////////////////////////////////////
    // writeM will be theoutput of ALU. Load bit for M. Here M is RAM[A-register]
    ////////////////////////////////////////////////////////////////////////
    
    and(writeM, instruction[15], instruction[3]);
    

    ////////////////////////////////////////////////////////////////////////
    // Content of A-register always appear at addressM 
    ////////////////////////////////////////////////////////////////////////
    
    assign addressM = A[14:0];
    
    
    ////////////////////////////////////////////////////////////////////////
    // A or M => A: instruction[12] =0, M: instruction[12] =1
    ////////////////////////////////////////////////////////////////////////
    
    n2t_mux16 MUX162(.out(AM), .a(A), .b(inM), .sel(instruction[12]));
    
    ////////////////////////////////////////////////////////////////////////
    // ALU
    ////////////////////////////////////////////////////////////////////////
    
    n2t_alu ALU(.out(ALUout), .zr(zr), .ng(ng), .x(D), .y(AM), .zx(instruction[11]), 
                                                               .nx(instruction[10]), 
                                                               .zy(instruction[9] ), 
                                                               .ny(instruction[8] ), 
                                                               .f (instruction[7] ), 
                                                               .no(instruction[6] ));
                                                               
   //////////////////////////////////////////////////////////////////////////
   // Managing PC
   //////////////////////////////////////////////////////////////////////////                                                               
    
   wire nzr, nng, po, opo, ozr, ong, jp1, jp2, loadPC;
   
   not(nzr, zr);
   not(nng, ng);
   
   and(po, nzr, nng);   // pos = out>0
   
   // JMP-bits and ALU flags 
   n2t_mux MUX1(.out(opo), .a(1'b0), .b(po), .sel(instruction[0])); 
   n2t_mux MUX2(.out(ozr), .a(1'b0), .b(zr), .sel(instruction[1]));
   n2t_mux MUX3(.out(ong), .a(1'b0), .b(ng), .sel(instruction[2]));  

   // loadPC
   or(jp1, opo, ozr);
   or(jp2, jp1, ong);
   
   and(loadPC, instruction[15], jp2);
   
   
   // Setting up PC
   n2t_pc REGISTER_PC(.out(pc)  , .in(A)       , .load(loadPC), 
                      .inc(1'b1), .reset(reset), .clk(clk)); 
   

endmodule
