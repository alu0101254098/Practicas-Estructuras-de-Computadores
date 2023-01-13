// Testbench para modulo mux4_1
`timescale 1 ns / 10 ps
module mux4_1_tb;

reg test_a, test_b, test_c, test_d;
reg [1:0] test_s;
wire test_out;

mux4_1 mux4a1(test_out, test_a, test_b, test_c, test_d, test_s);

initial
begin
  $monitor("tiempo=%0d s=%b a=%b b=%b c=%b d=%b out=%b", $time, test_s, test_a, test_b, test_c, test_d, test_out);

  test_s = 2'b00;
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b0;
  # 20;

  test_s = 2'b01;
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b0;
  test_d = 1'b1;
  # 20;
 
  test_s = 2'b10;
  test_a = 1'b1;
  test_b = 1'b0;
  test_c = 1'b1;
  test_d = 1'b0;
  # 20;

  test_s = 2'b11;
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b1;
  test_d = 1'b0;
  # 20;

  test_s = 2'b00;
  test_a = 1'b0;
  test_b = 1'b0;
  test_c = 1'b1;
  test_d = 1'b1;
  # 20;

  test_s = 2'b01;
  test_a = 1'b0;
  test_b = 1'b1;
  test_c = 1'b0;
  test_d = 1'b0;
  # 20;

  test_s = 2'b10;
  test_a = 1'b0;
  test_b = 1'b1;
  test_c = 1'b0;
  test_d = 1'b1;
  # 20;

  test_s = 2'b11;
  test_a = 1'b0;
  test_b = 1'b1;
  test_c = 1'b1;
  test_d = 1'b1;


  $finish;
end

endmodule
