`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   11:33:48 06/01/2018
// Design Name:   vga640x480
// Module Name:   C:/Users/TEMP.CS152A-01.001/Desktop/m152lab4-master/tb.v
// Project Name:  NERP_demo
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: vga640x480
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb;

	// Inputs
	reg topMid;
	reg dclk;
	reg clr;
	reg rst;
	reg [26:0] balance;

	// Outputs
	wire hsync;
	wire vsync;
	wire [2:0] red;
	wire [2:0] green;
	wire [1:0] blue;
	reg b1 = 0;
	reg b10 = 0;
	reg b50 = 0;
	reg b100 = 0; 
	reg [4:0] num1;
	reg [4:0] num2;
	reg [4:0] num3;
	reg [4:0] num4;


	// Instantiate the Unit Under Test (UUT)
	vga640x480 uut (
		.topMid(topMid), 
		.dclk(dclk), 
		.clr(clr), 
		.balance(balance), 
		.hsync(hsync), 
		.vsync(vsync), 
		.red(red), 
		.green(green), 
		.blue(blue)
	);

	bank bank(
		.clk(clk), 
		.b1(b1), 
		.b10(b10), 
		.b50(b50), 
		.b100(b100), 
		.randNum1(num1), 
		.randNum2(num2), 
		.randNum3(num3), 
		.randNum4(num4), 
		.rst(rst), 
		.balance(balance)
	);

	initial begin
		// Initialize Inputs
		topMid = 0;
		dclk = 0;
		clr = 0;
		rst = 1;

		// Wait 100 ns for global reset to finish
		#100;
		rst = 0;
		b10 = 1;
        
		// Add stimulus here

		num1 = 5;
		num2 = 5;
		num3 = 5; 
		num4 = 5;

		#10

		num1 = 4;

	end
	
	always #5 dclk = ~dclk;
      
endmodule

