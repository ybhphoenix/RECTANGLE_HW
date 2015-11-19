module reg_key(
        i_clk,
        i_select,
        iv_data1,
        iv_data2,
        ov_regkey0,
        ov_regkey1,
        ov_regkey2,
        ov_regkey3,
        ov_regkey4        
        );
  input i_clk;
  input i_select;
  input[79:0] iv_data1;
  input[79:0] iv_data2;
  output[15:0] ov_regkey0;
  output[15:0] ov_regkey1;
  output[15:0] ov_regkey2;
  output[15:0] ov_regkey3;
  output[15:0] ov_regkey4;

  wire[79:0]  wv_key; 
  reg[79:0] rv_key;

  assign wv_key = (i_select)? iv_data2 : iv_data1;
  assign ov_regkey0 = rv_key[15: 0];
  assign ov_regkey1 = rv_key[31:16];
  assign ov_regkey2 = rv_key[47:32];
  assign ov_regkey3 = rv_key[63:48];
  assign ov_regkey4 = rv_key[79:64];

  always @(posedge i_clk)
    begin
      rv_key <= wv_key;
    end
endmodule	
