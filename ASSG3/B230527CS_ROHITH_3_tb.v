module main_tb;

	reg clk,rst,m;
	wire [3:0] q;
	updcount u1(clk,rst,m,q);
	initial begin
		clk = 0;
		forever #5 clk = ~clk;
	end
	initial begin
		forever #10 m = $random%2;
	end
	initial begin
		rst = 0;
		#10
		rst = 1;
		#90;
		$finish;
	end
endmodule