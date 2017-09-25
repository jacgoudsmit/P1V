module              inp_synchronizer
(
input               clock_80,
input  [31:0]       pin_in,

output [31:0]       sync_out
);

// Asynchronous Input Synchronization - Adapted from Xilinx language template
// Since all 32 bits of pin_in are asynchronous to any internal clocking source
// in the Artix, in order to reduce the risk of metastability we run all input
// pin paths through a synchronizer to bring everything into the clock_160 domain.
//
// The following synthesis and implementation attributes are added to the code
// in order improve the MTBF characteristics of the implementation:
//
//  ASYNC_REG="TRUE" - Specifies registers will be receiving asynchronous data
//                     input to allow tools to report and improve metastability
//
// The following parameters are available for customization:
//
//   SYNC_STAGES     - Integer value for number of synchronizing registers, must be 2 or higher
//   PIPELINE_STAGES - Integer value for number of registers on the output of the
//                     synchronizer for the purpose of improveing performance.
//                     Particularly useful for high-fanout nets.
//   INIT            - Initial value of synchronizer registers upon startup, 1'b0 or 1'b1.

   parameter SYNC_STAGES = 2;
   parameter PIPELINE_STAGES = 2;
   parameter INIT = 32'b0;

   (* ASYNC_REG="TRUE" *) reg [SYNC_STAGES-1:0][31:0] sreg = {SYNC_STAGES{INIT}};

   always @(posedge clock_80)
     sreg <= {sreg[SYNC_STAGES-2:0], pin_in[31:0]};

   generate
      if (PIPELINE_STAGES==0) begin: no_pipeline
         assign sync_out = sreg[SYNC_STAGES-1][31:0];
      end else if (PIPELINE_STAGES==1) begin: one_pipeline
         reg [31:0] sreg_pipe = INIT;
         always @(posedge clock_80)
            sreg_pipe <= sreg[SYNC_STAGES-1][31:0];
         assign sync_out = sreg_pipe;
      end else begin: multiple_pipeline
        (* shreg_extract = "no" *) reg [PIPELINE_STAGES-1:0][31:0] sreg_pipe = {PIPELINE_STAGES{INIT}};
         always @(posedge clock_80)
            sreg_pipe <= {sreg_pipe[PIPELINE_STAGES-2:0], sreg[SYNC_STAGES-1][31:0]};
         assign sync_out = sreg_pipe[PIPELINE_STAGES-1][31:0];
      end
   endgenerate
   
endmodule