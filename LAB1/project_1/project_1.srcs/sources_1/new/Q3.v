`timescale 1ns/1ns
module DFlipFlop(q,clock,nreset,d);
    output q;
    input clock,nreset,d;
    reg q;
    always @(posedge clock)
    begin
        if (nreset==1)
            q <= d;
        else
            q <= 0;
    end
endmodule

module testDFlipFlop();
    reg clock, nreset, d;
    DFlipFlop D1(q,clock,nreset,d);
    always
    #10 clock=~clock;
    initial
    begin
        //$dumpfile("testDFlipFlop.dump");
        //$dumpvars(1,D1);
        #0 d=0;
        clock=0;
        #10 nreset = 0;
        
        // Test cases
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 1;
        
        #50 nreset=1;
        // Test cases
        #10 d = 1;
        #10 d = 0;
        #10 d = 1;
        #10 d = 1;
        #1000 $finish;
    end
    always
    #8 d=~d;
endmodule
