`timescale 1ns / 1ps

module SRAM_tb;
    reg [1:0] select;        // Address selection
    reg operation;           // Read (1) or Write (0)
    reg enable;              // Enable signal
    reg [3:0] data_in;       // Input data
    wire [3:0] data_out;     // Output data
    
    // Instantiate SRAM module
    SRAM uut (
        .select(select),
        .operation(operation),
        .enable(enable),
        .data_in(data_in),
        .data_out(data_out)
    );

    // Test procedure
    initial begin

        enable = 1; 
        operation = 1; // Read (should not output anything yet)
        select = 2'b00; 
        data_in = 4'b0000; 
        #10;
        
        // Write operations (operation = 0)
        operation = 0; data_in = 4'b1010; select = 2'b00; #10;  // Write 1010 to address 00
        operation = 0; data_in = 4'b1100; select = 2'b01; #10;  // Write 1100 to address 01
        operation = 0; data_in = 4'b0110; select = 2'b10; #10;  // Write 0110 to address 10
        operation = 0; data_in = 4'b0011; select = 2'b11; #10;  // Write 0011 to address 11

        // Read operations (operation = 1)
        operation = 1; select = 2'b00; #10;  // Read from address 00 (should be 1010)
        operation = 1; select = 2'b01; #10;  // Read from address 01 (should be 1100)
        operation = 1; select = 2'b10; #10;  // Read from address 10 (should be 0110)
        operation = 1; select = 2'b11; #10;  // Read from address 11 (should be 0011)

        // Disable SRAM and check output
        enable = 0; #10;  

        $finish;  // End simulation
    end

endmodule
