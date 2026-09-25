module switch_logic (
    input  logic [15:0] switches_inputs,
    output logic [15:0] switches_outputs 
);

    //assign switches_outputs = ~switches_inputs; 
    
    assign switches_outputs[15:0] = switches_inputs[15:0]; //there is no inversion on the inputs so the outputs will match the inputs
    //assign switches_outputs[7:1]  = switches_inputs[7:1];
    //assign switches_outputs[0]    = switches_inputs[1] & switches_inputs[0]; 

endmodule
