module da_rom_tb;
    parameter CLOCK = 10;
    reg clk;
    reg [2:0] addr1, addr2;
    wire [63:0] dout1, dout2;
    
    da_rom dut(
        .dout1(dout1),
        .dout2(dout2),
        .addr1(addr1),
        .addr2(addr2),
        .clk(clk)
    );
    
    initial begin
        clk = 1'b0;
        addr1 = 3'b000;
        addr2 = 3'b000;
    end
    
    initial
        forever #(CLOCK/2) clk = ~clk;
        
    initial begin
        #20 addr1 = 3'b001;
            addr2 = 3'b010;
        #20 addr1 = 3'b111;
            addr2 = 3'b101;
        #20 addr1 = 3'b110;
            addr2 = 3'b011;
        #100 $finish;
    end
endmodule