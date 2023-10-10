`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/03/2023 01:55:51 AM
// Design Name: 
// Module Name: my_memory
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


module my_memory(data, address, wr, clk, sw, seg, an, dp);

    parameter DATA_WIDTH = 32;
    parameter ADDR_WIDTH = 16;
    
    inout [DATA_WIDTH-1:0] data;
    input [ADDR_WIDTH-1:0] address;
    input wr,clk;
    input [11:0] sw;
    output [6:0] seg;
    output [3:0] an;
    output dp;

    reg	[3:0]	          mem[0:1<<ADDR_WIDTH-1];
    reg	[DATA_WIDTH-1:0]  data_out;
    // Tri-State buffer
    assign data=(wr==0) ? data_out : 32'bz;
    
    
    ////////////////////////////////////////
    // Clock
    wire targetClk;
    wire [18:0] tclk;
    
    assign tclk[0]=clk;
    
    genvar c;
    generate for(c=0;c<18;c=c+1) begin
        clockDiv fDiv(tclk[c], tclk[c+1]);
    end endgenerate
    
    clockDiv fdivTarget(tclk[18], targetClk);
    
    
    ////////////////////////////////////////
    // Display
    reg [3:0] num3,num2,num1,num0; // left to right
    fourSevenSeg display(targetClk, num0, num1, num2, num3, seg, an, dp);
    
    
    ////////////////////////////////////////
    // init mem
    initial $readmemb("data.list",mem);
    
    // set Mem-map I/O
    always @(address) begin
        case (address)
            16'hFFF0 : data_out = num0;
            16'hFFF4 : data_out = num1;
            16'hFFF8 : data_out = num2;
            16'hFFFC : data_out = num3;
            16'hFFE0 : data_out = sw[3:0];
            16'hFFE4 : data_out = sw[7:4];
            16'hFFE8 : data_out = sw[11:8];
            default : data_out = mem[address];
        endcase
    end
        
    always @(posedge clk)
    begin : MEM_WRITE
        if (wr) begin
           case (address)
                16'hFFF0 : num0 = data[3:0];
                16'hFFF4 : num1 = data[3:0];
                16'hFFF8 : num2 = data[3:0];
                16'hFFFC : num3 = data[7:4];
	            default : mem[address] = data;
            endcase
        $display("%10d - MEM[%h] <- %h",$time, address, data);
        end
    end

endmodule
