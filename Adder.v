module Adder(x,y,sum);

output [15:0] sum;
input [15:0]x,y;
reg [15:0]SUM;

always@(x,y)
begin 
	SUM = x+y;
end

assign sum= SUM;
endmodule

	


