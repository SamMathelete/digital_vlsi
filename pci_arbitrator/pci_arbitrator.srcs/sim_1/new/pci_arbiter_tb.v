`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2024 20:47:41
// Design Name: 
// Module Name: pci_arbiter_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module pci_arbiter_tb;
    parameter CLOCK = 20;
    reg req0, req1, req2, req3, clk, reset_n;
    wire gnt0, gnt1, gnt2, gnt3;
    
    pci_arbiter dut(
        .gnt0(gnt0),
        .gnt1(gnt1),
        .gnt2(gnt2),
        .gnt3(gnt3),
        .clk(clk),
        .reset_n(reset_n),
        .req0(req0),
        .req1(req1),
        .req2(req2),
        .req3(req3)
    );
    
    initial begin
        clk = 1'b0;
        reset_n = 1'b1;
        req0 = 1'b1;
        req1 = 1'b1;
        req2 = 1'b1;
        req3 = 1'b1;
    end
    
    initial
        forever #(CLOCK/2) clk = ~clk;
    
    initial begin
        #20 reset_n = 1'b0;
        #20 reset_n = 1'b1;
        #40 req0 = 1'b0;
        #20 req1 = 1'b0;
        #20 req2 = 1'b0;
        #20 req0 = 1'b1;
        #20 req3 = 1'b0;
        #100 $finish;
    end
endmodule
