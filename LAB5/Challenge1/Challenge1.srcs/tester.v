`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2023 11:33:49 PM
// Design Name: 
// Module Name: alu_test
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


module alu_test();
// Inputs
    reg [31:0] A, B;
    reg [2:0] alu_ops;
    reg Cin;

    // Outputs
    wire [31:0] S;
    wire z, Cout;

    // Instantiate the ALU module
    alu uut(
        .S(S),
        .z(z),
        .Cout(Cout),
        .A(A),
        .B(B),
        .Cin(Cin),
        .alu_ops(alu_ops)
    );

    // Clock generation
    reg clk = 0;
    always #5 clk = ~clk;

    // Testbench stimulus
    initial begin
        // Test Case 1: Addition (alu_ops = 3'b000)
        A = 8'h0A; // 10 in decimal
        B = 8'h05; // 5 in decimal
        alu_ops = 3'b000;
        Cin = 1'b0;
        #10;
        $display("ALU Operation: A + B");
        $display("A = %h, B = %h, Cin = %b", A, B, Cin);
        $display("Output (S) = %h, Cout = %b, Zero (z) = %b", S, Cout, z);
        #10;

        // Test Case 2: Subtraction (alu_ops = 3'b001)
        A = 8'h0F; // 15 in decimal
        B = 8'h08; // 8 in decimal
        alu_ops = 3'b001;
        Cin = 1'b1; // Borrow
        #10;
        $display("ALU Operation: A - B");
        $display("A = %h, B = %h, Cin = %b", A, B, Cin);
        $display("Output (S) = %h, Cout = %b, Zero (z) = %b", S, Cout, z);
        #10;

        // Test Case 3: Bitwise OR (alu_ops = 3'b010)
        A = 8'h0A; // 10 in decimal
        B = 8'h03; // 3 in decimal
        alu_ops = 3'b010;
        Cin = 1'b0;
        #10;
        $display("ALU Operation: A | B");
        $display("A = %h, B = %h, Cin = %b", A, B, Cin);
        $display("Output (S) = %h, Cout = %b, Zero (z) = %b", S, Cout, z);
        #10;

        // Test Case 4: Bitwise AND (alu_ops = 3'b011)
        A = 8'h0F; // 15 in decimal
        B = 8'h06; // 6 in decimal
        alu_ops = 3'b011;
        Cin = 1'b0;
        #10;
        $display("ALU Operation: A & B");
        $display("A = %h, B = %h, Cin = %b", A, B, Cin);
        $display("Output (S) = %h, Cout = %b, Zero (z) = %b", S, Cout, z);
        #10;

        // Test Case 5: Bitwise XOR (alu_ops = 3'b100)
        A = 8'h0A; // 10 in decimal
        B = 8'h06; // 6 in decimal
        alu_ops = 3'b100;
        Cin = 1'b0;
        #10;
        $display("ALU Operation: A ^ B");
        $display("A = %h, B = %h, Cin = %b", A, B, Cin);
        $display("Output (S) = %h, Cout = %b, Zero (z) = %b", S, Cout, z);
        #10;

        // Test Case 6: 2's complement (alu_ops = 3'b101)
        A = 8'h0F; // -15 in 8-bit 2's complement
        B = 8'h00;
        alu_ops = 3'b101;
        Cin = 1'b0;
        #10;
        $display("ALU Operation: -A");
        $display("A = %h, B = %h, Cin = %b", A, B, Cin);
        $display("Output (S) = %h, Cout = %b, Zero (z) = %b", S, Cout, z);
        #10;

        // Test Case 7: Bitwise NOT of A (alu_ops = 3'b110)
        A = 8'h0F; // 15 in decimal
        B = 8'h00;
        alu_ops = 3'b110;
        Cin = 1'b0;
        #10;
        $display("ALU Operation: ~A");
        $display("A = %h, B = %h, Cin = %b", A, B, Cin);
        $display("Output (S) = %h, Cout = %b, Zero (z) = %b", S, Cout, z);
        #10;

        // Test Case 8: Bitwise NOT of B (alu_ops = 3'b111)
        A = 8'h00;
        B = 8'h0A; // 10 in decimal
        alu_ops = 3'b111;
        Cin = 1'b0;
        #10;
        $display("ALU Operation: ~B");
        $display("A = %h, B = %h, Cin = %b", A, B, Cin);
        $display("Output (S) = %h, Cout = %b, Zero (z) = %b", S, Cout, z);
        #10;

        // Finish simulation
        $finish;
    end
endmodule