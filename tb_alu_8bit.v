`timescale 1ns / 1ps
module tb_alu_8bit();
reg [7:0]A,B;
reg [2:0]sel;
wire [7:0]out;
wire carry, zeroFlag, negFlag, OverFlowFlag;

alu_8bit uut(A,B,sel,out,carry,zeroFlag,negFlag,OverFlowFlag);

initial begin
$monitor("Time=%0t A=%d B=%d Sel=%b | Out=%d Carry=%b Zero=%b Neg=%b Ovf=%b",
                  $time, A, B, sel, out, carry, zeroFlag, negFlag, OverFlowFlag);
//Directed test
A=10; B=5; sel=3'b000; #10;
sel=3'b001; #10;
sel=3'b010; #10;
sel=3'b011; #10;
sel=3'b100; #10;
sel=3'b101; #10;
sel=3'b101; #10;
sel=3'b110; #10;

//Random Test
repeat(10) begin
A=$random;
B=$random;
sel=$random%7;
#10;
end
$finish;
end 
endmodule                 
