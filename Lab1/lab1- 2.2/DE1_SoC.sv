// Top level module that define the I/Os

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
output [9:0] LEDR;
input [3:0] KEY;
input [9:0] SW;

// Default values, turns off the HEX displays
assign HEX0 = 7'b1111111;	// turns HEX DISPLAY all off
assign HEX1 = 7'b1111111;
assign HEX2 = 7'b1111111;
assign HEX3 = 7'b1111111;
assign HEX4 = 7'b1111111;
assign HEX5 = 7'b1111111;

 nordstrom nordstrom_sim (.U(SW[9]), .P(SW[8]), .C(SW[7]), .M(SW[0]), .discount(LEDR[0]), .stolen(LEDR[1]));
 

endmodule

module nordstrom (discount, stolen, U, P, C, M);

output logic discount, stolen; 	
input  logic U, P, C, M; 	
		
assign discount = P | (U & C);
assign stolen =  ((U) & (~P) & (~M) | ((~U) & (~C) & (~M)));


endmodule

// Test Bench

module nordstrom_testbench();		
	logic  U, P, C, M; 		
	logic  discount, stolen; 		
			
	nordstrom dut ( .discount, .stolen, .U, .P, .C, .M ); 		
		
	
	initial begin	
		U=0; P=0; C=0; M=0; #10;
		U=0; P=0; C=0; M=1; #10;
		U=0; P=0; C=1; M=0; #10;
		U=0; P=0; C=1; M=1; #10;
		U=0; P=1; C=0; M=0; #10;
		U=0; P=1; C=0; M=1; #10;
		U=0; P=1; C=1; M=0; #10;
		U=0; P=1; C=1; M=1; #10;
		U=1; P=0; C=0; M=0; #10;
		U=1; P=0; C=0; M=1; #10;
      U=1; P=0; C=1; M=0; #10;		
		U=1; P=0; C=1; M=1; #10;
		U=1; P=1; C=0; M=0; #10;
		U=1; P=1; C=0; M=1; #10;
		U=1; P=1; C=1; M=0; #10;
		U=1; P=1; C=1; M=1; #10;
			
	end	
endmodule	





//module DE1_SoC_testbench();
//wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;/
//wire [9:0] LEDR;
//reg [3:0] KEY;
//reg [9:0] SW;
//DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR,
//.SW);
// Try all combinations of inputs.
//integer i;
//initial begin
//SW[9] = 1'b0;
//SW[8] = 1'b0;
//for(i = 0; i <256; i++) begin
//SW[7:0] = i; #10;
//end
//end
//endmodule