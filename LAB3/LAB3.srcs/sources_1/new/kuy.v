module main2();
reg clk;
always begin
    #5 clk = ~clk;
end
wire [3:0] num0;
assign num0 = 0;

always @ (posedge(clk))
begin
    num0 = num0 + 1;
end

// clkDiv fDiv2(segClk,tclk[18]);

    initial begin
        clk = 0;
        // Release reset

        // Compare outputs of the two shift registers

        // End simulation
        #10000 $finish;
    end

    endmodule
