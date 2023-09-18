`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08/29/2023 12:41:07 AM
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
    output [6:0] segment,
    output activeSeg,
    output [3:0] SegState,
    input clk
    );
    
    wire [3:0] num3,num2,num1,num0; 
    assign num0=4;
    assign num1=3;
    assign num2=2;
    assign num3=1;
    
    wire seg0,seg1,seg2,seg3;
    assign SegState={seg3,seg2,seg1,seg0};
    
    wire targetClk;
    wire [18:0] tclk;
    assign tclk[0]=clk;
    genvar c;
    generate for(c=0;c<18;c=c+1) 
        begin
            clkDivModule fDiv(tclk[c+1],tclk[c]);
        end 
    endgenerate
    
    clkDivModule fdivTarget(targetClk,tclk[18]);
    
    quad2heptaSeg q7seg(seg,dp,an0,an1,an2,an3,num0,num1,num2,num3,targetClk);
    
    
endmodule
