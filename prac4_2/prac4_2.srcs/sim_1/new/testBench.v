`timescale 1ns / 1ps

module testBench;
    reg clk;
    wire [15:0] sine;
    wire [16:0] shiftedSine;
    
    //initates and connects the sine generator to the testBench
    sine_gen baseSineGen(
        .clk        (clk),
        .sineOutput (sine)
    );
    
    shifter baseShift(
        .clk            (clk),
        .shift          (256),
        .amplitude      (2),
        .inSine         (sine),
        .shiftedOutput (shiftedSine)
    );
    
    //frequency control
    parameter freq = 100000000; //100 MHz
    parameter SIZE = 1024; 
    parameter clockRate = 0.005; //clock time (make this an output from the sine modules)
    
    //Generate a clock with the above frequency control
    initial
    begin 
    clk = 1'b0;
    end
    always #clockRate clk = ~clk; //#1 is one nano second delay (#x controlls the speed)
    
endmodule
