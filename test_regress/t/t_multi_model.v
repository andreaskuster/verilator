// DESCRIPTION: Verilator: Verilog Multiple Model Test Module
//
// This model counts from 0 to 10. It is instantiated twice in concurrent threads to check for race conditions/signal interference.
//
// This file ONLY is placed under the Creative Commons Public Domain, for
// any use, without warranty, 2020 by Andreas Kuster.
// SPDX-License-Identifier: CC0-1.0
//

module top
( input               clk_i
, input               rst_i
, input string        trace_name
, output logic [31:0] counter
, output logic        done_o
);

   initial begin
      $dumpfile(trace_name);
      $dumpvars();

   end

   always@(posedge clk_i)
   begin
      if(rst_i)
         counter <= 0;
      else
         counter <= counter + 1;
   end

   assign done_o = (counter >= 10) ? 1'b1:1'b0;

   always@(*)
   begin
      if (counter >= 10)
         $finish;
   end

endmodule


