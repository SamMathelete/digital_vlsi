`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 17.05.2024 20:08:29
// Design Name: 
// Module Name: pci_arbiter
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


module pci_arbiter(
    output reg gnt0, gnt1, gnt2, gnt3,
    input clk, reset_n, req0, req1, req2, req3
    );
    reg [2:0] arbiter_state;
    always @(posedge clk or negedge reset_n) begin
        if (reset_n == 1'b0) begin
            gnt0 <= 1'b0;
            gnt1 <= 1'b0;
            gnt2 <= 1'b0;
            gnt3 <= 1'b0;
            arbiter_state <= 3'b0;
        end else
            case (arbiter_state)
                3'b0: begin
                    gnt0 <= 1'b0;
                    gnt1 <= 1'b0;
                    gnt2 <= 1'b0;
                    gnt3 <= 1'b0;
                    if (req0 == 1'b1)
                        arbiter_state <= 3'b001;
                    else if (req1 == 1'b1)
                        arbiter_state <= 3'b010;
                    else if (req2 == 1'b1)
                        arbiter_state <= 3'b011;
                    else if (req3 == 1'b1)
                        arbiter_state <= 3'b100;
                    else
                        arbiter_state <= 3'b0;
                end
                3'b001: begin
                    gnt0 <= 1'b1;
                    gnt1 <= 1'b0;
                    gnt2 <= 1'b0;
                    gnt3 <= 1'b0;
                    if (req0 == 1'b1)
                        arbiter_state <= 3'b001;
                    else if (req1 == 1'b1)
                        arbiter_state <= 3'b010;
                    else if (req2 == 1'b1)
                        arbiter_state <= 3'b011;
                    else if (req3 == 1'b1)
                        arbiter_state <= 3'b100;
                    else
                        arbiter_state <= 3'b001;
                end
                3'b010: begin
                    gnt0 <= 1'b0;
                    gnt1 <= 1'b1;
                    gnt2 <= 1'b0;
                    gnt3 <= 1'b0;
                    if (req1 == 1'b1)
                        arbiter_state <= 3'b010;
                    else if (req2 == 1'b1)
                        arbiter_state <= 3'b011;
                    else if (req3 == 1'b1)
                        arbiter_state <= 3'b100;
                    else
                        arbiter_state <= 3'b001;
                end
                3'b011: begin
                    gnt0 <= 1'b0;
                    gnt1 <= 1'b0;
                    gnt2 <= 1'b1;
                    gnt3 <= 1'b0;
                    if (req2 == 1'b1)
                        arbiter_state <= 3'b011;
                    else if (req0 == 1'b1)
                        arbiter_state <= 3'b001;
                    else if (req1 == 1'b1)
                        arbiter_state <= 3'b010;
                    else if (req3 == 1'b1)
                        arbiter_state <= 3'b100;
                    else
                        arbiter_state <= 3'b001;
                end
                3'b100: begin
                    gnt0 <= 1'b0;
                    gnt1 <= 1'b0;
                    gnt2 <= 1'b0;
                    gnt3 <= 1'b1;
                    if (req3 == 1'b1)
                        arbiter_state <= 3'b100;
                    else
                        arbiter_state <= 3'b001;
                end
                default:
                    arbiter_state <= 3'b0;
           endcase
    end
endmodule
