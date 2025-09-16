`timescale 1ns / 1ps


module top_alu(
input [7:0]swA,
input [7:0]swB,
input [2:0]sel,
output [7:0]leds,
output led_carry,
output led_zero,
output led_neg,
output led_overflow

    );
    wire [7:0] out;
    wire carry,zeroFlag,negFlag,OverFlowFlag;
    
    alu_8bit uut(swA,swB,sel,out,carry,zeroFlag,negFlag,OverFlowFlag);
    
    assign leds=out;
    assign led_carry=carry;
    assign led_zero=zeroFlag;
    assign led_neg=negFlag;
    assign led_overflow=OverFlowFlag;
endmodule
