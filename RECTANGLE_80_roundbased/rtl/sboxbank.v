module sboxbank(
        iv_regstate0,
        iv_regstate1,
        iv_regstate2,
        iv_regstate3,
        ov_regstate0,
        ov_regstate1,
        ov_regstate2,
        ov_regstate3
        );
  input[15:0] iv_regstate0;
  input[15:0] iv_regstate1;
  input[15:0] iv_regstate2;
  input[15:0] iv_regstate3;
  output[15:0] ov_regstate0;
  output[15:0] ov_regstate1;
  output[15:0] ov_regstate2;
  output[15:0] ov_regstate3;
  wire[3:0] wv_sboxdatain0;
  wire[3:0] wv_sboxdataout0;
  wire[3:0] wv_sboxdatain1;
  wire[3:0] wv_sboxdataout1;
  wire[3:0] wv_sboxdatain2;
  wire[3:0] wv_sboxdataout2;
  wire[3:0] wv_sboxdatain3;
  wire[3:0] wv_sboxdataout3;
  wire[3:0] wv_sboxdatain4;
  wire[3:0] wv_sboxdataout4;
  wire[3:0] wv_sboxdatain5;
  wire[3:0] wv_sboxdataout5;
  wire[3:0] wv_sboxdatain6;
  wire[3:0] wv_sboxdataout6;
  wire[3:0] wv_sboxdatain7;
  wire[3:0] wv_sboxdataout7;
  wire[3:0] wv_sboxdatain8;
  wire[3:0] wv_sboxdataout8;
  wire[3:0] wv_sboxdatain9;
  wire[3:0] wv_sboxdataout9;
  wire[3:0] wv_sboxdatain10;
  wire[3:0] wv_sboxdataout10;
  wire[3:0] wv_sboxdatain11;
  wire[3:0] wv_sboxdataout11;
  wire[3:0] wv_sboxdatain12;
  wire[3:0] wv_sboxdataout12;
  wire[3:0] wv_sboxdatain13;
  wire[3:0] wv_sboxdataout13;
  wire[3:0] wv_sboxdatain14;
  wire[3:0] wv_sboxdataout14;
  wire[3:0] wv_sboxdatain15;
  wire[3:0] wv_sboxdataout15;
  
  sbox u_sbox0(
          .iv_data(wv_sboxdatain0),
          .ov_data(wv_sboxdataout0)
          );
  
  sbox u_sbox1(
          .iv_data(wv_sboxdatain1),
          .ov_data(wv_sboxdataout1)
          );
  
  sbox u_sbox2(
          .iv_data(wv_sboxdatain2),
          .ov_data(wv_sboxdataout2)
          );
  
  sbox u_sbox3(
          .iv_data(wv_sboxdatain3),
          .ov_data(wv_sboxdataout3)
          );
  
  sbox u_sbox4(
          .iv_data(wv_sboxdatain4),
          .ov_data(wv_sboxdataout4)
          );
  
  sbox u_sbox5(
          .iv_data(wv_sboxdatain5),
          .ov_data(wv_sboxdataout5)
          );
  
  sbox u_sbox6(
          .iv_data(wv_sboxdatain6),
          .ov_data(wv_sboxdataout6)
          );
  
  sbox u_sbox7(
          .iv_data(wv_sboxdatain7),
          .ov_data(wv_sboxdataout7)
          );
  
  sbox u_sbox8(
          .iv_data(wv_sboxdatain8),
          .ov_data(wv_sboxdataout8)
          );
  
  sbox u_sbox9(
          .iv_data(wv_sboxdatain9),
          .ov_data(wv_sboxdataout9)
          );
  
  sbox u_sbox10(
          .iv_data(wv_sboxdatain10),
          .ov_data(wv_sboxdataout10)
          );
  
  sbox u_sbox11(
          .iv_data(wv_sboxdatain11),
          .ov_data(wv_sboxdataout11)
          );
  
  sbox u_sbox12(
          .iv_data(wv_sboxdatain12),
          .ov_data(wv_sboxdataout12)
          );
  
  sbox u_sbox13(
          .iv_data(wv_sboxdatain13),
          .ov_data(wv_sboxdataout13)
          );
  
  sbox u_sbox14(
          .iv_data(wv_sboxdatain14),
          .ov_data(wv_sboxdataout14)
          );
  
  sbox u_sbox15(
          .iv_data(wv_sboxdatain15),
          .ov_data(wv_sboxdataout15)
          );
  assign wv_sboxdatain0 = {iv_regstate3[0],iv_regstate2[0],iv_regstate1[0],iv_regstate0[0]};
  assign wv_sboxdatain1 = {iv_regstate3[1],iv_regstate2[1],iv_regstate1[1],iv_regstate0[1]};
  assign wv_sboxdatain2 = {iv_regstate3[2],iv_regstate2[2],iv_regstate1[2],iv_regstate0[2]};
  assign wv_sboxdatain3 = {iv_regstate3[3],iv_regstate2[3],iv_regstate1[3],iv_regstate0[3]};
  assign wv_sboxdatain4 = {iv_regstate3[4],iv_regstate2[4],iv_regstate1[4],iv_regstate0[4]};
  assign wv_sboxdatain5 = {iv_regstate3[5],iv_regstate2[5],iv_regstate1[5],iv_regstate0[5]};
  assign wv_sboxdatain6 = {iv_regstate3[6],iv_regstate2[6],iv_regstate1[6],iv_regstate0[6]};
  assign wv_sboxdatain7 = {iv_regstate3[7],iv_regstate2[7],iv_regstate1[7],iv_regstate0[7]};
  assign wv_sboxdatain8 = {iv_regstate3[8],iv_regstate2[8],iv_regstate1[8],iv_regstate0[8]};
  assign wv_sboxdatain9 = {iv_regstate3[9],iv_regstate2[9],iv_regstate1[9],iv_regstate0[9]};
  assign wv_sboxdatain10 = {iv_regstate3[10],iv_regstate2[10],iv_regstate1[10],iv_regstate0[10]};
  assign wv_sboxdatain11 = {iv_regstate3[11],iv_regstate2[11],iv_regstate1[11],iv_regstate0[11]};
  assign wv_sboxdatain12 = {iv_regstate3[12],iv_regstate2[12],iv_regstate1[12],iv_regstate0[12]};
  assign wv_sboxdatain13 = {iv_regstate3[13],iv_regstate2[13],iv_regstate1[13],iv_regstate0[13]};
  assign wv_sboxdatain14 = {iv_regstate3[14],iv_regstate2[14],iv_regstate1[14],iv_regstate0[14]};
  assign wv_sboxdatain15 = {iv_regstate3[15],iv_regstate2[15],iv_regstate1[15],iv_regstate0[15]};
  assign ov_regstate0 = {wv_sboxdataout15[0],wv_sboxdataout14[0],wv_sboxdataout13[0],wv_sboxdataout12[0],wv_sboxdataout11[0],wv_sboxdataout10[0],wv_sboxdataout9[0],wv_sboxdataout8[0],wv_sboxdataout7[0],wv_sboxdataout6[0],wv_sboxdataout5[0],wv_sboxdataout4[0],wv_sboxdataout3[0],wv_sboxdataout2[0],wv_sboxdataout1[0],wv_sboxdataout0[0]}; 
  assign ov_regstate1 = {wv_sboxdataout15[1],wv_sboxdataout14[1],wv_sboxdataout13[1],wv_sboxdataout12[1],wv_sboxdataout11[1],wv_sboxdataout10[1],wv_sboxdataout9[1],wv_sboxdataout8[1],wv_sboxdataout7[1],wv_sboxdataout6[1],wv_sboxdataout5[1],wv_sboxdataout4[1],wv_sboxdataout3[1],wv_sboxdataout2[1],wv_sboxdataout1[1],wv_sboxdataout0[1]}; 
  assign ov_regstate2 = {wv_sboxdataout15[2],wv_sboxdataout14[2],wv_sboxdataout13[2],wv_sboxdataout12[2],wv_sboxdataout11[2],wv_sboxdataout10[2],wv_sboxdataout9[2],wv_sboxdataout8[2],wv_sboxdataout7[2],wv_sboxdataout6[2],wv_sboxdataout5[2],wv_sboxdataout4[2],wv_sboxdataout3[2],wv_sboxdataout2[2],wv_sboxdataout1[2],wv_sboxdataout0[2]}; 
  assign ov_regstate3 = {wv_sboxdataout15[3],wv_sboxdataout14[3],wv_sboxdataout13[3],wv_sboxdataout12[3],wv_sboxdataout11[3],wv_sboxdataout10[3],wv_sboxdataout9[3],wv_sboxdataout8[3],wv_sboxdataout7[3],wv_sboxdataout6[3],wv_sboxdataout5[3],wv_sboxdataout4[3],wv_sboxdataout3[3],wv_sboxdataout2[3],wv_sboxdataout1[3],wv_sboxdataout0[3]}; 

endmodule	
