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
//-- Filename : tb_rectangle.v
//-- Author : Bohan Yang
//-- Date : 25/02/2013
//-- Version : 0.1
//-- Description : This file has the testbench of 128 bit version rectangle.v
//--     
//-- Modification History:
//-- Date By Version Change Description
//--
//========================================================
//-- 25/02/13 tb_rectangle.v 0.1
//========================================================
//--Testbench File: 
//--Test Result File:
//--Synthesizable: no
//****************************************************************
//-FHEADER /////////////////////////////////////////////////////
`timescale 1ns/10ps
`define halfperiod 50
module tb_rectangle;
  reg r_clk;
  reg r_enable;
  reg[6:0] rv_counter;
  reg[63:0] rv_plaintext;
  reg[127:0] rv_key;
  wire[63:0] wv_outdata;
  wire w_done;

//////// units of sub modules ///////////////////////////////////
  rectangle u_rectangle(
    .i_clk(r_clk),
    .i_enable(r_enable), // enable signal for this modular
    .iv_plaintext(rv_plaintext), // input of plaintext
    .iv_key(rv_key), // input of key
    .o_done(w_done),// finish
    .ov_data(wv_outdata)
    );

  initial
    begin
      r_clk = 1'b0;
      r_enable = 1'b0;
      rv_counter = 7'b0;
      //rv_plaintext = 64'hFFFF_FFFF_FFFF_FFFF;
      rv_plaintex = 64'h0;
      rv_key = 128'h0;
      //rv_key = 128'hFFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF_FFFF;
    end

  always #(`halfperiod) r_clk = ~r_clk;

  always @(posedge r_clk)
    begin
      case (rv_counter)
        0:
          begin      
            r_enable <= 1'b1;
          end
        26:
          begin
            r_enable <= 1'b0;
          end
        default:;
      endcase
    rv_counter <= rv_counter +1'b1;
  end
endmodule	
	
