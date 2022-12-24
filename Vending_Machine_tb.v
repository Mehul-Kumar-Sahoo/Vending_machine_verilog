`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2022 09:27:41
// Design Name: 
// Module Name: Vending_Machine_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Vending_Machine_tb;
    reg clk,rst;
    reg [1:0] in;
    wire out;
    wire [1:0] change;

    // Instantiating the vending machine module
    Vending_Machine product(out,change,in,clk,rst);

    always #5 clk = ~clk;

    initial begin
        rst=1;
        clk=0;

        #6 rst=0;
        in=2'b01;
        #11 in=2'b01;
        #16 in=2'b01;
        #25 $finish;
    end
endmodule
