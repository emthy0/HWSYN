module singlePulser(
  output reg d,
  input clk, pushed
);
reg ps;

initial ps=0;

always @(posedge clk)
begin
  d = 0;
  if (pushed == ~ps) begin
    if(ps == 1)
      ps=0;
    else if (pushed == 1) begin
      d = 1;
      ps = 1;
    end
  end
end
endmodule