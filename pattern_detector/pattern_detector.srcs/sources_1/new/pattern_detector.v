`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2024 14:53:54
// Design Name: 
// Module Name: pattern_detector
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


module pattern_detector (
  output reg detected,
  input [15:0] data_in_seq, 
  input clk, reset_n
);

localparam S0 = 2'b00, S1 = 2'b01, S2 = 2'b10, S3 = 2'b11;
reg [1:0] state;
reg [15:0] data_in_reg;
wire data_in;
assign data_in = data_in_reg[0];

always @(posedge clk or negedge reset_n) begin
  if (reset_n == 1'b0) begin
    detected <= 1'b0;
    state <= S0;
    data_in_reg <= data_in_seq;
  end
  else begin
    case (state)
      S0: begin
        state <= data_in ? S0 : S1;
        detected <= 1'b0;
      end
      S1: begin
        state <= data_in ? S2 : S1;
        detected <= 1'b0;
      end
      S2: begin
        state <= data_in ? S3 : S1;
        detected <= 1'b0;
      end
      S3: begin
        state <= data_in ? S0 : S1;
        detected <= data_in ? 1'b0 : 1'b1;
      end
      default: begin
        state <= S0;
        detected <= 1'b0;
      end
    endcase
    data_in_reg <= (data_in_reg >> 1);
  end
end
endmodule

