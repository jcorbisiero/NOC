module arbiter(
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
	output [15:0] N_data_i,
	output [15:0] S_data_i,
	output [15:0] E_data_i,
	output [15:0] W_data_i,
	output [15:0] L_data_i
);

//make ERROR = 111?
always_comb begin
	case(N_port_select)
		case 000: ERROR;
		case 001: N_data_o = S_data_in;
		case 010: N_data_o = E_data_in;
		case 011: N_data_o = W_data_in;
		case 100: N_data_o = L_data_in;
		default: N_data_o = 'x;//nothing, doesnt matter, dont care
	endcase

	case(S_port_select)
		case 000: S_data_o = N_data_in;
		case 001: ERROR;
		case 010: S_data_o = E_data_in;
		case 011: S_data_o = W_data_in;
		case 100: S_data_o = L_data_in;
		default: S_data_o = 'x;//nothing, doesnt matter, dont care
	endcase

	case(E_port_select) 
		case 000: E_data_o = N_data_in;
		case 001: E_data_o = S_data_in;
		case 010: ERROR;
		case 011: E_data_o = W_data_in;
		case 100: E_data_o = L_data_in;
		default: E_data_o = 'x;//nothing, doesnt matter, dont care
	endcase
	
	case(W_port_select) 
		case 000: W_data_o = N_data_in;
		case 001: W_data_o = S_data_in;
		case 010: W_data_o = E_data_in;
		case 011: ERROR;
		case 100: W_data_o = L_data_in;
		default: W_data_o = 'x;//nothing, doesnt matter, dont care
	endcase

	case(L_port_select) 
		case 000: L_data_o = N_data_in;
		case 001: L_data_o = S_data_in;
		case 010: L_data_o = E_data_in;
		case 011: L_data_o = W_data_in;
		case 100: ERROR;
		default: L_data_o = 'x;//nothing, doesnt matter, dont care
	endcase
end

endmodule