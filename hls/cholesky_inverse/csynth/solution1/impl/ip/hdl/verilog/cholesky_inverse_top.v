// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="cholesky_inverse_top,hls_ip_2018_2,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=1,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xczu7ev-ffvc1156-2-e,HLS_INPUT_CLOCK=35.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=30.588000,HLS_SYN_LAT=-1,HLS_SYN_TPT=none,HLS_SYN_MEM=2,HLS_SYN_DSP=27,HLS_SYN_FF=2936,HLS_SYN_LUT=5285,HLS_VERSION=2018_2}" *)

module cholesky_inverse_top (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        A_address0,
        A_ce0,
        A_q0,
        InverseA_address0,
        InverseA_ce0,
        InverseA_we0,
        InverseA_d0,
        ap_return
);

parameter    ap_ST_fsm_state1 = 12'd1;
parameter    ap_ST_fsm_state2 = 12'd2;
parameter    ap_ST_fsm_state3 = 12'd4;
parameter    ap_ST_fsm_state4 = 12'd8;
parameter    ap_ST_fsm_state5 = 12'd16;
parameter    ap_ST_fsm_state6 = 12'd32;
parameter    ap_ST_fsm_state7 = 12'd64;
parameter    ap_ST_fsm_state8 = 12'd128;
parameter    ap_ST_fsm_state9 = 12'd256;
parameter    ap_ST_fsm_state10 = 12'd512;
parameter    ap_ST_fsm_state11 = 12'd1024;
parameter    ap_ST_fsm_state12 = 12'd2048;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [3:0] A_address0;
output   A_ce0;
input  [31:0] A_q0;
output  [3:0] InverseA_address0;
output   InverseA_ce0;
output   InverseA_we0;
output  [31:0] InverseA_d0;
output  [31:0] ap_return;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg A_ce0;
reg InverseA_ce0;
reg InverseA_we0;

