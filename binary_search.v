module binary_search(input clk, input [7:0] v_in,output reg [7:0] ans);

reg [8:0] b,e;
reg [3:0] counter;

wire [8:0] m;
assign m = (b+e) >> 1;

always@(posedge clk) begin
	if (counter == 4'b1000)begin //reset everything
		counter <= 4'b0000;
		ans <= m[7:0]; 
		b <= 0;
		e <= 9'd256;
	end
	else begin
		counter <= counter + 1;
		if (v_in >= m)
			b <= m ;
		else
			e <= m;
	end
end


endmodule
