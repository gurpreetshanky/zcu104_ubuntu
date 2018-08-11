// ==============================================================
// RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
// Version: 2018.2
// Copyright (C) 1986-2018 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

#ifndef _matrix_multiply_alt2_HH_
#define _matrix_multiply_alt2_HH_

#include "systemc.h"
#include "AESL_pkg.h"

#include "cholesky_inverse_ibs.h"
#include "cholesky_inverse_dEe.h"
#include "back_substitute_ahbi.h"

namespace ap_rtl {

struct matrix_multiply_alt2 : public sc_module {
    // Port declarations 16
    sc_in_clk ap_clk;
    sc_in< sc_logic > ap_rst;
    sc_in< sc_logic > ap_start;
    sc_out< sc_logic > ap_done;
    sc_out< sc_logic > ap_idle;
    sc_out< sc_logic > ap_ready;
    sc_out< sc_lv<4> > A_address0;
    sc_out< sc_logic > A_ce0;
    sc_in< sc_lv<32> > A_q0;
    sc_out< sc_lv<4> > A_address1;
    sc_out< sc_logic > A_ce1;
    sc_in< sc_lv<32> > A_q1;
    sc_out< sc_lv<4> > C_address0;
    sc_out< sc_logic > C_ce0;
    sc_out< sc_logic > C_we0;
    sc_out< sc_lv<32> > C_d0;


    // Module declarations
    matrix_multiply_alt2(sc_module_name name);
    SC_HAS_PROCESS(matrix_multiply_alt2);

    ~matrix_multiply_alt2();

    sc_trace_file* mVcdFile;

