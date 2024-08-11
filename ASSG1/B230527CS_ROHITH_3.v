module bitwise_xor(input [7:0]a,input [7:0]b,output [7:0]c);
xor(c[0],a[0],b[0]);
xor(c[1],a[1],b[1]);
xor(c[2],a[2],b[2]);
xor(c[3],a[3],b[3]);
xor(c[4],a[4],b[4]);
xor(c[5],a[5],b[5]);
xor(c[6],a[6],b[6]);
xor(c[7],a[7],b[7]);
endmodule

module left_shift(input [7:0]a,output [7:0]b);
and(b[7],a[3],1'b1);
and(b[6],a[2],1'b1);
and(b[5],a[1],1'b1);
and(b[4],a[0],1'b1);
and(b[3],1'b0,1'b1);
and(b[2],1'b0,1'b1);
and(b[1],1'b0,1'b1);
and(b[0],1'b0,1'b1);
endmodule

module half_adder(a,b,s,cout);
input a,b;
output s,cout;
xor(s,a,b);
and(cout,a,b);
endmodule

module full_adder(a,b,cin,s,cout);
input a,b,cin;
output s,cout;
wire w1,w2,w3;
half_adder h1(a,b,w1,w2);
half_adder h2(w1,cin,s,w3);
or(cout,w3,w2);
endmodule

module bitadder(input [7:0]a,input [7:0]b,input cin,output [7:0]s,output cout);
wire [6:0]w;
full_adder f1(a[0],b[0],cin,s[0],w[0]);
full_adder f2(a[1],b[1],w[0],s[1],w[1]);
full_adder f3(a[2],b[2],w[1],s[2],w[2]);
full_adder f4(a[3],b[3],w[2],s[3],w[3]);
full_adder f5(a[4],b[4],w[3],s[4],w[4]);
full_adder f6(a[5],b[5],w[4],s[5],w[5]);
full_adder f7(a[6],b[6],w[5],s[6],w[6]);
full_adder f8(a[7],b[7],w[6],s[7],cout);
endmodule

module bitsubtractor(input [7:0]a,input [7:0]b,output [7:0]d,output sign);
wire [7:0]w,x,y,z;
wire s1,s2,s3;
not(w[0],b[0]);
not(w[1],b[1]);
not(w[2],b[2]);
not(w[3],b[3]);
not(w[4],b[4]);
not(w[5],b[5]);
not(w[6],b[6]);
not(w[7],b[7]); 

bitadder b1(a,w,1'b1	,x,s);
not(s2,s);
xor(y[0],x[0],s2);
xor(y[1],x[1],s2);
xor(y[2],x[2],s2);
xor(y[3],x[3],s2);
xor(y[4],x[4],s2);
xor(y[5],x[5],s2);
xor(y[6],x[6],s2);
xor(y[7],x[7],s2);

bitadder b2(y,8'b000000,s2,d,s3);
and(sign,1'b1,s2);
endmodule

module mux(input [7:0]i1,input [7:0]i2,input [7:0]i3,input [7:0]i4,input [1:0]op,output [7:0]r);
	wire [3:0]w1,w2,w3,w4,w5,w6,w7,w8;
	
	wire n0,n1,m1,m2,m3,m4;
	
	not(n0,op[0]);
	not(n1,op[1]);
	
	and(m1,n0,n1);
	and(m3,n0,op[1]);
	and(m2,op[0],n1);
	and(m4,op[0],op[1]);
	
	and(w1[0],i1[0],m1);
	and(w1[1],i2[0],m2);
	and(w1[2],i3[0],m3);
	and(w1[3],i4[0],m4);
	or(r[0],w1[0],w1[1],w1[2],w1[3]);
	
	and(w2[0],i1[1],m1);
	and(w2[1],i2[1],m2);
	and(w2[2],i3[1],m3);
	and(w2[3],i4[1],m4);
	or(r[1],w2[0],w2[1],w2[2],w2[3]);
	
	and(w3[0],i1[2],m1);
	and(w3[1],i2[2],m2);
	and(w3[2],i3[2],m3);
	and(w3[3],i4[2],m4);
	or(r[2],w3[0],w3[1],w3[2],w3[3]);
	
	and(w4[0],i1[3],m1);
	and(w4[1],i2[3],m2);
	and(w4[2],i3[3],m3);
	and(w4[3],i4[3],m4);
	or(r[3],w4[0],w4[1],w4[2],w4[3]);
	
	and(w5[0],i1[4],m1);
	and(w5[1],i2[4],m2);
	and(w5[2],i3[4],m3);
	and(w5[3],i4[4],m4);
	or(r[4],w5[0],w5[1],w5[2],w5[3]);
	
	and(w6[0],i1[5],m1);
	and(w6[1],i2[5],m2);
	and(w6[2],i3[5],m3);
	and(w6[3],i4[5],m4);
	or(r[5],w6[0],w6[1],w6[2],w6[3]);
	
	and(w7[0],i1[6],m1);
	and(w7[1],i2[6],m2);
	and(w7[2],i3[6],m3);
	and(w7[3],i4[6],m4);
	or(r[6],w7[0],w7[1],w7[2],w7[3]);
	
	and(w8[0],i1[7],m1);
	and(w8[1],i2[7],m2);
	and(w8[2],i3[7],m3);
	and(w8[3],i4[7],m4);
	or(r[7],w8[0],w8[1],w8[2],w8[3]);
	
endmodule

module mux2(input cout,input sign,input [1:0]op,output overflow);

	wire n0,n1,m1,m2;
	
	not(n0,op[0]);
	not(n1,op[1]);
	
	and(m1,n0,n1,cout);
	and(m2,op[0],n1,sign);
	
	or(overflow,m1,m2);
	
endmodule

module alu(input [7:0]a,input [7:0]b,input [1:0]op,output [7:0]c,output overflow);
	wire [7:0] w1,w2,w3,w4;
	wire cout,sign;
	
	bitwise_xor b1(.a(a),.b(b),.c(w1));
	left_shift l1(.a(a),.b(w2));
	bitadder ba1(.a(a),.b(b),.cin(1'b0),.s(w3),.cout(cout)); 
	bitsubtractor bs1(.a(a),.b(b),.d(w4),.sign(sign));
	
	mux m1(.i1(w3),.i2(w4),.i3(w2),.i4(w1),.op(op),.r(c));
	mux2 m2(.cout(cout),.sign(sign),.op(op),.overflow(overflow));
	
	
endmodule 

