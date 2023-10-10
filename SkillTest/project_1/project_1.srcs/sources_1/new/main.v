`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/10/2023 02:31:45 PM
// Design Name: 
// Module Name: main
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


module main(
    output [4:0] led,
    input clk
    );
    wire [26:0] tclk;
    assign tclk[0] = clk;
    genvar c;
    reg l7 = 0;
    assign led[4] = l7;
    reg [3:0] exc;
    wire [3:0] wledState;
    assign wledState = {led[0],led[1],led[2],led[3]};
    reg [3:0] ledState;
    assign wledState = ledState;
    generate for(c=0; c<26; c=c+1)
        begin
            clockDiv fdiv(tclk[c+1], tclk[c]);
        end
    endgenerate
    clockDiv fDivTarget(targetClk, tclk[26]);

    always @(posedge targetClk) begin
        case (l7)
            0: l7 = 1;
            1: l7 = 0;
        endcase

        case (exc)
            0: ledState = 4'b0011;
            1: ledState = 4'b0100;
            2: ledState = 4'b0101;
            3: ledState = 4'b0110;
            4: ledState = 4'b0111;
            5: ledState = 4'b1000;
            6: ledState = 4'b1001;
            7: ledState = 4'b1010;
            8: ledState = 4'b1011;
            9: ledState = 4'b1100;
        endcase
        if (exc == 9) exc = 0;
        else exc = exc  + 1;
    end
endmodule
 