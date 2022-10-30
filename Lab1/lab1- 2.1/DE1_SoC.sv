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
// Student ID 2130841
// Digits to match 41

assign LEDR[9] = 1'b0;
assign LEDR[8] = 1'b0;
assign LEDR[7] = 1'b0;
assign LEDR[6] = 1'b0;
assign LEDR[5] = 1'b0;
assign LEDR[4] = 1'b0;
assign LEDR[3] = 1'b0;
assign LEDR[2] = 1'b0;
assign LEDR[1] = 1'b0;
assign LEDR[0] = (~SW[7] & SW[6] & ~SW[5] & ~SW[4]) &  (~SW[3] & ~SW[2] & ~SW[1] & SW[0]);



// recognizer for input of 1 (0001)
//logic w1, w2, f1;			// creating wires to save gate output
//nand (w1,SW[2], SW[3]);				
//nor (w2, w1, SW[1]);					
//nand (f1, w2, SW[0]);				

// recognizer for input of 4
//logic w3, w4, f2;
//nand (w3, SW[4], SW[5]);
//nor (w4, w3, SW[7]);
//nand (f2, w4, SW[6]);


// combines to output if 4 and 1 true
//and (LEDR[0], f1, f2);

endmodule

// Test Bench
module DE1_SoC_testbench();
wire [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5;
wire [9:0] LEDR;
reg [3:0] KEY;
reg [9:0] SW;
DE1_SoC dut (.HEX0, .HEX1, .HEX2, .HEX3, .HEX4, .HEX5, .KEY, .LEDR,
.SW);
// Try all combinations of inputs.
integer i;
initial begin
SW[9] = 1'b0;
SW[8] = 1'b0;
for(i = 0; i <256; i++) begin
SW[7:0] = i; #10;
end
end
endmodule