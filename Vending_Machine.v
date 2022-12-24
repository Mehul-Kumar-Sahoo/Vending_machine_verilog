`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 24.12.2022 09:12:58
// Design Name: 
// Module Name: Vending_Machine
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


module Vending_Machine(out,change,in,clk,rst);
    input clk,rst;
    input [1:0] in; // 01=5rs 10=10rs
    output reg out;
    output reg [1:0] change;

    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;

    reg [1:0] c_state,n_state;  // c_state = current state, n_state = next state

    always @(posedge clk) begin
        if(rst) begin
            c_state = 0;
            n_state = 0;
            change = 2'b00;
        end
        else begin
            c_state = n_state;
        end
        case(c_state)
            S0: // 0rs
                if(in==2'b00) begin
                    n_state=S0;
                    out=0;
                    change=2'b00;
                end
                else if(in==2'b01) begin
                    n_state=S1;
                    out=0;
                    change=2'b00;
                end
                else if(in==2'b10)begin
                    n_state=S2;
                    out=0;
                    change=2'b00;
                end
            S1: // 5rs
                if(in==2'b00) begin
                    n_state=S0;
                    out=0;
                    change=2'b01;
                end
                else if(in==2'b01) begin
                    n_state=S2;
                    out=0;
                    change=0;
                end
                else if(in==2'b10) begin
                    n_state=S0;
                    out=1;
                    change=0;
                end
            S2: //10rs
                if(in==2'b00) begin
                    n_state=S0;
                    out=0;
                    change=10;
                end
                else if(in==2'b01) begin
                    n_state=S0;
                    out=1;
                    change=0;
                end
                else if(in==2'b10) begin
                    n_state=S0;
                    out=1;
                    change=2'b01;
                end
        endcase
    end
endmodule
