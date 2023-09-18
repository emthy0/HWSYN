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
    output dp,
    output [3:0] an,
   input clk,
   input btnC,
   input btnU,
   input [7:0] sw
    );
    wire [3:0] num3,num2,num1,num0;
    wire [1:0] cout3,cout2,cout1,cout0, bout3,bout2,bout1,bout0, dump0, dump1;
    wire inc0, inc1, inc2, inc3, dec0, dec1, dec2, dec3, btnRst, btnSet;
    // reg clk, btnC, btnU;
    // reg [7:0] sw;


    // num0 = 0;
    // num1 = 0;
    // num2 = 0;
    // num3 = 0;
    // assign btnC = btnRst;
    // assign btnU = btnSet;
    assign dp = 1;
    wire seg0,seg1,seg2,seg3;
    assign an = {seg3,seg2,seg1,seg0};
    wire segClk;
    wire [18:0] tclk;
    assign tclk[0] = clk;
    genvar c;
    generate
        for(c=0;c<18;c=c+1)
            begin
                clkDiv fDiv(tclk[c+1],tclk[c]);
            end
    endgenerate

    clkDiv fDiv2(segClk,tclk[18]);
    
    singlePulser spRst(btnRst, segClk, btnC);
    singlePulser spSet(btnSet, segClk, btnU);
    singlePulser spDec0(dec0, segClk, sw[0]);
    singlePulser spInc0(inc0, segClk, sw[1]);
    singlePulser spDec1(dec1, segClk, sw[2]);
    singlePulser spInc1(inc1, segClk, sw[3]);
    singlePulser spDec2(dec2, segClk, sw[4]);
    singlePulser spInc2(inc2, segClk, sw[5]);
    singlePulser spDec3(dec3, segClk, sw[6]);
    singlePulser spInc3(inc3, segClk, sw[7]);

    // bcd2 bcdaaa(segClk, num0);
    bcd bcd0(segClk, btnRst, btnSet, 1, dec0, num0, cout0, bout0, dump0, dump1);
    bcd bcd1(segClk, btnRst, btnSet, inc1, dec1, num1, cout1, bout1, cout0, bout0);
    bcd bcd2(segClk, btnRst, btnSet, inc2, dec2, num2, cout2, bout2 ,cout1, bout1);
    bcd bcd3(segClk, btnRst, btnSet, inc3, dec3, num3, cout3, bout3, cout2, bout2);
    heptaSeg hepseg(seg, dp, seg0, seg1, seg2, seg3, num0, num1, num2, num3, segClk);


endmodule
