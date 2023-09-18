`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/11/2023 08:09:18 PM
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
  output [6:0] seg,
  output [3:0] an,
  input clk,
  input [4:0] sw
  );
    // begin of   7-seg shit //
    reg [3:0] num3,num2,num1,num0;
    wire seg0,seg1,seg2,seg3;
    assign an = {seg3,seg2,seg1,seg0};
    // end of     7-seg shit //

    // begin of   Clk thing //
    wire segClk;

    wire [30:0] tclk;
    assign tclk[0] = clk;
    genvar c;
    generate
        for(c=0;c<30;c=c+1)
            begin
                clkDiv fDiv(tclk[c+1],tclk[c]);
            end
    endgenerate

    clkDiv fDiv2(segClk,tclk[18]);
    // end of     Clk thing //

    // var wire reg //
    reg [15:0] rom [31:0];
    initial $readmemb("rom_big.data", rom);
    always @(posedge segClk) begin
      {num3,num2,num1,num0} = {rom[sw[4:0]] };
    end


    heptaSeg hepseg(seg, dp, seg0, seg1, seg2, seg3, num0, num1, num2, num3, segClk);


endmodule
