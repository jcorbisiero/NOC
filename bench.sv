
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
		
		$display("Bitmask: %b Turns[OP-1]:%b", bitmask,turns[outputPort-1]);
		$display("Input: %d	Output:%d", inputPort, outputPort);
		
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
		
		$display("Arbiter: %b %b %b %b %b", turns[0],turns[1],turns[2],turns[3], turns[4]);
		
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
		
		/*Clear Output values*/
		clear_delayed_output();
		
		/*Clear temp values*/
		reset_output();
		
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
			$display("INPUT BUFFER was empty for %s %d. Returning",
				input_buff.name, input_buff.index);
			return;
		end		
		
		header = input_buff.peek();
		
		/* Get output buffer */
		output_buff = get_output_buffer(header);

		/* Begin error checking and full check */
		if( output_buff.dir == inputPort ) begin
			$display("OUTPUT BUFFER is the same as INPUT PORT -- %s. Returning",
				output_buff.name);
			input_buff.pop();
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


		/*IF WE REACHED THIS POINT THEN PUT IT INTO OUTPUT BUFF*/
		output_buff.push( input_buff.pop() );

		/* Check for credits */
		if( credits[ output_buff.dir - 1] <= 0) begin
			$display("CREDITS FOR %s were %d. Returning",
				output_buff.name, credits[ output_buff.dir - 1]);
			return;
		end

		/*WE MADE IT. SEND TO OUTPUT*/
		outputs[output_buff.dir - 1] = output_buff.pop();

		/*----------------------------------------------*/
		/* THIS IS COMMENTED OUT -- UNCOMMENT */
		/* DONT FORGET ABOUT ME */
//->>> UNCOM	//credits[ output_buff.dir - 1] = credits[ output_buff.dir - 1] - 1;
		/*----------------------------------------------*/

		$display("OUTPUT %s should be %b",
		output_buff.name, outputs[output_buff.dir - 1]);
		
	endfunction;
	
	function void handle_input(int inputPort, logic [15:0] header_l);
	
		/* Check if input buffer is full and push */
		input_buff = get_input_buffer(inputPort);
		assert( input_buff.dir == inputPort );
		if( input_buff.isFull() ) begin
			$display("INPUT BUFFER is full for %s. Returning",
				input_buff.name);
			return;
		end		
		input_buff.push(header_l);
	
	endfunction

	//golden result
	function void golden_result(logic [15:0] header_l);
		
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
		
		/*Move output to special buffers for Checker*/
        	move_outputs();
        	
        	/* NOC seems to advance arbiter before inputs*/
        	/* IS THIS CORRECT? */
              	arbiter.advance();
        	
        	advance_inputPort(c.NORTH);
        	advance_inputPort(c.SOUTH);
        	advance_inputPort(c.EAST);
        	advance_inputPort(c.WEST);
        	advance_inputPort(c.LOCAL);
        	
		if( inputs[c.NORTH - 1] != -1 && !N_full) begin
			handle_input(c.NORTH, header_l);
		end
		if( inputs[c.SOUTH - 1] != -1 && !S_full) begin
			handle_input(c.SOUTH, header_l);
		end
		if( inputs[c.EAST - 1] != -1 && !E_full) begin
			handle_input(c.EAST, header_l);
		end
		if( inputs[c.WEST - 1] != -1 && !W_full) begin
			handle_input(c.WEST, header_l);
		end
		if( inputs[c.LOCAL - 1] != -1 && !L_full) begin
			handle_input(c.LOCAL, header_l);
        	end	
        	
        	L_input_buff.print();
        	$display("%d",delayed_outputs[0]);
        	$display("%d",delayed_outputs[1]);
        	$display("%d",delayed_outputs[2]);
        	$display("%d",delayed_outputs[3]);
        	$display("%d",delayed_outputs[4]);
        
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
	
	function void check_results(int data_o, int enable_o, int value, int dir, router_env env);
		
		if( enable_o || value != -1) begin
			$display("%d DUT Data_o: %d, enable_o: %d",
				dir, data_o, enable_o);
			$display("%d TST Data_o: %d",
				dir, value);
			if( data_o != value || !enable_o) begin
				$display("ERROR at cycle %d", env.cycle);
				$exit();
			end
		end
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
	rand logic [3:0] x;
	rand logic [3:0] y;
    
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
	constraint x_val { x == 4'b1000 || x == 4'b0100 || x == 4'b0010 || x == 4'b0001; }
	constraint y_val { y == 4'b1000 || y == 4'b0100 || y == 4'b0010 || y == 4'b0001; }


endclass

