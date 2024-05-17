
//////////////////////////////////////////////////////////////////////////////////
// Company: SamTestLabs
// Engineer: Sambit Mishra
// 
// Create Date: 17.05.2024 14:03:31
// Design Name: Two Input AND Gate
// Module Name: and_2i
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


module and_2i(
    input A,
    input B,
    output Y
    );
    wire Y;
    assign Y = A&B;
endmodule
