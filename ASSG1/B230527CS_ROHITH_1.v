module fsmx(input clk,input x,input rst,output reg y);

	parameter s0 = 2'b00,s1 = 2'b01,s2 = 2'b10,s3 = 2'b11;
	
	reg [1:0]curr_state,ns;
	
	always @(posedge clk or negedge rst) begin 
	
		if (!rst) curr_state <= s0;
		else curr_state <= ns;
	end

	always @(*) begin
		case (curr_state) 
				s0: ns <= x ? s1 : s0;
				s1: ns <= x ? s2 : s1;
				s2: begin 
					ns <= x ? s2 : s3;
				end
				s3: begin 
					ns <= x ? s0 : s1;
				end
				default : begin
					ns <= s0;
				end
		endcase
	end
	always @(curr_state,x) begin
		if (curr_state == s3) y = x ? 1 : 0;
		else y = 0;
	end
endmodule
		
	
	