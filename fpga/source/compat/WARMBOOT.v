module WARMBOOT(
    input BOOT,
    input S0,
    input S1
    );

`ifndef VERILATOR
SB_WARMBOOT warmboot(
	.BOOT(BOOT),
	.S0(S0),
	.S1(S1)
	);
`endif

endmodule

