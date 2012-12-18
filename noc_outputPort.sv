module outputPort(
	input clk,
	input rst,

	input [15:0] data_i,
	input port_en,
	input inc_credit_i,

	output logic [15:0] data_o,
	output logic send_data,
	output reg full
);

reg [2:0] count;

reg rst_n;
reg push_n;
reg pop_n;
reg empty;
reg error;

wire almost_empty;
wire half_full;
wire almost_full;

DW_fifo_s1_sf #(.width(16), .depth(5), .rst_mode(1)) buffer2(
		.clk, .rst_n,
		.push_req_n(push_n), .pop_req_n(pop_n),
		.data_in(data_i),
		.empty, .full,
		.data_out(data_o),
		.error,

		.diag_n('1), .almost_empty, .half_full, .almost_full
	);

always_comb begin

$display("----- OutputPort -------");

	if (rst) begin
		count <= 'b101;
		rst_n = 0;
		send_data = 0;
	end else begin
		rst_n = 1;
	end

	if (inc_credit_i) begin
		count <= count + 1;
		assert(count >= 0 && count <= 5);
	end 

	$display("Data out in outputPort: %b (%d)", data_o, data_o);
	
	if (port_en && !full) begin
		$display("Output push - %b Port_en: %d, Full:%d",
			data_i, port_en, full);
		push_n = 0;
	end else begin
		$display("Output not push - %b Port_en: %d, Full:%d",
			data_i, port_en, full);
		push_n = 1;
	end

	if (!empty && count != 0) begin
		$display("Pop 0 - %b", data_o);
		pop_n = 0;
		send_data = 1;
		count <= count - 1;
		assert(count >= 0 && count <= 5);
	end else begin
		$display("Pop 1 - %b", data_o);
		pop_n = 1;
		send_data = 0;
	end
	
	$display("Data_o - %b %d", data_o, send_data);

	//assert(!error);
end

endmodule