    back_substitute_ahbi* sum_mult_U;
    cholesky_inverse_ibs<1,1,32,32,32>* cholesky_inverse_ibs_U26;
    cholesky_inverse_dEe<1,1,32,32,32>* cholesky_inverse_dEe_U27;
    sc_signal< sc_lv<3> > ap_CS_fsm;
    sc_signal< sc_logic > ap_CS_fsm_state1;
    sc_signal< sc_lv<7> > indvar_flatten1_reg_115;
    sc_signal< sc_lv<3> > Col_assign_2_reg_126;
    sc_signal< sc_lv<6> > indvar_flatten_reg_137;
    sc_signal< sc_lv<3> > Row_assign_reg_148;
    sc_signal< sc_lv<3> > Col_assign_reg_159;
    sc_signal< sc_lv<1> > exitcond_flatten1_fu_185_p2;
    sc_signal< sc_lv<1> > exitcond_flatten1_reg_397;
    sc_signal< sc_logic > ap_CS_fsm_pp0_stage0;
    sc_signal< bool > ap_block_state2_pp0_stage0_iter0;
    sc_signal< bool > ap_block_state3_pp0_stage0_iter1;
    sc_signal< bool > ap_block_pp0_stage0_11001;
    sc_signal< sc_lv<7> > indvar_flatten_next1_fu_191_p2;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter0;
    sc_signal< sc_lv<1> > tmp_mid2_fu_229_p3;
    sc_signal< sc_lv<1> > tmp_mid2_reg_406;
    sc_signal< sc_lv<1> > tmp_1_mid2_fu_249_p3;
    sc_signal< sc_lv<1> > tmp_1_mid2_reg_410;
    sc_signal< sc_lv<3> > tmp_i_i_mid2_v_fu_257_p3;
    sc_signal< sc_lv<3> > tmp_i_i_mid2_v_reg_414;
    sc_signal< sc_lv<3> > tmp_fu_307_p3;
    sc_signal< sc_lv<3> > tmp_reg_419;
    sc_signal< sc_lv<4> > C_addr_reg_434;
    sc_signal< sc_lv<4> > sum_mult_addr_reg_439;
    sc_signal< sc_lv<3> > c_fu_377_p2;
    sc_signal< sc_lv<6> > indvar_flatten_next_fu_389_p3;
    sc_signal< bool > ap_block_pp0_stage0_subdone;
    sc_signal< sc_logic > ap_condition_pp0_exit_iter0_state2;
    sc_signal< sc_logic > ap_enable_reg_pp0_iter1;
    sc_signal< sc_lv<4> > sum_mult_address0;
    sc_signal< sc_logic > sum_mult_ce0;
    sc_signal< sc_lv<32> > sum_mult_q0;
    sc_signal< sc_logic > sum_mult_ce1;
    sc_signal< sc_logic > sum_mult_we1;
    sc_signal< sc_lv<32> > sum_mult_d1;
    sc_signal< sc_lv<3> > ap_phi_mux_Col_assign_2_phi_fu_130_p4;
    sc_signal< bool > ap_block_pp0_stage0;
    sc_signal< sc_lv<3> > ap_phi_mux_Row_assign_phi_fu_152_p4;
    sc_signal< sc_lv<64> > tmp_10_cast_fu_333_p1;
    sc_signal< sc_lv<64> > tmp_13_cast_fu_360_p1;
    sc_signal< sc_lv<64> > tmp_14_cast_fu_371_p1;
    sc_signal< sc_lv<32> > tmp_7_fu_170_p2;
    sc_signal< sc_lv<32> > mult_fu_177_p2;
    sc_signal< sc_lv<1> > exitcond_flatten_fu_203_p2;
    sc_signal< sc_lv<3> > k_fu_197_p2;
    sc_signal< sc_lv<1> > tmp_mid1_fu_217_p2;
    sc_signal< sc_lv<1> > tmp6_fu_223_p2;
    sc_signal< sc_lv<1> > tmp_1_mid1_fu_237_p2;
    sc_signal< sc_lv<1> > tmp_s_fu_243_p2;
    sc_signal< sc_lv<1> > exitcond_fu_275_p2;
    sc_signal< sc_lv<1> > not_exitcond_flatten_fu_269_p2;
    sc_signal< sc_lv<3> > Row_assign_mid_fu_209_p3;
    sc_signal< sc_lv<1> > exitcond_mid_fu_281_p2;
    sc_signal< sc_lv<1> > tmp_2_fu_293_p2;
    sc_signal< sc_lv<3> > r_fu_287_p2;
    sc_signal< sc_lv<5> > tmp_1_fu_315_p3;
    sc_signal< sc_lv<6> > tmp_9_cast_fu_323_p1;
    sc_signal< sc_lv<6> > tmp_i_i_mid2_cast_fu_265_p1;
    sc_signal< sc_lv<6> > tmp_3_fu_327_p2;
    sc_signal< sc_lv<3> > Col_assign_mid2_fu_299_p3;
    sc_signal< sc_lv<5> > tmp_4_fu_342_p3;
    sc_signal< sc_lv<6> > tmp_12_cast_fu_350_p1;
    sc_signal< sc_lv<6> > tmp_5_fu_354_p2;
    sc_signal< sc_lv<6> > tmp_i_i2_cast_fu_338_p1;
    sc_signal< sc_lv<6> > tmp_8_fu_365_p2;
    sc_signal< sc_lv<6> > indvar_flatten_op_fu_383_p2;
    sc_signal< sc_logic > ap_CS_fsm_state4;
    sc_signal< sc_lv<3> > ap_NS_fsm;
    sc_signal< sc_logic > ap_idle_pp0;
    sc_signal< sc_logic > ap_enable_pp0;
    sc_signal< bool > ap_condition_131;
    static const sc_logic ap_const_logic_1;
    static const sc_logic ap_const_logic_0;
    static const sc_lv<3> ap_ST_fsm_state1;
    static const sc_lv<3> ap_ST_fsm_pp0_stage0;
    static const sc_lv<3> ap_ST_fsm_state4;
    static const bool ap_const_boolean_1;
    static const sc_lv<32> ap_const_lv32_0;
    static const sc_lv<32> ap_const_lv32_1;
    static const bool ap_const_boolean_0;
    static const sc_lv<1> ap_const_lv1_0;
    static const sc_lv<1> ap_const_lv1_1;
    static const sc_lv<7> ap_const_lv7_0;
    static const sc_lv<3> ap_const_lv3_0;
    static const sc_lv<6> ap_const_lv6_0;
    static const sc_lv<7> ap_const_lv7_40;
    static const sc_lv<7> ap_const_lv7_1;
    static const sc_lv<3> ap_const_lv3_1;
    static const sc_lv<6> ap_const_lv6_10;
    static const sc_lv<3> ap_const_lv3_3;
    static const sc_lv<3> ap_const_lv3_4;
    static const sc_lv<2> ap_const_lv2_0;
    static const sc_lv<6> ap_const_lv6_1;
    static const sc_lv<32> ap_const_lv32_2;
    // Thread declarations
    void thread_ap_clk_no_reset_();
    void thread_A_address0();
    void thread_A_address1();
    void thread_A_ce0();
    void thread_A_ce1();
    void thread_C_address0();
    void thread_C_ce0();
    void thread_C_d0();
    void thread_C_we0();
    void thread_Col_assign_mid2_fu_299_p3();
    void thread_Row_assign_mid_fu_209_p3();
    void thread_ap_CS_fsm_pp0_stage0();
    void thread_ap_CS_fsm_state1();
    void thread_ap_CS_fsm_state4();
    void thread_ap_block_pp0_stage0();
    void thread_ap_block_pp0_stage0_11001();
    void thread_ap_block_pp0_stage0_subdone();
    void thread_ap_block_state2_pp0_stage0_iter0();
    void thread_ap_block_state3_pp0_stage0_iter1();
    void thread_ap_condition_131();
    void thread_ap_condition_pp0_exit_iter0_state2();
    void thread_ap_done();
    void thread_ap_enable_pp0();
    void thread_ap_idle();
    void thread_ap_idle_pp0();
    void thread_ap_phi_mux_Col_assign_2_phi_fu_130_p4();
    void thread_ap_phi_mux_Row_assign_phi_fu_152_p4();
    void thread_ap_ready();
    void thread_c_fu_377_p2();
    void thread_exitcond_flatten1_fu_185_p2();
    void thread_exitcond_flatten_fu_203_p2();
    void thread_exitcond_fu_275_p2();
    void thread_exitcond_mid_fu_281_p2();
    void thread_indvar_flatten_next1_fu_191_p2();
    void thread_indvar_flatten_next_fu_389_p3();
    void thread_indvar_flatten_op_fu_383_p2();
    void thread_k_fu_197_p2();
    void thread_not_exitcond_flatten_fu_269_p2();
    void thread_r_fu_287_p2();
    void thread_sum_mult_address0();
    void thread_sum_mult_ce0();
    void thread_sum_mult_ce1();
    void thread_sum_mult_d1();
    void thread_sum_mult_we1();
    void thread_tmp6_fu_223_p2();
    void thread_tmp_10_cast_fu_333_p1();
    void thread_tmp_12_cast_fu_350_p1();
    void thread_tmp_13_cast_fu_360_p1();
    void thread_tmp_14_cast_fu_371_p1();
    void thread_tmp_1_fu_315_p3();
    void thread_tmp_1_mid1_fu_237_p2();
    void thread_tmp_1_mid2_fu_249_p3();
    void thread_tmp_2_fu_293_p2();
    void thread_tmp_3_fu_327_p2();
    void thread_tmp_4_fu_342_p3();
    void thread_tmp_5_fu_354_p2();
    void thread_tmp_8_fu_365_p2();
    void thread_tmp_9_cast_fu_323_p1();
    void thread_tmp_fu_307_p3();
    void thread_tmp_i_i2_cast_fu_338_p1();
    void thread_tmp_i_i_mid2_cast_fu_265_p1();
    void thread_tmp_i_i_mid2_v_fu_257_p3();
    void thread_tmp_mid1_fu_217_p2();
    void thread_tmp_mid2_fu_229_p3();
    void thread_tmp_s_fu_243_p2();
    void thread_ap_NS_fsm();
};

}

using namespace ap_rtl;

#endif