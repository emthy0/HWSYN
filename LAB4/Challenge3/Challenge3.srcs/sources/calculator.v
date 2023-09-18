module Calculator(
    input wire clk,
    input wire reset,
    input wire [3:0] operand_A,
    input wire [3:0] operand_B,
    input wire [1:0] operation,
    output wire [3:0] result,
    output wire [3:0] memory_output
);


reg [3:0] memory [0:7];
reg [3:0] result_internal;

always @(posedge clk or posedge reset) begin
    if (reset) begin
        result_internal <= 4'b0;
    end else begin
        case (operation)
            0: result_internal <= operand_A + operand_B; // Addition
            1: result_internal <= operand_A - operand_B; // Subtraction
            2: result_internal <= operand_A * operand_B; // Multiplication
            3: begin
                if (operand_B != 4'b0) // Avoid division by zero
                    result_internal <= operand_A / operand_B; // Division
                else
                    result_internal <= 4'bxxxx; // Invalid operation
            end
            default: result_internal <= 4'bxxxx; // Invalid operation
        endcase
    end
end

always @(posedge slower_clk) begin
    if (write_enable) begin
        memory[operand_A] <= result_internal;
    end
end



assign result = result_internal;
assign memory_output = memory[operand_A];

endmodule