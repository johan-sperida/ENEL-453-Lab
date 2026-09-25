module lab_2_top_level(
    input  logic [15:0] switches_inputs, // slide switches (0 towards Basys3 board edge, 1 towards board center)
    input logic clk,
    input logic reset,
    input logic sel,
    output logic [15:0] led, // mapped to the LEDs above the slide switches, LEDs: write a 1 to light LED, 0 to turn it off
    output logic        CA, CB, CC, CD, CE, CF, CG, DP, // segment outputs (active-low)
    output logic        AN1, AN2, AN3, AN4 // anode outputs for digit selection (active-low)
    
);

    // Internal signal declarations

    logic [15:0] switches_outputs;
    logic [15:0] bin_in;
    logic [15:0] bcd_out;
    logic [15:0] num_out;
    
    // Instantiate components

    switch_logic SWITCHES (
         .switches_inputs( switches_inputs),
         .switches_outputs(switches_outputs)
    );
    
    seven_segment_display_subsystem SEVEN_SEGMENT_DISPLAY (
        .clk(   clk),
        .reset( reset),
        .min_dig2(num_out[15:12]),
        .min_dig1(num_out[11:8]),
        .sec_dig2(num_out[7:4]),
        .sec_dig1(num_out[3:0]),
        .CA(CA), 
        .CB(CB), 
        .CC(CC), 
        .CD(CD), 
        .CE(CE), 
        .CF(CF), 
        .CG(CG), 
        .DP(DP),
        .AN1(AN1), 
        .AN2(AN2), 
        .AN3(AN3), 
        .AN4(AN4)
    );
    bin_to_bcd BIN_TO_BCD(
        .clk(       clk),   
        .reset(     reset), 
        .bin_in (   switches_outputs),
        .bcd_out(   bcd_out)
    );  
    
    mux MUX(
        .sel(       sel),
        .hex(       switches_outputs),
        .dec(       bcd_out),
        .num_out(   num_out)
    );
    assign led = switches_outputs;
 
 
 

endmodule
