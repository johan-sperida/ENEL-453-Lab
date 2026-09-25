//******************************************************************************
// Module: seven_segment_decoder
//
// Description:
// This module decodes a 4-bit input into the appropriate signals to drive a
// 7-segment LED display. It supports displaying hexadecimal digits (0-F),
// with additional support for a decimal point.
//
// Inputs:
//   - data[3:0]: 4-bit input representing the digit to be displayed (0-F)
//   - dp_in:     Input for the decimal point (active-low)
//
// Outputs:
//   - CA, CB, CC, CD, CE, CF, CG: Individual segment controls (active-low)
//   - DP: Decimal point control (active-low)
//
// Behavior:
//   - The module uses a combinational logic block to decode the input into
//     a 7-bit pattern representing the segments to be lit.
//   - The decoded pattern is then inverted and assigned to the respective
//     segment outputs (CA-CG), as the 7-segment display is active-low.
//   - The decimal point (DP) is passed through directly from dp_in.
//
// Note:
//   - The module supports all hexadecimal digits (0-F), but digits A-F are
//     noted as "Not used in stopwatch" in the original comments.
//   - The segment mapping is as follows:
//       A
//     F   B
//       G
//     E   C
//       D  DP
//
//*****************************************************************************/


module seven_segment_decoder (
    output logic       CA,
    output logic       CB,
    output logic       CC,
    output logic       CD,
    output logic       CE,
    output logic       CF,
    output logic       CG,
    output logic       DP,
    input  logic       dp_in,
    input  logic [3:0] data
);

    logic [6:0] decoded_bits;

    always_comb begin
        // Decode the input data into 7-segment display pattern
		                            // ABCDEFG         7-segment LED pattern for reference (1 is on)
        case (data)                 // 6543210 
            4'b0000: decoded_bits = 7'b111_1110; // 0      
            4'b0001: decoded_bits = 7'b011_0000; // 1  
            4'b0010: decoded_bits = 7'b110_1101; // 2       
            4'b0011: decoded_bits = 7'b111_1001; // 3  
            4'b0100: decoded_bits = 7'b011_0011; // 4     
            4'b0101: decoded_bits = 7'b101_1011; // 5
            4'b0110: decoded_bits = 7'b101_1111; // 6
            4'b0111: decoded_bits = 7'b111_0000; // 7
            4'b1000: decoded_bits = 7'b111_1111; // 8
            4'b1001: decoded_bits = 7'b111_0011; // 9
            4'b1010: decoded_bits = 7'b111_0111;  // A
            4'b1011: decoded_bits = 7'b001_1111;  // B
            4'b1100: decoded_bits = 7'b100_1110;  // C
            4'b1101: decoded_bits = 7'b011_1101;  // D
            4'b1110: decoded_bits = 7'b100_1111;  // E
            4'b1111: decoded_bits = 7'b100_0111;  // F

            
// Students: fill in the remaining rows for this case statement,
// to account for the hexademcial digits A, B, C, D, E, and F

            default: decoded_bits = 7'b0000000; // All LEDs off
        endcase                     // ABCDEFG
    end                             // 6543210

    // Assign the decoded bits to the 7-segment display outputs (active-low on Basys3, i.e. 0 is ON)
    // Invert LED signals that were active-high for convenience
    assign DP = ~dp_in; // Passes through the decimal point signal (from top_level)
    assign CA = ~decoded_bits[6];
    assign CB = ~decoded_bits[5];
    assign CC = ~decoded_bits[4];
    assign CD = ~decoded_bits[3];
    assign CE = ~decoded_bits[2];
    assign CF = ~decoded_bits[1];
    assign CG = ~decoded_bits[0];

endmodule