(* fsm_encoding = "none" *) reg   [11:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
wire   [2:0] r_1_fu_186_p2;
reg   [2:0] r_1_reg_283;
wire    ap_CS_fsm_state2;
wire   [5:0] tmp_16_cast_fu_200_p1;
reg   [5:0] tmp_16_cast_reg_288;
wire   [0:0] tmp_fu_180_p2;
wire   [2:0] c_1_fu_210_p2;
reg   [2:0] c_1_reg_296;
wire    ap_CS_fsm_state3;
wire   [63:0] tmp_19_cast_fu_225_p1;
reg   [63:0] tmp_19_cast_reg_301;
wire   [0:0] tmp_2_fu_204_p2;
wire   [31:0] grp_cholesky_alt_fu_162_ap_return;
reg   [31:0] inverse_OK_reg_311;
wire    ap_CS_fsm_state5;
wire    grp_cholesky_alt_fu_162_ap_idle;
wire    grp_cholesky_alt_fu_162_ap_ready;
wire    grp_cholesky_alt_fu_162_ap_done;
wire   [2:0] r_2_fu_236_p2;
reg   [2:0] r_2_reg_318;
wire    ap_CS_fsm_state10;
wire   [5:0] tmp_18_cast_fu_250_p1;
reg   [5:0] tmp_18_cast_reg_323;
wire   [0:0] tmp_1_fu_230_p2;
wire   [2:0] c_2_fu_260_p2;
reg   [2:0] c_2_reg_331;
wire    ap_CS_fsm_state11;
wire   [63:0] tmp_20_cast_fu_275_p1;
reg   [63:0] tmp_20_cast_reg_336;
wire   [0:0] tmp_5_fu_254_p2;
reg   [3:0] U_address0;
reg    U_ce0;
reg    U_we0;
wire   [31:0] U_q0;
reg   [3:0] U_inv_address0;
reg    U_inv_ce0;
reg    U_inv_we0;
wire   [31:0] U_inv_q0;
reg   [3:0] U_inv_address1;
reg    U_inv_ce1;
reg    U_inv_we1;
wire   [31:0] U_inv_q1;
reg   [3:0] a_i_address0;
reg    a_i_ce0;
reg    a_i_we0;
wire   [31:0] a_i_q0;
reg   [3:0] InverseA_assign_address0;
reg    InverseA_assign_ce0;
reg    InverseA_assign_we0;
wire   [31:0] InverseA_assign_q0;
wire    grp_cholesky_alt_fu_162_ap_start;
wire   [3:0] grp_cholesky_alt_fu_162_A_address0;
wire    grp_cholesky_alt_fu_162_A_ce0;
wire   [3:0] grp_cholesky_alt_fu_162_L_address0;
wire    grp_cholesky_alt_fu_162_L_ce0;
wire    grp_cholesky_alt_fu_162_L_we0;
wire   [31:0] grp_cholesky_alt_fu_162_L_d0;
wire    grp_back_substitute_alt_fu_168_ap_start;
wire    grp_back_substitute_alt_fu_168_ap_done;
wire    grp_back_substitute_alt_fu_168_ap_idle;
wire    grp_back_substitute_alt_fu_168_ap_ready;
wire   [3:0] grp_back_substitute_alt_fu_168_A_address0;
wire    grp_back_substitute_alt_fu_168_A_ce0;
wire   [3:0] grp_back_substitute_alt_fu_168_B_address0;
wire    grp_back_substitute_alt_fu_168_B_ce0;
wire    grp_back_substitute_alt_fu_168_B_we0;
wire   [31:0] grp_back_substitute_alt_fu_168_B_d0;
wire   [3:0] grp_back_substitute_alt_fu_168_B_address1;
wire    grp_back_substitute_alt_fu_168_B_ce1;
wire    grp_back_substitute_alt_fu_168_B_we1;
wire   [31:0] grp_back_substitute_alt_fu_168_B_d1;
wire    grp_matrix_multiply_alt2_fu_174_ap_start;
wire    grp_matrix_multiply_alt2_fu_174_ap_done;
wire    grp_matrix_multiply_alt2_fu_174_ap_idle;
wire    grp_matrix_multiply_alt2_fu_174_ap_ready;
wire   [3:0] grp_matrix_multiply_alt2_fu_174_A_address0;
wire    grp_matrix_multiply_alt2_fu_174_A_ce0;
wire   [3:0] grp_matrix_multiply_alt2_fu_174_A_address1;
wire    grp_matrix_multiply_alt2_fu_174_A_ce1;
wire   [3:0] grp_matrix_multiply_alt2_fu_174_C_address0;
wire    grp_matrix_multiply_alt2_fu_174_C_ce0;
wire    grp_matrix_multiply_alt2_fu_174_C_we0;
wire   [31:0] grp_matrix_multiply_alt2_fu_174_C_d0;
reg   [2:0] r_reg_118;
reg   [2:0] c_reg_129;
wire    ap_CS_fsm_state4;
reg   [2:0] r1_reg_140;
wire    ap_CS_fsm_state9;
reg   [2:0] c2_reg_151;
wire    ap_CS_fsm_state12;
reg    grp_cholesky_alt_fu_162_ap_start_reg;
reg    grp_back_substitute_alt_fu_168_ap_start_reg;
wire    ap_CS_fsm_state6;
wire    ap_CS_fsm_state7;
reg    grp_matrix_multiply_alt2_fu_174_ap_start_reg;
wire    ap_CS_fsm_state8;
wire   [4:0] tmp_9_fu_192_p3;
wire   [5:0] tmp_4_cast_fu_216_p1;
wire   [5:0] tmp_11_fu_220_p2;
wire   [4:0] tmp_10_fu_242_p3;
wire   [5:0] tmp_6_cast_fu_266_p1;
wire   [5:0] tmp_12_fu_270_p2;
reg   [11:0] ap_NS_fsm;

// power-on initialization
initial begin
#0 ap_CS_fsm = 12'd1;
#0 grp_cholesky_alt_fu_162_ap_start_reg = 1'b0;
#0 grp_back_substitute_alt_fu_168_ap_start_reg = 1'b0;
#0 grp_matrix_multiply_alt2_fu_174_ap_start_reg = 1'b0;
end

cholesky_inverse_mb6 #(
    .DataWidth( 32 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
U_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(U_address0),
    .ce0(U_ce0),
    .we0(U_we0),
    .d0(grp_cholesky_alt_fu_162_L_d0),
    .q0(U_q0)
);

cholesky_inverse_ncg #(
    .DataWidth( 32 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
U_inv_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(U_inv_address0),
    .ce0(U_inv_ce0),
    .we0(U_inv_we0),
    .d0(grp_back_substitute_alt_fu_168_B_d0),
    .q0(U_inv_q0),
    .address1(U_inv_address1),
    .ce1(U_inv_ce1),
    .we1(U_inv_we1),
    .d1(grp_back_substitute_alt_fu_168_B_d1),
    .q1(U_inv_q1)
);

cholesky_inverse_mb6 #(
    .DataWidth( 32 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
a_i_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(a_i_address0),
    .ce0(a_i_ce0),
    .we0(a_i_we0),
    .d0(A_q0),
    .q0(a_i_q0)
);

cholesky_inverse_mb6 #(
    .DataWidth( 32 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
InverseA_assign_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(InverseA_assign_address0),
    .ce0(InverseA_assign_ce0),
    .we0(InverseA_assign_we0),
    .d0(grp_matrix_multiply_alt2_fu_174_C_d0),
    .q0(InverseA_assign_q0)
);

cholesky_alt grp_cholesky_alt_fu_162(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_cholesky_alt_fu_162_ap_start),
    .ap_done(grp_cholesky_alt_fu_162_ap_done),
    .ap_idle(grp_cholesky_alt_fu_162_ap_idle),
    .ap_ready(grp_cholesky_alt_fu_162_ap_ready),
    .A_address0(grp_cholesky_alt_fu_162_A_address0),
    .A_ce0(grp_cholesky_alt_fu_162_A_ce0),
    .A_q0(a_i_q0),
    .L_address0(grp_cholesky_alt_fu_162_L_address0),
    .L_ce0(grp_cholesky_alt_fu_162_L_ce0),
    .L_we0(grp_cholesky_alt_fu_162_L_we0),
    .L_d0(grp_cholesky_alt_fu_162_L_d0),
    .ap_return(grp_cholesky_alt_fu_162_ap_return)
);

