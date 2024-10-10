module updcount(input clk,input rst,input m,output reg [3:0] q);
	always @(posedge clk) begin
		if (!rst) q <= 0;
		else begin
			if (m) q <= q - 1;
			else q <= q + 1;
		end
	end
endmodule