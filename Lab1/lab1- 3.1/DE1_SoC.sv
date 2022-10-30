// Top level module that define the I/Os

module DE1_SoC (HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, KEY, LEDR, SW);
output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
output [9:0] LEDR;
input [3:0] KEY;
input [9:0] SW;

//assign HEX0 = 7'b1111111;	
//assign HEX1 = 7'b1111111;
assign HEX2 = 7'b1111111;
assign HEX3 = 7'b1111111;
assign HEX4 = 7'b1111111;
assign HEX5 = 7'b1111111;

 //nordstrom nordstrom_sim (.U(SW[9]), .P(SW[8]), .C(SW[7]), .M(SW[0]), .discount(LEDR[0]), .stolen(LEDR[1]));
 seg7 segone (.bcd(SW[3:0]), .leds(HEX0));
 seg7 segtwo (.bcd(SW[7:4]), .leds(HEX1));

endmodule


//-------------------------------------- new module----------------------------

module seg7 (bcd, leds);
  input  logic  [3:0] bcd;
  output logic  [6:0] leds;
	
  always_comb begin
      case (bcd)
        //          Light: 6543210
        4'b0000: leds = 7'b1000000; // 0
        4'b0001: leds = 7'b1111001; // 1
        4'b0010: leds = 7'b0100100; // 2
        4'b0011: leds = 7'b0110000; // 3
        4'b0100: leds = 7'b0011001; // 4
        4'b0101: leds = 7'b0010010; // 5
        4'b0110: leds = 7'b0000010; // 6
        4'b0111: leds = 7'b1111000; // 7
        4'b1000: leds = 7'b0000000; // 8
        4'b1001: leds = 7'b0010000; // 9
        default: leds = 7'bX;
      endcase
  end
endmodule



//-----------------------------------------------------------------------------

module DE1_SoC_testbench();

	 logic  [3:0] bcd;
	 logic  [6:0] leds;
	
	seg7 dut (.bcd, .leds);

	//wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;/
	//wire [9:0] LEDR;
	//reg [3:0] KEY;
	logic [9:0] SW;
	//	DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR, .SW);
	//Try all combinations of inputs.
	integer i;
		initial begin
			SW[9] = 1'b0;		
			SW[8] = 1'b0;
			for(i = 0; i <256; i++) begin
			SW[7:0] = i; #10;
			end
		end
	endmodule
