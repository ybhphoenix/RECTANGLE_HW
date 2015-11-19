//+FHEADER ////////////////////////////////////////////////////////////
//
//-- This confidential and proprietary software may be used
//-- only as authorized by a licensing agreement from
//-- COSIC/ESAT
//         ______      _____ _____ ______
//        / ____/___  / ___//_  _// ____/
//       / /   / __ \ \__ \  / / / /
//      / /___/ /_/ /___/ /_/ /_/ /___
//      \____/\____//____//____/\____/
//
//-- ALL RIGHTS RESERVED
//-- The entire notice above must be reproduced on all authorized copies.
//--
//-- Filename : rectangle.v
//-- Author : Bohan Yang
//-- Date : 25/02/2013
//-- Version : 0.1
//-- Description : This file has the entity, architecture
//-- and configuration of the RECTANGLE block cipher key 80 bits.
//--     
//-- Modification History:
//-- Date By Version Change Description
//--
//========================================================
//-- 11/02/13 rectangle.v 0.1
//========================================================
//--Testbench File: 
//--Test Result File:
//--Synthesizable: yes.
//****************************************************************
//-FHEADER /////////////////////////////////////////////////////

module rectangle(
    i_clk,
    //control_sig
    i_enable, // enable signal for this modular
    //data_in
    iv_plaintext, // input of plaintext
    iv_key, // input of key
    //control_out
    o_done,// finish signal 
    //data_out
    ov_data /////result data
    );
  input  i_clk;
  input  i_enable;// enable signal for this modular
  input[63:0]  iv_plaintext; // input of plaintext
  input[127:0]  iv_key; // input of key
  output  o_done;// finish signal 
  output[63:0]  ov_data; /////result data
  
  ///////////////wires///////////
  wire w_select;
  wire[15:0] wv_outstate0;
  wire[15:0] wv_outstate1;
  wire[15:0] wv_outstate2;
  wire[15:0] wv_outstate3;
  wire[15:0] wv_xor64res0;
  wire[15:0] wv_xor64res1;
  wire[15:0] wv_xor64res2;
  wire[15:0] wv_xor64res3;
  wire[15:0] wv_sboxbankres0;
  wire[15:0] wv_sboxbankres1;
  wire[15:0] wv_sboxbankres2;
  wire[15:0] wv_sboxbankres3;
  wire[15:0] wv_pstateres0;
  wire[15:0] wv_pstateres1;
  wire[15:0] wv_pstateres2;
  wire[15:0] wv_pstateres3;
  wire[31:0] wv_outkey0;
  wire[31:0] wv_outkey1;
  wire[31:0] wv_outkey2;
  wire[31:0] wv_outkey3;
  wire[3:0]  wv_sboxkey0;
  wire[3:0]  wv_sboxkey1;
  wire[3:0]  wv_sboxkey2;
  wire[3:0]  wv_sboxkey3;
  wire[3:0]  wv_sboxkey4;
  wire[3:0]  wv_sboxkey5;
  wire[3:0]  wv_sboxkey6;
  wire[3:0]  wv_sboxkey7;
  wire[4:0]  wv_rcxorkey;
  wire[4:0]  wv_rc;
  wire[31:0] wv_pkeyres0;
  wire[31:0] wv_pkeyres1;
  wire[31:0] wv_pkeyres2;
  wire[31:0] wv_pkeyres3;
  assign ov_data = {wv_xor64res3,wv_xor64res2,wv_xor64res1,wv_xor64res0};
  ////////modules /////////////
  mainfsm u_mainfsm(
    .iv_rc(wv_rc), // enable signal for this modular
    .o_done(o_done)// finish signal 
    );
  reg_state u_reg_state(
    .i_clk(i_clk),
    .i_select(i_enable),
    .iv_data1(iv_plaintext),
    .iv_data2({wv_pstateres3,wv_pstateres2,wv_pstateres1,wv_pstateres0}),
    .ov_regstate0(wv_outstate0),
    .ov_regstate1(wv_outstate1),
    .ov_regstate2(wv_outstate2),
    .ov_regstate3(wv_outstate3)
    );    
  reg_key u_reg_key(
    .i_clk(i_clk),
    .i_select(i_enable),
    .iv_data1(iv_key),
    .iv_data2({wv_pkeyres3,wv_pkeyres2,wv_pkeyres1,wv_pkeyres0[31:5],wv_rcxorkey}),
    .ov_regkey0(wv_outkey0),
    .ov_regkey1(wv_outkey1),
    .ov_regkey2(wv_outkey2),
    .ov_regkey3(wv_outkey3)
    );
  xor64 u_xor64(
    .iv_state0(wv_outstate0),
    .iv_state1(wv_outstate1),
    .iv_state2(wv_outstate2),
    .iv_state3(wv_outstate3),
    .iv_key0(wv_outkey0[15:0]),
    .iv_key1(wv_outkey1[15:0]),
    .iv_key2(wv_outkey2[15:0]),
    .iv_key3(wv_outkey3[15:0]),
    .ov_xordata0(wv_xor64res0),
    .ov_xordata1(wv_xor64res1),
    .ov_xordata2(wv_xor64res2),
    .ov_xordata3(wv_xor64res3)
    );
  sboxbank u_sboxbank(
    .iv_regstate0(wv_xor64res0),
    .iv_regstate1(wv_xor64res1),
    .iv_regstate2(wv_xor64res2),
    .iv_regstate3(wv_xor64res3),
    .ov_regstate0(wv_sboxbankres0),
    .ov_regstate1(wv_sboxbankres1),
    .ov_regstate2(wv_sboxbankres2),
    .ov_regstate3(wv_sboxbankres3)
    );
  p_shift_state u_p_shift_state(
    .iv_regstate0(wv_sboxbankres0),
    .iv_regstate1(wv_sboxbankres1),
    .iv_regstate2(wv_sboxbankres2),
    .iv_regstate3(wv_sboxbankres3),
    .ov_regstate0(wv_pstateres0),
    .ov_regstate1(wv_pstateres1),
    .ov_regstate2(wv_pstateres2),
    .ov_regstate3(wv_pstateres3)
    );
  sbox u_sboxkey0(
    .iv_data({wv_outkey3[0],wv_outkey2[0],wv_outkey1[0],wv_outkey0[0]}),
    .ov_data(wv_sboxkey0)
    );
  sbox u_sboxkey1(
    .iv_data({wv_outkey3[1],wv_outkey2[1],wv_outkey1[1],wv_outkey0[1]}),
    .ov_data(wv_sboxkey1)
    );
  sbox u_sboxkey2(
    .iv_data({wv_outkey3[2],wv_outkey2[2],wv_outkey1[2],wv_outkey0[2]}),
    .ov_data(wv_sboxkey2)
    );
  sbox u_sboxkey3(
    .iv_data({wv_outkey3[3],wv_outkey2[3],wv_outkey1[3],wv_outkey0[3]}),
    .ov_data(wv_sboxkey3)
    );
  sbox u_sboxkey4(
    .iv_data({wv_outkey3[4],wv_outkey2[4],wv_outkey1[4],wv_outkey0[4]}),
    .ov_data(wv_sboxkey4)
    );
  sbox u_sboxkey5(
    .iv_data({wv_outkey3[5],wv_outkey2[5],wv_outkey1[5],wv_outkey0[5]}),
    .ov_data(wv_sboxkey5)
    );
  sbox u_sboxkey6(
    .iv_data({wv_outkey3[6],wv_outkey2[6],wv_outkey1[6],wv_outkey0[6]}),
    .ov_data(wv_sboxkey6)
    );
  sbox u_sboxkey7(
    .iv_data({wv_outkey3[7],wv_outkey2[7],wv_outkey1[7],wv_outkey0[7]}),
    .ov_data(wv_sboxkey7)
    );
  p_shift_key u_p_shift_key(
    .iv_regkey0({wv_outkey0[31:8],wv_sboxkey7[0],wv_sboxkey6[0],wv_sboxkey5[0],wv_sboxkey4[0],wv_sboxkey3[0],wv_sboxkey2[0],wv_sboxkey1[0],wv_sboxkey0[0]}),
    .iv_regkey1({wv_outkey1[31:8],wv_sboxkey7[1],wv_sboxkey6[1],wv_sboxkey5[1],wv_sboxkey4[1],wv_sboxkey3[1],wv_sboxkey2[1],wv_sboxkey1[1],wv_sboxkey0[1]}),
    .iv_regkey2({wv_outkey2[31:8],wv_sboxkey7[2],wv_sboxkey6[2],wv_sboxkey5[2],wv_sboxkey4[2],wv_sboxkey3[2],wv_sboxkey2[2],wv_sboxkey1[2],wv_sboxkey0[2]}),
    .iv_regkey3({wv_outkey3[31:8],wv_sboxkey7[3],wv_sboxkey6[3],wv_sboxkey5[3],wv_sboxkey4[3],wv_sboxkey3[3],wv_sboxkey2[3],wv_sboxkey1[3],wv_sboxkey0[3]}),
    .ov_regkey0(wv_pkeyres0),
    .ov_regkey1(wv_pkeyres1),
    .ov_regkey2(wv_pkeyres2),
    .ov_regkey3(wv_pkeyres3)
    );  
  rcxor u_rcxor(
    .i_clk(i_clk),
    .i_select(i_enable),
    .iv_key(wv_pkeyres0[4:0]),
    .ov_key(wv_rcxorkey),
    .ov_rc(wv_rc)
    );     
endmodule	
