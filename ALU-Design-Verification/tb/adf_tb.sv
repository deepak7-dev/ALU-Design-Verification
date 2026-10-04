module adf_tb;
reg [7:0]A,B;
reg [3:0]S;
wire [15:0]Y;
reg [15:0]ex_Y;
ALUDUT connection(.A(A),.B(B),.S(S),.Y(Y));
integer i,j,k;
integer pass_c,fail_c;
// NOTE:
// Functional coverage is currently commented out because
// Vivado XSIM does not support SystemVerilog covergroups
// in the current simulation environment.
/*covergroup alucov;
coverpoint S{
bins ADD={4'b0000};
bins SUB={4'b0001};
bins MUL={4'b0010};
bins AND={4'b0011};
bins OR={4'b0100};
bins XOR={4'b0101};
bins NOTA ={4'b0110};
bins NOTB ={4'b0111};
bins NAND={4'b1000};
bins NOR={4'b1001};
bins XNOR={4'b1010};
bins RS={4'b1011};
bins ARS={4'b1100};
bins LS={4'b1101};
bins ALS={4'b1110};
bins RS1={4'b1111};
}
endgroup 
alucov cov = new();*/
initial begin
$display("!!!TEST STARTED!!!");
pass_c=0;
fail_c=0;
//$monitor("A=%b | B=%b | S=%b || Y=%b ",A,B,S,Y); 
for(i=0;i<16;i=i+1) begin
for(j=0;j<64;j=j+1)begin
for(k=0;k<64;k=k+1)begin
S=i;
A=j;
B=k;
#0.01;
//cov.sample();
case(S)
4'b0000: ex_Y = A + B;
4'b0001: ex_Y = A - B;
4'b0010: ex_Y = A * B;
4'b0011: ex_Y = A & B;
4'b0100: ex_Y = A | B;
4'b0101: ex_Y = A ^ B;
4'b0110: ex_Y ={8'b00000000,~A};
4'b0111: ex_Y = {8'b00000000,~B};
4'b1000: ex_Y = ~(A & B);
4'b1001: ex_Y = ~(A | B);
4'b1010: ex_Y = A ~^ B;
4'b1011: ex_Y = A << B;
4'b1100: ex_Y = A <<< B;
4'b1101: ex_Y = A >> B;
4'b1110: ex_Y = A >>> B;
4'b1111: ex_Y = A << 1;
default: ex_Y =16'b0;
endcase
if(Y == ex_Y)begin
//$display("pass || ex_Y = %b",ex_Y);
pass_c=pass_c+1;
end
else begin
//$display("FAIL: A=%b B=%b S=%b Y=%b EX_Y=%b",A,B,S,Y,ex_Y);
fail_c=fail_c+1;
end
assert (S != 4'b0000 || Y == A + B)
else 
$display("ADD ASSERTION FAILED   A=%b B=%b Y=%d expected=%d",A,B,Y,A + B);
assert(S != 4'b0001 || Y == A - B)
else
$display("SUB ASSERTION FAILED   A=%b B=%b Y=%d expected=%d",A,B,Y,A - B);
assert(S != 4'b0010 || Y == A * B)
else
$display("MUL ASSERTION FAILED   A=%b B=%b Y=%d expected=%d",A,B,Y,A * B);
assert(S != 4'b0011 || Y == {8'b0,(A & B)})
else
$display("AND ASSERTION FAILED  A=%b B=%b Y=%d expected=%d",A,B,Y,A & B);
assert(S != 4'b0100 || Y == {8'b0,(A | B)})
else
$display("OR ASSERTION FAILED  A=%b B=%b Y=%d expected=%d",A,B,Y,A | B);
assert(S != 4'b0101 || Y == {8'b0,(A ^ B)})
else
$display("XOR ASSERTION FAILED  A=%b B=%b Y=%d expected=%d",A,B,Y,A ^ B);
assert(S != 4'b0110 || Y == ({8'b00000000,~A}))
else
$display("NOT A ASSERTION FAILED  A=%b B=%b Y=%d expected=%d",A,B,Y,{8'b00000000,~A});
assert(S != 4'b0111 || Y == ({8'b00000000,~B}))
else
$display("NOT B ASSERTION FAILED   A=%b B=%b Y=%d expected=%d",A,B,Y,{8'b00000000,~B});
assert(S != 4'b1000 || Y ==(~(A & B)))
else
$display("NAND ASSERTION FAILED   A=%b B=%b Y=%d expected=%d",A,B,Y,~(A & B));
assert(S != 4'b1001 || Y == (~(A | B)))
else
$display("NOR ASSERTION FAILED   A=%b B=%b Y=%d expected=%d",A,B,Y,~(A | B));
assert(S != 4'b1010 || Y == (A ~^ B))
else
$display("XNOR ASSERTION FAILED   A=%b B=%b Y=%d expected=%d",A,B,Y,A ~^ B);
assert(S != 4'b1011 || Y == (A << B))
else
$display("LS ASSERTION FAILED   A=%b B=%b Y=%d expected=%d",A,B,Y,A << B);
assert(S != 4'b1100 || Y == (A <<< B))
else
$display("ALS ASSERTION FAILED   A=%b B=%b Y=%d expected=%d",A,B,Y,A <<< B);
assert(S != 4'b1101 || Y == (A >> B))
else
$display("RS ASSERTION FAILED   A=%b B=%b Y=%d expected=%d",A,B,Y,A >> B);
assert(S != 4'b1110 || Y == (A >>> B))
else
$display("ARS ASSERTION FAILED    A=%b B=%b Y=%d expected=%d",A,B,Y,A >>> B);
assert(S != 4'b1111 || Y == (A << 1))
else
$display("LF1 ASSERTION FAILED   A=%b B=%b Y=%d expected=%d",A,B,Y,A << 1);
end 
end
end
$display("======================");
$display("<<<<<<ALU TEST>>>>>>");
$display("======================");
$display("TOTAL : %d",pass_c+fail_c);
$display("PASS : %d",pass_c);
$display("FAIL : %d",fail_c);
if(fail_c == 0)
$display("STATUS : PASS ");
else
$display("STATUS : FAIL");
$display("======================");
$display("!!!TEST FINISHED!!!");
$finish();
end
endmodule
