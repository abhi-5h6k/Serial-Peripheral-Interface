`timescale 1ns / 1ps

module spi_tb;

    // Inputs
    reg clk;
    reg start;
    reg [11:0] din;

    // Outputs
    wire cs;
    wire mosi;
    wire done;
    wire sclk;

    // Instantiate the Unit Under Test (UUT)
    spi uut (
        .clk(clk), 
        .start(start), 
        .din(din), 
        .cs(cs), 
        .mosi(mosi), 
        .done(done), 
        .sclk(sclk)
    );

    initial begin
        // Initialize Inputs
        clk = 0;
        start = 0;
        din = 12'b000000000000;

        // Wait for global reset
        #100;

        // Apply stimulus
        start = 1;
        din = 12'b101010101010;

        #20;
        start = 0;

        // Wait for SPI transfer to complete
        wait(done);

        // Check outputs if necessary
        // For example: assert (expected_mosi == mosi)

        // Finish the test
        $finish;
    end

    // Clock generation
    always #5 clk = ~clk; // 100 MHz clock

endmodule
