module ALUDUT(input [7:0]A,input [7:0]B,input [3:0]S,output reg [15:0]Y);
always@(*) begin
case(S)
4'b0000: Y = A + B;
4'b0001: Y = A - B;
4'b0010: Y = A * B;
4'b0011: Y = A & B;
4'b0100: Y = A | B;
4'b0101: Y = A ^ B;
4'b0110: Y ={8'b00000000,~A};
4'b0111: Y ={8'b00000000,~B};
4'b1000: Y = ~(A & B);
4'b1001: Y = ~(A | B);
4'b1010: Y = A ~^ B;
4'b1011: Y = A << B;
4'b1100: Y = A <<< B;
4'b1101: Y = A >> B;
4'b1110: Y = A >>> B;
4'b1111: Y = A << 1;
default: Y =1'b0;
endcase
end
endmodule
