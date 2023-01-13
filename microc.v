module microc(input wire clk, reset, s_inc,s_abs , s_inm, we3, wez, input wire [2:0] op, output wire z, output wire [5:0] opcode);
//Microcontrolador sin memoria de datos de un solo ciclo

//Instanciar e interconectar pc, memprog, regfile, alu, sum, biestable Z y mux's
wire [7:0] alu_mux, wd3, rd1, rd2;
wire zalu;
wire [9:0] dir, s_sum, salida_mux, salida_mux2;
wire [15:0] rd;



mux2 muxdcha( alu_mux, rd[11:4], s_inm, wd3);
alu mialu(rd1, rd2, op, alu_mux, zalu);
ffd ffz(clk, reset, zalu, wez, z);

regfile bancoreg(clk, we3, rd[11:8], rd[7:4], rd[3:0], wd3, rd1, rd2);

memprog miprograma(clk, dir, rd);

mux2 #(10) muxizq2(s_sum, rd[9:0], s_abs, salida_mux2 );

sum misumador(salida_mux, dir, s_sum);

mux2 #(10) muxizq(rd[9:0],10'b1, s_inc ,salida_mux); 

registro #(10) pc(clk, reset, salida_mux2, dir);

assign opcode = rd[15:10];



endmodule

