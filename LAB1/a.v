module fullAdder(cout, s, a, b, cin);
output cout;
output s;
input a;
input b;
input cin;
reg cout, s;
always @( )
begin
end
endmodule
`timescale 1ns/1ns
module tester;
reg a,b,cin;
wire cout,s;
fullAdder a1(cout,s,a,b,cin);
initial
begin
//$dumpfile("time.dump");
//$dumpvars(2,a1);
$monitor("time %t: {%b %b} <- {%d %d %d}", $time,cout,s,a,b,cin);
#0;
a=0;
b=0;
cin=0;
//…...
$finish;
end
endmodule
