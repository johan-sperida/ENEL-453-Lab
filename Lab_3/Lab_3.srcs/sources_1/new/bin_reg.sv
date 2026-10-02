`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 11:41:20 AM
// Design Name: 
// Module Name: bin_reg
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


module bin_reg(
        input logic     clk, reset, en,
        input logic     [15:0] reg_in,
        output logic    [15:0] bin_val
    );
    
    always_ff @ (posedge clk) begin 
        if (reset) begin
            bin_val <= 16'h0000;
        end
        else if (en) begin
            bin_val <= reg_in;
        end
    end
endmodule
