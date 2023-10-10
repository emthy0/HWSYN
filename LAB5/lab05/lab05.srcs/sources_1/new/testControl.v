`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2023 12:54:18 AM
// Design Name: 
// Module Name: testControl
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module testControl();
    // Inputs
    reg [5:0] opcode;
    reg [2:0] reserved;
    reg z_flag;
    
    // Outputs
    wire sel_pc;
    wire sel_addpc;
    wire sel_wr;
    wire sel_b;
    wire sel_data;
    wire reg_wr;
    wire mem_wr;
    wire [1:0] ext_ops;
    wire [2:0] alu_ops;
    
    // Instantiate the control module
    control ctrl(
        .sel_pc(sel_pc),
        .sel_addpc(sel_addpc),
        .sel_wr(sel_wr),
        .sel_b(sel_b),
        .sel_data(sel_data),
        .reg_wr(reg_wr),
        .mem_wr(mem_wr),
        .ext_ops(ext_ops),
        .alu_ops(alu_ops),
        .opcode(opcode),
        .reserved(reserved),
        .z_flag(z_flag)
    );
    
    // Initialize inputs
    initial begin
        // default value
        reserved = 3'b000;
        z_flag = 0;
    
        // Other opcode
        opcode = 6'b011000; 
        #100
        
        // Other opcode
        opcode = 6'b011100; 
        #100
    
        // Change opcode to ALU
        opcode = 6'b000001;

        // Change reverse and display the results
        reserved = 3'b000;
        $display("Test: reserved = %b", opcode, reserved);
        $display("sel_pc = %b", sel_pc);
        $display("sel_addpc = %b", sel_addpc);
        $display("sel_wr = %b", sel_wr);
        $display("sel_b = %b", sel_b);
        $display("sel_data = %b", sel_data);
        $display("reg_wr = %b", reg_wr);
        $display("mem_wr = %b", mem_wr);
        $display("ext_ops = %b", ext_ops);
        $display("alu_ops = %b", alu_ops);
        #100
        
        // Change reverse and display the results
        reserved = 3'b001;
        $display("Test: reserved = %b", opcode, reserved);
        $display("sel_pc = %b", sel_pc);
        $display("sel_addpc = %b", sel_addpc);
        $display("sel_wr = %b", sel_wr);
        $display("sel_b = %b", sel_b);
        $display("sel_data = %b", sel_data);
        $display("reg_wr = %b", reg_wr);
        $display("mem_wr = %b", mem_wr);
        $display("ext_ops = %b", ext_ops);
        $display("alu_ops = %b", alu_ops);
        #100
        
        // Change reverse and display the results
        reserved = 3'b010;
        $display("Test: reserved = %b", opcode, reserved);
        $display("sel_pc = %b", sel_pc);
        $display("sel_addpc = %b", sel_addpc);
        $display("sel_wr = %b", sel_wr);
        $display("sel_b = %b", sel_b);
        $display("sel_data = %b", sel_data);
        $display("reg_wr = %b", reg_wr);
        $display("mem_wr = %b", mem_wr);
        $display("ext_ops = %b", ext_ops);
        $display("alu_ops = %b", alu_ops);
        #100
        
        // Change reverse and display the results
        reserved = 3'b011;
        $display("Test: reserved = %b", opcode, reserved);
        $display("sel_pc = %b", sel_pc);
        $display("sel_addpc = %b", sel_addpc);
        $display("sel_wr = %b", sel_wr);
        $display("sel_b = %b", sel_b);
        $display("sel_data = %b", sel_data);
        $display("reg_wr = %b", reg_wr);
        $display("mem_wr = %b", mem_wr);
        $display("ext_ops = %b", ext_ops);
        $display("alu_ops = %b", alu_ops);
        #100
        
        // Change reverse and display the results
        reserved = 3'b100;
        $display("Test: reserved = %b", opcode, reserved);
        $display("sel_pc = %b", sel_pc);
        $display("sel_addpc = %b", sel_addpc);
        $display("sel_wr = %b", sel_wr);
        $display("sel_b = %b", sel_b);
        $display("sel_data = %b", sel_data);
        $display("reg_wr = %b", reg_wr);
        $display("mem_wr = %b", mem_wr);
        $display("ext_ops = %b", ext_ops);
        $display("alu_ops = %b", alu_ops);
        #100
        
        // Change reverse and display the results
        reserved = 3'b101;
        $display("Test: reserved = %b", opcode, reserved);
        $display("sel_pc = %b", sel_pc);
        $display("sel_addpc = %b", sel_addpc);
        $display("sel_wr = %b", sel_wr);
        $display("sel_b = %b", sel_b);
        $display("sel_data = %b", sel_data);
        $display("reg_wr = %b", reg_wr);
        $display("mem_wr = %b", mem_wr);
        $display("ext_ops = %b", ext_ops);
        $display("alu_ops = %b", alu_ops);
        #100
        
        // Change reverse and display the results
        reserved = 3'b110;
        $display("Test: reserved = %b", opcode, reserved);
        $display("sel_pc = %b", sel_pc);
        $display("sel_addpc = %b", sel_addpc);
        $display("sel_wr = %b", sel_wr);
        $display("sel_b = %b", sel_b);
        $display("sel_data = %b", sel_data);
        $display("reg_wr = %b", reg_wr);
        $display("mem_wr = %b", mem_wr);
        $display("ext_ops = %b", ext_ops);
        $display("alu_ops = %b", alu_ops);
        #100
        
        // Change reverse and display the results
        reserved = 3'b111;
        $display("Test: reserved = %b", opcode, reserved);
        $display("sel_pc = %b", sel_pc);
        $display("sel_addpc = %b", sel_addpc);
        $display("sel_wr = %b", sel_wr);
        $display("sel_b = %b", sel_b);
        $display("sel_data = %b", sel_data);
        $display("reg_wr = %b", reg_wr);
        $display("mem_wr = %b", mem_wr);
        $display("ext_ops = %b", ext_ops);
        $display("alu_ops = %b", alu_ops);
        #100
        $finish;
    end
endmodule