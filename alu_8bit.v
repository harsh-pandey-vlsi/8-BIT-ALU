`timescale 1ns / 1ps
module alu_8bit #(parameter WIDTH = 8)(
input [WIDTH-1:0]A,B,
input [2:0]sel,
output reg [WIDTH-1:0]out,
output reg carry,
output reg zeroFlag,
output reg negFlag,
output reg OverFlowFlag
    );
    wire [WIDTH:0]tmp_add;
    wire [WIDTH:0]tmp_sub;
    
    assign tmp_add ={1'b0, A}+{1'b0, B};
    assign tmp_sub ={1'b0, A}-{1'b0, B};
    
    always @(*) begin
    carry=0;
    OverFlowFlag=0;
    
    case(sel)
    3'b000: begin
    out=A+B;
    carry=tmp_add[WIDTH];
    OverFlowFlag=(A[WIDTH-1]&~B[WIDTH-1]&~out[WIDTH-1]) | (~A[WIDTH-1]&B[WIDTH-1]&out[WIDTH-1]);
    end
    3'b001: begin // SUB
    out= A-B;
    carry    = tmp_sub[WIDTH];
    OverFlowFlag= (A[WIDTH-1]&~B[WIDTH-1]&~out[WIDTH-1]) | (~A[WIDTH-1]&B[WIDTH-1]&out[WIDTH-1]);
    end
    3'b010:out=A&B;
    3'b011:out=A|B;
    3'b100:out=A^B;
    3'b101:out=A<<1;
    3'b110:out=A>>1;
    default:out=0;
    endcase
    
    zeroFlag=(out==0);
    negFlag=out[WIDTH-1];
    end
   
endmodule
