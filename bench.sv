
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

class router_transaction;
    rand bit rst;
    
    rand int input_port;
    rand logic [3:0] x;
    rand logic [3:0] y;
    
    constraint in_val { input_port >= 1 && input_port <= 5; }
    constraint x_val { x == 4'b1000 || x == 4'b0100 || x == 4'b0010 || x == 4'b0001 || 4 == 5'b0000; }
    constraint y_val { y == 4'b1000 || y == 4'b0100 || y == 4'b0010 || y == 4'b0001 || 4 == 5'b0000; }
    

endclass

class arbiter;
	
	Constants c;
	int turns [4:0];
	
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
		if( turns[4] == 5'b0001) turns[4] = 5'b10000;
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
	
	/* Temporaray variables */
	buffer input_buff;
	buffer output_buff;
	logic [15:0] header;
	int dir_to_send;
	int is_turn;
	
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
		
		/*Output values*/
		clear_output();
		
		/*Credits */
		reset_credits();
		
		return;
	endfunction
	
	function void clear_input();
		inputs[0] = 0;
		inputs[1] = 0;
		inputs[2] = 0;
		inputs[3] = 0;
		inputs[4] = 0;
	endfunction
	
	function void clear_output();
		outputs[0] = 0;
		outputs[1] = 0;
		outputs[2] = 0;
		outputs[3] = 0;
		outputs[4] = 0;
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
	
	function buffer get_output_buffer(logic [15:0] header);
	
		int H_YCOORD = header[3:0];
		int H_XCOORD = header[7:4];
	
		if( H_YCOORD < YCOORD ) begin
			return N_input_buff;
		end
		else if ( H_YCOORD > YCOORD ) begin
			return S_input_buff;
		end
		else if ( H_YCOORD == YCOORD && H_XCOORD < XCOORD ) begin
			return W_input_buff;
		end
		else if ( H_YCOORD == YCOORD && H_XCOORD > XCOORD ) begin
			return E_input_buff;
		end
		else if ( H_YCOORD == YCOORD && H_XCOORD == XCOORD ) begin
			return L_input_buff;
		end
		else begin
			$display("ERROR in get_output_buffer. Header: %b -- to [%d,%d]",
				header, XCOORD, YCOORD);
			$exit();
		end
	endfunction
	
	function void advance_inputPort(int inputPort);
		
		input_buff = get_input_buffer(inputPort);
		assert( input_buff.dir == inputPort );
		if( input_buff.isEmpty() ) begin
			$display("INPUT BUFFER was empty for %s. Returning",
				input_buff.name);
			return;
		end		
		
		header = input_buff.peek();
		
		/* Get output buffer */
		output_buff = get_output_buffer(header);

		/* Begin error checking and full check */
		if( output_buff.dir == inputPort ) begin
			$display("OUTPUT BUFFER is the same as INPUT PORT -- %s. Returning",
				output_buff.name);
			output_buff.pop();
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
	
	function void handle_input(int inputPort, logic [15:0] header);
	
		/* Check if input buffer is full and push */
		input_buff = get_input_buffer(inputPort);
		assert( input_buff.dir == inputPort );
		if( input_buff.isFull() ) begin
			$display("INPUT BUFFER is full for %s. Returning",
				input_buff.name);
			return;
		end		
		input_buff.push(header);
	
	endfunction

	//golden result
	function void golden_result(int inputPort, logic [15:0] header);

		if (rst) begin
			reset();
			$display("Resetting golden model");
			return;
		end
		
		if( inputs[c.NORTH - 1] ) begin
			handle_input(c.NORTH, header);
		end
		if( inputs[c.SOUTH - 1] ) begin
			handle_input(c.SOUTH, header);
		end
		if( inputs[c.EAST - 1] ) begin
			handle_input(c.EAST, header);
		end
		if( inputs[c.WEST - 1] ) begin
			handle_input(c.WEST, header);
		end
		if( inputs[c.LOCAL - 1] ) begin
			handle_input(c.LOCAL, header);
        	end
        	
        	advance_inputPort(c.NORTH);
        	advance_inputPort(c.SOUTH);
        	advance_inputPort(c.EAST);
        	advance_inputPort(c.WEST);
        	advance_inputPort(c.LOCAL);
        	
        	arbiter.advance();	
        
    endfunction
    
    function void print_outputs();
    	for( int i = 0; i < 5; i++) begin
    		$display("Output[%d] = %d",i,outputs[i]);
    	end
    endfunction
endclass

class router_checker;								//checker class
    function bit check_result (int op,int dut_value, int bench_value, bit verbose); 
        
        bit passed = (dut_value == bench_value);
        
        if(verbose) $display("dut_value: %d", dut_value);
        
        if(passed) begin
            if(verbose) $display("%t : pass %d\n", $realtime, op);
        end
        else begin
            $display("%t : fail %d\n", $realtime, op);
            $display("dut value: %d", dut_value);
            $display("bench value: %d", bench_value);
            $display("Operation: %d", op);
            $exit();
        end
        return passed;
    endfunction  
endclass

class router_env;
    int cycle = 0;
    int max_transactions = 20;
    int warmup_time = 2;
    bit verbose = 1;
    
    int reset_density = 1;
    int read_density = 1;
    int write_density = 1;
    int search_density = 1;
    
    int read_index_mask = 5'h1F;
    int write_index_mask = 5'h1F;
    int write_data_mask = 5'h1F;
    int search_data_mask = 5'h1F;

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
            
        end
    endfunction
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
	        packet = new();
        	packet.randomize();
        	
        	test.rst <= 1;
		ctrl_ds.cb.rst <= 1;
        
        	@(ctrl_ds.cb);
        	test.golden_result(0,0);
	
	endtask

    task do_cycle;
        env.cycle++;
        cycle = env.cycle;
        packet = new();
        packet.randomize();
        
        test.clear_input();
        test.clear_output();
        
        test.rst <= 0;
        ctrl_ds.cb.rst <= 0;
        $display("\n------------------------------------");
        $display("After randomize -  InputPort:%d, X:%d, Y:%d",
        	packet.input_port,packet.x,packet.y);
        
        header = { 8'b00000000 , packet.x, packet.y };
        
        $display("Header: %b", header);
        
        if( packet.input_port == c.NORTH ) begin
        	n_ds.cb.valid_i <= 1;
        	n_ds.cb.data_i <= header;
        	test.inputs[c.NORTH - 1] = header;
        end
        else if( packet.input_port == c.SOUTH ) begin
        	s_ds.cb.valid_i <= 1;
        	s_ds.cb.data_i <= header;
        	test.inputs[c.SOUTH - 1] = header;
        end
        else if( packet.input_port == c.EAST ) begin
		e_ds.cb.valid_i <= 1;
		e_ds.cb.data_i <= header;
		test.inputs[c.EAST - 1] = header;
        end
        else if( packet.input_port == c.WEST ) begin
		w_ds.cb.valid_i <= 1;
		w_ds.cb.data_i <= header;
		test.inputs[c.WEST - 1] = header;
        end
        else if( packet.input_port == c.LOCAL ) begin
		l_ds.cb.valid_i <= 1;
		l_ds.cb.data_i <= header;
		test.inputs[c.LOCAL - 1] = header;
        end
        
        @(ctrl_ds.cb);
        
        test.golden_result(packet.input_port,header);
        
        test.print_outputs();

    endtask

    initial begin
        test = new();
        checker = new();
        packet = new();
        env = new();
        //env.configure("config.txt");
        
        test.XCOORD = 2;
        test.YCOORD = 2;
        
        $display("Starting validation with router at [%d,%d]",
        	test.XCOORD, test.YCOORD);

        // warm up
        repeat (env.warmup_time) begin
            do_warmup();
        end

        // testing
        repeat (env.max_transactions) begin
            do_cycle();
        
        
        
            //checker.check_result(1,ds.cb.read_data, test.read_data, env.verbose);
            
        end
        
        $display("\n\n----%d cycles completed succesfully ----\n\n", env.cycle);
    end
endprogram
