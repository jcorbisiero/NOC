interface ifc(input bit clk);
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

	clocking cb @(negedge clk);
		output posedge rst;
	
    		output posedge valid_i;
    		output posedge data_i;
    		output posedge credit_i;

		input negedge data_o;    		
    		input negedge enable_o;
		input negedge credit_o;
  	endclocking

  	modport router (  		
		input valid_i,
		input data_i,
		input credit_i,
		
		output enable_o,
		output data_o,
		output credit_o
	);

	modport control (
		input clk,
		input rst
	);
	
	modport bench (clocking cb);

endinterface
