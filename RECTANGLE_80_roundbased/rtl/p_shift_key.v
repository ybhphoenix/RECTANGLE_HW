module p_shift_key(
        iv_regkey0,
        iv_regkey1,
        iv_regkey2,
        iv_regkey3,
        iv_regkey4,
        ov_regkey0,
        ov_regkey1,
        ov_regkey2,
        ov_regkey3,
        ov_regkey4
        );
  input[15:0] iv_regkey0;
  input[15:0] iv_regkey1;
  input[15:0] iv_regkey2;
  input[15:0] iv_regkey3;
  input[15:0] iv_regkey4;
  output[15:0] ov_regkey0;
  output[15:0] ov_regkey1;
  output[15:0] ov_regkey2;
  output[15:0] ov_regkey3;
  output[15:0] ov_regkey4;

  assign ov_regkey0 = {iv_regkey0[7:0],iv_regkey0[15:8]} ^ iv_regkey1;
  assign ov_regkey1 = iv_regkey2;
  assign ov_regkey2 = iv_regkey3;
  assign ov_regkey3 = {iv_regkey3[3:0],iv_regkey3[15:4]} ^ iv_regkey4;
  assign ov_regkey4 = iv_regkey0;

endmodule	
