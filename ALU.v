

module alu;

 
 reg [15:0] X,Y;
 reg [2:0]C;
 reg C_IN;
 wire [15:0] Z;
 wire C_OUT,LT,EQ,GT,OVERFLOW,ZERO;
 
 ALU aluop(X,Y,Z,C_IN,C_OUT,LT,EQ,GT,OVERFLOW,C,ZERO);

 initial
 begin
 X=16'd0 ; Y=16'd15;
 
 C=3'd0 ; #1 $display(" %b AND %b = %b ",X,Y,Z);
			#1 $display("selection input=%b, less than =%b,equal =%b, greater than =%b\n",C,LT,EQ,GT);

 X=16'd150 ; Y=16'd15;			
C=3'd1 ; #1 $display(" %b OR %b = %b ",X,Y,Z);
			#1 $display("selection input=%b, less than =%b,equal =%b, greater than =%b \n",C,LT,EQ,GT);

 X=16'd256 ; Y=16'd15; C_IN=1;
C=3'd2 ; #1 $display(" %b ADD %b with carry in %b = %b ,carry out %b ,overflow=%b",X,Y,C_IN,Z,C_OUT,OVERFLOW);
			#1 $display("selection input=%b, less than =%b,equal =%b, greater than =%b\n",C,LT,EQ,GT);

 X=16'd256 ; Y=16'd15;			
C=3'd3 ; #1 $display(" %b Subraction %b = %b with carry out=%b and over flow=%b",X,Y,Z,C_OUT,OVERFLOW);
			#1 $display("selection input=%b, less than =%b,equal =%b, greater than =%b,zero=%b\n",C,LT,EQ,GT,ZERO);

 X=16'd1 ; Y=16'd15;			
C=3'd4 ; #1 $display(" %b less than %b = %b ",X,Y,Z);
			#1 $display("selection input=%b, less than =%b,equal =%b, greater than =%b zero =%b\n",C,LT,EQ,GT,ZERO);
			
X=16'd256 ; Y=16'd15; C_IN=0;
C=3'd2 ; #1 $display(" %b ADD %b with carry in %b = %b ,carry out %b ,overflow=%b",X,Y,C_IN,Z,C_OUT,OVERFLOW);
			#1 $display("selection input=%b, less than =%b,equal =%b, greater than =%b\n",C,LT,EQ,GT);

			
end
endmodule

module ALU(x,y,		//dual input
z,					//single wordresult
c_in,				//carry in
c_out,				//carry out
lt,eq,gt,			//comparison indicators less than, equal,greater than
overflow,			//overflow indicator
c,					//operation select
zero
);

output [15:0] z;
output c_out,lt,eq,gt,overflow,zero;
input [15:0] x,y;
input [2:0]c;
input c_in;
reg C_OUT,LT,EQ,GT,OVERFLOW,ZERO;
reg [15:0] Z;
reg y1;
always@(x,y)
begin
		EQ=x==y;
		LT=x<y;
		GT=x>y;
		ZERO=0;
		case(c)
		3'd0:		//and operation
		begin
		Z<=x&y;
		end
		3'd1:		//or operation
		Z<=x|y;
		
		3'd2:		//addition with carry in
		{OVERFLOW,C_OUT,Z}<=x+y+c_in;
		
		3'd3:		//subraction 
		begin
		 y1 = ~y + 1;
		{OVERFLOW,C_OUT,Z} <= x + y1;     
	            if (LT == 1) ZERO = 1;
		    
		end
		
		3'd4:		//set on less than
		Z <= LT;
		
		//default
      endcase
	  end
	  assign c_out = C_OUT;
	  assign lt=LT;
	  assign eq= EQ;
	  assign gt= GT;
	  assign overflow= OVERFLOW;
	  assign zero= ZERO;
	  assign z=Z;
    	         
	endmodule
		


