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




assign result = result_internal;
assign memory_output = memory[operand_A];

endmodule