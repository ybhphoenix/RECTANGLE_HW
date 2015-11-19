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
//-- Filename : sbox.v
//-- Author : Bohan Yang
//-- Date : 25/02/2013
//-- Version : 0.1
//-- Description : This file has the entity, architecture
//-- and configuration of the sbox.
//--     
//-- Modification History:
//-- Date By Version Change Description
//--
//========================================================
//-- 11/02/13 sbox.v 0.1
//-- 11/11/14 sbox.v 0.2 with updated sbox 
//-- 6 5 c a 1 e 7 9 b 0 3 d 8 f 4 2 
//========================================================
//--Testbench File: 
//--Test Result File:
//--Synthesizable: yes.
//****************************************************************
//-FHEADER /////////////////////////////////////////////////////

module sbox(
        iv_data,
        ov_data
        );
  input[3:0]  iv_data;
  output[3:0] ov_data;
  
  wire a,b,c,d,e,f,g,h;
  wire t1,t2,t3,t4,t5,t7,t8,t10,t11,t13;
  
  assign a=iv_data[0];
  assign b=iv_data[1];
  assign c=iv_data[2];
  assign d=iv_data[3];
  
  assign t1 = ~d; 
  assign t2 = ~(b & t1); 
  assign t3 = a ^ t2; 
  assign t4 = c & t3; 
  assign t5 = ~(c | t3); 
  assign f = ~(t4 | t5); 
  assign t7 = t1 & t3; 
  assign t8 = ~(t5 | t7); 
  assign h = b ^ t8; 
  assign t10 = ~(t3 | h); 
  assign t11 = ~(t4 | t10); 
  assign e = t1 ^ t11; 
  assign t13 = h | e; 
  assign g = t3 ^ t13; 
  
  assign ov_data={h,g,f,e};
endmodule	
