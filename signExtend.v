module extender;

reg [3:0]INP;
reg CLOCK;
wire [15:0] EXTENDEDONE;
always
		#2 CLOCK = ~CLOCK;	//clock changes for every 2time unit
		initial
		#20 $finish;
signExtend extend(INP,CLOCK,EXTENDEDONE);

initial 
begin
CLOCK=0; 
INP = 4'd1 ; 

#1 $display("input=%b , extendedOne= %b",INP,EXTENDEDONE);
 $display("no extention because no posedge clock,clock =%b\n",CLOCK);

INP = 4'd15 ; 

#1 $display("input=%b , extendedOne= %b",INP,EXTENDEDONE);
 $display("no extention because  no posedge clock,clock =%b\n",CLOCK);

INP = 4'd1 ; 
 
#6 $display("input=%b , extendedOne= %b",INP,EXTENDEDONE);
$display("there is a extention because posedge clock,clock =%b\n",CLOCK);

INP = 4'd15 ; 

#4 $display("input=%b , extendedOne= %b",INP,EXTENDEDONE);
 $display("there is a extention because posedge clock,clock =%b\n",CLOCK);


end
endmodule



module signExtend(inp,clock,extendedOne);
input[3:0]inp;		//4bit input
input clock;
output [15:0]extendedOne; //input should be extent to 16 bit.
reg [15:0] EXTENDEDONE;

 always @(posedge clock)

begin 
EXTENDEDONE={{12{inp[3]}},inp};
end


assign extendedOne=EXTENDEDONE;

endmodule






