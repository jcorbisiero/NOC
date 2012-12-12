module arbiter(
	input clk,
	input rst,
	
	output [4:0] N_turn_o,
	output [4:0] S_turn_o,
	output [4:0] E_turn_o,
	output [4:0] W_turn_o,
	output [4:0] L_turn_o
);

reg [4:0] NTurn;
reg [4:0] STurn;
reg [4:0] ETurn;
reg [4:0] WTurn;
reg [4:0] LTurn;

always_comb begin
	N_turn_o <= NTurn;
	S_turn_o <= STurn;
	E_turn_o <= ETurn;
	W_turn_o <= WTurn;
	L_turn_o <= LTurn;
end

always_ff @(posedge clk) begin
	if (rst) begin
		//TODO:
		//initialize the Turn registers
	end else begin
		NTurn  <= NTurn >> 1;
		if (NTurn == 00000) NTurn <= 10000;

		STurn <= STurn >> 1;
		if (STurn == 01000) STurn <= STurn >> 1;
		else if (STurn == 00000) STurn <= 10000;

		ETurn <= ETurn >> 1;
		if (ETurn == 00100) ETurn <= ETurn >> 1;
		else if (ETurn == 00000) ETurn <= 10000;

		WTurn <= WTurn >> 1;
		if (WTurn == 00010) WTurn <= WTurn >> 1;
		else if (WTurn == 00000) WTurn <= 10000;

		LTurn <= LTurn >> 1;
		if (LTurn == 00001) LTurn <= 10000;
	end
end

endmodule