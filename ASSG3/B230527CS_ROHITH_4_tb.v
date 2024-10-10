module main_tb;
	
	reg clk,rst;
	wire [11:0] q;
	bcdc b1(clk,rst,q);
	initial begin 
		clk = 0;
		forever #5 clk = ~clk;
	end
	
	initial begin
		rst = 0;
		#10
		rst = 1;
		#1000
		$finish;
	end
endmodule