interface ifc_noc(input bit clk);
  	//control
  	logic rst;
  	
  	//inputs
	logic [15:0] valid_i;
	logic [15:0][15:0] data_i;
	
	//outputs
	logic [15:0] valid_o;
	logic [15:0][15:0] data_o;

	clocking cb @(posedge clk);
		output rst;
	
    		output valid_i;
    		output data_i;
    		
    		input valid_o;
		input data_o;
  	endclocking

  	modport noc (
  		input clk,
  		input rst,
  		
		input valid_i,
		input data_i,
		
		output valid_o,
		output data_o
	);
	
	modport bench (clocking cb);

endinterface