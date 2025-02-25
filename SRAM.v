`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 23.02.2025 11:41:40
// Design Name: 
// Module Name: SRAM
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


module SRAM(
    input [1:0]select,
    input operation,enable,
    input [3:0]data_in,
    output reg [3:0]data_out
    );
    reg [3:0] memory[3:0];

    always @(*)
    begin
        if(!operation)
        begin
            case(select)
                2'b00: memory[0]=data_in;
                2'b01: memory[1]=data_in;
                2'b10: memory[2]=data_in;
                2'b11: memory[3]=data_in;
            endcase
        end
        else
        begin
            case(select)
                2'b00: data_out = memory[0];
                2'b01: data_out = memory[1];
                2'b10: data_out = memory[2];
                2'b11: data_out = memory[3];
            endcase
        end 
    end
endmodule
