module experiment_3(input clk, input [7:0] v_in,output reg [7:0] ans);

reg [7:0] b,e;
reg [2:0] counter;

wire [7:0] m;
assign m = (b+e) >> 1;

always@(posedge clk) begin
	if (counter == 3'b111)begin //reset everything
		counter <= 3'b000;
		ans <= m; 
		b <= 0;
		e <= 255;
	end
	else begin
		counter <= counter + 1;
		if (v_in > m)
			b <= m + 1;
		else
			e <= m;
	end
end


endmodule
