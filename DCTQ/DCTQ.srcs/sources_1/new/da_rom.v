`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2024 10:16:01
// Design Name: 
// Module Name: da_rom
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


module da_rom(
    output reg [63:0] dout1, dout2,
    input [2:0] addr1, addr2,
    input clk
);
    wire [63:0] loc0, loc1, loc2, loc3, loc4, loc5, loc6, loc7;
    reg [63:0] dout1_next, dout2_next, dout1_reg, dout2_reg;
    assign loc0 = 64'h5B5B5B5B5B5B5B5B;
    assign loc1 = 64'h7E6A4719E7B99682;
    assign loc2 = 64'h7631CF8A8ACF3176;
    assign loc3 = 64'h6AE782B9477E1996;
    assign loc4 = 64'h5BA5A55B5BA5A55B;
    assign loc5 = 64'h4782196A96E77EB9;
    assign loc6 = 64'h318A76CFCF768A31;
    assign loc7 = 64'h19B96A827E9647E7;
    always @(loc0 or loc1 or loc2 or loc3 or loc4 or loc5 or loc6 or loc7 or addr1 or addr2) begin
        case (addr1)
            3'b000:
                dout1_next <= loc0;
            3'b001:
                dout1_next <= loc1;
            3'b010:
                dout1_next <= loc2;
            3'b011:
                dout1_next <= loc3;
            3'b100:
                dout1_next <= loc4;
            3'b101:
                dout1_next <= loc5;
            3'b110:
                dout1_next <= loc6;
            3'b111:
                dout1_next <= loc7;
            default:
                dout1_next <= loc0;
        endcase
        case (addr2)
            3'b000:
                dout2_next <= loc0;
            3'b001:
                dout2_next <= loc1;
            3'b010:
                dout2_next <= loc2;
            3'b011:
                dout2_next <= loc3;
            3'b100:
                dout2_next <= loc4;
            3'b101:
                dout2_next <= loc5;
            3'b110:
                dout2_next <= loc6;
            3'b111:
                dout2_next <= loc7;
            default:
                dout1_next <= loc0;
        endcase
    end
    always @(posedge clk) begin
        dout1_reg <= dout1_next;
        dout2_reg <= dout2_next;
    end
    always @(posedge clk) begin
        dout1 <= dout1_reg;
        dout2 <= dout2_reg;
    end
endmodule
