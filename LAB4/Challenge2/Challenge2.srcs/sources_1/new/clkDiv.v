module clkDiv (
    output reg clkDiv,
    input clk
    );
    
    initial begin
        clkDiv=0;
    end
    
    always @(posedge clk) begin
        clkDiv=~clkDiv;
    end
    
endmodule