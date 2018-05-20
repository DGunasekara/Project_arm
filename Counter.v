module Counter( in, clk, clear, load, up_down, out);

// Port Declaration

input   [7:0] in;		//to 8 bits
input   clk, clear, load, up_down;

output  [7:0] out;

reg     [7:0] count;

always @ (posedge clk)
begin
    if (!clear)					//should start again from zero
        counter = 8'b00;		//8 bits in binary
    else if (load)				//load input to the counter
        cnt = d;
    else if (up_down)			//if it says to do up counter
        cnt = cnt + 1;
    else						//if it says to do down
        cnt = cnt - 1;
end 

assign out = count;

endmodule