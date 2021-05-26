

module sine_gen(
    input clk ,
    output wire [15:0] sineOutput
    );
    
    parameter SIZE = 1024;    
    parameter writeEnable = 1'b0;
    parameter enable = 1'b1;
    integer i;
    
    blk_mem_gen_0 BRAM_1 (
          .clka     (clk),    // input wire clka
          .ena      (enable),      // input wire ena
          .wea      (writeEnable),      // input wire [0 : 0] wea
          .addra    (i),  // input wire [9 : 0] addra
          .douta    (sineOutput)  // output wire [15 : 0] douta
     );
     
    initial begin
        i = 0;
    end
        
    //At every positive edge of the clock, output a sine wave sample.
    always@(posedge clk) begin
        i = i+ 1;
        if(i == SIZE)
            i = 0;
    end
endmodule