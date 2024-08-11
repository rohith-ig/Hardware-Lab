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

module adder(input [7:0]a,input [7:0]b,input cin,output [7:0]s,output cout);
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




