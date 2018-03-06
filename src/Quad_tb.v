
`default_nettype none
`timescale 100 ns / 10 ns
`define DUMPSTR(x) `"x.vcd`"


module Quad_tb();

//-- Simulation time: 1us (10 * 100ns)
parameter DURATION = 10;

//-- Clock signal. It is not used in this simulation
reg clk = 0;
always #0.5 clk = ~clk;


//-- Counter bits length
reg A, B;
wire [7:0] counter;

initial begin
  B = 1'b1;
  A = 1'b1;
  #1;
  B = 1'b0;
  forever #2 B <= ~B;
    end
  always #2 A <= ~A;


quad quad1(
           .clk(clk),
           .quadA(B),
           .quadB(A),
           .count(counter)
);

initial begin
  //-- File where to store the simulation
  $dumpfile(`DUMPSTR(`VCD_OUTPUT));
  $dumpvars(0, Quad_tb);

  #(DURATION) $display("END of the simulation");
  $finish;
end

endmodule
