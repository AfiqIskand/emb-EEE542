`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Create Date: 12/23/2021 09:22:36 PM
// Designer Name: Muhammad Afiq Iskandar Bin Shamshuddin
// Module Name: arbiter_1p0
// Project Name: EEE542 Industry Student Mini Project
//////////////////////////////////////////////////////////////////////////////////

module arbiter_1p0(
    input CLK,
    input RST,
    input [3:1] INPUT_DEVICE,
    output reg [3:1] OUTPUT_RESPONSE
    );
    
    reg [1:0] state = 2'b00; 
    parameter IDLE = 2'b00, GNT1 = 2'b01, GNT2 = 2'b10,GNT3 = 2'b11; 
    
    always @ (state) begin 
        case(state) 
            IDLE: 
                OUTPUT_RESPONSE = 3'b000; 
            GNT1: 
                OUTPUT_RESPONSE = 3'b100;
            GNT2: 
                OUTPUT_RESPONSE = 3'b010; 
            GNT3: 
                OUTPUT_RESPONSE = 3'b001; 
            default: 
                OUTPUT_RESPONSE = 3'b000; 
        endcase 
    end 

    always @ (posedge CLK or posedge RST) begin 
        if (RST) 
            state <= IDLE; 
        else  
            case(state) 
            IDLE: 
                if (INPUT_DEVICE[3]) // event = 1xx
                    state <= GNT1; 
                else if (INPUT_DEVICE[3:2] == 2'b01) // event = 01x
                    state <= GNT2; 
                else if (INPUT_DEVICE == 3'b001) // event = 001
                    state <= GNT3; 
                else 
                    state <= IDLE; 
            GNT1: 
                if (INPUT_DEVICE[3]) // event = 1xx
                    state <= GNT1; 
                else if (INPUT_DEVICE[3:2] == 2'b01) // event = 01x
                    state <= GNT2;
                else                 // event = 00x
                    state <= IDLE; 
            GNT2: 
                if (INPUT_DEVICE[2]) // event = x1x
                    state <= GNT2; 
                else if (INPUT_DEVICE[2:1] == 2'b01) // event = x01
                    state <= GNT3;
                else                 // event = x00
                    state <= IDLE; 
            GNT3: 
                if (INPUT_DEVICE[1]) // event = xx1
                    state <= GNT3; 
                else                 // event = xx0
                    state <= IDLE; 
            endcase
    end 
endmodule
