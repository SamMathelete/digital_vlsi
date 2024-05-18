module sa_rom_tb;
    parameter CLOCK = 10;
    reg clk;
    reg [5:0] a;
    wire [7:0] d;
    
    sa_rom dut(
        .d(d),
        .a(a),
        .clk(clk)
    );
    
    initial begin
        clk = 1'b0;
        a = 6'b000000;
    end
    
    initial
        forever #(CLOCK/2) clk = ~clk;
        
    initial begin
        #20 a = 6'b0000001;
        #20 a = 6'b111111;
        #20 a = 6'b001110;
        #100 $finish;
    end
endmodule