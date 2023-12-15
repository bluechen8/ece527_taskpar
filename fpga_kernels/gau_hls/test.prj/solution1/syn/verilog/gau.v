// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL
// Version: 2020.1
// Copyright (C) 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="gau_gau,hls_ip_2020_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xcu250-figd2104-2L-e,HLS_INPUT_CLOCK=2.500000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=1.750000,HLS_SYN_LAT=68110,HLS_SYN_TPT=none,HLS_SYN_MEM=1,HLS_SYN_DSP=0,HLS_SYN_FF=463,HLS_SYN_LUT=877,HLS_VERSION=2020_1}" *)

module gau (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        data_address0,
        data_ce0,
        data_q0,
        out_r_address0,
        out_r_ce0,
        out_r_we0,
        out_r_d0
);

parameter    ap_ST_fsm_state1 = 8'd1;
parameter    ap_ST_fsm_pp0_stage0 = 8'd2;
parameter    ap_ST_fsm_state4 = 8'd4;
parameter    ap_ST_fsm_state5 = 8'd8;
parameter    ap_ST_fsm_state6 = 8'd16;
parameter    ap_ST_fsm_state7 = 8'd32;
parameter    ap_ST_fsm_pp2_stage0 = 8'd64;
parameter    ap_ST_fsm_state14 = 8'd128;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [15:0] data_address0;
output   data_ce0;
input  [7:0] data_q0;
output  [15:0] out_r_address0;
output   out_r_ce0;
output   out_r_we0;
output  [7:0] out_r_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg data_ce0;
reg out_r_ce0;
reg out_r_we0;

