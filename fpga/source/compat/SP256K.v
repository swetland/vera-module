
module SP256K(
    input wire CK,
    input wire [13:0] AD,
    input wire [15:0] DI,
    output wire [15:0] DO,
    input wire [3:0] MASKWE,
    input wire WE,
    input wire CS,
    input wire STDBY,
    input wire SLEEP,
    input wire PWROFF_N
    );

`ifdef verilator
reg [15:0]mem[0:16383];
reg [15:0]data;

always @(posedge CK) begin
    if (WE)
        mem[AD] <= DI;
    else
        data <= mem[AD];
end

assign DO = data;
`else
SB_SPRAM256KA spram_inst(
    .CLOCK(CK),
    .ADDRESS(AD),
    .DATAIN(DI),
    .DATAOUT(DO),
    .MASKWREN(MASKWE),
    .WREN(WE),
    .CHIPSELECT(CS),
    .STANDBY(STDBY),
    .SLEEP(SLEEP),
    .POWEROFF(PWROFF_N)
    );
`endif
endmodule

