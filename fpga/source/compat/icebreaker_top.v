
module icebreaker_top(
    input  wire       clk12,

    // HDMI interface
    output wire       hdmi_clk,
    output wire       hdmi_red,
    output wire       hdmi_grn,
    output wire       hdmi_blu,
    output wire       hdmi_hsync,
    output wire       hdmi_vsync,
    output wire       hdmi_de,

    // Audio output
    output wire       audio_lrck,
    output wire       audio_bck,
    output wire       audio_data,

    // External bus interface
    input  wire       extbus_rd_n,   /* Read strobe */
    input  wire       extbus_wr_n,   /* Write strobe */
    input  wire [4:0] extbus_a,      /* Address */
    inout  wire [7:0] extbus_d,      /* Data (bi-directional) */
    output wire       extbus_irq_n   /* IRQ */
);

wire clk25;

wire [3:0] vga_r;
wire [3:0] vga_g;
wire [3:0] vga_b;

assign hdmi_red = vga_r[0] ^ vga_r[1] ^ vga_r[2] ^ vga_r[3];
assign hdmi_grn = vga_g[0] ^ vga_g[1] ^ vga_g[2] ^ vga_g[3];
assign hdmi_blu = vga_b[0] ^ vga_b[1] ^ vga_b[2] ^ vga_b[3];

pll_12_25 pll(
    .clock_in(clk12),
    .clock_out(clk25),
    .locked()
    );

top vera(
    .clk25(clk25),

    .vga_r(vga_r),
    .vga_g(vga_g),
    .vga_b(vga_b),
    .vga_hsync(hdmi_hsync),
    .vga_vsync(hdmi_vsync),
    .vga_active(hdmi_de),

    .audio_lrck(audio_lrck),
    .audio_bck(audio_bck),
    .audio_data(audio_data),

    .spi_sck(),
    .spi_mosi(),
    .spi_miso(1'b0),
    .spi_ssel_n_sd(),

    .extbus_cs_n(1'b0),
    .extbus_rd_n(extbus_rd_n),
    .extbus_wr_n(extbus_wr_n),
    .extbus_a(extbus_a),
    .extbus_d(extbus_d),
    .extbus_irq_n(extbus_irq_n)
    );

`ifdef verilator
assign hdmi_clk = clk25;
`else
SB_IO #(
        .PIN_TYPE(6'b010000), // DDR OUTPUT
        .PULLUP(1'b0),
        .NEG_TRIGGER(1'b0),
        .IO_STANDARD("SB_LVCMOS")
        ) hdmi_clk_io (
        .PACKAGE_PIN(hdmi_clk),
        .LATCH_INPUT_VALUE(),
        .CLOCK_ENABLE(), // per docs, leave discon for always enable
        .INPUT_CLK(),
        .OUTPUT_CLK(clk25),
        .D_OUT_0(1'b1),
        .D_OUT_1(1'b0),
        .D_IN_0(),
        .D_IN_1()
        );
`endif

endmodule
