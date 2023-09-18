module bcd (
    input clk, rst, set, inc, dec,
    output reg[3:0] bcd_digit,
    output cout, bout,
    input cin, bin
    );
reg [3:0] ns;
reg cout, bout;

always @ (posedge(clk))
begin
   if (rst) bcd_digit <= 0;
   if (set) bcd_digit <= 4'b1001;
   else begin
        cout = 0;
        bout = 0;
        ns = bcd_digit + cin + inc  - bin - dec;
        if (ns > 4'b1001) begin
            cout = 1;
            ns = ns - 4'b1010;
        end
        else if (ns < 0) begin
            bout = 1;
            ns = 4'b1010 + ns;
        end
        bcd_digit = ns;
   end
    // bcd_digit = 2;
end
endmodule

// module bcd2(input clk, output reg[3:0] digit);
// always @ (posedge(clk))
// begin
//     digit <= digit + 1;
// end
// endmodule