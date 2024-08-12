Overview
This project implements a Serial Peripheral Interface (SPI) module in Verilog. The SPI module is designed to handle serial communication between a master and a slave device. It includes functionality for clock generation, data transmission, and state management.

Module Description
Module Name: spi
Inputs:
clk: System clock signal.
start: Start signal to initiate data transmission.
din: 12-bit data input to be transmitted via SPI.
Outputs:
cs: Chip select signal to activate the slave device.
mosi: Master Out Slave In signal for data transmission.
done: Signal indicating completion of data transmission.
sclk: SPI clock signal for synchronizing data transmission.
Functional Details
Clock Divider:

A clock divider is implemented to generate the SPI clock (sclk) from the system clock (clk). This is controlled by an internal counter that toggles the sclk signal after reaching a predefined count.
State Machine:

The SPI module operates using a simple state machine with four states:
idle: The default state where the module waits for a start signal.
start_tx: Activates the chip select (cs) and prepares data for transmission.
send: Handles the bit-wise transmission of the input data (din) via the mosi line.
end_tx: Concludes the transmission, deactivates the chip select, and signals completion (done).
Data Transmission:

The send state shifts the bits of the input data onto the mosi line, synchronized with the SPI clock. The transmission process is managed by a bit counter that ensures all bits are sent before transitioning to the end_tx state.
Usage
To use this module in a project:

Integrate the SPI module into your design.
Connect the clk, start, and din inputs.
Monitor the cs, mosi, sclk, and done outputs to handle SPI communication with a slave device.
