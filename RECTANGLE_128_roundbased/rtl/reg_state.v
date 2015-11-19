module reg_state( 
        i_clk, 
        i_select, 
        iv_data1, 
        iv_data2, 
        ov_regstate0, 
        ov_regstate1, 
        ov_regstate2, 
        ov_regstate3 
        ); 
  input i_clk; 
  input i_select; 
  input[63:0] iv_data1; 
  input[63:0] iv_data2; 
  output[15:0] ov_regstate0; 
  output[15:0] ov_regstate1; 
  output[15:0] ov_regstate2; 
  output[15:0] ov_regstate3; 

  wire[63:0]  wv_state;  
  reg[63:0]  rv_state;  

  assign wv_state = (i_select)? iv_data2 : iv_data1;   
  assign ov_regstate0 = rv_state[15:0]; 
  assign ov_regstate1 = rv_state[31:16]; 
  assign ov_regstate2 = rv_state[47:32]; 
  assign ov_regstate3 = rv_state[63:48]; 

  always @(posedge i_clk)
    begin
      rv_state <= wv_state;
    end

endmodule
