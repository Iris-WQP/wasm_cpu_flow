`timescale 1ns / 1ps

module tb_stack;

    reg clk;
    reg rst_n;
    reg push;
    reg pop;
    reg [`st_width-1:0] push_data;
    wire [`st_width-1:0] pop_data;
    wire isEmpty;

    // Instantiate the stack module
    stack u1 (
        .clk(clk),
        .rst_n(rst_n),
        .push(push),
        .pop(pop),
        .push_data(push_data),
        .pop_data(pop_data),
        .isEmpty(isEmpty)
    );

    // Clock generator
    always begin
        #5 clk = ~clk;
    end

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        rst_n = 0;
        push = 0;
        pop = 0;
        push_data = 0;

        #10 rst_n = 1; // De-assert reset
        #10 push = 1; push_data = 64'hA5A5A5A5A5A5A5A5; // Push data onto the stack
        #10 push = 1; push_data = 64'h7B7B7B7B7B7B7B7B; 
        #10 push = 0; pop = 1; // Pop data from the stack
        #10 pop = 0;  push = 1; push_data = 64'h9999999999999999;
        #10 push = 0; pop = 1; // Pop data from the stack
        #10 push = 0; pop = 1; // Pop data from the stack

        // Add more test sequences as needed...

        #10 $finish; // End the simulation
    end

endmodule