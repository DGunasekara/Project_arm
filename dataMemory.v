module dataMemory;
wire [15:0]MEMDATA;
reg [15:0] ADDR,WRITEDATA;
reg CLOCK,CLEAR,MEMREAD,MEMWRITE;


Data_Memory damem(CLOCK,CLEAR,ADDR,WRITEDATA,MEMWRITE,MEMREAD,MEMDATA);
initial
begin
	CLOCK=0;CLEAR=0;MEMREAD=1'b1;MEMWRITE=1'b1; WRITEDATA=16'd256;ADDR=16'd10;
	#1$display("MEMDATA=%b, for CLOCK=%b,CLEAR=%b,MEMREAD=%b,MEMWRITE=%b, WRITEDATA=%b\n",MEMDATA,CLOCK,CLEAR,MEMREAD,MEMWRITE,WRITEDATA);

	CLOCK=0;CLEAR=1;MEMREAD=1'b1;MEMWRITE=1'b1; WRITEDATA=16'd256;
	#1$display("MEMDATA=%b, for CLOCK=%b,CLEAR=%b,MEMREAD=%b,MEMWRITE=%b, WRITEDATA=%b\n",MEMDATA,CLOCK,CLEAR,MEMREAD,MEMWRITE,WRITEDATA);

	CLOCK=1;CLEAR=0;MEMREAD=1'b1;MEMWRITE=1'b1; WRITEDATA=16'd256;
	#1$display("MEMDATA=%b, for CLOCK=%b,CLEAR=%b,MEMREAD=%b,MEMWRITE=%b, WRITEDATA=%b\n",MEMDATA,CLOCK,CLEAR,MEMREAD,MEMWRITE,WRITEDATA);

	CLOCK=1;CLEAR=1;MEMREAD=1'b1;MEMWRITE=1'b1; WRITEDATA=16'd256;
	#1$display("MEMDATA=%b, for CLOCK=%b,CLEAR=%b,MEMREAD=%b,MEMWRITE=%b, WRITEDATA=%b\n",MEMDATA,CLOCK,CLEAR,MEMREAD,MEMWRITE,WRITEDATA);

end
endmodule	
		

module Data_Memory(Clock,Clear,Addr,WriteData,MemWrite,MemRead,MemData);
output[15:0]MemData;
input[15:0]Addr,WriteData;
input MemRead,MemWrite,Clock,Clear;
reg [15:0]memData;
reg [15:0]mem [0:8];
integer x;
always@(posedge Clock)
begin
if(Clear==0)
begin
	if(MemWrite==1'b1)
			begin
			mem[Addr]<=WriteData;
			end
	if(MemRead==1'b1)
			begin
			memData<=mem[Addr];
			end
		else
			begin 
			memData<=0;
			end
end
end
assign MemData=memData;

initial 
begin		//load data and instructions of program
for(x=0; x<8;x=x+1)
begin
mem[x]=x;
end
end
endmodule







