module demux2to4(out,in1,in2,enable);

output reg [3:0] out;
input in1,in2,enable;
always @(enable,in1,in2) // outputs should be change when in1,in2 or enable signal changes
begin
if(enable==1)
begin
 out[0]=(~in1) && (~in2);		// 00	
 out[1]=(~in1) && in2;			// 01
 out[2]=in1 && (~in2);			//10
 out[3]=in1 && in2;				//11


end
end

endmodule
