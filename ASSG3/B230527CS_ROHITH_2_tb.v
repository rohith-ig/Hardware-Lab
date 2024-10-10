module rw_reg_tb;

reg [15:0] w1,w2;
reg clk,rst,rw;
wire [15:0] read;

rw_reg r1(clk,rst,rw,w1,w2,read);

initial begin 
	clk = 0;
	forever #5 clk = ~clk;
end

/* initial begin
	rst = 0;
	#10
	rst = 1;
	#10
	forever begin
		#10;
		rw = $random%2;
		w1 = $random;
		w2 = $random;
	end
end
endmodule */
	initial begin
		rst = 0;
		#10
		rst = 1;
		#10
		rw = 1;
		w1 = 1;
		#10
		w2 = 2;
		#10
		rw = 0;
		#10
		rw = 1;
		w1 = 55;
		#10
		rw = 0;
		#10
		$finish;
	end
endmodule
	 