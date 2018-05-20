module instructionMemory(addr,data,clock);
output reg [15:0] addr;
input [15:0] data;
input clock;
reg [15:0] mem[0:8] ;//9 instructions and 16bit word


initial
begin
mem[0] = 0;
end


always @(posedge clock)
    begin
	addr <= mem[data];
    end

endmodule








