

class noc_transaction;
    rand bit rst;
    rand logic [15:0][15:0] valid_i;
    rand logic [15:0][15:0] data_i;

endclass

					//golden model
class noc_test;
    bit rst;
    int valid_i;
    int data_i;
    int valid_o;
    int data_o;

    function void golden_result;	//golden result
        
        if (rst) begin
        	valid_i = 0;
        	valid_o = 0;
        	data_i = 0;
        	data_o = 0;
        	return;
        end
        
        data_o = 0;
        valid_o = 0;
        if (valid_i) begin
        	$display("Valid data of %d", data_i);
        	data_o = data_i;
        	valid_o = 1;
        end
        	
        
        
        
    endfunction
endclass

class noc_checker;								//checker class
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

class noc_env;
    int cycle = 0;
    int max_transactions = 1;
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

program tb (ifc.bench ds);
    noc_test test;
    noc_transaction packet; 
    noc_checker checker;
    noc_env env;
    int cycle; // For DVE

	task do_warmup;
	
		env.cycle++;
	        cycle = env.cycle;
	        packet = new();
        	packet.randomize();
        	
        	test.rst <= 1;
		ds.cb.rst <= 1;
        
        	@(ds.cb);
        	test.golden_result();
	
	endtask

    task do_cycle;
        env.cycle++;
        cycle = env.cycle;
        packet = new();
        packet.randomize();
        
        test.rst <= 0;
        ds.cb.rst <= 0;
        
        test.data_i <= packet.data_i & 1'b1;
        ds.cb.data_i <= packet.data_i & 1'b1;
        
        test.valid_i <=
        
        @(ds.cb);
        test.golden_result();
        

    endtask

    initial begin
        test = new();
        checker = new();
        packet = new();
        env = new();
        //env.configure("config.txt");

        // warm up
        repeat (env.warmup_time) begin
            do_warmup();
        end

        // testing
        repeat (env.max_transactions) begin
            do_cycle();
            
            //checker.check_result(1,ds.cb.read_data, test.read_data, env.verbose);
            
        end
    end
endprogram
