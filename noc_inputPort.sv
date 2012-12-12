module inputPort
(
	input clk,
	unput rst,
	input [15:0] data_i,
	input write_en,
	input shift,
	output [15:0] data_o,
	read_valid_o
);

//how to declare buffer from designware?
always_comb begin
	if (rst)
		buffer.rst_n = 0;
	else 
		buffer.rst_n = 1;

	if (write_en && !buffer.full) begin
		buffer.data_in = data_i;
		buffer.push_req_n = 0;
	else
		buffer.push_req_n = 1;
	end

	if (shift) begin
		assert(!buffer.empty);

		buffer.pop_req_n = 0;
	else
		buffer.pop_req_n = 1;
	end

	if (!buffer.empty) begin
		data_o = buffer.data_out;
		read_valid = 1;
	else 
		data_o = 0;
		read_valid = 0;
	end

	assert(!buffer.error);
end

endmodule