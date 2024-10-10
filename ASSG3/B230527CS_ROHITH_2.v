module rw_reg(input clk,input rst,input rw,input [15:0] write_1, input [15:0] write_2,output reg [15:0] read);
	reg [15:0] block;
	reg toggle;
	always @(posedge clk) begin
		if (!rst) begin
			block <= 0;
			toggle <= 0;
		end
		else begin
			if (rw) begin
				if (!toggle) begin
					block <= write_1;
					toggle <= 1;
				end
				else begin
					block <= write_2;
					toggle <= 0;
				end
			end
			else read <= block;	
		end
	end
endmodule
	