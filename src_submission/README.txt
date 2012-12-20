README:

To run Single Router TestBench:
	
	Set properties in "env.txt"
	Example:
		RANDOM_SEED 17		
		TRANSACTIONS 10		<-- # of runs
		XCOORD 1		<-- X coordinate in simulated NOC (1,2,4,8)
		YCOORD 1		<-- Y coordinate in simulated NOC (1,2,4,8)
		RESET_DENSITY 0
		INPUT1 1		<-- First message input. Flag (1,0) sets input port on/off
		0 0 0 0 1		<-- Bitmask for turning on/off port for first message input ( N S E W L)
		INPUT2 0			Setting multiple directions allows the randomizer to choose
		1 1 1 1 1			which direction to send but only one message at a time per message
		INPUT3 0			port.
		1 1 1 1 1			To send multiple messages during one clock cycle (up to 5),
		INPUT4 0			enable message input ports 2-5 by setting the flag to 1 and 
		1 1 1 1 1			choosing the directions to send
		INPUT5 0
		1 1 1 1 1		<-- This selects all directions - N S E W L


	To run: 'make router'

END


To run NOC Testbench:

	Set properties in "noc_env.txt"
	Example:
		RANDOM_SEED 17
		TRANSACTIONS 1000
		RESET_DENSITY 0
		ROUTERS 1		<-- # of routers transmitting during one clock cycle
		

	To run: 'make noc'

END

