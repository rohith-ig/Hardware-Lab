module vm(clk,rst,in,out,change);
	input clk;
	input rst;
	input [1:0]in;          
	output reg out;
	output reg[1:0] change;

	parameter IDLE = 2'b00;
	parameter FIVE = 2'b01;
	parameter TEN = 2'b10;

	reg [1:0]curr_state;
	reg [1:0]ns;

	always @(posedge clk or negedge rst)
	begin
		if(!rst)
		begin
			curr_state = 2'b00;
			ns = 2'b00;
			change = 2'b00;
			out = 1'b0;
		end
		
		else
		curr_state = ns;
		
		case(curr_state)
			IDLE:
					if(in == 2'b00)
					begin
						ns = IDLE;
						out = 0;
						change = 2'b00;
					end
					
					else if(in == 2'b01)
					begin
						ns = FIVE;
						out = 0;
						change = 2'b00;
					end
            
					else if(in == 2'b10)
					begin
						ns = TEN;
						out = 0;
						change = 2'b00;
					end
					
			FIVE:
					if(in == 2'b00)
					begin
						ns = IDLE;
						out = 0;
						change = 2'b01; 
					end	
					
					else if(in == 2'b01)
					begin
					 ns = TEN;
                out = 0;
                change = 2'b00;
					end
					else if(in == 2'b10)
					begin
						ns = IDLE;
						out = 1; 
						change = 2'b00;
					end
					
			TEN: 
					if(in == 2'b00)
					begin
						ns = IDLE;
						out = 0;
						change = 2'b10;
					end
					
					else if(in == 2'b01)
					begin
						ns = IDLE;
						out = 1;
						change = 2'b00;
					end
					
					else if(in == 2'b10)
					begin
						ns = IDLE;
						out = 1;
						change = 2'b01; 
					end
		endcase
	end
endmodule