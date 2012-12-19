module crossbarSwitch(
	input [15:0] N_data_i,
	input [15:0] S_data_i,
	input [15:0] E_data_i,
	input [15:0] W_data_i,
	input [15:0] L_data_i,
	input [2:0] N_port_select,
	input [2:0] S_port_select,
	input [2:0] E_port_select,
	input [2:0] W_port_select,
	input [2:0] L_port_select,
	output reg [15:0] N_data_o,
	output reg [15:0] S_data_o,
	output reg [15:0] E_data_o,
	output reg [15:0] W_data_o,
	output reg [15:0] L_data_o
);

always_comb begin

	//$display("----- Switch -------");

	case(N_port_select)
		3'b000: N_data_o = 16'bx;
		3'b001: N_data_o = S_data_i;
		3'b010: N_data_o = E_data_i;
		3'b011: N_data_o = W_data_i;
		3'b100: N_data_o = L_data_i;
		default: N_data_o = 16'bx;
	endcase

	case(S_port_select)
		3'b000: S_data_o = N_data_i;
		3'b001: S_data_o = 16'bx;
		3'b010: S_data_o = E_data_i;
		3'b011: S_data_o = W_data_i;
		3'b100: S_data_o = L_data_i;
		default: S_data_o = 16'bx;		
	endcase

	case(E_port_select) 
		3'b000: E_data_o = N_data_i;
		3'b001: E_data_o = S_data_i;
		3'b010: E_data_o = 16'bx;
		3'b011: E_data_o = W_data_i;
		3'b100: E_data_o = L_data_i;
		default: E_data_o = 16'bx;
	endcase
	
	case(W_port_select) 
		3'b000: W_data_o = N_data_i;
		3'b001: W_data_o = S_data_i;
		3'b010: W_data_o = E_data_i;
		3'b011: W_data_o = 16'bx;
		3'b100: W_data_o = L_data_i;
		default: W_data_o = 16'bx;
	endcase

	case(L_port_select) 
		3'b000: L_data_o = N_data_i;
		3'b001: L_data_o = S_data_i;
		3'b010: L_data_o = E_data_i;
		3'b011: L_data_o = W_data_i;
		3'b100: L_data_o = 16'bx;
		default: L_data_o = 16'bx;
	endcase
	
end

endmodule
