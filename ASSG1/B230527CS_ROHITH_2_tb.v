module fsm1_tb;

reg clk;
reg rst;
reg [1:0] in;

wire out;
wire [1:0] change;

vm f1 (
    .clk(clk), 
    .rst(rst), 
    .in(in), 
    .out(out), 
    .change(change)
);

initial begin 
	clk = 1'b1;
	repeat(1000) #5 clk = ~clk;
	$finish;
end

initial begin
	 #5;
    rst = 0;
    #5;
    rst = 1;
	 #10
    in = 2'b00;
    #10;
    in = 2'b01;
    #10;
    in = 2'b10;
    #10;


    in = 2'b01;
    #10;


    in = 2'b10;
    #10;

     
    in = 2'b10;
    #10;


    in = 2'b10;
    #10;
    in = 2'b10;
    #10;

    in = 2'b10;
    #10;
    in = 2'b10;
    #10;
    in = 2'b10;
    #10;

    in = 2'b10;
    #10;
    in = 2'b10;
    #10;
    in = 2'b10;
    #10;
    in = 2'b01;
    #10;
    in = 2'b10;
    #10;
    in = 2'b10;
    #10;
    in = 2'b10;
    #10;
    in = 2'b10;
    #10;
    


    in = 2'b10;
    #10;
    in = 2'b10;
    #10;
    in = 2'b01;
    #10;
    in = 2'b10;
end

endmodule