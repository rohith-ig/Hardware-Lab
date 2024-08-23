module subtractor_tb;

reg [7:0]a,b;
wire [7:0]d;
wire sign;

subtractor s1(.a(a),.b(b),.d(d),.sign(sign));

integer i,j;

initial begin 
	for (i=0;i<256;i=i+1) begin
		a = i;
		for (j=0;j<256;j=j+1) begin
			b = j;
			#10;
		end
	end
end
endmodule