program tb (ifc.bench n_ds,ifc.bench s_ds,ifc.bench e_ds,
		ifc.bench w_ds,ifc.bench l_ds,ifc.bench ctrl_ds);
		
    router_test test;
    router_transaction packet; 
    router_checker checker;
    router_env env;
    int cycle; // For DVE
    
    /*Temp variables*/
    logic [15:0] header;
    
    Constants c;

	task do_warmup;
	
		env.cycle++;
	        cycle = env.cycle;
	        packet = new(env);
        	packet.randomize();
        	
        	test.rst <= 1;
		ctrl_ds.cb.rst <= 1;
        
        	@(ctrl_ds.cb);

        	test.golden_result(0);
	
	endtask
	
	task activate_message(int input_port, logic [15:0] header_l);

		if( input_port == c.NORTH ) begin
			n_ds.cb.valid_i <= 1;
			n_ds.cb.data_i <= header_l;
			test.inputs[c.NORTH - 1] = header_l;
		end
		else if( input_port == c.SOUTH ) begin
			s_ds.cb.valid_i <= 1;
			s_ds.cb.data_i <= header_l;
			test.inputs[c.SOUTH - 1] = header_l;
		end
		else if( input_port == c.EAST ) begin
			e_ds.cb.valid_i <= 1;
			e_ds.cb.data_i <= header_l;
			test.inputs[c.EAST - 1] = header_l;
		end
		else if( input_port == c.WEST ) begin
			w_ds.cb.valid_i <= 1;
			w_ds.cb.data_i <= header_l;
			test.inputs[c.WEST - 1] = header_l;
		end
		else if( input_port == c.LOCAL ) begin
			l_ds.cb.valid_i <= 1;
			l_ds.cb.data_i <= header_l;
			test.inputs[c.LOCAL - 1] = header_l;
		end
		else begin
			$display("NO VALID INPUT PORT FOR %d", input_port);
		end
	endtask

    task do_cycle;
        env.cycle++;
        cycle = env.cycle;
        packet = new(env);
        packet.randomize();
        
        test.clear_input();
        test.clear_delayed_output();
        
        //Reset inputs to DUT
        n_ds.cb.valid_i <= 0;
	n_ds.cb.data_i <= 0;
	s_ds.cb.valid_i <= 0;
	s_ds.cb.data_i <= 0;
	e_ds.cb.valid_i <= 0;
	e_ds.cb.data_i <= 0;
	w_ds.cb.valid_i <= 0;
	w_ds.cb.data_i <= 0;
	l_ds.cb.valid_i <= 0;
	l_ds.cb.data_i <= 0;        
        
        header = { 8'b00000000 , packet.x, packet.y };
        
        $display("\n------------------------------------");
	$display("After randomize - X:%d, Y:%d Rst:%d Reset_Density:%f",
		packet.x,packet.y,packet.rst,env.reset_density);

	$display("Header: %b", header);
	
	
	test.rst 	<= (packet.rst < 10*env.reset_density);
        ctrl_ds.cb.rst 	<= (packet.rst < 10*env.reset_density);
        
	n_ds.cb.credit_i <= 1;
	s_ds.cb.credit_i <= 1;
	e_ds.cb.credit_i <= 1;
	w_ds.cb.credit_i <= 1;
	l_ds.cb.credit_i <= 1;
        
        //if( packet.rst > 7) begin
        	if( env.input1_active ) begin
        		$display("Activating port 1");
        		activate_message(packet.input_port1,header);
        	end 
        //end
        if( env.input2_active ) begin
        	$display("Activating port 2");
	        activate_message(packet.input_port2,header);
        end 
        if( env.input3_active ) begin
        	$display("Activating port 3");
	        activate_message(packet.input_port3,header);
        end 
        if( env.input4_active ) begin
        	$display("Activating port 4");
	        activate_message(packet.input_port4,header);
        end 
        if( env.input5_active ) begin
        	$display("Activating port 5");
	        activate_message(packet.input_port5,header);
        end 
        
        @(ctrl_ds.cb);
        
        test.golden_result(header);

    endtask

    initial begin
        test = new();
        checker = new();
        env = new();
        env.configure("env.txt");
        packet = new(env);
        
        test.XCOORD = env.XCOORD;
        test.YCOORD = env.YCOORD;
        
        $display("Starting validation with router at [%d,%d]",
        	test.XCOORD, test.YCOORD);

        // warm up
        repeat (env.warmup_time) begin
            do_warmup();
        end

        // testing
        repeat (env.max_transactions) begin
            do_cycle();
        
        	$display("------------------------------------------");
        	$display("CHECKING");
		//$display("%b %b", s_ds.cb.data_o, s_ds.cb.enable_o);
		checker.check_results(n_ds.cb.data_o, n_ds.cb.enable_o, test.delayed_outputs[c.NORTH -1], c.NORTH, env);
		checker.check_results(s_ds.cb.data_o, s_ds.cb.enable_o, test.delayed_outputs[c.SOUTH -1], c.SOUTH, env);
		checker.check_results(e_ds.cb.data_o, e_ds.cb.enable_o, test.delayed_outputs[c.EAST -1], c.EAST, env);
		checker.check_results(w_ds.cb.data_o, w_ds.cb.enable_o, test.delayed_outputs[c.WEST -1], c.WEST, env);
		checker.check_results(l_ds.cb.data_o, l_ds.cb.enable_o, test.delayed_outputs[c.LOCAL -1], c.LOCAL, env);
		$display("--------------------------------------");
        end
        
        $display("\n\n----%d cycles completed succesfully ----\n\n", env.cycle);
    end
endprogram
	