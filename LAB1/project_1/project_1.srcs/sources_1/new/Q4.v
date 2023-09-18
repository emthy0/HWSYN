`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/21/2023 11:28:15 PM
// Design Name: 
// Module Name: Q4
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


module shiftA(q,clock,d);
output [1:0] q;
input clock,d;
reg [1:0] q;
always @(posedge clock)
begin
q[0]=d;
q[1]=q[0];
end
endmodule

module shiftB(q,clock,d);
output [1:0] q;
input clock,d;
reg [1:0] q;
always @(posedge clock)
begin
q[0]<=d;
q[1]<=q[0];
end
endmodule

module testbench;

    reg clk;
    reg reset;
    reg shift_in;
    reg enable;
    wire [1:0] shift_out_1;
    wire [1:0] shift_out_2;

    // Instantiate the first 2-bit shift register
    shiftA shift_reg_A (shift_out_1, clk,shift_in );

    // Instantiate the second 2-bit shift register
    shiftB shift_reg_B (shift_out_2, clk, shift_in);

    // Clock generation
    always begin
        #5 clk = ~clk;
    end

    always @ (shift_out_1 or shift_out_2)
        begin
        if (shift_out_1 !== shift_out_2) begin
            $display("Mismatch in shift outputs: shift_out_1 = %b, shift_out_2 = %b", shift_out_1, shift_out_2);
        end else begin
            $display("Shift outputs match: shift_out_1 = %b, shift_out_2 = %b", shift_out_1, shift_out_2);
        end
    end
    // Initialize signals
    initial begin
        clk = 0;
        reset = 1;
        shift_in = 0;
        enable = 0;

        // Release reset
        #10 reset = 0;
        #10 enable = 1;  // Enable shifting
        
        // Test cases
        #10 shift_in = 1; // Shift in 1

        // Compare outputs of the two shift registers

        // End simulation
        #10 $finish;
    end

endmodule