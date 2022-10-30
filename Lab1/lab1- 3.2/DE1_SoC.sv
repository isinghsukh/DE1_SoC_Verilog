// Top level module that define the I/Os

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
output [9:0] LEDR;
input [3:0] KEY;
input [9:0] SW;

//assign HEX0 = 7'b1111111;	
//assign HEX1 = 7'b1111111;
//assign HEX2 = 7'b1111111;
//assign HEX3 = 7'b1111111;
//assign HEX4 = 7'b1111111;
//assign HEX5 = 7'b1111111;

nordstrom nordstrom_sim (.U(SW[9]), .P(SW[8]), .C(SW[7]), .M(SW[0]), .discount(LEDR[0]), .stolen(LEDR[1]));

 seg7 segone (.C(SW[7]), .P(SW[8]) , .U(SW[9]), .HEX0(HEX0), .HEX1(HEX1), .HEX2(HEX2), .HEX3(HEX3), .HEX4(HEX4), .HEX5(HEX5));
 //seg7 segtwo (.bcd(SW[7:4]), .leds(HEX1));

endmodule


//-------------------------------------- new module----------------------------

module seg7 (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, C, P, U);
  input  logic C,P,U;
  output logic[6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
	
  always_comb begin
  
		if ( U == 0 &  P == 0 & C == 0 ) begin
		// numbers        7654321
			     HEX0 = 7'b0000110; //e  // Phone
				  HEX1 = 7'b0101011; //n
			     HEX2 = 7'b0100011; //o
			     HEX3 = 7'b0001011; //h
				  HEX4 = 7'b0001100; //p
				  HEX5 = 7'b1111111; //NULL
				  
		end else if (U == 0 & P == 0 & C == 1) begin
		// numbers        7654321
				  HEX0 = 7'b0000110; //E // APPLE
				  HEX1 = 7'b1000111; //L
			     HEX2 = 7'b0001100; //P
			     HEX3 = 7'b0001100; //P
				  HEX4 = 7'b0001000; //A
				  HEX5 = 7'b1111111; //NULL

     end else if ( U == 0 & P == 1 & C == 1) begin 
		// numbers        7654321
				  HEX0 = 7'b0010010; //S  // CHIPS
				  HEX1 = 7'b0001100; //P
			     HEX2 = 7'b1111001; //I
			     HEX3 = 7'b0001001; //H
				  HEX4 = 7'b1000110; //C
			     HEX5 = 7'b1111111; //NULL
				  
				  
		end else if ( U == 1 & P == 0 &  C == 0) begin
		// numbers        7654321
			  	  HEX0 = 7'b1000111;  //l // pencil
				  HEX1 = 7'b1111001; //i
			     HEX2 = 7'b0100111; //c
			     HEX3 = 7'b0101011; //n
				  HEX4 = 7'b0000110; //e
			     HEX5 = 7'b0001100; //p
				 
				 
		end else if ( U == 1 & P == 0 & C == 1) begin
		// numbers        7654321
				  HEX0 = 7'b0001000; //A // COCOA
				  HEX1 = 7'b1000000; //O
			     HEX2 = 7'b1000110; //C
				  HEX3 = 7'b1000000; //O
			     HEX4 = 7'b1000110; //C
			     HEX5 = 7'b1111111; //null
				  
		end else if ( U == 1 & P == 1 & C == 0) begin
		// numbers        7654321
	
				  HEX0 = 7'b0000110; //E  // COFFEE
				  HEX1 = 7'b0000110; //E
			     HEX2 = 7'b0001110; //F
			     HEX3 = 7'b0001110; //F
				  HEX4 = 7'b1000000; //0
				  HEX5 = 7'b1000110; //C
			    
				  
		end else begin
		
				  HEX0 = 7'b1111111; //null  
				  HEX1 = 7'b1111111; //n
			     HEX2 = 7'b1111111; //u
			     HEX3 = 7'b1111111; //l
				  HEX4 = 7'b1111111; //l
				  HEX5 = 7'b1111111; //l
		
		
	  end	
			
     // case (bcd)
        //            Light: 6543210
      //  4'b0000: leds = 7'b1000000; // 0
       // 4'b0001: leds = 7'b1111001; // 1
      //  4'b0010: leds = 7'b0100100; // 2
      //  4'b0011: leds = 7'b0110000; // 3
      //  4'b0100: leds = 7'b0011001; // 4
      //  4'b0101: leds = 7'b0010010; // 5
      //  4'b0110: leds = 7'b0000010; // 6
      //  4'b0111: leds = 7'b1111000; // 7
      //  4'b1000: leds = 7'b0000000; // 8
      //  4'b1001: leds = 7'b0010000; // 9
      //  default: leds = 7'bX;
      //endcase
  end
endmodule

//-------------------------Lab 2 Module------------------------------------------


module nordstrom (discount, stolen, U, P, C, M);

output logic discount, stolen; 	
input  logic U, P, C, M; 	
		
assign discount = P | (U & C);
assign stolen =  ((U) & (~P) & (~M) | ((~U) & (~C) & (~M)));


endmodule

//-----------------------------------------------------------------------------

//---------------------------Test Bench----------------------------------------

module fred_testbench();		
	  logic C,P,U,M;
     logic[6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;		
			
	seg7 dut ( .U, .P, .C,  .HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5 ); 		
		
	
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



