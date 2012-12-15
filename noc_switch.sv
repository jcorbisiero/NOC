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
	case(N_port_select)
		000: N_data_o = 16'bx;
		001: N_data_o = S_data_i;
		010: N_data_o = E_data_i;
		011: N_data_o = W_data_i;
		100: N_data_o = L_data_i;
		default: N_data_o = 16'bx;
	endcase

	case(S_port_select)
		000: S_data_o = N_data_i;
		001: S_data_o = 16'bx;
		010: S_data_o = E_data_i;
		011: S_data_o = W_data_i;
		100: S_data_o = L_data_i;
		default: S_data_o = 16'bx;
	endcase

	case(E_port_select) 
		000: E_data_o = N_data_i;
		001: E_data_o = S_data_i;
		010: E_data_o = 16'bx;
		011: E_data_o = W_data_i;
		100: E_data_o = L_data_i;
		default: E_data_o = 16'bx;
	endcase
	
	case(W_port_select) 
		000: W_data_o = N_data_i;
		001: W_data_o = S_data_i;
		010: W_data_o = E_data_i;
		011: W_data_o = 16'bx;
		100: W_data_o = L_data_i;
		default: W_data_o = 16'bx;
	endcase

	case(L_port_select) 
		000: L_data_o = N_data_i;
		001: L_data_o = S_data_i;
		010: L_data_o = E_data_i;
		011: L_data_o = W_data_i;
		100: L_data_o = 16'bx;
		default: L_data_o = 16'bx;
	endcase
end

endmodule
