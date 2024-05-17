module pattern_detector_tb;

reg [15:0] data_in;
reg clk, reset_n;
wire detected;

pattern_detector mypd(
  .detected(detected), 
  .data_in_seq(data_in), 
  .clk(clk), 
  .reset_n(reset_n)
);

initial begin
  data_in = 16'b1010011011110110;
  clk = 1'b0;
  reset_n = 1'b0;
end

initial begin
  forever #10 clk = ~clk;
end

initial begin
  #1 reset_n = 1'b1;
  #1000 $finish;
end

initial $monitor($time, " clk = %b, data_in = %16b, detected = %b", clk, data_in, detected);
endmodule
