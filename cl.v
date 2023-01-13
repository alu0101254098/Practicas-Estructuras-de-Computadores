module cl(output wire out, input wire a, b, input wire [1:0] s);
	
	wire c_and, c_or, c_xor, c_not;
	
	and j_and(c_and, b, a);
	or  j_or(c_or, b, a);
	xor j_xor(c_xor, b, a);
	not j_not(c_not, a);
	
	mux4_1 mux4a1(out, c_and, c_or, c_xor, c_not);

endmodule
