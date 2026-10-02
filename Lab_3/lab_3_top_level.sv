module lab_3_top_level(
    input  logic [15:0] switches_inputs, // slide switches (0 towards Basys3 board edge, 1 towards board center)
    input logic clk,
    input logic reset,
    input logic sel0,
    input logic sel1,
    input logic en,
    output logic [15:0] led, // mapped to the LEDs above the slide switches, LEDs: write a 1 to light LED, 0 to turn it off
    output logic        CA, CB, CC, CD, CE, CF, CG, DP, // segment outputs (active-low)
    output logic        AN1, AN2, AN3, AN4 // anode outputs for digit selection (active-low)
    
);

    // Internal signal declarations

    logic [15:0] switches_outputs;
    logic [15:0] bin_in;
    logic [15:0] bcd_out;
    logic [15:0] num_out;
    logic [15:0] num_out0;
    logic [15:0] bin_val;
    logic [15:0] synch_in;
    logic [15:0] synch_out;
    logic db_en;
    logic db_sel0;
    logic db_sel1;
    
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
        .bin_in (   num_out0),
        .bcd_out(   bcd_out)
    );  
    
    mux MUX0(
        .sel(       db_sel0),
        .hex(       bin_val),
        .dec(       synch_out),
        .num_out(   num_out0)
    );
    
    mux MUX1(
        .sel(       db_sel1),
        .hex(       num_out0),
        .dec(       bcd_out),
        .num_out(   num_out)
    );
    
    bin_reg BIN_REG(
        .clk(       clk),
        .reset(     reset),
        .en(        db_en),
        .reg_in(    synch_out),
        .bin_val(   bin_val)
    );
    
    synchronizer SYNCHRONIZER(
        .clk(       clk),
        .reset(     reset),
        .synch_in(  switches_outputs),
        .synch_out( synch_out)
    );
    
    debounce SEL0_DEBOUNCE(
        .clk(       clk),
        .reset(     reset),
        .button(    sel0),
        .result(    db_sel0)
    );
    
    debounce SEL1_DEBOUNCE(
        .clk(       clk),
        .reset(     reset),
        .button(    sel1),
        .result(    db_sel1)
    );
    
    debounce EN_DEBOUNCE(
        .clk(       clk),
        .reset(     reset),
        .button(    en),
        .result(    db_en)
    );
    assign led = switches_outputs;
 
 
 

endmodule
