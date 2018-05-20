 
module Stimulus;
reg [3:0] Aaddr, Baddr, Caddr;
reg LOAD,CLOCK,CLEAR;
reg [15:0]  C;
wire [15:0] A,B;
 reg [15:0] RegFile [0:15];
Reg_File regisFile(Aaddr, Baddr, Caddr, A, B, C, CLOCK, CLEAR, LOAD);
initial
begin

C = 16'd65535; Caddr = 4'd0; Aaddr = 4'd1; Baddr = 4'd2; CLOCK = 0; 
CLEAR = 1; LOAD = 1; 
		#1 $display(" registerFile is empty. A= %b B= %b, C= %b, Aaddr= %d, Baddr= %d, Caddr= %d, CLOCK= %b, LOAD= %b, CLEAR= %b\n",A ,B ,C,Aaddr ,Baddr ,Caddr ,CLOCK ,LOAD ,CLEAR);
C = 16'd256; Caddr = 4'd0; Aaddr = 4'd1; Baddr = 4'd2; CLOCK = 1; 
CLEAR = 1; LOAD = 1; 
		#1 $display(" registerFile is empty. A= %b B= %b, C= %b, Aaddr= %d, Baddr= %d, Caddr= %d, CLOCK= %b, LOAD= %b, CLEAR= %b\n",A ,B ,C,Aaddr ,Baddr ,Caddr ,CLOCK ,LOAD ,CLEAR);
C = 16'd0; Caddr = 4'd0; Aaddr = 4'd0; Baddr = 4'd0; CLOCK = 1; 
CLEAR = 1; LOAD = 1; 
		#1 $display(" registerFile is empty. A= %b B= %b, C= %b, Aaddr= %d, Baddr= %d, Caddr= %d, CLOCK= %b, LOAD= %b, CLEAR= %b\n",A ,B ,C,Aaddr ,Baddr ,Caddr ,CLOCK ,LOAD ,CLEAR);		

 end
endmodule


module Reg_File(Aaddr, Baddr, Caddr, A, B, C, Clk, Clear, Load);

input [3:0] Aaddr, Baddr, Caddr;     		//address of the input
 input   Load;					//inputs
// output reg [31:0] R_Data;
 input [15:0]  C;	
output reg[15:0] A,B; //outputs 16 bits
 input  Clk, Clear;

 reg [15:0] RegFile [0:15];					//16 registers 16 bits
integer x;
 // procedure 

always @(posedge Clk) 

begin if (Load==1) 

begin 

A=RegFile[Aaddr];					//get the output from the registers by givin addresses
B=RegFile[Baddr];
RegFile[Caddr]=C;					//load the valus to the given address

 end 

if(Clear==0)				//clear all the registers in the register file
begin 
 x = 0; 
  while( x < 16 ) 
  begin 
    RegFile[x]=0; 
  x=x+1;
  end 
end 
end
endmodule



 