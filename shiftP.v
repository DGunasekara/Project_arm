module shiftResister;
reg [3:0] IN;
reg LS,RS,S0,S1,CLOCK,ENABLE;
wire [3:0] OUT;
always
		#2 CLOCK = ~CLOCK;	//clock changes for every 2time unit
		initial
		#80 $finish;
shift_resister sr(IN,LS,RS,S0,S1,CLOCK,ENABLE,OUT);

initial
begin


		// set input lines
		IN =4'b0110; RS=1; LS=1; CLOCK =1;ENABLE=1;
			
		 $display("IN=%b, RS =%b, LS= %b\n",IN,RS,LS);
		 $display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		// choose IN0
		S1 = 0; S0 = 0; $display("load ");
		#1 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		// choose IN1
		$display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		S1 = 0; S0 = 1; $display("hold ");
		#1 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		// choose IN2
		$display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		S1 = 1; S0 = 0; $display("shift left ");
		#1 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		// choose IN3
		$display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		S1 = 1; S0 = 1; $display("shift right ");
		#1 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);

		 
		 $display("clock changes from 0 to 1. Posedge clock");
		 $display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		 S1 = 1; S0 = 0; $display("shift left ");
		#1 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		// choose IN3
		$display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		S1 = 1; S0 = 1; $display("shift right ");
		#1 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		S1 = 0; S0 = 0; $display("load ");
		#1 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		// choose IN1
		$display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		S1 = 0; S0 = 1; $display("hold ");
		#1 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		
		// choose IN2
		$display("clock changes from 0 to 1. Posedge clock");
		 $display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		 S1 = 1; S0 = 0; $display("shift left ");
		#1 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		// choose IN3
		$display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		$display("clock changes from 0 to 1. Posedge clock");
		 
		S1 = 1; S0 = 1; $display("shift right ");
		#4 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		
		
		RS=1; LS=0;
		 $display("RS =%b, LS= %b\n",RS,LS);
		// choose IN2
		$display("clock changes from 0 to 1. Posedge clock");
		 $display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		 S1 = 1; S0 = 0; $display("shift left ");
		#4 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		// choose IN3
		$display("clock changes from 0 to 1. Posedge clock");
		$display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		S1 = 1; S0 = 1; $display("shift right ");
		#4 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);



		RS=0; LS=0;
		$display("RS =%b, LS= %b\n",RS,LS);
		// choose IN2
		$display("clock changes from 0 to 1. Posedge clock");
		 $display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		 S1 = 1; S0 = 0; $display("shift left ");
		#4 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		// choose IN3
		$display("clock changes from 0 to 1. Posedge clock");
		$display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		S1 = 1; S0 = 1; $display("shift right ");
		#4 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);



		RS=0; LS=1;
		$display("RS =%b, LS= %b\n",RS,LS);
		// choose IN2
		$display("clock changes from 0 to 1. Posedge clock");
		 $display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		 S1 = 1; S0 = 0; $display("shift left ");
		#4 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		// choose IN3
		$display("clock changes from 0 to 1. Posedge clock");
		$display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		S1 = 1; S0 = 1; $display("shift right ");
		#4 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);


		
		ENABLE=0;
		$display("clock changes from 0 to 1. Posedge clock");
		$display("no changes because enable is 0");
		//choose IN2
		 $display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		 S1 = 1; S0 = 0; $display("shift left ");
		#4 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		// choose IN3
		$display("CLOCK =%b and ENABLE=%b",CLOCK,ENABLE);
		S1 = 1; S0 = 1; $display("shift right ");
		#4 $display("S1 = %b, S0 = %b, OUT = %b \n", S1, S0, OUT);
		 
end

endmodule



 module shift_resister(par_in,ls,rs,s0,s1,clock,enable,out);
 
	output [3:0] out;
	reg [3: 0] out;
	input[3:0] par_in;
	input rs,ls,s0,s1,clock,enable;
	
//always @(posedge clock && enable)
//always @(enable)



always @(posedge clock)

if( enable==1)
case ({s1, s0})
2'd0: out <= par_in;                 // load
2'd1: out <= out; 		    // hold
2'd2: out <= (( out>>1) | (ls<<3)) ;     // left shift
2'd3: out <= ((out<<1)| rs );                 //  right shift
endcase


endmodule