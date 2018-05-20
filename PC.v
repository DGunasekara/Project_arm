module pc(clock,inputAddress,outputAddress);
input clock;
input[15:0]inputAddress;
output [15:0]outputAddress;
reg [15:0]OutputAddress;

always@(posedge clock)
begin
OutputAddress <=inputAddress;
end

assign outputAddress=OutputAddress;
endmodule