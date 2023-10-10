`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/04/2023 10:29:42 PM
// Design Name: 
// Module Name: fourSevenSeg
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


module fourSevenSeg(
    input clk,
    input [3:0] num0,
    input [3:0] num1,
    input [3:0] num2,
    input [3:0] num3,
    output [6:0] seg,
    output [3:0] an,
    output dp
    );
    
reg [1:0] nextState;
reg [1:0] currentState;
reg [3:0] displayEnable;

reg [3:0] currentHex;
wire [6:0] segments;
assign seg = segments;

segmentDecoder segDecode(segments, currentHex);

assign dp = 1;
assign an = ~displayEnable;

// Update state every clock
always @ (posedge clk) begin
    currentState = nextState;
end

// Generate next state by adding 1 to current state
always @ (currentState) begin
    nextState = currentState + 1;
end

// Generate display enable (one-hot) from current state
always @ (currentState) begin
    case (currentState)
        2'b00 : displayEnable = 4'b0001;
        2'b01 : displayEnable = 4'b0010;
        2'b10 : displayEnable = 4'b0100;
        2'b11 : displayEnable = 4'b1000;
    endcase
end

// Generate segments signal from current state
always @ (currentState) begin
    case (currentState)
        2'b00 : currentHex = num0;
        2'b01 : currentHex = num1;
        2'b10 : currentHex = num2;
        2'b11 : currentHex = num3;
    endcase
end

endmodule