(* fsm_encoding = "none" *) reg   [7:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [9:0] empty_reg_229;
reg   [8:0] xi_reg_284;
wire   [0:0] exitcond4613_fu_295_p2;
reg   [0:0] exitcond4613_reg_825;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [9:0] empty_19_fu_301_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [7:0] empty_20_fu_307_p1;
reg   [7:0] empty_20_reg_834;
wire   [1:0] tmp_2_fu_311_p4;
reg   [1:0] tmp_2_reg_839;
wire   [4:0] tmp_3_fu_321_p3;
reg   [4:0] tmp_3_reg_844;
wire   [4:0] empty_21_fu_329_p2;
reg   [4:0] empty_21_reg_849;
wire   [0:0] empty_22_fu_335_p2;
reg   [0:0] empty_22_reg_854;
wire   [4:0] empty_25_fu_349_p2;
reg   [4:0] empty_25_reg_860;
wire   [7:0] window_buf_0_1_0_load_reg_901;
wire    ap_CS_fsm_state5;
wire   [7:0] window_buf_0_2_0_load_reg_906;
wire   [7:0] window_buf_1_1_0_load_reg_911;
wire   [7:0] window_buf_1_2_0_load_reg_916;
wire   [7:0] window_buf_2_1_0_load_reg_921;
wire   [7:0] window_buf_2_2_0_load_reg_926;
wire   [3:0] empty_35_fu_437_p2;
wire   [7:0] next_mul_fu_443_p2;
wire   [0:0] exitcond4512_fu_431_p2;
wire   [3:0] idx_urem_fu_505_p3;
wire   [0:0] icmp_ln31_fu_537_p2;
wire    ap_CS_fsm_state7;
wire   [8:0] add_ln31_fu_543_p2;
reg   [8:0] add_ln31_reg_1001;
wire   [15:0] tmp_6_fu_553_p3;
reg   [15:0] tmp_6_reg_1006;
wire   [0:0] icmp_ln32_fu_570_p2;
reg   [0:0] icmp_ln32_reg_1011;
wire    ap_CS_fsm_pp2_stage0;
wire    ap_block_state8_pp2_stage0_iter0;
wire    ap_block_state9_pp2_stage0_iter1;
wire    ap_block_state10_pp2_stage0_iter2;
wire    ap_block_state11_pp2_stage0_iter3;
wire    ap_block_state12_pp2_stage0_iter4;
wire    ap_block_state13_pp2_stage0_iter5;
wire    ap_block_pp2_stage0_11001;
reg   [0:0] icmp_ln32_reg_1011_pp2_iter1_reg;
reg   [0:0] icmp_ln32_reg_1011_pp2_iter2_reg;
reg   [0:0] icmp_ln32_reg_1011_pp2_iter3_reg;
reg   [0:0] icmp_ln32_reg_1011_pp2_iter4_reg;
wire   [8:0] add_ln32_fu_576_p2;
reg    ap_enable_reg_pp2_iter0;
reg   [7:0] line_buf_addr_1_reg_1020;
reg   [7:0] line_buf_addr_1_reg_1020_pp2_iter1_reg;
reg   [7:0] line_buf_addr_1_reg_1020_pp2_iter2_reg;
wire   [15:0] add_ln44_fu_582_p2;
reg   [15:0] add_ln44_reg_1026;
wire   [63:0] zext_ln44_fu_587_p1;
reg   [63:0] zext_ln44_reg_1031;
reg   [63:0] zext_ln44_reg_1031_pp2_iter2_reg;
reg   [63:0] zext_ln44_reg_1031_pp2_iter3_reg;
reg   [63:0] zext_ln44_reg_1031_pp2_iter4_reg;
reg   [7:0] window_buf_0_2_reg_1041;
reg   [7:0] window_buf_1_2_reg_1047;
reg   [7:0] window_buf_1_2_reg_1047_pp2_iter3_reg;
reg   [7:0] window_buf_2_2_reg_1053;
reg   [15:0] tmp_1_reg_1060;
reg   [7:0] window_buf_0_1_2_reg_1065;
wire   [9:0] add_ln62_3_fu_666_p2;
reg   [9:0] add_ln62_3_reg_1070;
wire   [9:0] add_ln62_5_fu_682_p2;
reg   [9:0] add_ln62_5_reg_1075;
reg   [7:0] trunc_ln_reg_1080;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_pp2_stage0_subdone;
reg    ap_condition_pp2_flush_enable;
reg    ap_enable_reg_pp2_iter1;
reg    ap_enable_reg_pp2_iter2;
reg    ap_enable_reg_pp2_iter3;
reg    ap_enable_reg_pp2_iter4;
reg    ap_condition_pp2_exit_iter4_state12;
reg    ap_enable_reg_pp2_iter5;
reg   [7:0] line_buf_address0;
reg    line_buf_ce0;
reg   [2:0] line_buf_we0;
reg   [23:0] line_buf_d0;
reg    line_buf_ce1;
wire   [23:0] line_buf_q1;
reg   [3:0] empty_33_reg_240;
wire    ap_CS_fsm_state4;
reg   [7:0] phi_mul_reg_251;
reg   [3:0] phi_urem_reg_262;
reg   [8:0] yi_reg_273;
wire    ap_CS_fsm_state14;
wire    ap_CS_fsm_state6;
wire   [63:0] p_cast11_fu_355_p1;
wire    ap_block_pp0_stage0;
wire   [63:0] zext_ln32_fu_561_p1;
wire    ap_block_pp2_stage0;
reg   [7:0] window_buf_0_1_fu_158;
reg   [7:0] window_buf_0_1_1_fu_162;
reg   [7:0] window_buf_1_1_fu_166;
reg   [7:0] window_buf_1_1_1_fu_170;
reg   [7:0] window_buf_2_1_fu_174;
reg   [7:0] window_buf_2_1_1_fu_178;
wire   [23:0] empty_31_fu_396_p2;
wire   [2:0] mask_fu_406_p2;
wire   [23:0] tmp_5_fu_633_p3;
wire   [4:0] empty_23_fu_341_p3;
wire   [4:0] empty_24_fu_359_p3;
wire   [23:0] empty_26_fu_364_p1;
wire   [23:0] empty_27_fu_368_p1;
wire   [23:0] empty_29_fu_378_p2;
wire   [23:0] empty_30_fu_384_p2;
wire   [23:0] empty_28_fu_371_p3;
wire   [23:0] p_demorgan_fu_390_p2;
wire   [2:0] empty_32_fu_403_p1;
wire   [3:0] next_urem_fu_493_p2;
wire   [0:0] empty_37_fu_499_p2;
wire   [7:0] empty_39_fu_549_p1;
wire   [15:0] zext_ln32_1_fu_566_p1;
wire   [8:0] shl_ln62_4_fu_651_p3;
wire   [9:0] zext_ln62_fu_640_p1;
wire   [9:0] zext_ln62_7_fu_659_p1;
wire   [8:0] zext_ln62_8_fu_663_p1;
wire   [8:0] zext_ln62_6_fu_647_p1;
wire   [8:0] add_ln62_4_fu_672_p2;
wire   [9:0] zext_ln62_2_fu_644_p1;
wire   [9:0] zext_ln62_12_fu_678_p1;
wire   [8:0] shl_ln_fu_712_p3;
wire   [8:0] shl_ln62_1_fu_723_p3;
wire   [9:0] shl_ln62_2_fu_735_p3;
wire   [8:0] shl_ln62_3_fu_747_p3;
wire   [9:0] zext_ln62_3_fu_731_p1;
wire   [9:0] zext_ln62_1_fu_719_p1;
wire   [9:0] add_ln62_fu_758_p2;
wire   [10:0] zext_ln62_5_fu_754_p1;
wire   [10:0] zext_ln62_4_fu_743_p1;
wire   [10:0] add_ln62_1_fu_768_p2;
wire   [11:0] zext_ln62_9_fu_764_p1;
wire   [11:0] zext_ln62_10_fu_774_p1;
wire   [10:0] zext_ln62_11_fu_784_p1;
wire   [10:0] zext_ln62_13_fu_787_p1;
wire   [10:0] add_ln62_6_fu_790_p2;
wire   [11:0] add_ln62_2_fu_778_p2;
wire   [11:0] zext_ln62_14_fu_796_p1;
wire   [11:0] add_ln62_7_fu_800_p2;
reg   [7:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_idle_pp2;
wire    ap_enable_pp2;

// power-on initialization
initial begin
#0 ap_CS_fsm = 8'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp2_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp2_iter1 = 1'b0;
#0 ap_enable_reg_pp2_iter2 = 1'b0;
#0 ap_enable_reg_pp2_iter3 = 1'b0;
#0 ap_enable_reg_pp2_iter4 = 1'b0;
#0 ap_enable_reg_pp2_iter5 = 1'b0;
end

gau_line_buf #(
    .DataWidth( 24 ),
    .AddressRange( 256 ),
    .AddressWidth( 8 ))
line_buf_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(line_buf_address0),
    .ce0(line_buf_ce0),
    .we0(line_buf_we0),
    .d0(line_buf_d0),
    .address1(line_buf_addr_1_reg_1020),
    .ce1(line_buf_ce1),
    .q1(line_buf_q1)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
        end else if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp2_iter0 <= 1'b0;
    end else begin
        if ((1'b1 == ap_condition_pp2_flush_enable)) begin
            ap_enable_reg_pp2_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln31_fu_537_p2 == 1'd0))) begin
            ap_enable_reg_pp2_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp2_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp2_stage0_subdone)) begin
            ap_enable_reg_pp2_iter1 <= ap_enable_reg_pp2_iter0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp2_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp2_stage0_subdone)) begin
            ap_enable_reg_pp2_iter2 <= ap_enable_reg_pp2_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp2_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp2_stage0_subdone)) begin
            ap_enable_reg_pp2_iter3 <= ap_enable_reg_pp2_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp2_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp2_stage0_subdone)) begin
            ap_enable_reg_pp2_iter4 <= ap_enable_reg_pp2_iter3;
        end else if ((((1'b0 == ap_block_pp2_stage0_subdone) & (ap_enable_reg_pp2_iter3 == 1'b0) & (1'b1 == ap_condition_pp2_exit_iter4_state12)) | ((1'b1 == ap_CS_fsm_state7) & (icmp_ln31_fu_537_p2 == 1'd0)))) begin
            ap_enable_reg_pp2_iter4 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp2_iter5 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp2_stage0_subdone) & (1'b1 == ap_condition_pp2_exit_iter4_state12))) begin
            ap_enable_reg_pp2_iter5 <= ap_enable_reg_pp2_iter3;
        end else if ((1'b0 == ap_block_pp2_stage0_subdone)) begin
            ap_enable_reg_pp2_iter5 <= ap_enable_reg_pp2_iter4;
        end else if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln31_fu_537_p2 == 1'd0))) begin
            ap_enable_reg_pp2_iter5 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        empty_33_reg_240 <= 4'd0;
    end else if (((1'b1 == ap_CS_fsm_state5) & (exitcond4512_fu_431_p2 == 1'd0))) begin
        empty_33_reg_240 <= empty_35_fu_437_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_11001) & (exitcond4613_fu_295_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_reg_229 <= empty_19_fu_301_p2;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        empty_reg_229 <= 10'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        phi_mul_reg_251 <= 8'd0;
    end else if (((1'b1 == ap_CS_fsm_state5) & (exitcond4512_fu_431_p2 == 1'd0))) begin
        phi_mul_reg_251 <= next_mul_fu_443_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        phi_urem_reg_262 <= 4'd0;
    end else if (((1'b1 == ap_CS_fsm_state5) & (exitcond4512_fu_431_p2 == 1'd0))) begin
        phi_urem_reg_262 <= idx_urem_fu_505_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (ap_enable_reg_pp2_iter3 == 1'b1) & (icmp_ln32_reg_1011_pp2_iter2_reg == 1'd0))) begin
        window_buf_0_1_1_fu_162 <= window_buf_0_2_reg_1041;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        window_buf_0_1_1_fu_162 <= window_buf_0_2_0_load_reg_906;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (ap_enable_reg_pp2_iter3 == 1'b1) & (icmp_ln32_reg_1011_pp2_iter2_reg == 1'd0))) begin
        window_buf_0_1_fu_158 <= window_buf_0_1_1_fu_162;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        window_buf_0_1_fu_158 <= window_buf_0_1_0_load_reg_901;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (ap_enable_reg_pp2_iter4 == 1'b1) & (icmp_ln32_reg_1011_pp2_iter3_reg == 1'd0))) begin
        window_buf_1_1_1_fu_170 <= window_buf_1_2_reg_1047_pp2_iter3_reg;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        window_buf_1_1_1_fu_170 <= window_buf_1_2_0_load_reg_916;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (ap_enable_reg_pp2_iter4 == 1'b1) & (icmp_ln32_reg_1011_pp2_iter3_reg == 1'd0))) begin
        window_buf_1_1_fu_166 <= window_buf_1_1_1_fu_170;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        window_buf_1_1_fu_166 <= window_buf_1_1_0_load_reg_911;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (ap_enable_reg_pp2_iter3 == 1'b1) & (icmp_ln32_reg_1011_pp2_iter2_reg == 1'd0))) begin
        window_buf_2_1_1_fu_178 <= window_buf_2_2_reg_1053;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        window_buf_2_1_1_fu_178 <= window_buf_2_2_0_load_reg_926;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (ap_enable_reg_pp2_iter3 == 1'b1) & (icmp_ln32_reg_1011_pp2_iter2_reg == 1'd0))) begin
        window_buf_2_1_fu_174 <= window_buf_2_1_1_fu_178;
    end else if ((1'b1 == ap_CS_fsm_state6)) begin
        window_buf_2_1_fu_174 <= window_buf_2_1_0_load_reg_921;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (1'b1 == ap_CS_fsm_pp2_stage0) & (ap_enable_reg_pp2_iter0 == 1'b1) & (icmp_ln32_fu_570_p2 == 1'd0))) begin
        xi_reg_284 <= add_ln32_fu_576_p2;
    end else if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln31_fu_537_p2 == 1'd0))) begin
        xi_reg_284 <= 9'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state6)) begin
        yi_reg_273 <= 9'd0;
    end else if ((1'b1 == ap_CS_fsm_state14)) begin
        yi_reg_273 <= add_ln31_reg_1001;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        add_ln31_reg_1001 <= add_ln31_fu_543_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln32_fu_570_p2 == 1'd0))) begin
        add_ln44_reg_1026 <= add_ln44_fu_582_p2;
        line_buf_addr_1_reg_1020 <= zext_ln32_fu_561_p1;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (icmp_ln32_reg_1011_pp2_iter2_reg == 1'd0))) begin
        add_ln62_3_reg_1070 <= add_ln62_3_fu_666_p2;
        add_ln62_5_reg_1075 <= add_ln62_5_fu_682_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond4613_fu_295_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        empty_20_reg_834 <= empty_20_fu_307_p1;
        empty_21_reg_849[4 : 3] <= empty_21_fu_329_p2[4 : 3];
        empty_22_reg_854 <= empty_22_fu_335_p2;
        empty_25_reg_860 <= empty_25_fu_349_p2;
        tmp_2_reg_839 <= {{empty_reg_229[9:8]}};
        tmp_3_reg_844[4 : 3] <= tmp_3_fu_321_p3[4 : 3];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        exitcond4613_reg_825 <= exitcond4613_fu_295_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (1'b1 == ap_CS_fsm_pp2_stage0))) begin
        icmp_ln32_reg_1011 <= icmp_ln32_fu_570_p2;
        icmp_ln32_reg_1011_pp2_iter1_reg <= icmp_ln32_reg_1011;
        line_buf_addr_1_reg_1020_pp2_iter1_reg <= line_buf_addr_1_reg_1020;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp2_stage0_11001)) begin
        icmp_ln32_reg_1011_pp2_iter2_reg <= icmp_ln32_reg_1011_pp2_iter1_reg;
        icmp_ln32_reg_1011_pp2_iter3_reg <= icmp_ln32_reg_1011_pp2_iter2_reg;
        icmp_ln32_reg_1011_pp2_iter4_reg <= icmp_ln32_reg_1011_pp2_iter3_reg;
        line_buf_addr_1_reg_1020_pp2_iter2_reg <= line_buf_addr_1_reg_1020_pp2_iter1_reg;
        window_buf_0_1_2_reg_1065 <= window_buf_0_1_1_fu_162;
        window_buf_1_2_reg_1047_pp2_iter3_reg <= window_buf_1_2_reg_1047;
        zext_ln44_reg_1031_pp2_iter2_reg[15 : 0] <= zext_ln44_reg_1031[15 : 0];
        zext_ln44_reg_1031_pp2_iter3_reg[15 : 0] <= zext_ln44_reg_1031_pp2_iter2_reg[15 : 0];
        zext_ln44_reg_1031_pp2_iter4_reg[15 : 0] <= zext_ln44_reg_1031_pp2_iter3_reg[15 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (icmp_ln32_reg_1011_pp2_iter1_reg == 1'd0))) begin
        tmp_1_reg_1060 <= {{line_buf_q1[23:8]}};
        window_buf_0_2_reg_1041 <= {{line_buf_q1[15:8]}};
        window_buf_1_2_reg_1047 <= {{line_buf_q1[23:16]}};
        window_buf_2_2_reg_1053 <= data_q0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln31_fu_537_p2 == 1'd0))) begin
        tmp_6_reg_1006[15 : 8] <= tmp_6_fu_553_p3[15 : 8];
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (icmp_ln32_reg_1011_pp2_iter3_reg == 1'd0))) begin
        trunc_ln_reg_1080 <= {{add_ln62_7_fu_800_p2[11:4]}};
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln32_reg_1011 == 1'd0))) begin
        zext_ln44_reg_1031[15 : 0] <= zext_ln44_fu_587_p1[15 : 0];
    end
end

always @ (*) begin
    if ((exitcond4613_fu_295_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp2_iter4 == 1'b1) & (ap_enable_reg_pp2_iter3 == 1'b0))) begin
        ap_condition_pp2_exit_iter4_state12 = 1'b1;
    end else begin
        ap_condition_pp2_exit_iter4_state12 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp2_stage0_subdone) & (1'b1 == ap_CS_fsm_pp2_stage0) & (icmp_ln32_fu_570_p2 == 1'd1))) begin
        ap_condition_pp2_flush_enable = 1'b1;
    end else begin
        ap_condition_pp2_flush_enable = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln31_fu_537_p2 == 1'd1))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp2_iter5 == 1'b0) & (ap_enable_reg_pp2_iter4 == 1'b0) & (ap_enable_reg_pp2_iter3 == 1'b0) & (ap_enable_reg_pp2_iter2 == 1'b0) & (ap_enable_reg_pp2_iter1 == 1'b0) & (ap_enable_reg_pp2_iter0 == 1'b0))) begin
        ap_idle_pp2 = 1'b1;
    end else begin
        ap_idle_pp2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln31_fu_537_p2 == 1'd1))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (ap_enable_reg_pp2_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp2_stage0))) begin
        data_ce0 = 1'b1;
    end else begin
        data_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp2_stage0) & (ap_enable_reg_pp2_iter3 == 1'b1))) begin
        line_buf_address0 = line_buf_addr_1_reg_1020_pp2_iter2_reg;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        line_buf_address0 = p_cast11_fu_355_p1;
    end else begin
        line_buf_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0)) | ((1'b0 == ap_block_pp2_stage0_11001) & (ap_enable_reg_pp2_iter3 == 1'b1)))) begin
        line_buf_ce0 = 1'b1;
    end else begin
        line_buf_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (ap_enable_reg_pp2_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp2_stage0))) begin
        line_buf_ce1 = 1'b1;
    end else begin
        line_buf_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp2_stage0) & (ap_enable_reg_pp2_iter3 == 1'b1))) begin
        line_buf_d0 = tmp_5_fu_633_p3;
    end else if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        line_buf_d0 = empty_31_fu_396_p2;
    end else begin
        line_buf_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (ap_enable_reg_pp2_iter3 == 1'b1) & (icmp_ln32_reg_1011_pp2_iter2_reg == 1'd0))) begin
        line_buf_we0 = 3'd7;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond4613_reg_825 == 1'd0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        line_buf_we0 = mask_fu_406_p2;
    end else begin
        line_buf_we0 = 3'd0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (ap_enable_reg_pp2_iter5 == 1'b1))) begin
        out_r_ce0 = 1'b1;
    end else begin
        out_r_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp2_stage0_11001) & (ap_enable_reg_pp2_iter5 == 1'b1) & (icmp_ln32_reg_1011_pp2_iter4_reg == 1'd0))) begin
        out_r_we0 = 1'b1;
    end else begin
        out_r_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (exitcond4613_fu_295_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((ap_enable_reg_pp0_iter0 == 1'b1) & (1'b0 == ap_block_pp0_stage0_subdone) & (exitcond4613_fu_295_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state5;
        end
        ap_ST_fsm_state5 : begin
            if (((1'b1 == ap_CS_fsm_state5) & (exitcond4512_fu_431_p2 == 1'd0))) begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (icmp_ln31_fu_537_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp2_stage0;
            end
        end
        ap_ST_fsm_pp2_stage0 : begin
            if (~((1'b0 == ap_block_pp2_stage0_subdone) & (ap_enable_reg_pp2_iter4 == 1'b1) & (ap_enable_reg_pp2_iter3 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_pp2_stage0;
            end else if (((1'b0 == ap_block_pp2_stage0_subdone) & (ap_enable_reg_pp2_iter4 == 1'b1) & (ap_enable_reg_pp2_iter3 == 1'b0))) begin
                ap_NS_fsm = ap_ST_fsm_state14;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp2_stage0;
            end
        end
        ap_ST_fsm_state14 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln31_fu_543_p2 = (yi_reg_273 + 9'd1);

assign add_ln32_fu_576_p2 = (xi_reg_284 + 9'd1);

assign add_ln44_fu_582_p2 = (tmp_6_reg_1006 + zext_ln32_1_fu_566_p1);

assign add_ln62_1_fu_768_p2 = (zext_ln62_5_fu_754_p1 + zext_ln62_4_fu_743_p1);

assign add_ln62_2_fu_778_p2 = (zext_ln62_9_fu_764_p1 + zext_ln62_10_fu_774_p1);

assign add_ln62_3_fu_666_p2 = (zext_ln62_fu_640_p1 + zext_ln62_7_fu_659_p1);

assign add_ln62_4_fu_672_p2 = (zext_ln62_8_fu_663_p1 + zext_ln62_6_fu_647_p1);

assign add_ln62_5_fu_682_p2 = (zext_ln62_2_fu_644_p1 + zext_ln62_12_fu_678_p1);

assign add_ln62_6_fu_790_p2 = (zext_ln62_11_fu_784_p1 + zext_ln62_13_fu_787_p1);

assign add_ln62_7_fu_800_p2 = (add_ln62_2_fu_778_p2 + zext_ln62_14_fu_796_p1);

assign add_ln62_fu_758_p2 = (zext_ln62_3_fu_731_p1 + zext_ln62_1_fu_719_p1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp2_stage0 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state14 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd5];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp2_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp2_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp2_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state10_pp2_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state11_pp2_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp2_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp2_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp2_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp2_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_pp2 = (ap_idle_pp2 ^ 1'b1);

assign data_address0 = zext_ln44_fu_587_p1;

assign empty_19_fu_301_p2 = (empty_reg_229 + 10'd1);

assign empty_20_fu_307_p1 = empty_reg_229[7:0];

assign empty_21_fu_329_p2 = (tmp_3_fu_321_p3 | 5'd7);

assign empty_22_fu_335_p2 = ((tmp_3_fu_321_p3 > empty_21_fu_329_p2) ? 1'b1 : 1'b0);

assign empty_23_fu_341_p3 = ((empty_22_fu_335_p2[0:0] === 1'b1) ? tmp_3_fu_321_p3 : empty_21_fu_329_p2);

assign empty_24_fu_359_p3 = ((empty_22_reg_854[0:0] === 1'b1) ? empty_21_reg_849 : tmp_3_reg_844);

assign empty_25_fu_349_p2 = ($signed(5'd23) - $signed(empty_23_fu_341_p3));

assign empty_26_fu_364_p1 = empty_24_fu_359_p3;

assign empty_27_fu_368_p1 = empty_25_reg_860;

assign empty_28_fu_371_p3 = ((empty_22_reg_854[0:0] === 1'b1) ? 24'd0 : 24'd0);

assign empty_29_fu_378_p2 = 24'd16777215 << empty_26_fu_364_p1;

assign empty_30_fu_384_p2 = 24'd16777215 >> empty_27_fu_368_p1;

assign empty_31_fu_396_p2 = (p_demorgan_fu_390_p2 & empty_28_fu_371_p3);

assign empty_32_fu_403_p1 = tmp_2_reg_839;

assign empty_35_fu_437_p2 = (empty_33_reg_240 + 4'd1);

assign empty_37_fu_499_p2 = ((next_urem_fu_493_p2 < 4'd3) ? 1'b1 : 1'b0);

assign empty_39_fu_549_p1 = yi_reg_273[7:0];

assign exitcond4512_fu_431_p2 = ((empty_33_reg_240 == 4'd9) ? 1'b1 : 1'b0);

assign exitcond4613_fu_295_p2 = ((empty_reg_229 == 10'd768) ? 1'b1 : 1'b0);

assign icmp_ln31_fu_537_p2 = ((yi_reg_273 == 9'd256) ? 1'b1 : 1'b0);

assign icmp_ln32_fu_570_p2 = ((xi_reg_284 == 9'd256) ? 1'b1 : 1'b0);

assign idx_urem_fu_505_p3 = ((empty_37_fu_499_p2[0:0] === 1'b1) ? next_urem_fu_493_p2 : 4'd0);

assign mask_fu_406_p2 = 3'd1 << empty_32_fu_403_p1;

assign next_mul_fu_443_p2 = (8'd22 + phi_mul_reg_251);

assign next_urem_fu_493_p2 = (phi_urem_reg_262 + 4'd1);

assign out_r_address0 = zext_ln44_reg_1031_pp2_iter4_reg;

assign out_r_d0 = trunc_ln_reg_1080;

assign p_cast11_fu_355_p1 = empty_20_reg_834;

assign p_demorgan_fu_390_p2 = (empty_30_fu_384_p2 & empty_29_fu_378_p2);

assign shl_ln62_1_fu_723_p3 = {{window_buf_1_1_fu_166}, {1'd0}};

assign shl_ln62_2_fu_735_p3 = {{window_buf_1_1_1_fu_170}, {2'd0}};

assign shl_ln62_3_fu_747_p3 = {{window_buf_1_2_reg_1047_pp2_iter3_reg}, {1'd0}};

assign shl_ln62_4_fu_651_p3 = {{window_buf_2_1_1_fu_178}, {1'd0}};

assign shl_ln_fu_712_p3 = {{window_buf_0_1_2_reg_1065}, {1'd0}};

assign tmp_2_fu_311_p4 = {{empty_reg_229[9:8]}};

assign tmp_3_fu_321_p3 = {{tmp_2_fu_311_p4}, {3'd0}};

assign tmp_5_fu_633_p3 = {{window_buf_2_2_reg_1053}, {tmp_1_reg_1060}};

assign tmp_6_fu_553_p3 = {{empty_39_fu_549_p1}, {8'd0}};

assign window_buf_0_1_0_load_reg_901 = 8'd0;

assign window_buf_0_2_0_load_reg_906 = 8'd0;

assign window_buf_1_1_0_load_reg_911 = 8'd0;

assign window_buf_1_2_0_load_reg_916 = 8'd0;

assign window_buf_2_1_0_load_reg_921 = 8'd0;

assign window_buf_2_2_0_load_reg_926 = 8'd0;

assign zext_ln32_1_fu_566_p1 = xi_reg_284;

assign zext_ln32_fu_561_p1 = xi_reg_284;

assign zext_ln44_fu_587_p1 = add_ln44_reg_1026;

assign zext_ln62_10_fu_774_p1 = add_ln62_1_fu_768_p2;

assign zext_ln62_11_fu_784_p1 = add_ln62_3_reg_1070;

assign zext_ln62_12_fu_678_p1 = add_ln62_4_fu_672_p2;

assign zext_ln62_13_fu_787_p1 = add_ln62_5_reg_1075;

assign zext_ln62_14_fu_796_p1 = add_ln62_6_fu_790_p2;

assign zext_ln62_1_fu_719_p1 = shl_ln_fu_712_p3;

assign zext_ln62_2_fu_644_p1 = window_buf_0_2_reg_1041;

assign zext_ln62_3_fu_731_p1 = shl_ln62_1_fu_723_p3;

assign zext_ln62_4_fu_743_p1 = shl_ln62_2_fu_735_p3;

assign zext_ln62_5_fu_754_p1 = shl_ln62_3_fu_747_p3;

assign zext_ln62_6_fu_647_p1 = window_buf_2_1_fu_174;

assign zext_ln62_7_fu_659_p1 = shl_ln62_4_fu_651_p3;

assign zext_ln62_8_fu_663_p1 = window_buf_2_2_reg_1053;

assign zext_ln62_9_fu_764_p1 = add_ln62_fu_758_p2;

assign zext_ln62_fu_640_p1 = window_buf_0_1_fu_158;

always @ (posedge ap_clk) begin
    tmp_3_reg_844[2:0] <= 3'b000;
    empty_21_reg_849[2:0] <= 3'b111;
    tmp_6_reg_1006[7:0] <= 8'b00000000;
    zext_ln44_reg_1031[63:16] <= 48'b000000000000000000000000000000000000000000000000;
    zext_ln44_reg_1031_pp2_iter2_reg[63:16] <= 48'b000000000000000000000000000000000000000000000000;
    zext_ln44_reg_1031_pp2_iter3_reg[63:16] <= 48'b000000000000000000000000000000000000000000000000;
    zext_ln44_reg_1031_pp2_iter4_reg[63:16] <= 48'b000000000000000000000000000000000000000000000000;
end

endmodule //gau
