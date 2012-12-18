module inputPort
(
	input clk,
	input rst,

	input [15:0] data_i,
	input write_en,
	input shift,

	output [15:0] data_o,
	output reg read_valid_o
);

reg rst_n;
reg push_n;
reg pop_n;
reg empty;
reg full;
reg error;

wire almost_empty;
wire half_full;
wire almost_full;

DW_fifo_s1_sf#(.width(16), .depth(5), .rst_mode(1))  buffer(
		.clk, .rst_n, 
		.push_req_n(push_n), .pop_req_n(pop_n),
		.data_in(data_i),
		.empty, .full,
		.data_out(data_o),
		.error,

		.diag_n('1), .almost_empty, .half_full, .almost_full
	);

always_comb begin
	if (rst) begin
		rst_n = 0;
	end else begin
		rst_n = 1;
	end


	if (write_en == 1 && !full) begin
		$display("Pushing -- Data_i:%d Data_out:%d", data_i, data_o);
		push_n = 0;
	end else begin
		$display("Not Pushing -- Data_i:%d Write_en: %d Full:%d Data_out:%d",
			data_i, write_en, full,data_o);
		push_n = 1;
	end


	if (shift) begin
		assert(!empty);
		$display("Popping in input");
		pop_n = 0;
	end else begin
		pop_n = 1;
	end


	if (!empty) begin
		read_valid_o = 1;
	end else begin
		read_valid_o = 0;
	end

	//assert(!error);
end

endmodule
