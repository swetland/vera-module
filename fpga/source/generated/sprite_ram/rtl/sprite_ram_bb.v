/*******************************************************************************
    Verilog netlist generated by IPGEN Radiant Software (64-bit) 1.1.0.165.1
    Soft IP Version: 1.1.0
    Wed Sep 04 11:07:50 2019
*******************************************************************************/
/*******************************************************************************
    Wrapper Module generated per user settings.
*******************************************************************************/
module sprite_ram (wr_clk_i, rd_clk_i, wr_clk_en_i, rd_en_i, rd_clk_en_i,
    wr_en_i, ben_i, wr_data_i, wr_addr_i, rd_addr_i, rd_data_o)/* synthesis syn_black_box syn_declare_black_box=1 */;
    input  wr_clk_i;
    input  rd_clk_i;
    input  wr_clk_en_i;
    input  rd_en_i;
    input  rd_clk_en_i;
    input  wr_en_i;
    input  [3:0]  ben_i;
    input  [31:0]  wr_data_i;
    input  [7:0]  wr_addr_i;
    input  [7:0]  rd_addr_i;
    output  [31:0]  rd_data_o;
endmodule