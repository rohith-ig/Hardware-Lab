module d_latch_1bit(input d,input en,input rst,output q,output qnot);
	
	/* wire [5:0]w;
	wire d_out,en_out;
	
	not(w[0],d_out);
	not(w[3],en_out);
	not(w[4],rst);
	
	and(w[5],en,w[4]);
	or(en_out,rst,w[5]);
	
	and(d_out,d,w[4]);
	
	nand(w[1],d_out,en_out);
	nand(w[2],w[0],en_out);
	
	nand(q,w[1],qnot);
	nand(qnot,w[2],q); */
	
	wire [5:0]w;
	wire d_out,en_out;
	not(w[0],rst);
	
	and(d_out,rst,d);
	or(en_out,w[0],en);
	
	not(w[2],d_out);
	
	nand(w[3],d_out,en_out);
	nand(w[4],w[2],en_out);
	
	nand(q,w[3],qnot);
	nand(qnot,w[4],q);
	
endmodule

module d_latch(input [7:0]d,input en,input rst,output [7:0]q,output [7:0]qnot);
	d_latch_1bit d1(d[0],en,rst,q[0],qnot[0]);
	d_latch_1bit d2(d[1],en,rst,q[1],qnot[1]);
	d_latch_1bit d3(d[2],en,rst,q[2],qnot[2]);
	d_latch_1bit d4(d[3],en,rst,q[3],qnot[3]);
	d_latch_1bit d5(d[4],en,rst,q[4],qnot[4]);
	d_latch_1bit d6(d[5],en,rst,q[5],qnot[5]);
	d_latch_1bit d7(d[6],en,rst,q[6],qnot[6]);
	d_latch_1bit d8(d[7],en,rst,q[7],qnot[7]);

endmodule