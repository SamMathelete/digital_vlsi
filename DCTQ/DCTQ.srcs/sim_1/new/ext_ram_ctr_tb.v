`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2024 17:00:25
// Design Name: 
// Module Name: ext_ram_ctr_tb
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


module ext_ram_ctr_tb;

    parameter CLOCK = 10;
    parameter max_drpixaddr = 65535;
    parameter test_data = 24'h555555;
    
    reg clk_out, reset_n, hold, endram;
    wire [15:0] addr;
    wire ce_n, wr_n, oe_n, rwn;
    reg error = 0;
    
    wire [23:0] data;
    reg [23:0] mem [max_drpixaddr:0];
    
    ext_ram_ctr dut(
        .addr(addr),
        .rwn(rwn),
        .ce_n(ce_n),
        .wr_n(wr_n),
        .oe_n(oe_n),
        .clk_out(clk_out),
        .reset_n(reset_n),
        .hold(hold),
        .endram(endram)
    );
    
    initial begin
        clk_out = 1'b0;
        reset_n = 1'b1;
        hold = 1'b0;
        endram = 1'b0;
        
        #10 reset_n = 1'b0;
        #30 reset_n = 1'b1;
        #16 endram = 1'b1;
           
        #2800000 $finish;
    end
    
    always @(rwn or addr)
        if (rwn == 1'b0)
            mem[addr] <= test_data;
        else;
        
    always @(addr)
        case ({ (rwn == 1'b1), (mem[addr] == test_data), (addr == max_drpixaddr) })
            3'b111: begin
                if (error == 0)
                    $display(" External RAM Test: PASS");
                else begin
                    $display(" External RAM Test: FAIL");
                    error <= 0;
                end
            end
            3'b101:
                $display(" External RAM Test: FAIL => Last address @ %d", addr);
            3'b100:
                error <= 1;
            default: ;
        endcase
    
    assign data = mem[addr];
    
    initial
        forever #(CLOCK/2) clk_out = ~clk_out;
        
endmodule
