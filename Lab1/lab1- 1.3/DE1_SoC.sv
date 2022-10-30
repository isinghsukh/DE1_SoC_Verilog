module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW); 	
	output logic [6:0]  HEX0, HEX1, HEX2, HEX3, HEX4, HEX5; 	
	output logic [9:0]  LEDR; 	
	input  logic [3:0]  KEY; 	
	input  logic [9:0]  SW; 	
			
	mux4_1 m(.out(LEDR[0]), .i00(SW[0]), .i01(SW[1]), .i10(SW[2]), .i11(SW[3]), .sel0(SW[8]), .sel1(SW[9])); 	
	assign HEX0 = '1; 	
	assign HEX1 = '1; 	
	assign HEX2 = '1; 	
	assign HEX3 = '1; 	
	assign HEX4 = '1; 	
	assign HEX5 = '1; 	
endmodule	