module Debounce(
    input               clock,
    input               reset,
    input      [15:0]   switch,
    output reg [15:0]   switch_db
    );
    
    parameter INPUTS = 16;
    genvar x;
    generate
        for (x = 0; x < INPUTS; x++) begin
            debounce_one dbounce_one_switch(
                .clock  (clock),
                .reset  (reset),
                .switch (switch[x]),
                .switch_db (switch_db[x])
            );
        end
    endgenerate
endmodule
