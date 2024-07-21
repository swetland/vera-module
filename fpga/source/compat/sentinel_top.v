`define WITH_SENTINEL

module sentinel_top(
    // VGA interface
    output wire [3:0] vga_r,
    output wire [3:0] vga_g,
    output wire [3:0] vga_b,
    output wire       vga_hsync,
    output wire       vga_vsync,

    // Audio output
    output wire       audio_lrck,
    output wire       audio_bck,
    output wire       audio_data,

    // External bus interface
    input  wire       extbus_sysclk,    /* Clock */
    input  wire       extbus_cs_n,   /* Chip Select */
    input  wire       extbus_phi2,     /* PHI2 clock */
    input  wire       extbus_rw,     /* Read/Write Strobe */
    input  wire [4:0] extbus_a,      /* Address */
    inout  wire [7:0] extbus_d,      /* Data (bi-directional) */
    output wire       extbus_irq_n   /* IRQ */
);

top vera(
    .clk25(extbus_sysclk),

    .vga_r(vga_r),
    .vga_g(vga_g),
    .vga_b(vga_b),
    .vga_hsync(vga_hsync),
    .vga_vsync(vga_vsync),

    .audio_lrck(audio_lrck),
    .audio_bck(audio_bck),
    .audio_data(audio_data),

    .spi_sck(),
    .spi_mosi(),
    .spi_miso(1'b0),
    .spi_ssel_n_sd(),

    .extbus_cs_n(extbus_cs_n),
	.extbus_phi2(extbus_phi2),
    .extbus_rw(extbus_rw),
    .extbus_a(extbus_a),
    .extbus_d(extbus_d),
    .extbus_irq_n(extbus_irq_n)
);

endmodule
