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
  // output dp,
  output [3:0] an,
  input clk,
  input btnU, btnC, btnD,
  input [7:0] sw
  );
    // begin of   7-seg shit //
    wire [3:0] num3,num2,num1,num0;
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
    wire btnRst, btnPsh, btnPop;
    reg [7:0] rom [255:0];
    reg [7:0] top;
    reg [7:0] addr;
    wire [7:0] topWire = top;
    wire [7:0] addrWire = addr;
    assign topWire = {num3,num2};
    assign addrWire = {num1,num0};

    initial addr = 0;
    initial top = 0;


    // main //

    singlePulser spRst(btnRst, segClk, btnD);
    singlePulser spPsh(btnPsh, segClk, btnU);
    singlePulser spPop(btnPop, segClk, btnC);

    always @(posedge segClk) begin
      if (btnRst) begin 
        top = 0;
        addr = 0;
      end
      else if (btnPsh) begin
        rom[addr] = sw[7:0];
        addr = addr + 1;
      end
      else if (btnPop) begin 
        if (addr == 0) begin
          top = 0;
          addr = 0; 
        end
        else begin
          addr = addr - 1;
          top = rom[addr];
          rom[addr] = 0;
        end
      end
    end


    heptaSeg hepseg(seg, dp, seg0, seg1, seg2, seg3, num0, num1, num2, num3, segClk);


endmodule
