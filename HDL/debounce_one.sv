// DeBounce_v.v


//////////////////////// Button Debounceer ///////////////////////////////////////
//***********************************************************************
// FileName: DeBounce_v.v
// FPGA: MachXO2 7000HE
// IDE: Diamond 2.0.1 
//
// HDL IS PROVIDED "AS IS." DIGI-KEY EXPRESSLY DISCLAIMS ANY
// WARRANTY OF ANY KIND, WHETHER EXPRESS OR IMPLIED, INCLUDING BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
// PARTICULAR PURPOSE, OR NON-INFRINGEMENT. IN NO EVENT SHALL DIGI-KEY
// BE LIABLE FOR ANY INCIDENTAL, SPECIAL, INDIRECT OR CONSEQUENTIAL
// DAMAGES, LOST PROFITS OR LOST DATA, HARM TO YOUR EQUIPMENT, COST OF
// PROCUREMENT OF SUBSTITUTE GOODS, TECHNOLOGY OR SERVICES, ANY CLAIMS
// BY THIRD PARTIES (INCLUDING BUT NOT LIMITED TO ANY DEFENSE THEREOF),
// ANY CLAIMS FOR INDEMNITY OR CONTRIBUTION, OR OTHER SIMILAR COSTS.
// DIGI-KEY ALSO DISCLAIMS ANY LIABILITY FOR PATENT OR COPYRIGHT
// INFRINGEMENT.
//
// Version History
// Version 1.0 04/11/2013 Tony Storey
// Initial Public Release
// Small Footprint Button Debouncer


module debounce_one 
    (
    input       clock, reset, switch,                   // inputs
    output reg  switch_db                               // output
    );
//// ---------------- internal constants --------------
    parameter N = 6;                                    // (2^5 count @19.5Khz = 1.6ms debounce time
////---------------- internal variables ---------------
    reg  [N-1 : 0]  q_reg;                              // timing regs
    reg  [N-1 : 0]  q_next;
    reg DFF1, DFF2;                                     // input flip-flops
    wire q_add;                                         // control flags
    wire q_reset;
//// ------------------------------------------------------

////continuous assignment for counter control
    assign q_reset = (DFF1  ^ DFF2);        // xor input flip flops to look for level change, which resets counter
    assign  q_add = ~(q_reg[N-1]);          // add to counter when q_reg msb is equal to 0
    
//// combo counter to manage q_next 
    always @ ( q_reset, q_add, q_reg)
        begin
            case( {q_reset , q_add})
                2'b00 :
                        q_next <= q_reg;
                2'b01 :
                        q_next <= q_reg + 1;
                default :
                        q_next <= { N {1'b0} };
            endcase     
        end
    
//// Flip flop inputs and q_reg update
    always @ ( posedge clock )
        begin
            if(reset ==  1'b1)
                begin
                    DFF1 <= 1'b0;
                    DFF2 <= 1'b0;
                    q_reg <= { N {1'b0} };
                end
            else
                begin
                    DFF1 <= switch;
                    DFF2 <= DFF1;
                    q_reg <= q_next;
                end
        end
    
//// counter control
    always @ ( posedge clock )
        begin
            if(q_reg[N-1] == 1'b1)
                    switch_db <= DFF2;
            else
                    switch_db <= switch_db;
        end

    endmodule