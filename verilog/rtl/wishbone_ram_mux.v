`default_nettype none

module wishbone_ram_mux
(
`ifdef USE_POWER_PINS
    inout vccd1,	// User area 1 1.8V supply
    inout vssd1,	// User area 1 digital ground
`endif

    // Wishbone UFP (Upward Facing Port)
    input           wb_clk_i,
    input           wb_rst_i,
    input           wbs_ufp_stb_i,
    input           wbs_ufp_cyc_i,
    input           wbs_ufp_we_i,
    input   [3:0]   wbs_ufp_sel_i,
    input   [31:0]  wbs_ufp_dat_i,
    input   [31:0]  wbs_ufp_adr_i,
    output          wbs_ufp_ack_o,
    output  [31:0]  wbs_ufp_dat_o,


    // Wishbone OR (Downward Facing Port) - SRAM8
    output          wbs_or8_stb_o,
    output          wbs_or8_cyc_o,
    output          wbs_or8_we_o,
    output  [3:0]   wbs_or8_sel_o,
    input   [31:0]  wbs_or8_dat_i,
    input           wbs_or8_ack_i,
    output  [31:0]  wbs_or8_dat_o,


    // Wishbone OR (Downward Facing Port) - SRAM9
    output          wbs_or9_stb_o,
    output          wbs_or9_cyc_o,
    output          wbs_or9_we_o,
    output  [3:0]   wbs_or9_sel_o,
    input   [31:0]  wbs_or9_dat_i,
    input           wbs_or9_ack_i,
    output  [31:0]  wbs_or9_dat_o,


    // Wishbone OR (Downward Facing Port) - SRAM10
    output          wbs_or10_stb_o,
    output          wbs_or10_cyc_o,
    output          wbs_or10_we_o,
    output  [3:0]   wbs_or10_sel_o,
    input   [31:0]  wbs_or10_dat_i,
    input           wbs_or10_ack_i,
    output  [31:0]  wbs_or10_dat_o,


    // Wishbone OR (Downward Facing Port) - SRAM0
    output          wbs_or0_stb_o,
    output          wbs_or0_cyc_o,
    output          wbs_or0_we_o,
    output  [3:0]   wbs_or0_sel_o,
    input   [31:0]  wbs_or0_dat_i,
    input           wbs_or0_ack_i,
    output  [31:0]  wbs_or0_dat_o,


    // Wishbone OR (Downward Facing Port) - SRAM1
    output          wbs_or1_stb_o,
    output          wbs_or1_cyc_o,
    output          wbs_or1_we_o,
    output  [3:0]   wbs_or1_sel_o,
    input   [31:0]  wbs_or1_dat_i,
    input           wbs_or1_ack_i,
    output  [31:0]  wbs_or1_dat_o,

    // Wishbone OR (Downward Facing Port) - SRAM2
    output          wbs_or2_stb_o,
    output          wbs_or2_cyc_o,
    output          wbs_or2_we_o,
    output  [3:0]   wbs_or2_sel_o,
    input   [31:0]  wbs_or2_dat_i,
    input           wbs_or2_ack_i,
    output  [31:0]  wbs_or2_dat_o,
	
    // Wishbone OR (Downward Facing Port) - SRAM3
    output          wbs_or3_stb_o,
    output          wbs_or3_cyc_o,
    output          wbs_or3_we_o,
    output  [3:0]   wbs_or3_sel_o,
    input   [31:0]  wbs_or3_dat_i,
    input           wbs_or3_ack_i,
    output  [31:0]  wbs_or3_dat_o,
	
    // Wishbone OR (Downward Facing Port) - SRAM4
    output          wbs_or4_stb_o,
    output          wbs_or4_cyc_o,
    output          wbs_or4_we_o,
    output  [3:0]   wbs_or4_sel_o,
    input   [31:0]  wbs_or4_dat_i,
    input           wbs_or4_ack_i,
    output  [31:0]  wbs_or4_dat_o,
	
    // Wishbone OR (Downward Facing Port) - SRAM5
    output          wbs_or5_stb_o,
    output          wbs_or5_cyc_o,
    output          wbs_or5_we_o,
    output  [3:0]   wbs_or5_sel_o,
    input   [31:0]  wbs_or5_dat_i,
    input           wbs_or5_ack_i,
    output  [31:0]  wbs_or5_dat_o,
	
    // Wishbone OR (Downward Facing Port) - SRAM6
    /* output          wbs_or6_stb_o, */
    /* output          wbs_or6_cyc_o, */
    /* output          wbs_or6_we_o, */
    /* output  [3:0]   wbs_or6_sel_o, */
    /* input   [31:0]  wbs_or6_dat_i, */
    /* input           wbs_or6_ack_i, */
    /* output  [31:0]  wbs_or6_dat_o, */
    
    // Wishbone OR (Downward Facing Port) - ROM0 
    output          wbs_rom0_stb_o,
    output          wbs_rom0_cyc_o,
    output  [3:0]   wbs_rom0_sel_o,
    input   [31:0]  wbs_rom0_dat_i,
    input           wbs_rom0_ack_i
);

parameter SRAM8_BASE_ADDR = 32'h3000_0000;
parameter SRAM8_MASK = 32'hffff_fc00;

parameter SRAM9_BASE_ADDR = 32'h3001_0000;
parameter SRAM9_MASK = 32'hffff_f000;

parameter SRAM10_BASE_ADDR = 32'h3002_0000;
parameter SRAM10_MASK = 32'hffff_f800;

parameter SRAM0_BASE_ADDR = 32'h3003_0000;
parameter SRAM0_MASK = 32'hffff_f000;		

parameter SRAM1_BASE_ADDR = 32'h3004_0000;
parameter SRAM1_MASK = 32'hffff_fc00;

parameter SRAM2_BASE_ADDR = 32'h3005_0000;
parameter SRAM2_MASK = 32'hffff_f800;

parameter SRAM3_BASE_ADDR = 32'h3006_0000;
parameter SRAM3_MASK = 32'hffff_f800;

parameter SRAM4_BASE_ADDR = 32'h3007_0000;
parameter SRAM4_MASK = 32'hffff_f000;

parameter SRAM5_BASE_ADDR = 32'h3008_0000;
parameter SRAM5_MASK = 32'hffff_f800;

parameter SRAM6_BASE_ADDR = 32'h3009_0000;
parameter SRAM6_MASK = 32'hffff_f000;

parameter ROM0_BASE_ADDR = 32'h300a_0000;
parameter ROM0_MASK = 32'hffff_f000;

parameter SRAM8_INDEX = 4'b0000;
parameter SRAM9_INDEX = 4'b0001;
parameter SRAM10_INDEX = 4'b0010;
parameter SRAM0_INDEX = 4'b0011;
parameter SRAM1_INDEX = 4'b0100;
parameter SRAM2_INDEX = 4'b0101;
parameter SRAM3_INDEX = 4'b0110;
parameter SRAM4_INDEX = 4'b0111;
parameter SRAM5_INDEX = 4'b1000;
parameter SRAM6_INDEX = 4'b1001;
parameter ROM0_INDEX = 4'b1010;

wire sram8_addr;
wire sram8_index;
wire sram8_select;

wire sram9_addr;
wire sram9_index;
wire sram9_select;

wire sram10_addr;
wire sram10_index;
wire sram10_select;

wire sram0_addr;
wire sram0_index;
wire sram0_select;

wire sram1_addr;
wire sram1_index;
wire sram1_select;

wire sram2_addr;
wire sram2_index;
wire sram2_select;

wire sram3_addr;
wire sram3_index;
wire sram3_select;

wire sram4_addr;
wire sram4_index;
wire sram4_select;

wire sram5_addr;
wire sram5_index;
wire sram5_select;

wire sram6_addr;
wire sram6_index;
wire sram6_select;

wire rom0_addr;
wire rom0_index;
wire rom0_select;

wire [3:0] sram_index_bits;
assign sram_index_bits = wbs_ufp_adr_i[19:16];

// assign sram8_select = (((wbs_ufp_adr_i & SRAM8_MASK) == SRAM8_BASE_ADDR) && sram_index_bits == 4'b0000);
assign sram8_addr = (wbs_ufp_adr_i & SRAM8_MASK) == SRAM8_BASE_ADDR;
assign sram8_index = sram_index_bits == SRAM8_INDEX;
assign sram8_select = sram8_index & sram8_addr;

//assign sram9_select = (((wbs_ufp_adr_i & SRAM9_MASK) == SRAM9_BASE_ADDR) && sram_index_bits == 4'b0001) ;
assign sram9_addr = (wbs_ufp_adr_i & SRAM9_MASK) == SRAM9_BASE_ADDR;
assign sram9_index = sram_index_bits == SRAM9_INDEX;
assign sram9_select = sram9_index & sram9_addr;

//assign sram10_select = (((wbs_ufp_adr_i & SRAM10_MASK) == SRAM10_BASE_ADDR) && sram_index_bits == 4'b0010);
assign sram10_addr = (wbs_ufp_adr_i & SRAM10_MASK) == SRAM10_BASE_ADDR;
assign sram10_index = sram_index_bits == SRAM10_INDEX;
assign sram10_select = sram10_index & sram10_addr;

//assign sram0_select = (((wbs_ufp_adr_i & SRAM0_MASK) == SRAM0_BASE_ADDR) && sram_index_bits == 4'b0011);
assign sram0_addr = (wbs_ufp_adr_i & SRAM0_MASK) == SRAM0_BASE_ADDR;
assign sram0_index = sram_index_bits == SRAM0_INDEX;
assign sram0_select = sram0_index & sram0_addr;

//assign sram1_select = (((wbs_ufp_adr_i & SRAM1_MASK) == SRAM1_BASE_ADDR) && sram_index_bits == 4'b0100);
assign sram1_addr = (wbs_ufp_adr_i & SRAM1_MASK) == SRAM1_BASE_ADDR;
assign sram1_index = sram_index_bits == SRAM1_INDEX;
assign sram1_select = sram1_index & sram1_addr;

//assign sram2_select = (((wbs_ufp_adr_i & SRAM2_MASK) == SRAM2_BASE_ADDR) && sram_index_bits == 4'b0101);
assign sram2_addr = (wbs_ufp_adr_i & SRAM2_MASK) == SRAM2_BASE_ADDR;
assign sram2_index = sram_index_bits == SRAM2_INDEX;
assign sram2_select = sram2_index & sram2_addr;

//assign sram3_select = (((wbs_ufp_adr_i & SRAM3_MASK) == SRAM3_BASE_ADDR) && sram_index_bits == 4'b0110);
assign sram3_addr = (wbs_ufp_adr_i & SRAM3_MASK) == SRAM3_BASE_ADDR;
assign sram3_index = sram_index_bits == SRAM3_INDEX;
assign sram3_select = sram3_index & sram3_addr;

//assign sram4_select = (((wbs_ufp_adr_i & SRAM4_MASK) == SRAM4_BASE_ADDR) && sram_index_bits == 4'b0111);
assign sram4_addr = (wbs_ufp_adr_i & SRAM4_MASK) == SRAM4_BASE_ADDR;
assign sram4_index = sram_index_bits == SRAM4_INDEX;
assign sram4_select = sram4_index & sram4_addr;

//assign sram5_select = (((wbs_ufp_adr_i & SRAM5_MASK) == SRAM5_BASE_ADDR) && sram_index_bits == 4'b1000);
assign sram5_addr = (wbs_ufp_adr_i & SRAM5_MASK) == SRAM5_BASE_ADDR;
assign sram5_index = sram_index_bits == SRAM5_INDEX;
assign sram5_select = sram5_index & sram5_addr;

//assign sram6_select = (((wbs_ufp_adr_i & SRAM6_MASK) == SRAM6_BASE_ADDR) && sram_index_bits == 4'b1001);
assign sram6_addr = (wbs_ufp_adr_i & SRAM6_MASK) == SRAM6_BASE_ADDR;
assign sram6_index = sram_index_bits == SRAM6_INDEX;
assign sram6_select = sram6_index & sram6_addr;

//assign rom0_select = (((wbs_ufp_adr_i & ROM0_MASK) == ROM0_BASE_ADDR) && sram_index_bits == 4'b1010);
assign rom0_addr = (wbs_ufp_adr_i & ROM0_MASK) == ROM0_BASE_ADDR;
assign rom0_index = sram_index_bits == ROM0_INDEX;
assign rom0_select = rom0_index & rom0_addr;

// UFP -> SRAM 8
assign wbs_or8_stb_o = wbs_ufp_stb_i & sram8_select;
assign wbs_or8_cyc_o = wbs_ufp_cyc_i;
assign wbs_or8_we_o = wbs_ufp_we_i & sram8_select;
assign wbs_or8_sel_o = wbs_ufp_sel_i & {4{sram8_select}};
assign wbs_or8_dat_o = wbs_ufp_dat_i & {32{sram8_select}};

// UFP -> SRAM 9
assign wbs_or9_stb_o = wbs_ufp_stb_i & sram9_select;
assign wbs_or9_cyc_o = wbs_ufp_cyc_i;
assign wbs_or9_we_o = wbs_ufp_we_i & sram9_select;
assign wbs_or9_sel_o = wbs_ufp_sel_i & {4{sram9_select}};
assign wbs_or9_dat_o = wbs_ufp_dat_i & {32{sram9_select}};

// UFP -> SRAM 10
assign wbs_or10_stb_o = wbs_ufp_stb_i & sram10_select;
assign wbs_or10_cyc_o = wbs_ufp_cyc_i;
assign wbs_or10_we_o = wbs_ufp_we_i & sram10_select;
assign wbs_or10_sel_o = wbs_ufp_sel_i & {4{sram10_select}};
assign wbs_or10_dat_o = wbs_ufp_dat_i & {32{sram10_select}};

// UFP -> SRAM 0
assign wbs_or0_stb_o = wbs_ufp_stb_i & sram0_select;
assign wbs_or0_cyc_o = wbs_ufp_cyc_i;
assign wbs_or0_we_o = wbs_ufp_we_i & sram0_select;
assign wbs_or0_sel_o = wbs_ufp_sel_i & {4{sram0_select}};
assign wbs_or0_dat_o = wbs_ufp_dat_i & {32{sram0_select}};

// UFP -> SRAM 1
assign wbs_or1_stb_o = wbs_ufp_stb_i & sram1_select;
assign wbs_or1_cyc_o = wbs_ufp_cyc_i;
assign wbs_or1_we_o = wbs_ufp_we_i & sram1_select;
assign wbs_or1_sel_o = wbs_ufp_sel_i & {4{sram1_select}};
assign wbs_or1_dat_o = wbs_ufp_dat_i & {32{sram1_select}};

// UFP -> SRAM 2
assign wbs_or2_stb_o = wbs_ufp_stb_i & sram2_select;
assign wbs_or2_cyc_o = wbs_ufp_cyc_i;
assign wbs_or2_we_o = wbs_ufp_we_i & sram2_select;
assign wbs_or2_sel_o = wbs_ufp_sel_i & {4{sram2_select}};
assign wbs_or2_dat_o = wbs_ufp_dat_i & {32{sram2_select}};

// UFP -> SRAM 3
assign wbs_or3_stb_o = wbs_ufp_stb_i & sram3_select;
assign wbs_or3_cyc_o = wbs_ufp_cyc_i;
assign wbs_or3_we_o = wbs_ufp_we_i & sram3_select;
assign wbs_or3_sel_o = wbs_ufp_sel_i & {4{sram3_select}};
assign wbs_or3_dat_o = wbs_ufp_dat_i & {32{sram3_select}};

// UFP -> SRAM 4
assign wbs_or4_stb_o = wbs_ufp_stb_i & sram4_select;
assign wbs_or4_cyc_o = wbs_ufp_cyc_i;
assign wbs_or4_we_o = wbs_ufp_we_i & sram4_select;
assign wbs_or4_sel_o = wbs_ufp_sel_i & {4{sram4_select}};
assign wbs_or4_dat_o = wbs_ufp_dat_i & {32{sram4_select}};

// UFP -> SRAM 5
assign wbs_or5_stb_o = wbs_ufp_stb_i & sram5_select;
assign wbs_or5_cyc_o = wbs_ufp_cyc_i;
assign wbs_or5_we_o = wbs_ufp_we_i & sram5_select;
assign wbs_or5_sel_o = wbs_ufp_sel_i & {4{sram5_select}};
assign wbs_or5_dat_o = wbs_ufp_dat_i & {32{sram5_select}};

// UFP -> SRAM 6
/* assign wbs_or6_stb_o = wbs_ufp_stb_i & sram6_select; */
/* assign wbs_or6_cyc_o = wbs_ufp_cyc_i; */
/* assign wbs_or6_we_o = wbs_ufp_we_i & sram6_select; */
/* assign wbs_or6_sel_o = wbs_ufp_sel_i & {4{sram6_select}}; */
/* assign wbs_or6_dat_o = wbs_ufp_dat_i & {32{sram6_select}}; */


// UFP -> ROM 0
assign wbs_rom0_stb_o = wbs_ufp_stb_i & rom0_select;
assign wbs_rom0_cyc_o = wbs_ufp_cyc_i;
assign wbs_rom0_sel_o = wbs_ufp_sel_i & {4{rom0_select}};

assign wbs_ufp_ack_o = (wbs_or8_ack_i & sram8_select) | (wbs_or9_ack_i & sram9_select) | (wbs_or10_ack_i & sram10_select) | (wbs_or0_ack_i & sram0_select) | (wbs_or1_ack_i & sram1_select) | (wbs_or2_ack_i & sram2_select) | (wbs_or3_ack_i & sram3_select) | (wbs_or4_ack_i & sram4_select) | (wbs_or5_ack_i & sram5_select) | (wbs_rom0_ack_i & rom0_select);

assign wbs_ufp_dat_o = (wbs_or8_dat_i & {32{sram8_select}}) | (wbs_or9_dat_i & {32{sram9_select}}) | (wbs_or10_dat_i & {32{sram10_select}}) | (wbs_or0_dat_i & {32{sram0_select}}) | (wbs_or1_dat_i & {32{sram1_select}}) | (wbs_or2_dat_i & {32{sram2_select}}) | (wbs_or3_dat_i & {32{sram3_select}}) | (wbs_or4_dat_i & {32{sram4_select}}) | (wbs_or5_dat_i & {32{sram5_select}}) | (wbs_rom0_dat_i & {32{rom0_select}});

endmodule

`default_nettype wire
