module xor64(
        iv_state0,
        iv_state1,
        iv_state2,
        iv_state3,
        iv_key0,
        iv_key1,
        iv_key2,
        iv_key3,
        ov_xordata0,
        ov_xordata1,
        ov_xordata2,
        ov_xordata3
        );
  input[15:0] iv_state0;
  input[15:0] iv_state1;
  input[15:0] iv_state2;
  input[15:0] iv_state3;
  input[15:0] iv_key0;
  input[15:0] iv_key1;
  input[15:0] iv_key2;
  input[15:0] iv_key3;
  output[15:0] ov_xordata0;
  output[15:0] ov_xordata1;
  output[15:0] ov_xordata2;
  output[15:0] ov_xordata3;

  assign ov_xordata0 = iv_state0 ^ iv_key0;
  assign ov_xordata1 = iv_state1 ^ iv_key1;
  assign ov_xordata2 = iv_state2 ^ iv_key2;
  assign ov_xordata3 = iv_state3 ^ iv_key3;
endmodule	
