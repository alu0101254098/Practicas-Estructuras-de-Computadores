module mux2_1(output wire out, input wire a, input wire b, input wire s);

	assign out = s ? b : a; //oper. cond C, sintaxis [cond ? v_si_cierta : v_si_falsa] 

endmodule
