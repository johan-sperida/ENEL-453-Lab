`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2026 10:36:53 AM
// Design Name: 
// Module Name: mux_tb
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


module mux_tb();
    parameter CLK_PERIOD = 10;
    
    logic [15:0] dec;
    logic [15:0] hex;
    logic [15:0] num_out;
    logic sel;
    
    mux uut (
        .dec(dec),
        .hex(hex),
        .num_out(num_out),
        .sel(sel)
    );     

    initial begin
    
        dec = 16'b0101010101010101;
        hex = 16'b0101010101010101;
        sel = 0;
        #CLK_PERIOD;
        
        dec = 16'b1010101010101010; #CLK_PERIOD;
        
        sel = 1; #CLK_PERIOD
        
        hex = 16'b1010101010101010; #CLK_PERIOD;
        
        $stop;
    end
    
    
endmodule
