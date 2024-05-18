`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 18.05.2024 16:23:20
// Design Name: 
// Module Name: ext_ram_ctr
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


module ext_ram_ctr (
    output wire [15:0] addr,
    output wire ce_n,
    output reg rwn, wr_n, oe_n,
    input clk_out, reset_n, hold, endram
);

    parameter max_drpixaddr = 65536;
    reg [15:0] drwaddr, drraddr;
    wire [15:0] drwaddr_next, drraddr_next;
    wire enwaddr, enwr_cnt, wr_cnt_next, res_addr, res_waddr;
    reg wr_cnt;
    wire enraddr, enrd_cnt, rd_cnt_next, res_raddr;
    reg rd_cnt;
    
    assign res_addr = (addr == max_drpixaddr) & ((wr_cnt == 1'b1) | (rd_cnt == 1'b1)) & (ce_n == 1'b0);
    
    always @(posedge clk_out or negedge reset_n) begin
        if (reset_n == 1'b0)
            rwn <= 1'b0;
        else if (hold == 1'b1)
            rwn <= rwn;
        else if (res_addr == 1'b1)
            rwn <= ~rwn;
        else
            rwn <= rwn;
    end
    
    assign enwr_cnt = (endram == 1'b1) & (rwn == 1'b0) & (ce_n == 1'b0);
    
    always @(negedge clk_out or negedge reset_n) begin
        if (reset_n == 1'b0)
            wr_n <= 1'b1;
        else if (hold == 1'b1)
            wr_n <= wr_n;
        else if (enwr_cnt == 1'b1)
            wr_n <= ~wr_n;
        else
            wr_n <= 1'b1;
    end
    
    assign wr_cnt_next = wr_cnt + 1;
    
    always @(posedge clk_out or negedge reset_n) begin
        if (reset_n == 1'b0)
            wr_cnt <= 1'b0;
        else if (hold == 1'b1)
            wr_cnt <= wr_cnt;
        else if (wr_cnt == 1'b1)
            wr_cnt <= 1'b0;
        else if (enwr_cnt == 1'b1)
            wr_cnt <= wr_cnt_next;
        else
            wr_cnt <= wr_cnt;
    end
    
    assign drwaddr_next = drwaddr + 1;
    assign enwaddr = (endram == 1'b1) & (rwn == 1'b0) & (wr_cnt == 1'b1) & (ce_n == 1'b0);
    assign res_waddr = (drwaddr == max_drpixaddr) & (wr_cnt == 1'b1) & (ce_n == 1'b0);
    
    always @(posedge clk_out or negedge reset_n) begin
        if (reset_n == 1'b0)
            drwaddr <= 16'd0;
        else if (hold == 1'b1)
            drwaddr <= drwaddr;
        else if (res_waddr == 1'b1)
            drwaddr <= 16'd0;
        else if (enwaddr == 1'b1)
            drwaddr <= drwaddr_next;
    end
    
    assign rd_cnt_next = rd_cnt + 1;
    
    always @(posedge clk_out or negedge reset_n) begin
        if (reset_n == 1'b0)
            rd_cnt <= 1'b0;
        else if (hold == 1'b1)
            rd_cnt <= rd_cnt;
        else if (rd_cnt == 1'b1)
            rd_cnt <= 1'b0;
        else if (enrd_cnt == 1'b1)
            rd_cnt <= rd_cnt_next;
        else
            rd_cnt <= rd_cnt;
    end
    
    assign drraddr_next = drraddr + 1;
    assign enraddr = (endram == 1'b1) & (rwn == 1'b1) & (rd_cnt == 1'b1) & (ce_n == 1'b0);
    assign res_raddr = (drraddr == max_drpixaddr) & (rd_cnt == 1'b1) & (ce_n == 1'b0);
    
    always @(posedge clk_out or negedge reset_n) begin
        if (reset_n == 1'b0)
            drraddr <= 16'd0;
        else if (hold == 1'b1)
            drraddr <= drraddr;
        else if (res_raddr == 1'b1)
            drraddr <= 16'd0;
        else if (enraddr == 1'b1)
            drraddr <= drraddr_next;
    end
    
    assign enrd_cnt = (endram == 1'b1) & (rwn == 1'b1) & (ce_n == 1'b0);
    
    always @(negedge clk_out or negedge reset_n) begin
        if (reset_n == 1'b0)
            oe_n <= 1'b1;
        else if (hold == 1'b1)
            oe_n <= oe_n;
        else if (enrd_cnt == 1'b1)
            oe_n <= ~oe_n;
        else
            oe_n <= 1'b1;
    end
    
    assign addr = (rwn) ? drraddr : drwaddr;
    assign ce_n = (addr <= max_drpixaddr) ? 1'b0 : 1'b1;
endmodule
