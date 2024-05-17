`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2024 14:42:23
// Design Name: 
// Module Name: counter
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


module counter (
  output reg [7:0] cnt_reg,
  input reset_n, A, B, C, clk
);

wire res_cnt, adv_cnt;
wire [7:0] cnt_nxt;
assign res_cnt = (cnt_reg == 255);
assign adv_cnt = ((A == 1'b1) && (B == 1'b1)) && (C == 1'b1);
assign cnt_nxt = cnt_reg + 1;

always @(posedge clk or negedge reset_n) begin
  if (reset_n == 1'b0)
    cnt_reg <= 8'b0;
  else if (res_cnt == 1'b1)
    cnt_reg <= 8'b0;
  else if (adv_cnt == 1'b1)
    cnt_reg <= cnt_nxt;
  else
    cnt_reg <= cnt_reg;
end
endmodule

