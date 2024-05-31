`timescale 1ns / 1ps

module debouncer_tb;

    // Inputs
    reg button;
    reg clk;
	reg reset;

    // Outputs
    wire result;

    // Instantiate the Unit Under Test (UUT)
    debouncer debouncer_u (
        .button(button), 
        .clk(clk), 
		.reset(reset),
        .result(result)
    );

   initial begin
      clk = 1'b0; 
    end

always #100 clk = ~ clk;  

    initial begin 

        button=0; reset=1;
        #50 reset=0;
        #50 button=1;            // Fluctuations - glitch
        #200 button=0;
        #50 button=1;           // Fluctuations - glitch
        #150 button=0;
        #100 button=1;          // Pushbotton pressed
        #8000 button=0;                       
        #50 button=1;           // Fluctuations - glitch
        #200 button=0;
        #50 button=1;           // Fluctuations - glitch
        #200 button=0;
        #1000 $finish;
    end 
	
  
endmodule