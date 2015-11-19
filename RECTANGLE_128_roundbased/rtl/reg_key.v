module reg_key(
        i_clk,
        i_select,
        iv_data1,
        iv_data2,
        ov_regkey0,
        ov_regkey1,
        ov_regkey2,
        ov_regkey3
        );
  input i_clk;
  input i_select;
  input[127:0] iv_data1;
  input[127:0] iv_data2;
  output[31:0] ov_regkey0;
  output[31:0] ov_regkey1;
  output[31:0] ov_regkey2;
  output[31:0] ov_regkey3;

  wire[127:0] wv_key; 
  reg[127:0] rv_key; 
 
  assign wv_key = (i_select)? iv_data2 : iv_data1;
  assign ov_regkey0 = rv_key[31:0];
  assign ov_regkey1 = rv_key[63:32];
  assign ov_regkey2 = rv_key[95:64];
  assign ov_regkey3 = rv_key[127:96];

  always @(posedge i_clk)
    begin
      rv_key <= wv_key;
    end
endmodule	
