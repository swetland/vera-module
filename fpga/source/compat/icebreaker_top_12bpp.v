
module icebreaker_top(
    input  wire       clk12,

    // HDMI interface
    output wire       hdmi_clk,
    output wire [3:0] hdmi_red,
    output wire [3:0] hdmi_grn,
    output wire [3:0] hdmi_blu,
    output wire       hdmi_hsync,
    output wire       hdmi_vsync,
    output wire       hdmi_de,

`ifdef WITH_SPI_DEBUG
    input wire        spi_clk,
    input wire        spi_cs,
    input wire        spi_si,
    output wire       spi_so,
`endif

    // Audio output
    output wire       audio_lrck,
    output wire       audio_bck,
    output wire       audio_data
);

wire clk25;

pll_12_25 pll(
    .clock_in(clk12),
    .clock_out(clk25),
    .locked()
    );

`ifdef WITH_SPI_DEBUG
wire [7:0] sys_waddr;
wire [7:0] sys_wdata;
wire sys_wr;

spi_debug_ifc debug(
    .spi_clk(spi_clk),
    .spi_cs_i(spi_cs),
    .spi_data_i(spi_si),
    .spi_data_o(spi_so),
    .sys_clk(clk25),
    .sys_wr_o(sys_wr),
    .sys_waddr_o(sys_waddr),
    .sys_wdata_o(sys_wdata)
    );
`endif

top vera(
    .clk25(clk25),

    .vga_r(hdmi_red),
    .vga_g(hdmi_grn),
    .vga_b(hdmi_blu),
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

`ifdef WITH_SPI_DEBUG
    .debug_wr(sys_wr),
    .debug_addr(sys_waddr[4:0]),
    .debug_wdata(sys_wdata[7:0]),
`endif

    .extbus_cs_n(1'b1),
    .extbus_rd_n(1'b1),
    .extbus_wr_n(1'b1),
    .extbus_a(5'h0),
    .extbus_d(),
    .extbus_irq_n()
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
