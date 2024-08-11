module alu_tb;
	reg [7:0]a,b;
	reg [1:0]op;
	wire [7:0]c;
	wire overflow;
	
	alu a1(a,b,op,c,overflow);
	
	integer i,j;
	
	initial begin 
		$monitor("a = %b,b = %b,opcode = %b,c = %b,overflow = %b",a,b,op,c,overflow);
		op = 0;
		for (i=0;i<256;i=i+1) begin
			a = i;
			for (j=0;j<256;j=j+1) begin
				b = j;
				#10;
			end
		end
		op = 1;
		for (i=0;i<256;i=i+1) begin
			a = i;
			for (j=0;j<256;j=j+1) begin
				b = j;
				#10;
			end
		end
		op = 2;
		for (i=0;i<256;i=i+1) begin
			a = i;
			for (j=0;j<256;j=j+1) begin
				b = j;
				#10;
			end
		end
		op = 3;
		for (i=0;i<256;i=i+1) begin
			a = i;
			for (j=0;j<256;j=j+1) begin
				b = j;
				#10;
			end
		end
	end
endmodule