back_substitute_alt grp_back_substitute_alt_fu_168(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_back_substitute_alt_fu_168_ap_start),
    .ap_done(grp_back_substitute_alt_fu_168_ap_done),
    .ap_idle(grp_back_substitute_alt_fu_168_ap_idle),
    .ap_ready(grp_back_substitute_alt_fu_168_ap_ready),
    .A_address0(grp_back_substitute_alt_fu_168_A_address0),
    .A_ce0(grp_back_substitute_alt_fu_168_A_ce0),
    .A_q0(U_q0),
    .B_address0(grp_back_substitute_alt_fu_168_B_address0),
    .B_ce0(grp_back_substitute_alt_fu_168_B_ce0),
    .B_we0(grp_back_substitute_alt_fu_168_B_we0),
    .B_d0(grp_back_substitute_alt_fu_168_B_d0),
    .B_address1(grp_back_substitute_alt_fu_168_B_address1),
    .B_ce1(grp_back_substitute_alt_fu_168_B_ce1),
    .B_we1(grp_back_substitute_alt_fu_168_B_we1),
    .B_d1(grp_back_substitute_alt_fu_168_B_d1)
);

matrix_multiply_alt2 grp_matrix_multiply_alt2_fu_174(
    .ap_clk(ap_clk),
    .ap_rst(ap_rst),
    .ap_start(grp_matrix_multiply_alt2_fu_174_ap_start),
    .ap_done(grp_matrix_multiply_alt2_fu_174_ap_done),
    .ap_idle(grp_matrix_multiply_alt2_fu_174_ap_idle),
    .ap_ready(grp_matrix_multiply_alt2_fu_174_ap_ready),
    .A_address0(grp_matrix_multiply_alt2_fu_174_A_address0),
    .A_ce0(grp_matrix_multiply_alt2_fu_174_A_ce0),
    .A_q0(U_inv_q0),
    .A_address1(grp_matrix_multiply_alt2_fu_174_A_address1),
    .A_ce1(grp_matrix_multiply_alt2_fu_174_A_ce1),
    .A_q1(U_inv_q1),
    .C_address0(grp_matrix_multiply_alt2_fu_174_C_address0),
    .C_ce0(grp_matrix_multiply_alt2_fu_174_C_ce0),
    .C_we0(grp_matrix_multiply_alt2_fu_174_C_we0),
    .C_d0(grp_matrix_multiply_alt2_fu_174_C_d0)
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
        grp_back_substitute_alt_fu_168_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            grp_back_substitute_alt_fu_168_ap_start_reg <= 1'b1;
        end else if ((grp_back_substitute_alt_fu_168_ap_ready == 1'b1)) begin
            grp_back_substitute_alt_fu_168_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_cholesky_alt_fu_162_ap_start_reg <= 1'b0;
    end else begin
        if (((tmp_fu_180_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state2))) begin
            grp_cholesky_alt_fu_162_ap_start_reg <= 1'b1;
        end else if ((grp_cholesky_alt_fu_162_ap_ready == 1'b1)) begin
            grp_cholesky_alt_fu_162_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        grp_matrix_multiply_alt2_fu_174_ap_start_reg <= 1'b0;
    end else begin
        if ((1'b1 == ap_CS_fsm_state8)) begin
            grp_matrix_multiply_alt2_fu_174_ap_start_reg <= 1'b1;
        end else if ((grp_matrix_multiply_alt2_fu_174_ap_ready == 1'b1)) begin
            grp_matrix_multiply_alt2_fu_174_ap_start_reg <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        c2_reg_151 <= c_2_reg_331;
    end else if (((tmp_1_fu_230_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state10))) begin
        c2_reg_151 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        c_reg_129 <= c_1_reg_296;
    end else if (((tmp_fu_180_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        c_reg_129 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state11) & (tmp_5_fu_254_p2 == 1'd1))) begin
        r1_reg_140 <= r_2_reg_318;
    end else if (((1'b1 == ap_CS_fsm_state9) & (grp_matrix_multiply_alt2_fu_174_ap_done == 1'b1))) begin
        r1_reg_140 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_2_fu_204_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
        r_reg_118 <= r_1_reg_283;
    end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        r_reg_118 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        c_1_reg_296 <= c_1_fu_210_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        c_2_reg_331 <= c_2_fu_260_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((grp_cholesky_alt_fu_162_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
        inverse_OK_reg_311 <= grp_cholesky_alt_fu_162_ap_return;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state2)) begin
        r_1_reg_283 <= r_1_fu_186_p2;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        r_2_reg_318 <= r_2_fu_236_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_fu_180_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
        tmp_16_cast_reg_288[4 : 2] <= tmp_16_cast_fu_200_p1[4 : 2];
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_1_fu_230_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state10))) begin
        tmp_18_cast_reg_323[4 : 2] <= tmp_18_cast_fu_250_p1[4 : 2];
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_2_fu_204_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state3))) begin
        tmp_19_cast_reg_301[5 : 0] <= tmp_19_cast_fu_225_p1[5 : 0];
    end
end

always @ (posedge ap_clk) begin
    if (((tmp_5_fu_254_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state11))) begin
        tmp_20_cast_reg_336[5 : 0] <= tmp_20_cast_fu_275_p1[5 : 0];
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state3)) begin
        A_ce0 = 1'b1;
    end else begin
        A_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        InverseA_assign_address0 = tmp_20_cast_fu_275_p1;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        InverseA_assign_address0 = grp_matrix_multiply_alt2_fu_174_C_address0;
    end else begin
        InverseA_assign_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state11)) begin
        InverseA_assign_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state9)) begin
        InverseA_assign_ce0 = grp_matrix_multiply_alt2_fu_174_C_ce0;
    end else begin
        InverseA_assign_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        InverseA_assign_we0 = grp_matrix_multiply_alt2_fu_174_C_we0;
    end else begin
        InverseA_assign_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        InverseA_ce0 = 1'b1;
    end else begin
        InverseA_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state12)) begin
        InverseA_we0 = 1'b1;
    end else begin
        InverseA_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        U_address0 = grp_back_substitute_alt_fu_168_A_address0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        U_address0 = grp_cholesky_alt_fu_162_L_address0;
    end else begin
        U_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        U_ce0 = grp_back_substitute_alt_fu_168_A_ce0;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        U_ce0 = grp_cholesky_alt_fu_162_L_ce0;
    end else begin
        U_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        U_inv_address0 = grp_matrix_multiply_alt2_fu_174_A_address0;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        U_inv_address0 = grp_back_substitute_alt_fu_168_B_address0;
    end else begin
        U_inv_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        U_inv_address1 = grp_matrix_multiply_alt2_fu_174_A_address1;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        U_inv_address1 = grp_back_substitute_alt_fu_168_B_address1;
    end else begin
        U_inv_address1 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        U_inv_ce0 = grp_matrix_multiply_alt2_fu_174_A_ce0;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        U_inv_ce0 = grp_back_substitute_alt_fu_168_B_ce0;
    end else begin
        U_inv_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state9)) begin
        U_inv_ce1 = grp_matrix_multiply_alt2_fu_174_A_ce1;
    end else if ((1'b1 == ap_CS_fsm_state7)) begin
        U_inv_ce1 = grp_back_substitute_alt_fu_168_B_ce1;
    end else begin
        U_inv_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        U_inv_we0 = grp_back_substitute_alt_fu_168_B_we0;
    end else begin
        U_inv_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state7)) begin
        U_inv_we1 = grp_back_substitute_alt_fu_168_B_we1;
    end else begin
        U_inv_we1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state5)) begin
        U_we0 = grp_cholesky_alt_fu_162_L_we0;
    end else begin
        U_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        a_i_address0 = tmp_19_cast_reg_301;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        a_i_address0 = grp_cholesky_alt_fu_162_A_address0;
    end else begin
        a_i_address0 = 'bx;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        a_i_ce0 = 1'b1;
    end else if ((1'b1 == ap_CS_fsm_state5)) begin
        a_i_ce0 = grp_cholesky_alt_fu_162_A_ce0;
    end else begin
        a_i_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        a_i_we0 = 1'b1;
    end else begin
        a_i_we0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_1_fu_230_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state10))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_1_fu_230_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state10))) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_state2 : begin
            if (((tmp_fu_180_p2 == 1'd0) & (1'b1 == ap_CS_fsm_state2))) begin
                ap_NS_fsm = ap_ST_fsm_state3;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state3 : begin
            if (((tmp_2_fu_204_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state3))) begin
                ap_NS_fsm = ap_ST_fsm_state2;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state3;
        end
        ap_ST_fsm_state5 : begin
            if (((grp_cholesky_alt_fu_162_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state5))) begin
                ap_NS_fsm = ap_ST_fsm_state6;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state5;
            end
        end
        ap_ST_fsm_state6 : begin
            ap_NS_fsm = ap_ST_fsm_state7;
        end
        ap_ST_fsm_state7 : begin
            if (((1'b1 == ap_CS_fsm_state7) & (grp_back_substitute_alt_fu_168_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state8;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state7;
            end
        end
        ap_ST_fsm_state8 : begin
            ap_NS_fsm = ap_ST_fsm_state9;
        end
        ap_ST_fsm_state9 : begin
            if (((1'b1 == ap_CS_fsm_state9) & (grp_matrix_multiply_alt2_fu_174_ap_done == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state9;
            end
        end
        ap_ST_fsm_state10 : begin
            if (((tmp_1_fu_230_p2 == 1'd1) & (1'b1 == ap_CS_fsm_state10))) begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state11;
            end
        end
        ap_ST_fsm_state11 : begin
            if (((1'b1 == ap_CS_fsm_state11) & (tmp_5_fu_254_p2 == 1'd1))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state12;
            end
        end
        ap_ST_fsm_state12 : begin
            ap_NS_fsm = ap_ST_fsm_state11;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign A_address0 = tmp_19_cast_fu_225_p1;

assign InverseA_address0 = tmp_20_cast_reg_336;

assign InverseA_d0 = InverseA_assign_q0;

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];

assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];

assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];

assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];

assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];

assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];

assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];

assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];

assign ap_return = inverse_OK_reg_311;

assign c_1_fu_210_p2 = (c_reg_129 + 3'd1);

assign c_2_fu_260_p2 = (c2_reg_151 + 3'd1);

assign grp_back_substitute_alt_fu_168_ap_start = grp_back_substitute_alt_fu_168_ap_start_reg;

assign grp_cholesky_alt_fu_162_ap_start = grp_cholesky_alt_fu_162_ap_start_reg;

assign grp_matrix_multiply_alt2_fu_174_ap_start = grp_matrix_multiply_alt2_fu_174_ap_start_reg;

assign r_1_fu_186_p2 = (r_reg_118 + 3'd1);

assign r_2_fu_236_p2 = (r1_reg_140 + 3'd1);

assign tmp_10_fu_242_p3 = {{r1_reg_140}, {2'd0}};

assign tmp_11_fu_220_p2 = (tmp_16_cast_reg_288 + tmp_4_cast_fu_216_p1);

assign tmp_12_fu_270_p2 = (tmp_18_cast_reg_323 + tmp_6_cast_fu_266_p1);

assign tmp_16_cast_fu_200_p1 = tmp_9_fu_192_p3;

assign tmp_18_cast_fu_250_p1 = tmp_10_fu_242_p3;

assign tmp_19_cast_fu_225_p1 = tmp_11_fu_220_p2;

assign tmp_1_fu_230_p2 = ((r1_reg_140 == 3'd4) ? 1'b1 : 1'b0);

assign tmp_20_cast_fu_275_p1 = tmp_12_fu_270_p2;

assign tmp_2_fu_204_p2 = ((c_reg_129 == 3'd4) ? 1'b1 : 1'b0);

assign tmp_4_cast_fu_216_p1 = c_reg_129;

assign tmp_5_fu_254_p2 = ((c2_reg_151 == 3'd4) ? 1'b1 : 1'b0);

assign tmp_6_cast_fu_266_p1 = c2_reg_151;

assign tmp_9_fu_192_p3 = {{r_reg_118}, {2'd0}};

assign tmp_fu_180_p2 = ((r_reg_118 == 3'd4) ? 1'b1 : 1'b0);

always @ (posedge ap_clk) begin
    tmp_16_cast_reg_288[1:0] <= 2'b00;
    tmp_16_cast_reg_288[5] <= 1'b0;
    tmp_19_cast_reg_301[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
    tmp_18_cast_reg_323[1:0] <= 2'b00;
    tmp_18_cast_reg_323[5] <= 1'b0;
    tmp_20_cast_reg_336[63:6] <= 58'b0000000000000000000000000000000000000000000000000000000000;
end

endmodule //cholesky_inverse_top
