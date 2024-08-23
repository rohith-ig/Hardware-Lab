module d_latch_tb;
	
	reg [7:0]d;
	reg en,rst;
	wire [7:0]q,qnot;
	
	integer i;
	
	d_latch d1(d,en,rst,q,qnot);
	
	initial begin 
		$monitor("d = %b,rst = %b,en = %b,q = %b,qnot = %b",d,rst,en,q,qnot);
		en = 0; rst = 0;
		for (i=0;i<256;i=i+1) begin
			d = i;
			#10;
		end 
		en = 0; rst = 1;
		for (i=0;i<256;i=i+1) begin
			d = i;
			#10;
		end 
		en = 1; rst = 0;
		for (i=0;i<256;i=i+1) begin
			d = i;
			#10;
		end 
		en = 1; rst = 1;
		for (i=0;i<256;i=i+1) begin
			d = i;
			#10;
		end 
	end
endmodule
	