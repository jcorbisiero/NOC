/*
*	File to hold helper classes for bench(s)
*	Contains simulated router used by both benchs
*	Used by: bench_router.sv, bench_noc.sv
*
*	Author: Ilan
*	Date: 12/20/2012
*/

class Constants;
	static const int NORTH 	= 1;
	static const int SOUTH 	= 2;
	static const int EAST 	= 3;
	static const int WEST	= 4;
	static const int LOCAL 	= 5;
	
	static int BITMASKS [0:4] = {
				5'b10000, /*North*/
				5'b01000, /*South*/
				5'b00100, /*East*/
				5'b00010, /*West*/
				5'b00001  /*Local*/
				};

    	
endclass	

class arbiter;
	
	Constants c;
	logic [4:0] turns [4:0];
	
	/*Temporary variables*/
	int bitmask;
	
	function new();
		reset();
	endfunction
	
	function reset;
		/* 	Arbiter				*/
		/* These initializations match the code */
		/* DO NOT CHANGE UNLESS CHANGED IN CODE	*/
		turns[0] = 5'b01000; /*North*/
		turns[1] = 5'b00100; /*South*/
		turns[2] = 5'b00010; /*East*/
		turns[3] = 5'b00001; /*West*/
		turns[4] = 5'b10000; /*Local*/
	endfunction;
	
	function int is_turn(int inputPort, int outputPort);
		
		/*Get bitmask for proper port*/
		bitmask = c.BITMASKS[inputPort - 1];
		
		//$display("Bitmask: %b Turns[OP-1]:%b", bitmask,turns[outputPort-1]);
		//$display("Input: %d	Output:%d", inputPort, outputPort);
		
		/* Check if the inputPorts turn */
		if( turns[outputPort - 1] & bitmask) begin
			return 1;
		end
		
		return 0;
		
	endfunction
	
	function advance();
	
		/*North*/
		turns[0] = turns[0] >> 1;
		if( turns[0] == 5'b00000) turns[0] = 5'b01000;
		
		/*South*/
		turns[1] = turns[1] >> 1;
		if( turns[1] == 5'b01000) turns[1] = 5'b00100;
		else if (turns[1] == 5'b00000) turns[1] = 5'b10000;
		
		/*East*/
		turns[2] = turns[2] >> 1;
		if( turns[2] == 5'b00100) turns[2] = 5'b00010;
		else if (turns[2] == 5'b00000) turns[2] = 5'b10000;
		
		/*West*/
		turns[3] = turns[3] >> 1;
		if( turns[3] == 5'b00010) turns[3] = 5'b00001;
		else if (turns[3] == 5'b00000) turns[3] = 5'b10000;
		
		/*Local*/
		turns[4] = turns[4] >> 1;
		if( turns[4] == 5'b00001) turns[4] = 5'b10000;
		
		//$display("Arbiter: %b %b %b %b %b", turns[0],turns[1],turns[2],turns[3], turns[4]);
		
	endfunction

endclass

class buffer;
	
	/* Make sure to keep these sizes consistent */
	/* Compiler didnt like int buff[BUFF_SIZE:0] */
	int BUFF_SIZE = 5;
	int buff[5:0];
	
	int index = 0;	
	string name;
	int dir;
	
	/*Temp variable*/
	int data;
	
	function new(int dir, string name);
		this.dir = dir;
		this.name = name;
	endfunction
	
	function int push(int data);
		if( isFull() ) begin
			return -1;
		end
		buff[index] = data;
		index = index + 1;
	endfunction
	
	function int pop();
		if( isEmpty() )begin
			return -1;
		end
		index = index - 1;
		data = buff[0];
		for(int i = 1; i < BUFF_SIZE; i++) begin
			buff[ i - 1 ] = buff[i];
		end
		return data;
	endfunction
	
	function int peek();
		if( isEmpty() )begin
			return -1;
		end
		return buff[0];
	endfunction
	
	function void clear();
		index = 0;
		for(int i = 0; i < BUFF_SIZE; i++) begin
			buff[ i ] = 0;
		end
	endfunction
	
	function int isFull();
		return ( index == BUFF_SIZE );
	endfunction
	
	function int isEmpty();
		return ( index == 0 );
	endfunction
	
	function void print();
		for( int i = 0; i < BUFF_SIZE; i++) begin
			$display("%s[%d]=%d",name,i,buff[i]);
		end
	endfunction
endclass
					
					
class router_test;
    	
    	Constants c;
    	
    	bit rst;
    	int XCOORD;
    	int YCOORD;
	arbiter arbiter = new();
	buffer N_input_buff 	= new(c.NORTH, 	"N INPUT");
	buffer N_output_buff 	= new(c.NORTH, 	"N OUTPUT");
	buffer S_input_buff	= new(c.SOUTH, 	"S INPUT");	
	buffer S_output_buff	= new(c.SOUTH,	"S OUTPUT");
	buffer E_input_buff	= new(c.EAST, 	"E INPUT");
	buffer E_output_buff	= new(c.EAST, 	"E OUTPUT");
	buffer W_input_buff	= new(c.WEST, 	"W INPUT");
	buffer W_output_buff	= new(c.WEST, 	"W OUTPUT");
	buffer L_input_buff	= new(c.LOCAL,	"L INPUT");
	buffer L_output_buff	= new(c.LOCAL, 	"L OUTPUT");
	int credits [4:0];
	int outputs [4:0];
	int inputs  [4:0];
	int delayed_outputs[4:0];
	int message_counter [4:0];
	
	router_test neighbors [3:0];
	
	/* Temporaray variables */
	buffer input_buff;
	buffer output_buff;
	logic [15:0] header;
	int dir_to_send;
	int is_turn;
	int N_full, S_full, W_full, E_full, L_full;
	
	function void reset();
		
		arbiter.reset();
				
		/* Buffers */
		N_input_buff.clear();
		N_output_buff.clear();
		S_input_buff.clear();
		S_output_buff.clear();
		E_input_buff.clear();
		E_output_buff.clear();
		W_input_buff.clear();
		W_output_buff.clear();
		L_input_buff.clear();
		L_output_buff.clear();
		
		/*Clear temp values*/
		reset_output();
		
		clear_input();
		
		/*Credits */
		reset_credits();
		
		return;
	endfunction
	
	function void clear_input();
		inputs[0] = -1;
		inputs[1] = -1;
		inputs[2] = -1;
		inputs[3] = -1;
		inputs[4] = -1;
	endfunction
	
	function void clear_delayed_output();
		delayed_outputs[0] = -1;
		delayed_outputs[1] = -1;
		delayed_outputs[2] = -1;
		delayed_outputs[3] = -1;
		delayed_outputs[4] = -1;
	endfunction
	
	function void reset_output();
		outputs[0] = -1;
		outputs[1] = -1;
		outputs[2] = -1;
		outputs[3] = -1;
		outputs[4] = -1;
	endfunction
	
	function void reset_credits();
		credits[0] = 5;
		credits[1] = 5;
		credits[2] = 5;
		credits[3] = 5;
		credits[4] = 5;
	endfunction
	
	function buffer get_input_buffer(int inputPort);
		if( inputPort == c.NORTH ) begin
			return N_input_buff;
		end
		else if ( inputPort == c.SOUTH ) begin
			return S_input_buff;
		end
		else if ( inputPort == c.WEST ) begin
			return W_input_buff;
		end
		else if ( inputPort == c.EAST ) begin
			return E_input_buff;
		end
		else if ( inputPort == c.LOCAL ) begin
			return L_input_buff;
		end
		else begin
			$display("ERROR in get_input_buffer. InputPort: %d",
				inputPort);
			$exit();
		end
	endfunction
	
	function buffer get_output_buffer(logic [15:0] header_l);
	
		int H_YCOORD = header_l[3:0];
		int H_XCOORD = header_l[7:4];
	
		if( H_YCOORD < YCOORD ) begin
			return N_output_buff;
		end
		else if ( H_YCOORD > YCOORD ) begin
			return S_output_buff;
		end
		else if ( H_YCOORD == YCOORD && H_XCOORD < XCOORD ) begin
			return W_output_buff;
		end
		else if ( H_YCOORD == YCOORD && H_XCOORD > XCOORD ) begin
			return E_output_buff;
		end
		else if ( H_YCOORD == YCOORD && H_XCOORD == XCOORD ) begin
			return L_output_buff;
		end
		else begin
			$display("ERROR in get_output_buffer. Header: %b -- to [%d,%d]",
				header_l, XCOORD, YCOORD);
			$exit();
		end
	endfunction
	
	function void advance_inputPort(int inputPort);
		
		input_buff = get_input_buffer(inputPort);
		assert( input_buff.dir == inputPort );
		if( input_buff.isEmpty() ) begin
			//$display("INPUT BUFFER was empty for %s %d. Returning",
			//	input_buff.name, input_buff.index);
			return;
		end		
		
		header = input_buff.peek();
		$display("Peeking at input %d of input_buff %s (%d,%d)", 
				header, input_buff.name, XCOORD, YCOORD);
		
		/* Get output buffer */
		output_buff = get_output_buffer(header);
		$display("Output buff was: %s", output_buff.name);

		/* Begin error checking and full check */
		if( output_buff.dir == inputPort ) begin
			$display("OUTPUT BUFFER is the same as INPUT PORT -- %s. Returning",
				output_buff.name);
			input_buff.pop();
			inc_neighbors_credits(input_buff.dir);
			return;
		end
		if( (input_buff.dir == c.EAST || input_buff.dir == c.WEST) &&
			header[3:0] != YCOORD ) begin
			$display("Illegal port for %s (Attempt to send to %s)",
				input_buff.name, output_buff.name);
			input_buff.pop();
			inc_neighbors_credits(input_buff.dir);
			return;
		end
		if( output_buff.isFull() ) begin
			$display("OUTPUT BUFFER is full -- %s. Returning",
					output_buff.name);
			return;
		end


		/*Check arbiter */
		is_turn = arbiter.is_turn(input_buff.dir, output_buff.dir);
		$display("Checking: %s. Sending to: %s 	IP: %d	OP: %d",
			input_buff.name, output_buff.name, input_buff.dir, 
			output_buff.dir);
		if( !is_turn ) begin
			$display("Wasnt %s turn for %s. Returning",
				input_buff.name, output_buff.name);
			return;
		end

		$display("Popping off input_buff %s onto output buff %s",
			input_buff.name, output_buff.name);

		/*IF WE REACHED THIS POINT THEN PUT IT INTO OUTPUT BUFF*/
		output_buff.push( input_buff.pop() );
		message_counter[ output_buff.dir - 1] = message_counter[ output_buff.dir - 1] + 1;

		inc_neighbors_credits( input_buff.dir );

		/* Check for credits */
		if( credits[ output_buff.dir - 1] <= 0) begin
			$display("CREDITS FOR %s were %d. Returning",
				output_buff.name, credits[ output_buff.dir - 1]);
			return;
		end

		/*WE MADE IT. SEND TO OUTPUT*/
		if( credits[output_buff.dir - 1] != 0) begin
			if( credits[ output_buff.dir] < 0 ) begin
				$display("CREDITS < 0 for %s", output_buff.name);
				$exit();
			end
			
			$display( "Placing onto output buff of %s", 
				output_buff.name);
			outputs[output_buff.dir - 1] = output_buff.pop();

			credits[ output_buff.dir - 1] = credits[ output_buff.dir - 1] - 1;

			$display("OUTPUT %s should be %b (dir:%d)",
				output_buff.name, outputs[output_buff.dir - 1], output_buff.dir);
		end
		
	endfunction;
	
	function void handle_input(int inputPort, logic [15:0] header_l);
	
		/* Check if input buffer is full and push */
		input_buff = get_input_buffer(inputPort);
		assert( input_buff.dir == inputPort );
		if( input_buff.isFull() ) begin
			//$display("INPUT BUFFER is full for %s. Returning",
			//	input_buff.name);
			return;
		end
		$display("Pushing %d onto input_buff", header_l);
		input_buff.push(header_l);
	
	endfunction

	//golden result
	function void golden_result();
		
		/*Pass Messages on to Neighbors*/
		send_to_neighbors();
		
		/*Move output to special buffers for Checker*/
        	move_outputs();
		
		if (rst) begin
			reset();
			$display("Resetting golden model");
			return;
		end
		
		/*--Work backwards-- */
		/* First check output*/
		/* Then advance all buffers*/
		/* Last, add new input to buffers*/
		
		N_full = N_input_buff.isFull();
		S_full = S_input_buff.isFull();
		E_full = E_input_buff.isFull();
		W_full = W_input_buff.isFull();
		L_full = L_input_buff.isFull();
        	
        	advance_inputPort(c.NORTH);
        	advance_inputPort(c.SOUTH);
        	advance_inputPort(c.EAST);
        	advance_inputPort(c.WEST);
        	advance_inputPort(c.LOCAL);
        	
		if( inputs[c.NORTH - 1] != -1 && !N_full) begin
			handle_input(c.NORTH, inputs[c.NORTH - 1]);
		end
		if( inputs[c.SOUTH - 1] != -1 && !S_full) begin
			handle_input(c.SOUTH, inputs[c.SOUTH - 1]);
		end
		if( inputs[c.EAST - 1] != -1 && !E_full) begin
			handle_input(c.EAST, inputs[c.EAST - 1]);
		end
		if( inputs[c.WEST - 1] != -1 && !W_full) begin
			handle_input(c.WEST, inputs[c.WEST - 1]);
		end
		if( inputs[c.LOCAL - 1] != -1 && !L_full) begin
			$display("Checking local -- %d", inputs[c.LOCAL-1]);
			handle_input(c.LOCAL, inputs[c.LOCAL - 1]);
        	end	
        	
        	//N_output_buff.print();
        	//$display("%d",outputs[0]);
        	//$display("%d",outputs[1]);
		//$display("%d",outputs[2]);
		//$display("%d",outputs[3]);
        	//$display("%d",outputs[4]);
        	/*
        	L_input_buff.print();
        	E_input_buff.print();
        	S_input_buff.print();
        	W_input_buff.print();
        	*/
        	
		/* Based on negedge/posedge rst -- this comes
		 before or after advance_inputPort*/
		/* IS THIS CORRECT? */
              	arbiter.advance();
        
    endfunction
    
    function void inc_neighbors_credits( int input_port );
    	
    	/* Increment credits of N neighbor, S port */
	if( neighbors[0] && input_port == c.NORTH) begin
		neighbors[0].credits[1]++; 
		$display("INC Neighbor %d Port%d",0,1);
	end
        	
        /* Increment credits of S neighbor, N port */
	if( neighbors[1] && input_port == c.SOUTH) begin
		neighbors[1].credits[0]++; 
		$display("INC Neighbor %d Port%d",1,0);
	end
	
	/* Increment credits of E neighbor, W port */
	if( neighbors[2] && input_port == c.EAST) begin
		neighbors[2].credits[3]++; 
		$display("INC Neighbor %d Port%d",2,3);
	end
	/* Increment credits of W neighbor, E port */
	if( neighbors[3] && input_port == c.WEST) begin
		neighbors[3].credits[2]++; 
		$display("INC Neighbor %d Port%d",3,2);
	end
    
    endfunction
    
    function void send_to_neighbors();
    
    	/* Send N message to S port of neighbor*/
    	if( neighbors[0]) begin
    		neighbors[0].inputs[1] = -1;
    		if(outputs[0] > 0) begin 
    			neighbors[0].handle_input(c.SOUTH, outputs[0]);
    		end
    		//$display("Sending to neighbor 0");
    	end
    	
    	/* Send S message to N port of neighbor*/
	if( neighbors[1]) begin
		neighbors[1].inputs[0] = -1;
		if(outputs[1] > 0) begin
			neighbors[1].handle_input(c.NORTH, outputs[1]);
		end
		//$display("Sending to neighbor 1");
    	end
    	
    	/* Send E message to W port of neighbor*/
	if( neighbors[2]) begin
	    	neighbors[2].inputs[3] = -1;
	    	if(outputs[2] > 0) begin
	    		neighbors[2].handle_input(c.WEST, outputs[2]);
		end
		//$display("Sending to neighbor 2");
	end
	
	/* Send W message to E port of neighbor*/
	if( neighbors[3] ) begin
		neighbors[3].inputs[2] = -1;
		if( outputs[3] > 0 ) begin
			neighbors[3].handle_input(c.EAST, outputs[3]);
		end
		//$display("Sending to neighbor 3");
	end
    endfunction
    
    function void move_outputs();
	delayed_outputs[0] = outputs[0];
	delayed_outputs[1] = outputs[1];
	delayed_outputs[2] = outputs[2];
	delayed_outputs[3] = outputs[3];
	delayed_outputs[4] = outputs[4];
	
	outputs[0] = -1;
	outputs[1] = -1;
	outputs[2] = -1;
	outputs[3] = -1;
	outputs[4] = -1;
    endfunction
    
    function void print_outputs();
    	for( int i = 0; i < 5; i++) begin
    		$display("Output[%d] = %d",i,outputs[i]);
    	end
    endfunction
endclass

class router_env;
    int cycle = 0;
    int max_transactions = 20;
    int warmup_time = 2;
    bit verbose = 1;
    
    real reset_density = 0.0;
    
    int XCOORD=2;
    int YCOORD=2;
    
    bit use_input1 [4:0];
    bit use_input2 [4:0];
    bit use_input3 [4:0];
    bit use_input4 [4:0];
    bit use_input5 [4:0];
    
    bit input1_active = 1;
    bit input2_active = 0;
    bit input3_active = 0;
    bit input4_active = 0;
    bit input5_active = 0;

    function configure(string filename);
        int file, value, seed, chars_returned;
        string param;
        file = $fopen(filename, "r");
        while(!$feof(file)) begin
            chars_returned = $fscanf(file, "%s %d", param, value);
            if ("RANDOM_SEED" == param) begin
                seed = value;
                $srandom(seed);
            end
            else if("TRANSACTIONS" == param) begin
                max_transactions = value;
            end
            else if("XCOORD" == param) begin
            	this.XCOORD = value;
            end
            else if("YCOORD" == param) begin
	        this.YCOORD = value;
            end
            else if("RESET_DENSITY" == param) begin
            	this.reset_density = value;
            end
            else if("INPUT1" == param) begin
            	$display("In input1");
            	if( value == 1 ) input1_active = 1; 
            	chars_returned = $fscanf(file, "%d %d %d %d %d", 
            		use_input1[0], use_input1[1], use_input1[2], use_input1[3], use_input1[4]);
            	$display("%d %d %d %d %d", 
            		use_input1[0], use_input1[1], use_input1[2], use_input1[3], use_input1[4]);
            end
            else if("INPUT2" == param) begin
		$display("In input2");
		if( value == 1 ) input2_active = 1; 
		chars_returned = $fscanf(file, "%d %d %d %d %d", 
			use_input2[0], use_input2[1], use_input2[2], use_input2[3], use_input2[4]);
		$display("%d %d %d %d", 
			use_input2[0], use_input2[1], use_input2[2], use_input2[3], use_input2[4]);
            end
            else if("INPUT3" == param) begin
		$display("In input3");
		if( value == 1 ) input3_active = 1; 
		chars_returned = $fscanf(file, "%d %d %d %d %d", 
			use_input3[0], use_input3[1], use_input3[2], use_input3[3], use_input3[4]);
    	    end
    	    else if("INPUT4" == param) begin
		$display("In input4");
		if( value == 1 ) input4_active = 1; 
		chars_returned = $fscanf(file, "%d %d %d %d %d", 
			use_input4[0], use_input4[1], use_input4[2], use_input4[3], use_input4[4]);
    	    end
    	    else if("INPUT5" == param) begin
		$display("In input5");
		if( value == 1 ) input5_active = 1; 
		chars_returned = $fscanf(file, "%d %d %d %d %d", 
		use_input5[0], use_input5[1], use_input5[2], use_input5[3], use_input5[4]);
	    end
        end
    endfunction
endclass

class router_checker;	//checker class
	
	Constants c;	
	
	function int check_results(int data_o, int enable_o, int value, int dir, router_env env);
		
		if( enable_o || value != -1) begin
			$display("%d DUT Data_o: %d, enable_o: %d",
				dir, data_o, enable_o);
			$display("%d TST Data_o: %d",
				dir, value);
			if( data_o != value || !enable_o) begin
				$display("ERROR at cycle %d", env.cycle);
				$exit();
			end
			return 1;
		end
		return 0;
	endfunction  
endclass


class router_transaction;

	router_env env;

    	rand int rst;
    
	/*Packet enters into router here*/
	rand int input_port1;
	rand int input_port2;
	rand int input_port3;
	rand int input_port4;
	rand int input_port5;

	/* Destination address of packet*/
	rand logic [3:0] x1;
	rand logic [3:0] y1;
	rand logic [3:0] x2;
	rand logic [3:0] y2;
	rand logic [3:0] x3;
	rand logic [3:0] y3;
	rand logic [3:0] x4;
	rand logic [3:0] y4;
	rand logic [3:0] x5;
	rand logic [3:0] y5;
    
	function new(router_env env);
		this.env = env;
	endfunction

	function void pre_randomize();
		if( !env.input1_active ) in1_val.constraint_mode(0);
		if( !env.input2_active ) in2_val.constraint_mode(0);
		if( !env.input3_active ) in3_val.constraint_mode(0);
		if( !env.input4_active ) in4_val.constraint_mode(0);
		if( !env.input5_active ) in5_val.constraint_mode(0);
	endfunction

	constraint rst_val { rst >= 0 && rst <= 10; }
	constraint in1_val { (env.use_input1[0] && input_port1 == 1) ||  
			(env.use_input1[1] && input_port1 == 2) ||
			(env.use_input1[2] && input_port1 == 3) ||
			(env.use_input1[3] && input_port1 == 4) ||
			(env.use_input1[4] && input_port1 == 5);
			}
	constraint in2_val { (env.use_input2[0] && input_port2 == 1) ||  
			(env.use_input2[1] && input_port2 == 2) ||
			(env.use_input2[2] && input_port2 == 3) ||
			(env.use_input2[3] && input_port2 == 4) ||
			(env.use_input2[4] && input_port2 == 5);
			}
	constraint in3_val { (env.use_input3[0] && input_port3 == 1) ||  
			(env.use_input3[1] && input_port3 == 2) ||
			(env.use_input3[2] && input_port3 == 3) ||
			(env.use_input3[3] && input_port3 == 4) ||
			(env.use_input3[4] && input_port3 == 5);
			}
	constraint in4_val { (env.use_input4[0] && input_port4 == 1) ||  
			(env.use_input4[1] && input_port4 == 2) ||
			(env.use_input4[2] && input_port4 == 3) ||
			(env.use_input4[3] && input_port4 == 4) ||
			(env.use_input4[4] && input_port4 == 5);
			}
	constraint in5_val { (env.use_input5[0] && input_port5 == 1) ||  
			(env.use_input5[1] && input_port5 == 2) ||
			(env.use_input5[2] && input_port5 == 3) ||
			(env.use_input5[3] && input_port5 == 4) ||
			(env.use_input5[4] && input_port5 == 5);
			}
	constraint x1_val { x1 == 4'b1000 || x1 == 4'b0100 || x1 == 4'b0010 || x1 == 4'b0001; }
	constraint y1_val { y1 == 4'b1000 || y1 == 4'b0100 || y1 == 4'b0010 || y1 == 4'b0001; }
	constraint x2_val { x2 == 4'b1000 || x2 == 4'b0100 || x2 == 4'b0010 || x2 == 4'b0001; }
	constraint y2_val { y2 == 4'b1000 || y2 == 4'b0100 || y2 == 4'b0010 || y2 == 4'b0001; }
	constraint x3_val { x3 == 4'b1000 || x3 == 4'b0100 || x3 == 4'b0010 || x3 == 4'b0001; }
	constraint y3_val { y3 == 4'b1000 || y3 == 4'b0100 || y3 == 4'b0010 || y3 == 4'b0001; }
	constraint x4_val { x4 == 4'b1000 || x4 == 4'b0100 || x4 == 4'b0010 || x4 == 4'b0001; }
	constraint y4_val { y4 == 4'b1000 || y4 == 4'b0100 || y4 == 4'b0010 || y4 == 4'b0001; }
	constraint x5_val { x5 == 4'b1000 || x5 == 4'b0100 || x5 == 4'b0010 || x5 == 4'b0001; }
	constraint y5_val { y5 == 4'b1000 || y5 == 4'b0100 || y5 == 4'b0010 || y5 == 4'b0001; }


endclass
