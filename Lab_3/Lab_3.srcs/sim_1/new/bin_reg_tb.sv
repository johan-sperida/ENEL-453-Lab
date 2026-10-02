`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/30/2026 12:06:23 PM
// Design Name: 
// Module Name: bin_reg_tb
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


module bin_reg_tb();

parameter CLK_PERIOD = 10;

logic           clk = 0;
logic           reset;
logic           en;
logic   [15:0]  reg_in;
logic   [15:0]  bin_val;

bin_reg uut (
    .reg_in(reg_in),
    .clk(clk),
    .reset(reset),
    .en(en),
    .bin_val(bin_val)
);

always #(CLK_PERIOD/2) clk = ~clk;

initial begin
    reset = 0;
    reg_in = 16'h0000;
    en = 0;
    
    #(CLK_PERIOD / 4);
    reset = 1;
    #(5*CLK_PERIOD);
    reset = 0;
    #(4*CLK_PERIOD);
    
    reg_in = 16'b0101_0101_0101_0101; #(CLK_PERIOD);
    en = 1; #(CLK_PERIOD);
    
    reg_in = 16'b1010_1010_1010_1010; #(CLK_PERIOD);
    en = 0; #(CLK_PERIOD);
    
    reg_in = 16'b1111_1111_1111_1111; #(CLK_PERIOD);
   
    #(5 * CLK_PERIOD);
    $stop;
end
    
    
endmodule
