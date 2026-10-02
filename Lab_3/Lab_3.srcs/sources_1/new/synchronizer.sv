`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/02/2026 11:15:45 AM
// Design Name: 
// Module Name: synchronizer
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


module synchronizer(
    input logic     clk, reset, 
    input logic     [15:0] synch_in,
    output logic    [15:0] synch_out
    );
    
    logic [15:0] middle;
    
    always_ff @ (posedge clk) begin
        middle <= synch_in;
    end
    
    always_ff @ (posedge clk) begin
        synch_out <= middle;
    end
    
endmodule
