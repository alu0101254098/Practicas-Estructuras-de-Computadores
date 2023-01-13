`timescale 1 ns / 10 ps

module microc_tb;

reg test_clk, test_reset, test_s_inc, test_s_abs, test_s_inm, test_we3, test_wez; 
reg [2:0]test_op; 
wire test_z;
wire [5:0]test_opcode;


microc micro(test_clk, test_reset, test_s_inc, test_s_abs, test_s_inm, test_we3, test_wez, test_op, test_z, test_opcode);


initial
  test_clk=1;
  
always
begin
  #10;
  test_clk=~test_clk;
end

initial
begin
  test_reset=1;
  #5;
  test_reset=0;
end

initial
begin
  
  $dumpfile("microc_tb.vcd");
  $dumpvars;
  
  //PRIMERA INSTRUCCION, LI
  test_op=000;
  #10;
  test_s_inc=1;
  test_s_abs=0;
  test_s_inm=1;
  test_we3=1;
  test_wez=0;

  #20;
  //SEGUNDA INSTRUCCION, LI
  test_op=000;
  test_s_inc=1;
  test_s_abs=0;
  test_s_inm=1;
  test_we3=1;
  test_wez=0;
 
  #20;
  //TERCERA INSTRUCCION, LI
  test_op=000;
  test_s_inc=1;
  test_s_abs=0;
  test_s_inm=1;
  test_we3=1;
  test_wez=0;
 
  #20;
  //CUARTA INSTRUCCION, JR
  test_op=000;
  test_s_abs=0;
  test_s_inc=0;
  test_s_inm=0;
  test_we3=0;
  test_wez=0;
  
  #20;
  //QUINTA INSTRUCCION, SUB
  test_op=011;
  test_s_inc=1;
  test_s_abs=1;
  test_s_inm=0;
  test_we3=1;
  test_wez=1;
  
  #20;
  //SEXTA INSTRUCCION, JNZ
  test_op=000;
  if(test_z==0)
    test_s_abs=1;
  else
  begin test_s_abs=0; 
  test_s_inc=1;
  end
  test_s_inm=0;
  test_we3=0;
  test_wez=0;
  
  #20;
  //SEPTIMA INSTRUCCION, ADD
  test_op=010;
  test_s_inc=1;
  test_s_abs=1;
  test_s_inm=0;
  test_we3=1;
  test_wez=1;
  
  #20;
  //QUINTA INSTRUCCION, SUB
  test_op=011;
  test_s_inc=1;
  test_s_abs=1;
  test_s_inm=0;
  test_we3=1;
  test_wez=1;
  
  #20;
  //SEXTA INSTRUCCION, JNZ
  test_op=000;
  if(test_z==0)
    test_s_abs=1;
  else
  begin test_s_abs=0; 
  test_s_inc=1;
  end
  test_s_inm=0;
  test_we3=0;
  test_wez=0;
  
  #20;
  //OCTAVA INSTRUCCION, J
  test_op=000;
  test_s_inc=0;
  test_s_abs=1;
  test_s_inm=0;
  test_we3=0;
  test_wez=0;
  
  #20;
   //OCTAVA INSTRUCCION, J
  test_op=000;
  test_s_inc=0;
  test_s_abs=1;
  test_s_inm=0;
  test_we3=0;
  test_wez=0;
  
  #20;
  
  
  
  $finish;  
end
endmodule
