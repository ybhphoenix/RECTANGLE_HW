module p_shift_key(
        iv_regkey0,
        iv_regkey1,
        iv_regkey2,
        iv_regkey3,
        ov_regkey0,
        ov_regkey1,
        ov_regkey2,
        ov_regkey3
        );
  input[31:0] iv_regkey0;
  input[31:0] iv_regkey1;
  input[31:0] iv_regkey2;
  input[31:0] iv_regkey3;
  output[31:0] ov_regkey0;
  output[31:0] ov_regkey1;
  output[31:0] ov_regkey2;
  output[31:0] ov_regkey3;

  assign ov_regkey0 = {iv_regkey0[23:0],iv_regkey0[31:24]} ^ iv_regkey1;
  assign ov_regkey1 = iv_regkey2;
  assign ov_regkey2 = {iv_regkey2[15:0],iv_regkey2[31:16]} ^ iv_regkey3;
  assign ov_regkey3 = iv_regkey0;

endmodule	
