module cal(output wire out, c_out, input wire a, b, l, c_in, input wire [1:0] s);
	
	wire out_cl, out_fa;
	
	cl      cl1(out_cl, a, b, s);
	fa      fa1(c_out, out_fa, a, b, c_in);
	mux2_1  mux2a1(out, out_fa, out_cl, l);

  
  
endmodule
