module p_shift_state(
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

  assign ov_regstate0 = iv_regstate0;
  assign ov_regstate1 = {iv_regstate1[14:0],iv_regstate1[15]};
  assign ov_regstate2 = {iv_regstate2[3:0],iv_regstate2[15:4]};
  assign ov_regstate3 = {iv_regstate3[2:0],iv_regstate3[15:3]};

endmodule	
