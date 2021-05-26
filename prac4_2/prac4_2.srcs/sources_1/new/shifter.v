`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/26/2021 05:39:35 PM
// Design Name: 
// Module Name: shifter
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


module shifter(
    input clk,
    input wire [9:0] shift,
    input wire [4:0] amplitude,
    input wire [14:0] inSine,
    output reg [16:0] shiftedOutput
    );
    
    parameter SIZE = 1024;    
    parameter writeEnable = 0;
    parameter enable = 1'b1;
    integer i;
    wire [15:0] tempVal;
    
    blk_mem_gen_0 BRAM_2(
          .clka     (clk),    // input wire clka
          .ena      (enable),      // input wire ena
          .wea      (writeEnable),      // input wire [0 : 0] wea
          .addra    (i),  // input wire [9 : 0] addra
          .douta    (tempVal)  // output wire [15 : 0] douta
     );
    
    
    initial begin
        i = shift;
    end
        
    //At every positive edge of the clock, output a sine wave sample.
    always@(posedge clk) begin
        i = i+ 1;
        if(i == SIZE)
            i = 0;
            
        shiftedOutput = tempVal * amplitude;
    end
endmodule
