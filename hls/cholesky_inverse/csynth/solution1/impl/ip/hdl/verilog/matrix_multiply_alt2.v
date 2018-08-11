// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module matrix_multiply_alt2 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        A_address0,
        A_ce0,
        A_q0,
        A_address1,
        A_ce1,
        A_q1,
        C_address0,
        C_ce0,
        C_we0,
        C_d0
);

parameter    ap_ST_fsm_state1 = 3'd1;
parameter    ap_ST_fsm_pp0_stage0 = 3'd2;
parameter    ap_ST_fsm_state4 = 3'd4;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [3:0] A_address0;
output   A_ce0;
input  [31:0] A_q0;
output  [3:0] A_address1;
output   A_ce1;
input  [31:0] A_q1;
output  [3:0] C_address0;
output   C_ce0;
output   C_we0;
output  [31:0] C_d0;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg A_ce0;
reg A_ce1;
reg C_ce0;
reg C_we0;

(* fsm_encoding = "none" *) reg   [2:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [6:0] indvar_flatten1_reg_115;
reg   [2:0] Col_assign_2_reg_126;
reg   [5:0] indvar_flatten_reg_137;
reg   [2:0] Row_assign_reg_148;
reg   [2:0] Col_assign_reg_159;
wire   [0:0] exitcond_flatten1_fu_185_p2;
reg   [0:0] exitcond_flatten1_reg_397;
wire    ap_CS_fsm_pp0_stage0;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_pp0_stage0_11001;
wire   [6:0] indvar_flatten_next1_fu_191_p2;
reg    ap_enable_reg_pp0_iter0;
wire   [0:0] tmp_mid2_fu_229_p3;
reg   [0:0] tmp_mid2_reg_406;
wire   [0:0] tmp_1_mid2_fu_249_p3;
reg   [0:0] tmp_1_mid2_reg_410;
wire   [2:0] tmp_i_i_mid2_v_fu_257_p3;
reg   [2:0] tmp_i_i_mid2_v_reg_414;
wire   [2:0] tmp_fu_307_p3;
reg   [2:0] tmp_reg_419;
reg   [3:0] C_addr_reg_434;
reg   [3:0] sum_mult_addr_reg_439;
wire   [2:0] c_fu_377_p2;
wire   [5:0] indvar_flatten_next_fu_389_p3;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter1;
wire   [3:0] sum_mult_address0;
reg    sum_mult_ce0;
wire   [31:0] sum_mult_q0;
reg    sum_mult_ce1;
reg    sum_mult_we1;
reg   [31:0] sum_mult_d1;
reg   [2:0] ap_phi_mux_Col_assign_2_phi_fu_130_p4;
wire    ap_block_pp0_stage0;
reg   [2:0] ap_phi_mux_Row_assign_phi_fu_152_p4;
wire   [63:0] tmp_10_cast_fu_333_p1;
wire   [63:0] tmp_13_cast_fu_360_p1;
wire   [63:0] tmp_14_cast_fu_371_p1;
wire   [31:0] tmp_7_fu_170_p2;
wire   [31:0] mult_fu_177_p2;
wire   [0:0] exitcond_flatten_fu_203_p2;
wire   [2:0] k_fu_197_p2;
wire   [0:0] tmp_mid1_fu_217_p2;
wire   [0:0] tmp6_fu_223_p2;
wire   [0:0] tmp_1_mid1_fu_237_p2;
wire   [0:0] tmp_s_fu_243_p2;
wire   [0:0] exitcond_fu_275_p2;
wire   [0:0] not_exitcond_flatten_fu_269_p2;
wire   [2:0] Row_assign_mid_fu_209_p3;
wire   [0:0] exitcond_mid_fu_281_p2;
wire   [0:0] tmp_2_fu_293_p2;
wire   [2:0] r_fu_287_p2;
wire   [4:0] tmp_1_fu_315_p3;
wire   [5:0] tmp_9_cast_fu_323_p1;
wire   [5:0] tmp_i_i_mid2_cast_fu_265_p1;
wire   [5:0] tmp_3_fu_327_p2;
wire   [2:0] Col_assign_mid2_fu_299_p3;
wire   [4:0] tmp_4_fu_342_p3;
wire   [5:0] tmp_12_cast_fu_350_p1;
wire   [5:0] tmp_5_fu_354_p2;
wire   [5:0] tmp_i_i2_cast_fu_338_p1;
wire   [5:0] tmp_8_fu_365_p2;
wire   [5:0] indvar_flatten_op_fu_383_p2;
wire    ap_CS_fsm_state4;
reg   [2:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_condition_131;

// power-on initialization
initial begin
#0 ap_CS_fsm = 3'd1;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
end

back_substitute_ahbi #(
    .DataWidth( 32 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
sum_mult_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(sum_mult_address0),
    .ce0(sum_mult_ce0),
    .q0(sum_mult_q0),
    .address1(sum_mult_addr_reg_439),
    .ce1(sum_mult_ce1),
    .we1(sum_mult_we1),
    .d1(sum_mult_d1)
);

cholesky_inverse_ibs #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
cholesky_inverse_ibs_U26(
    .din0(sum_mult_q0),
    .din1(mult_fu_177_p2),
    .dout(tmp_7_fu_170_p2)
);

cholesky_inverse_dEe #(
    .ID( 1 ),
    .NUM_STAGE( 1 ),
    .din0_WIDTH( 32 ),
    .din1_WIDTH( 32 ),
    .dout_WIDTH( 32 ))
cholesky_inverse_dEe_U27(
    .din0(A_q0),
    .din1(A_q1),
    .dout(mult_fu_177_p2)
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
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
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
        end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten1_reg_397 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        Col_assign_2_reg_126 <= tmp_i_i_mid2_v_reg_414;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        Col_assign_2_reg_126 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten1_fu_185_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        Col_assign_reg_159 <= c_fu_377_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        Col_assign_reg_159 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten1_reg_397 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        Row_assign_reg_148 <= tmp_reg_419;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        Row_assign_reg_148 <= 3'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten1_fu_185_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten1_reg_115 <= indvar_flatten_next1_fu_191_p2;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten1_reg_115 <= 7'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten1_fu_185_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        indvar_flatten_reg_137 <= indvar_flatten_next_fu_389_p3;
    end else if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
        indvar_flatten_reg_137 <= 6'd0;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten1_fu_185_p2 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        C_addr_reg_434 <= tmp_14_cast_fu_371_p1;
        sum_mult_addr_reg_439 <= tmp_14_cast_fu_371_p1;
        tmp_1_mid2_reg_410 <= tmp_1_mid2_fu_249_p3;
        tmp_mid2_reg_406 <= tmp_mid2_fu_229_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        exitcond_flatten1_reg_397 <= exitcond_flatten1_fu_185_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (exitcond_flatten1_fu_185_p2 == 1'd0) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        tmp_i_i_mid2_v_reg_414 <= tmp_i_i_mid2_v_fu_257_p3;
        tmp_reg_419 <= tmp_fu_307_p3;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        A_ce0 = 1'b1;
    end else begin
        A_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        A_ce1 = 1'b1;
    end else begin
        A_ce1 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        C_ce0 = 1'b1;
    end else begin
        C_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((tmp_1_mid2_reg_410 == 1'd1) & (tmp_mid2_reg_406 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1))) begin
        C_we0 = 1'b1;
    end else begin
        C_we0 = 1'b0;
    end
end

always @ (*) begin
    if ((exitcond_flatten1_fu_185_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state4) | ((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1)))) begin
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
    if (((ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((exitcond_flatten1_reg_397 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_Col_assign_2_phi_fu_130_p4 = tmp_i_i_mid2_v_reg_414;
    end else begin
        ap_phi_mux_Col_assign_2_phi_fu_130_p4 = Col_assign_2_reg_126;
    end
end

always @ (*) begin
    if (((exitcond_flatten1_reg_397 == 1'd0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0))) begin
        ap_phi_mux_Row_assign_phi_fu_152_p4 = tmp_reg_419;
    end else begin
        ap_phi_mux_Row_assign_phi_fu_152_p4 = Row_assign_reg_148;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state4)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter0 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        sum_mult_ce0 = 1'b1;
    end else begin
        sum_mult_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((((tmp_mid2_reg_406 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((tmp_1_mid2_reg_410 == 1'd0) & (tmp_mid2_reg_406 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        sum_mult_ce1 = 1'b1;
    end else begin
        sum_mult_ce1 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_condition_131)) begin
        if ((tmp_mid2_reg_406 == 1'd1)) begin
            sum_mult_d1 = mult_fu_177_p2;
        end else if (((tmp_1_mid2_reg_410 == 1'd0) & (tmp_mid2_reg_406 == 1'd0))) begin
            sum_mult_d1 = tmp_7_fu_170_p2;
        end else begin
            sum_mult_d1 = 'bx;
        end
    end else begin
        sum_mult_d1 = 'bx;
    end
end

always @ (*) begin
    if ((((tmp_mid2_reg_406 == 1'd1) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)) | ((tmp_1_mid2_reg_410 == 1'd0) & (tmp_mid2_reg_406 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
        sum_mult_we1 = 1'b1;
    end else begin
        sum_mult_we1 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if (~((1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_flatten1_fu_185_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if (((1'b0 == ap_block_pp0_stage0_subdone) & (exitcond_flatten1_fu_185_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_state4;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state4 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign A_address0 = tmp_10_cast_fu_333_p1;

assign A_address1 = tmp_13_cast_fu_360_p1;

assign C_address0 = C_addr_reg_434;

assign C_d0 = tmp_7_fu_170_p2;

assign Col_assign_mid2_fu_299_p3 = ((tmp_2_fu_293_p2[0:0] === 1'b1) ? 3'd0 : Col_assign_reg_159);

assign Row_assign_mid_fu_209_p3 = ((exitcond_flatten_fu_203_p2[0:0] === 1'b1) ? 3'd0 : ap_phi_mux_Row_assign_phi_fu_152_p4);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state4 = ap_CS_fsm[32'd2];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

always @ (*) begin
    ap_condition_131 = ((1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b0 == ap_block_pp0_stage0));
end

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign c_fu_377_p2 = (Col_assign_mid2_fu_299_p3 + 3'd1);

assign exitcond_flatten1_fu_185_p2 = ((indvar_flatten1_reg_115 == 7'd64) ? 1'b1 : 1'b0);

assign exitcond_flatten_fu_203_p2 = ((indvar_flatten_reg_137 == 6'd16) ? 1'b1 : 1'b0);

assign exitcond_fu_275_p2 = ((Col_assign_reg_159 == 3'd4) ? 1'b1 : 1'b0);

assign exitcond_mid_fu_281_p2 = (not_exitcond_flatten_fu_269_p2 & exitcond_fu_275_p2);

assign indvar_flatten_next1_fu_191_p2 = (indvar_flatten1_reg_115 + 7'd1);

assign indvar_flatten_next_fu_389_p3 = ((exitcond_flatten_fu_203_p2[0:0] === 1'b1) ? 6'd1 : indvar_flatten_op_fu_383_p2);

assign indvar_flatten_op_fu_383_p2 = (indvar_flatten_reg_137 + 6'd1);

assign k_fu_197_p2 = (ap_phi_mux_Col_assign_2_phi_fu_130_p4 + 3'd1);

assign not_exitcond_flatten_fu_269_p2 = (exitcond_flatten_fu_203_p2 ^ 1'd1);

assign r_fu_287_p2 = (Row_assign_mid_fu_209_p3 + 3'd1);

assign sum_mult_address0 = tmp_14_cast_fu_371_p1;

assign tmp6_fu_223_p2 = ((ap_phi_mux_Col_assign_2_phi_fu_130_p4 == 3'd0) ? 1'b1 : 1'b0);

assign tmp_10_cast_fu_333_p1 = tmp_3_fu_327_p2;

assign tmp_12_cast_fu_350_p1 = tmp_4_fu_342_p3;

assign tmp_13_cast_fu_360_p1 = tmp_5_fu_354_p2;

assign tmp_14_cast_fu_371_p1 = tmp_8_fu_365_p2;

assign tmp_1_fu_315_p3 = {{tmp_fu_307_p3}, {2'd0}};

assign tmp_1_mid1_fu_237_p2 = ((k_fu_197_p2 == 3'd3) ? 1'b1 : 1'b0);

assign tmp_1_mid2_fu_249_p3 = ((exitcond_flatten_fu_203_p2[0:0] === 1'b1) ? tmp_1_mid1_fu_237_p2 : tmp_s_fu_243_p2);

assign tmp_2_fu_293_p2 = (exitcond_mid_fu_281_p2 | exitcond_flatten_fu_203_p2);

assign tmp_3_fu_327_p2 = (tmp_9_cast_fu_323_p1 + tmp_i_i_mid2_cast_fu_265_p1);

assign tmp_4_fu_342_p3 = {{Col_assign_mid2_fu_299_p3}, {2'd0}};

assign tmp_5_fu_354_p2 = (tmp_12_cast_fu_350_p1 + tmp_i_i_mid2_cast_fu_265_p1);

assign tmp_8_fu_365_p2 = (tmp_9_cast_fu_323_p1 + tmp_i_i2_cast_fu_338_p1);

assign tmp_9_cast_fu_323_p1 = tmp_1_fu_315_p3;

assign tmp_fu_307_p3 = ((exitcond_mid_fu_281_p2[0:0] === 1'b1) ? r_fu_287_p2 : Row_assign_mid_fu_209_p3);

assign tmp_i_i2_cast_fu_338_p1 = Col_assign_mid2_fu_299_p3;

assign tmp_i_i_mid2_cast_fu_265_p1 = tmp_i_i_mid2_v_fu_257_p3;

assign tmp_i_i_mid2_v_fu_257_p3 = ((exitcond_flatten_fu_203_p2[0:0] === 1'b1) ? k_fu_197_p2 : ap_phi_mux_Col_assign_2_phi_fu_130_p4);

assign tmp_mid1_fu_217_p2 = ((k_fu_197_p2 == 3'd0) ? 1'b1 : 1'b0);

assign tmp_mid2_fu_229_p3 = ((exitcond_flatten_fu_203_p2[0:0] === 1'b1) ? tmp_mid1_fu_217_p2 : tmp6_fu_223_p2);

assign tmp_s_fu_243_p2 = ((ap_phi_mux_Col_assign_2_phi_fu_130_p4 == 3'd3) ? 1'b1 : 1'b0);

endmodule //matrix_multiply_alt2