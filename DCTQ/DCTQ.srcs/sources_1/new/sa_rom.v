`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2024 11:18:56
// Design Name: 
// Module Name: sa_rom
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


module sa_rom(
    output reg [7:0] d,
    input [5:0] a,
    input clk
);
    wire [7:0] d_next;
    reg [63:0] mem [7:0];
    reg [7:0] byte_data [7:0];
    wire [63:0] mem_data;
    wire [63:0] loc0, loc1, loc2, loc3, loc4, loc5, loc6, loc7;
    
    assign loc0 = 64'hFF806C5D4F4C473C;
    assign loc1 = 64'h80805D554C473C37;
    assign loc2 = 64'h6C5D4F4C473C3C36;
    assign loc3 = 64'h5D5D4F4C473C3733;
    assign loc4 = 64'h5D4F4C47403B332B;
    assign loc5 = 64'h4F4C47403B332B23;
    assign loc6 = 64'h4F4C473C362D251E;
    assign loc7 = 64'h4C473B362D251E19;
    
    always @(loc0 or loc1 or loc2 or loc3 or loc4 or loc5 or loc6 or loc7) begin
        mem[0] <= loc0;
        mem[1] <= loc1;
        mem[2] <= loc2;
        mem[3] <= loc3;
        mem[4] <= loc4;
        mem[5] <= loc5;
        mem[6] <= loc6;
        mem[7] <= loc7;
    end
    
    always @(mem_data) begin
        byte_data[0] <= mem_data[63:56];
        byte_data[1] <= mem_data[55:48];
        byte_data[2] <= mem_data[47:40];
        byte_data[3] <= mem_data[39:32];
        byte_data[4] <= mem_data[31:24];
        byte_data[5] <= mem_data[23:16];
        byte_data[6] <= mem_data[15:8];
        byte_data[7] <= mem_data[7:0];
    end
    
    assign mem_data = mem[a[5:3]];
    assign d_next = byte_data[a[2:0]];
    
    always @(posedge clk)
        d <= d_next;
                
endmodule
