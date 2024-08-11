module adder_tb;

reg [7:0]a,b;
reg cin;
wire [7:0]s;
wire cout;

adder s1(.a(a),.b(b),.cin(cin),.s(s),.cout(cout));

integer i,j;

initial begin 
	cin = 0;
	for (i=0;i<256;i=i+1) begin
		a = i;
		for (j=0;j<256;j=j+1) begin
			b = j;
			#10;
		end
	end
	cin = 1;
	for (i=0;i<256;i=i+1) begin
		a = i;
		for (j=0;j<256;j=j+1) begin
			b = j;
			#10;
		end
	end
end
endmodule