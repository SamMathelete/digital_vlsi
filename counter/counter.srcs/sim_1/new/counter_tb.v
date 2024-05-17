module counter_tb;
reg A, B, C, clk, reset_n;
wire [7:0] cnt_reg;

counter mycntr(cnt_reg, reset_n, A, B, C, clk);

initial begin
  clk = 1'b0;
  A = 1'b1;
  B = 1'b1;
  C = 1'b1;
  reset_n = 1'b1;
end

initial begin
  forever #5 clk = ~clk;
end

initial begin
  #10 reset_n = 1'b0;
  #5 reset_n = 1'b1;
  #100 $finish;
end

initial $monitor($time, " cnt_reg = %8b, reset_n = %b", cnt_reg, reset_n);
endmodule
