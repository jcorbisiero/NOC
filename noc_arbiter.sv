module arbiter(
	input clk,
	input rst,
	
	output logic [4:0] N_turn_o,
	output logic [4:0] S_turn_o,
	output logic [4:0] E_turn_o,
	output logic [4:0] W_turn_o,
	output logic [4:0] L_turn_o
);

reg [4:0] NTurn;
reg [4:0] STurn;
reg [4:0] ETurn;
reg [4:0] WTurn;
reg [4:0] LTurn;

always_ff @(posedge clk) begin
	N_turn_o <= NTurn;
	S_turn_o <= STurn;
	E_turn_o <= ETurn;
	W_turn_o <= WTurn;
	L_turn_o <= LTurn;
	
	$display("STurn: %b, STurn_o: %b",STurn, S_turn_o);
end

always_ff @(posedge clk) begin
$display("------ Arbiter ------");
	if (rst) begin
		NTurn <= 5'b01000;
		STurn <= 5'b00100;
		ETurn <= 5'b00010;
		WTurn <= 5'b00001;
		LTurn <= 5'b10000;	
	end else begin
		NTurn <= NTurn >> 1;
		if (NTurn >> 1== 5'b00000) NTurn <= 5'b01000;

		$display("STurn Before: %b", STurn);

		STurn <= STurn >> 1;
		if (STurn >> 1== 5'b01000) begin 
			STurn <= STurn >> 1;
			$display("S1");
		end
		else if (STurn >> 1== 5'b00000)begin
			STurn <= 5'b10000;
			$display("S2");
		end
		$display("STurn After: %b", STurn);

		ETurn <= ETurn >> 1;
		if (ETurn >> 1== 5'b00100) ETurn <= ETurn >> 1;
		else if (ETurn >> 1== 5'b00000) ETurn <= 5'b10000;

		WTurn <= WTurn >> 1;
		if (WTurn >> 1== 5'b00010) WTurn <= WTurn >> 1;
		else if (WTurn >> 1== 5'b00000) WTurn <= 5'b10000;

		LTurn <= LTurn >> 1;
		if (LTurn >> 1== 5'b00001) LTurn <= 5'b10000;
	end
end

endmodule
