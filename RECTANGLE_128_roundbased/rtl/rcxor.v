module rcxor(
        i_clk,
        i_select,
        iv_key,
        ov_key,
        ov_rc
        );
  input i_clk;
  input i_select;
  input[4:0] iv_key;
  output[4:0] ov_key;
  output[4:0] ov_rc;
  
  reg[4:0] rv_rc;
  wire[4:0] wv_rc;
  
  assign wv_rc = (i_select)? {rv_rc[3],rv_rc[2],rv_rc[1],rv_rc[0],(rv_rc[4] ^ rv_rc[2])} : 5'b00001 ;
  assign ov_key = iv_key ^ rv_rc;
  assign ov_rc = rv_rc;

  always @(posedge i_clk)
    begin
      rv_rc <= wv_rc;
    end
endmodule	
