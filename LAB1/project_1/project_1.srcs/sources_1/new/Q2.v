module fullAdder(cout, s, a, b, cin);
output cout;
output s;
input a;
input b;
input cin;
assign {cout,s} = a + b + cin;
endmodule


`timescale 1ns/1ns


`define assert(signal, value) \
        if (signal !== value) begin \
            $display("ASSERTION FAILED in %m: signal != value"); \
            $finish; \
        end
      
module tester;

reg a,b,cin;
wire cout,s;
fullAdder a1(cout,s,a,b,cin);
initial
begin
//$dumpfile("time.dump");
//$dumpvars(2,a1);
$monitor("time %t: {%b %b} <-{%d %d %d}", $time,cout,s,a,b,cin);
#10;
// 0 0 0
a=0;
b=0;
cin=0;
#10;
`assert(cout,0);
`assert(s,0);
#10;

// 0 0 1
a=0;
b=0;
cin=1;
#10;
`assert(cout,0);
`assert(s,1);
#10;

// 0 1 0
a=0;
b=1;
cin=0;
#10;
`assert(cout,0);
`assert(s,1);
#10;

// 0 1 1
a=0;
b=1;
cin=1;
#10;
`assert(cout,1);
`assert(s,0);
#10

// 1 0 0
a=1;
b=0;
cin=0;
#10;
`assert(cout,0);
`assert(s,1);
#10

// 1 0 1
a=1;
b=0;
cin=1;
#10;
`assert(cout,1);
`assert(s,0);
#10

// 1 1 0
a=1;
b=1;
cin=0;
#10;
`assert(cout,1);
`assert(s,0);
#10

// 1 1 1
a=1;
b=1;
cin=1;
#10;
`assert(cout,1);
`assert(s,1);
#10

//…...
$finish;
end
endmodule

