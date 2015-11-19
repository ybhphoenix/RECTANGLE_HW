module mainfsm(
  iv_rc,
  o_done// finish signal 
  );
  input[4:0] iv_rc;
  output o_done;// finish signal 
  assign o_done = (iv_rc == 5'b1_1010)? 1'b1:1'b0;  
endmodule
