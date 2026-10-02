`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 10:36:06 AM
// Design Name: 
// Module Name: mux
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


module mux(
    input sel,
    input [15:0]hex,
    input [15:0]dec,
    output [15:0] num_out
    );
    assign num_out = sel ? hex : dec; //sel = 1, num_out = hex. sel = 0, num_out = dec
endmodule

