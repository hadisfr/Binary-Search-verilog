module bin2bcd(input [7:0] bin, output [3:0] hds, tens, ones);
	wire [35:0] w;
	sha3({1'b0, 1'b0, bin[7:6]}, w[3:0]);
	sha3({w[2:0], bin[5]}, w[7:4]);
	sha3({w[6:4], bin[4]}, w[11:8]);
	sha3({w[10:8], bin[3]}, w[15:12]);
	sha3({w[14:12], bin[2]}, w[19:16]);
	sha3({w[18:16], bin[1]}, w[23:20]);
	sha3({1'b0, w[3], w[7], w[11]}, w[27:24]);
	sha3({w[26:24], w[15]}, w[31:28]);
	sha3({w[30:28], w[19]}, w[35:32]);
	assign hds = {1'b0, w[27], w[31], w[35]};
	assign tens = {w[34:32], w[23]};
	assign ones = {w[22:20], bin[0]};
endmodule

module sha3(input [3:0] in, output [3:0] out);
	assign out = in >= 4'd5 ? in + 4'd3 : in;
endmodule
