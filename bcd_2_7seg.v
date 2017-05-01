module bcd_2_7seg (data_in, data_out);

	input [3:0]data_in;
	output [6:0]data_out;
								//secuence :a-b-c-d-e-f-g-h  // pin plan to (MSB)HEX[0]-HEX[1]-HEX[2]-HEX[3]-HEX[4]-HEX[5]-HEX[6]-HEX[7](LSB)
	assign data_out = 	
						(data_in == 4'b0000)? 7'b1000000:	//0 segments 
						(data_in == 4'b0001)? 7'b1111001:	//1 segments 
						(data_in == 4'b0010)? 7'b0100100:	//2 segments 
						(data_in == 4'b0011)? 7'b0110000:	//3 segments 
						(data_in == 4'b0100)? 7'b0011001:	//4 segments 
						(data_in == 4'b0101)? 7'b0010010:	//5 segments 
						(data_in == 4'b0110)? 7'b0000010:	//6 segments 
						(data_in == 4'b0111)? 7'b1111000:	//7 segments 
						(data_in == 4'b1000)? 7'b0000000:	//8 segments 
						(data_in == 4'b1001)? 7'b0010000:	//9 segments 
						7'b0000110;
endmodule
