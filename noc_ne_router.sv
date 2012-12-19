module ne_router#(parameter XCOORD = 1111, parameter YCOORD = 1111)
(
	ifc S_ifc_a,
	ifc S_ifc_b,
	ifc W_ifc_a,
	ifc W_ifc_b,
	ifc L_ifc_a,
	ifc L_ifc_b,
	ifc.control control
);

//wires

wire S_pop;
wire W_pop;
wire L_pop;

wire [15:0] S_rcvd_data;
wire [15:0] W_rcvd_data;
wire [15:0] L_rcvd_data;

wire S_rcvd_valid;
wire W_rcvd_valid;
wire L_rcvd_valid;

wire [15:0] S_send_data;
wire [15:0] W_send_data;
wire [15:0] L_send_data;

wire S_send_enable;
wire W_send_enable;
wire L_send_enable;

wire S_full;
wire W_full;
wire L_full;

wire [4:0] S_turn;
wire [4:0] W_turn;
wire [4:0] L_turn;

wire [2:0] S_port_select;
wire [2:0] W_port_select;
wire [2:0] L_port_select;


//Ports

	inputPort sInPort(.clk(control.clk),
				.rst(control.rst), 
				.data_i(S_ifc_b.data), 
				.write_en(S_ifc_b.enable),
				.shift(S_pop),
				.data_o(S_rcvd_data),
				.read_valid_o(S_rcvd_valid));

	outputPort sOutPort(.clk(control.clk),
				.rst(control.rst),
				.data_i(S_send_data),
				.port_en(S_send_enable),
				.inc_credit_i(S_ifc_a.credit),
				.data_o(S_ifc_a.data),
				.send_data(S_ifc_a.enable),
				.full(S_full));


	inputPort wInPort(.clk(control.clk),
				.rst(control.rst), 
				.data_i(W_ifc_b.data), 
				.write_en(W_ifc_b.enable),
				.shift(W_pop),
				.data_o(W_rcvd_data),
				.read_valid_o(W_rcvd_valid));

	outputPort wOutPort(.clk(control.clk),
				.rst(control.rst),
				.data_i(W_send_data),
				.port_en(W_send_enable),
				.inc_credit_i(W_ifc_a.credit),
				.data_o(W_ifc_a.data),
				.send_data(W_ifc_a.enable),
				.full(W_full));


inputPort lInPort(.clk(control.clk),
			.rst(control.rst), 
			.data_i(L_ifc_b.data), 
			.write_en(L_ifc_b.enable),
			.shift(L_pop),
			.data_o(L_rcvd_data),
			.read_valid_o(L_rcvd_valid));

outputPort lOutPort(.clk(control.clk),
			.rst(control.rst),
			.data_i(L_send_data),
			.port_en(L_send_enable),
			.inc_credit_i(L_ifc_a.credit),
			.data_o(L_ifc_a.data),
			.send_data(L_ifc_a.enable),
			.full(L_full));


//Routing Logic
routeLogic#(.XCOORD(XCOORD), .YCOORD(YCOORD),
		.NORTH(0), .SOUTH(1), .EAST(0), .WEST(1)) route
(		.N_data_i('0),
		.S_data_i(S_rcvd_data[7:0]),
		.E_data_i('0),
		.W_data_i(W_rcvd_data[7:0]),
		.L_data_i(L_rcvd_data[7:0]),
		.N_valid_i('0),
		.S_valid_i(S_rcvd_valid),
		.E_valid_i('0),
		.W_valid_i(W_rcvd_valid),
		.L_valid_i(L_rcvd_valid),
		.N_port_full('0),
		.S_port_full(S_full),
		.E_port_full('0),
		.W_port_full(W_full),
		.L_port_full(L_full),
		.N_turn('0),
		.S_turn(S_turn),
		.E_turn('0),
		.W_turn(W_turn),
		.L_turn(L_turn),
		.N_port_select(),
		.S_port_select(S_port_select),
		.E_port_select(),
		.W_port_select(W_port_select),
		.L_port_select(L_port_select),
		.N_port_remove(),
		.S_port_remove(S_pop),
		.E_port_remove(),
		.W_port_remove(W_pop),
		.L_port_remove(L_pop),
		.N_port_enable(),
		.S_port_enable(S_send_enable),
		.E_port_enable(),
		.W_port_enable(W_send_enable),
		.L_port_enable(L_send_enable),
		.N_credit_inc(),
		.S_credit_inc(S_ifc_a.credit),
		.E_credit_inc(),
		.W_credit_inc(W_ifc_a.credit),
		.L_credit_inc(L_ifc_a.credit));

//Arbiter
arbiter arb(.clk(control.clk), 
	.rst(control.rst),
	.N_turn_o(),
	.S_turn_o(S_turn),
	.E_turn_o(),
	.W_turn_o(W_turn),
	.L_turn_o(L_turn));


//Switch
crossbarSwitch switch (
			.N_data_i('0),
			.S_data_i(S_rcvd_data),
			.E_data_i('0),
			.W_data_i(W_rcvd_data),
			.L_data_i(L_rcvd_data),
			.N_port_select(),
			.S_port_select(S_port_select),
			.E_port_select(),
			.W_port_select(W_port_select),
			.L_port_select(L_port_select),
			.N_data_o(),
			.S_data_o(S_send_data),
			.E_data_o(),
			.W_data_o(W_send_data),
			.L_data_o(L_send_data));

endmodule
