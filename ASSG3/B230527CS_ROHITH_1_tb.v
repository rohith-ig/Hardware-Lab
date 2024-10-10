module siso_tb;

	reg clk,rst,rw,w;
	wire r;
	sipo s1(clk,rst,rw,w,r);
	
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		rst = 0;
		#10
		rst = 1;
		rw = 1;
		w = 1;
		#10
		w = 0;
		#10
		w = 1;
		#10
		w = 1;
		#10
		rw = 0;
		#50;
	end
endmodule