module sipo(input clk,input rst,input rw,input w,output reg [3:0] q);
	reg [3:0] d;
	always @(posedge clk) begin
		if (!rst) begin
			d <= 0;
			q <= 0;
		end
		else begin
			if (rw) begin
				d[0] <= d[1];
				d[1] <= d[2];
				d[2] <= d[3];
				d[3] <= w;			
			end
			else begin
				q <= d;
			end
		end
	end
endmodule
