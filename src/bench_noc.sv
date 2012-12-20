`include "router_test_classes.sv"

class noc_env;
    int cycle = 0;
    int max_transactions = 20;
    int warmup_time = 2;
    bit verbose = 1;
    
    real reset_density = 0.0;
    
    rand logic [3:0] x [15:0];
    rand logic [3:0] y [15:0];
    
    constraint x1 { foreach( x[i] ) x[i] >= 1 && x[i] <= 8; }
    constraint y1 { foreach( y[i] ) y[i] >= 1 && y[i] <= 8; }

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
            else if("RESET_DENSITY" == param) begin
            	this.reset_density = value;
            end
            else if("INPUT1" == param) begin
            	/*$display("In input1");
            	if( value == 1 ) input1_active = 1; 
            	chars_returned = $fscanf(file, "%d %d %d %d %d", 
            		use_input1[0], use_input1[1], use_input1[2], use_input1[3], use_input1[4]);
            	$display("%d %d %d %d %d", 
            		use_input1[0], use_input1[1], use_input1[2], use_input1[3], use_input1[4]);
            	*/
            end
        end
    endfunction
endclass

class noc_checker;	//checker class
	
	Constants c;	
	
	function int check_results(int data_o, int enable_o, int value, int dir, router_env env);
		
		return 0;
	endfunction  
endclass


class noc_transaction;

	noc_env env;

    	rand int rst;
    
	function new(noc_env env);
		this.env = env;
	endfunction


endclass

class noc_test;

	Constants c;

	router_test test [3:0][3:0];
	bit rst;
	logic [15:0] header;
	int send_to [3:0][3:0];
	
	function new();
		initialize_routers();
		connect_all_routers(test);
	endfunction
	
	function initialize_routers();		        
		int xcoord = 1;
		int ycoord = 1;
		for( int i = 0; i < 4; i++ )begin
			xcoord = 1;
			for( int j = 0; j < 4; j++) begin
				test[j][i] = new();
				test[j][i].XCOORD = xcoord;
				test[j][i].YCOORD = ycoord;
				xcoord = xcoord * 2;
			end
			ycoord = ycoord * 2;
		end
		
	endfunction

	function void reset();
	
		/* Reset routers */
		for(int i = 0; i < 4; i++) begin
			for(int j = 0; j < 4; j++) begin
				test[i][j].rst <= 1;
			end
		end
		
	endfunction
	
	
	function void golden_result();
	
		if (rst) begin
			reset();
			$display("Resetting NOC golden model");
			return;
		end
				
		for(int i = 0; i < 4; i++) begin
			for(int j = 0; j < 4; j++) begin
				test[i][j].inputs[c.LOCAL-1] = -1;
				if( send_to[i][j] ) begin
					test[i][j].inputs[c.LOCAL-1] = send_to[i][j]; 
					$display("Sending input %d to(%d,%d)",
						send_to[i][j], i, j );
				end
				test[i][j].rst <= rst;
				test[i][j].golden_result();
			end
		end
		
	endfunction
	
	function void print();
	
		for(int i = 0; i < 4; i++) begin
			for(int j = 0; j < 4; j++) begin
				router_test t = test[i][j];
				$display("[%d,%d] %d",t.XCOORD,t.YCOORD, t.neighbors[0]);
				if( t.neighbors[0] ) begin
					$display("\t[%d,%d]",t.neighbors[0].XCOORD,t.neighbors[0].YCOORD);
				end
				if( t.neighbors[1] ) begin
					$display("\t[%d,%d]",t.neighbors[1].XCOORD,t.neighbors[1].YCOORD);
				end
				if( t.neighbors[2] ) begin
					$display("\t[%d,%d]",t.neighbors[2].XCOORD,t.neighbors[2].YCOORD);
				end
				if( t.neighbors[3] ) begin
					$display("\t[%d,%d]",t.neighbors[3].XCOORD,t.neighbors[3].YCOORD);
				end
			end
		end

	
	endfunction
	
	extern function void connect_all_routers(router_test test [3:0][3:0]);
endclass

program tb_noc (
		ifc control,
		ifc ifc_0_0_to,
		ifc ifc_0_1_to,
		ifc ifc_0_2_to,
		ifc ifc_0_3_to,

		ifc ifc_0_0_from,
		ifc ifc_0_1_from,
		ifc ifc_0_2_from,
		ifc ifc_0_3_from,

		ifc ifc_1_0_to,
		ifc ifc_1_1_to,
		ifc ifc_1_2_to,
		ifc ifc_1_3_to,

		ifc ifc_1_0_from,
		ifc ifc_1_1_from,
		ifc ifc_1_2_from,
		ifc ifc_1_3_from,

		ifc ifc_2_0_to,
		ifc ifc_2_1_to,
		ifc ifc_2_2_to,
		ifc ifc_2_3_to,

		ifc ifc_2_0_from,
		ifc ifc_2_1_from,
		ifc ifc_2_2_from,
		ifc ifc_2_3_from,

		ifc ifc_3_0_to,
		ifc ifc_3_1_to,
		ifc ifc_3_2_to,
		ifc ifc_3_3_to,

		ifc ifc_3_0_from,
		ifc ifc_3_1_from,
		ifc ifc_3_2_from,
		ifc ifc_3_3_from
		);
	
    noc_test noc;	
    noc_transaction packet; 
    noc_checker checker;
    noc_env env;
    int cycle; // For DVE
    
    logic[15:0] header;
    
    Constants c;

	task do_warmup;
	
		env.cycle++;
	        cycle = env.cycle;
	        packet = new(env);
        	packet.randomize();
        	
        
        	noc.rst <= 1;
		control.cb_s.rst <= 1;
        
        	@(control.cb_s);
        	
        	noc.golden_result();
	
	endtask
	
	task activate_message(int input_port, logic [15:0] header_l);

/*
		if( input_port == c.NORTH ) begin
			n_ds_b.cb_s.enable <= 1;
			n_ds_b.cb_s.data <= header_l;
			test.inputs[c.NORTH - 1] = header_l;
		end
		else if( input_port == c.SOUTH ) begin
			s_ds_b.cb_s.enable <= 1;
			s_ds_b.cb_s.data <= header_l;
			test.inputs[c.SOUTH - 1] = header_l;
		end
*/
	endtask

    task do_cycle;
        env.cycle++;
        cycle = env.cycle;
        packet = new(env);
        packet.randomize();
        
        header = { 8'b00000000 , 4'b0010, 4'b0001 };
        
        noc.rst 	 <= 0;
        control.cb_s.rst <= 0;
        
        ifc_0_0_from.data <= 0;
	ifc_0_0_from.enable <= 0; 
        noc.send_to[0][0] <= 0;
        
        $display("Cycle: %d", env.cycle);
        $display("X: %b Y: %b", env.x[0], env.y[0]); 
        
        if( env.cycle == 4) begin
        	ifc_0_0_from.data <= header;
        	ifc_0_0_from.enable <= 1;
        	noc.send_to[0][0] <= header;
        end
        
        @(control.cb_s);
	        
        noc.golden_result();
        
        $display("IFC to: %d %d", ifc_1_0_to.data, ifc_1_0_to.enable);
        $display("Local: %d", noc.test[1][0].delayed_outputs[c.LOCAL-1]);
        
        /*
        header1 = { 8'b00000000 , packet.x1, packet.y1 };
        header2 = { 8'b00000000 , packet.x2, packet.y2 };
        header3 = { 8'b00000000 , packet.x3, packet.y3 };
        header4 = { 8'b00000000 , packet.x4, packet.y4 };
        header5 = { 8'b00000000 , packet.x5, packet.y5 };
        
        
        $display("\n------------------------------------");
	$display("After randomize - Rst:%d Reset_Density:%f",
			packet.rst,env.reset_density);
	
	
	test.rst 	<= (packet.rst < env.reset_density);
        ctrl_ds.cb_s.rst <= (packet.rst < env.reset_density);
        
        //if( packet.rst > 7) begin
        	if( env.input1_active ) begin
        		$display("Activating port 1");
        		$display("Header: %b (%d)", header1,header1);
        		activate_message(packet.input_port1,header1);
        	end 
        //end
        
        @(ctrl_ds.cb_s);
        
        //test.golden_result();
        
	$display("------------------------------------------");
	$display("CHECKING");
	
	//Reset credit inputs -- here because good values to to go
	//	through @(ctrl_ds.cb_s) 
	n_ds_a.cb_r.credit <= 0;
	l_ds_a.cb_r.credit <= 0;
	
	received = checker.check_results(n_ds_a.cb_r.data, n_ds_a.cb_r.enable, test.delayed_outputs[c.NORTH -1], c.NORTH, env);
	if( received ) n_ds_a.cb_r.credit <= 1;
	
	*/
    endtask

    initial begin
	noc = new();        
        checker = new();
        env = new();
        env.configure("env.txt");
        packet = new(env);
      
        $display("Starting validation with noc");
        
        noc.print();

        // warm up
        repeat (env.warmup_time) begin
            do_warmup();
        end

        // testing
        repeat (env.max_transactions) begin
            do_cycle();
        end

        $display("\n\n----%d cycles completed succesfully ----\n\n", env.cycle);
    end
    
endprogram

function void noc_test::connect_all_routers(router_test test [3:0][3:0]);

	Constants c;
    	
    	/*FIRST ROW*/
    	
    	/* (0,0) */
    	//test[0][0].neighbors[c.NORTH-1] 	= 0;
    	test[0][0].neighbors[c.SOUTH-1] 	= test[0][1];
    	test[0][0].neighbors[c.EAST-1] 		= test[1][0];
    	//test[0][0].neighbors[c.WEST-1] 	= 0;
    	
    	/* (1,0) */
    	//test[1][0].neighbors[c.NORTH-1] 	= 0;
	test[1][0].neighbors[c.SOUTH-1]		= test[1][1];
	test[1][0].neighbors[c.EAST-1] 		= test[2][0];
    	test[1][0].neighbors[c.WEST-1] 		= test[0][0];
    	
    	/* (2,0) */
	//test[2][0].neighbors[c.NORTH-1] 	= 0;
	test[2][0].neighbors[c.SOUTH-1]		= test[2][1];
	test[2][0].neighbors[c.EAST-1] 		= test[3][0];
    	test[2][0].neighbors[c.WEST-1] 		= test[1][0];
    	
    	/* (3,0) */
	//test[3][0].neighbors[c.NORTH-1] 	= 0;
	test[3][0].neighbors[c.SOUTH-1]	  	= test[3][1];
	//test[3][0].neighbors[c.EAST-1]  	= 0;
    	test[3][0].neighbors[c.WEST-1] 	  	= test[2][0];
    	
    	
    	/* SECOND ROW */
    	/* (0,1) */
	test[0][1].neighbors[c.NORTH-1]		= test[0][0];
	test[0][1].neighbors[c.SOUTH-1]		= test[0][2];
	test[0][1].neighbors[c.EAST-1] 		= test[1][1];
    	//test[0][1].neighbors[c.WEST-1]	= 0;
    	
    	/* (1,1) */
	test[1][1].neighbors[c.NORTH-1] 	= test[1][0];
	test[1][1].neighbors[c.SOUTH-1] 	= test[1][2];
	test[1][1].neighbors[c.EAST-1] 		= test[2][1];
    	test[1][1].neighbors[c.WEST-1] 		= test[0][1];
    	
    	/* (2,1) */
	test[2][1].neighbors[c.NORTH-1] 	= test[2][0];
	test[2][1].neighbors[c.SOUTH-1] 	= test[2][2];
	test[2][1].neighbors[c.EAST-1] 		= test[3][1];
    	test[2][1].neighbors[c.WEST-1] 		= test[1][1];
    	
    	/* (3,1) */
	test[3][1].neighbors[c.NORTH-1] 	= test[3][0];
	test[3][1].neighbors[c.SOUTH-1] 	= test[3][2];
	//test[3][1].neighbors[c.EAST-1] 	= 0;
    	test[3][1].neighbors[c.WEST-1] 		= test[2][1];
    	
    	
    	/* THIRD ROW */
    	/* (0,2) */
	test[0][2].neighbors[c.NORTH-1]		= test[0][1];
	test[0][2].neighbors[c.SOUTH-1]		= test[0][3];
	test[0][2].neighbors[c.EAST-1] 		= test[1][2];
    	//test[0][2].neighbors[c.WEST-1] 	= 0;
    	
    	/* (1,2) */
	test[1][2].neighbors[c.NORTH-1]		= test[1][1];
	test[1][2].neighbors[c.SOUTH-1]		= test[1][3];
	test[1][2].neighbors[c.EAST-1] 		= test[2][2];
    	test[1][2].neighbors[c.WEST-1] 		= test[0][2];
    	
    	/* (2,2) */
	test[2][2].neighbors[c.NORTH-1]		= test[2][1];
	test[2][2].neighbors[c.SOUTH-1]		= test[2][3];
	test[2][2].neighbors[c.EAST-1] 		= test[3][2];
    	test[2][2].neighbors[c.WEST-1] 		= test[1][2];
    	
    	/* (3,2) */
	test[3][2].neighbors[c.NORTH-1]		= test[3][1];
	test[3][2].neighbors[c.SOUTH-1]		= test[3][3];
	//test[3][2].neighbors[c.EAST-1]	= 0;
    	test[3][2].neighbors[c.WEST-1] 		= test[2][2];
    	
    	
    	/* FOURTH ROW */
    	/* (0,3) */
    	test[0][3].neighbors[c.NORTH-1]		= test[0][2];
	//test[0][3].neighbors[c.SOUTH-1]	= 0;
	test[0][3].neighbors[c.EAST-1] 		= test[1][3];
    	//test[0][3].neighbors[c.WEST-1] 	= 0;
    	
    	/* (1,3) */
    	test[1][3].neighbors[c.NORTH-1]		= test[1][2];
	//test[1][3].neighbors[c.SOUTH-1]	= 0;
	test[1][3].neighbors[c.EAST-1] 		= test[2][3];
    	test[1][3].neighbors[c.WEST-1] 		= test[0][3];
    	
    	/* (2,3) */
	test[2][3].neighbors[c.NORTH-1]		= test[2][2];
	//test[2][3].neighbors[c.SOUTH-1]	= 0;
	test[2][3].neighbors[c.EAST-1] 		= test[3][3];
    	test[2][3].neighbors[c.WEST-1] 		= test[1][3];
    	
    	/* (3,3) */
	test[3][3].neighbors[c.NORTH-1]		= test[3][2];
	//test[3][3].neighbors[c.SOUTH-1]	= 0;
	//test[3][3].neighbors[c.EAST-1] 	= test[2][3];
    	test[3][3].neighbors[c.WEST-1] 		= test[2][3];
    	
    endfunction
	