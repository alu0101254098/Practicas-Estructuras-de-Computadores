module alu(output wire [3:0] R, output wire zero, carry, sign, input wire [3:0] A, B, input wire [1:0] ALUOp, input wire L);

	wire [3:0] r;
	wire [3:0] op1;
	wire [3:0] op2;
	wire c0, c1, c2;
	wire cin0, op1a, op2a, cpl;
	assign op1a =(~ALUOp[1]) |  (L);
	assign op2a = (~ALUOp[1]) | (ALUOp[0]) | (L);
	assign cpl = (~L & ALUOp[1]) | (~L & ALUOp[0]);
	assign cin0 = (ALUOp[1]) | (ALUOp[0]);

	mux2_4 mux2a4_1(op1, 4'b0000, A, op1a);
	mux2_4 mux2a4_2(r, A, B, op2a);
	compl1 compl1_1(op2, r, cpl);
	cal jcal1(R[0], c0, op1[0], op2[0], L, cin0, ALUOp);
	cal jcal2(R[1], c1, op1[1], op2[1], L, c0, ALUOp);
	cal jcal3(R[2], c2, op1[2], op2[2], L, c1, ALUOp);
	cal jcal4(R[3], carry, op1[3], op2[3], L, c2, ALUOp);

  	assign sign = R[3];
	assign zero = (R == 4'b0000) ? 1 : 0;
   
endmodule
