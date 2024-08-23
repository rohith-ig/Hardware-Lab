module fsm_tb;

reg x,clk,reset;

wire y;

fsmx f1(clk,x,reset,y);

initial begin 
	clk = 1'b1;
	repeat(2000) #5 clk = ~clk;
	$finish;
end

initial begin 
		#5 reset=0;
		#5 reset=1;
		#10 x=1;
		#10 x=1;
		#10 x=0;
		#10 x=1;
	end
	always #10 x = $random;

endmodule