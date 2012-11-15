interface ifc_router(input bit clk);
  	//control
  	logic rst;
  	
  	//inputs
	logic valid_i;
	logic [15:0] data_i;
	logic credit_i;
	
	//outputs
	logic enable_o;
	logic [15:0] data_o;
	logic credit_o;

	clocking cb @(posedge clk);
		output rst;
	
    		output valid_i;
    		output data_i;
    		output credit_i;
    		
    		input enable_o;
		input data_o;
		input credit_o;
  	endclocking

  	modport router (
  		input clk,
  		input rst,
  		
		input valid_i,
		input data_i,
		input credit_i,
		
		output enable_o,
		output data_o,
		output credit_o
	);
	
	modport bench (clocking cb);

endinterface