module and_2i_tb();
    parameter CLOCK = 20;
    reg A, B;
    wire Y;
    and_2i uut(.A(A), .B(B), .Y(Y));
    initial begin
        A = 1'b0;
        B = 1'b0;
        #100 $finish;
    end
    initial begin
        forever #(CLOCK/2) A <= ~A;
    end
    initial begin
        forever #(CLOCK) B <= ~B;
    end 
    initial $monitor($time, " A = %b, B = %b, Y = %b", A, B, Y);
endmodule