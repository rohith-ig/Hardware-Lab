module bcdc(input clk,input rst,output reg [11:0] q);
	reg [3:0] d0,d1,d2;
	always @(posedge clk) begin
		if (!rst) begin
			q <= 0;
			d0 <= 0;
			d1 <= 0;
			d2 <= 0;
		end
		else begin
			if (d0 == 9) begin
				d0 <= 0;
				if (d1 == 9) begin
					d1 <= 0;
					if (d2 == 9) begin
						d2 <= 0;
					end
					else d2 <= d2 + 1;
				end
				else d1 <= d1 + 1;
			end
			else d0 <= d0 + 1;		
			q <= {d2,d1,d0};
		end
	end
endmodule