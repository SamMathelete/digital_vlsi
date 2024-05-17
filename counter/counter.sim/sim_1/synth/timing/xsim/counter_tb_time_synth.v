// Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
// Copyright 2022-2023 Advanced Micro Devices, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2023.2 (win64) Build 4029153 Fri Oct 13 20:14:34 MDT 2023
// Date        : Fri May 17 14:46:47 2024
// Host        : DESKTOP-2GKGU52 running 64-bit major release  (build 9200)
// Command     : write_verilog -mode timesim -nolib -sdf_anno true -force -file
//               D:/digital_vlsi/counter/counter.sim/sim_1/synth/timing/xsim/counter_tb_time_synth.v
// Design      : counter
// Purpose     : This verilog netlist is a timing simulation representation of the design and should not be modified or
//               synthesized. Please ensure that this netlist is used with the corresponding SDF file.
// Device      : xc7k70tfbv676-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps
`define XIL_TIMING

(* NotValidForBitStream *)
module counter
   (cnt_reg,
    reset_n,
    A,
    B,
    C,
    clk);
  output [7:0]cnt_reg;
  input reset_n;
  input A;
  input B;
  input C;
  input clk;

  wire A;
  wire A_IBUF;
  wire B;
  wire B_IBUF;
  wire C;
  wire C_IBUF;
  wire clk;
  wire clk_IBUF;
  wire clk_IBUF_BUFG;
  wire [7:0]cnt_reg;
  wire \cnt_reg[1]_i_1_n_0 ;
  wire \cnt_reg[6]_i_2_n_0 ;
  wire \cnt_reg[7]_i_1_n_0 ;
  wire \cnt_reg[7]_i_3_n_0 ;
  wire \cnt_reg[7]_i_4_n_0 ;
  wire [7:0]cnt_reg_OBUF;
  wire [7:0]p_0_in;
  wire reset_n;
  wire reset_n_IBUF;

initial begin
 $sdf_annotate("counter_tb_time_synth.sdf",,,,"tool_control");
end
  IBUF A_IBUF_inst
       (.I(A),
        .O(A_IBUF));
  IBUF B_IBUF_inst
       (.I(B),
        .O(B_IBUF));
  IBUF C_IBUF_inst
       (.I(C),
        .O(C_IBUF));
  BUFG clk_IBUF_BUFG_inst
       (.I(clk_IBUF),
        .O(clk_IBUF_BUFG));
  IBUF clk_IBUF_inst
       (.I(clk),
        .O(clk_IBUF));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_reg[0]_i_1 
       (.I0(cnt_reg_OBUF[0]),
        .O(p_0_in[0]));
  (* SOFT_HLUTNM = "soft_lutpair2" *) 
  LUT2 #(
    .INIT(4'h6)) 
    \cnt_reg[1]_i_1 
       (.I0(cnt_reg_OBUF[1]),
        .I1(cnt_reg_OBUF[0]),
        .O(\cnt_reg[1]_i_1_n_0 ));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT3 #(
    .INIT(8'h78)) 
    \cnt_reg[2]_i_1 
       (.I0(cnt_reg_OBUF[1]),
        .I1(cnt_reg_OBUF[0]),
        .I2(cnt_reg_OBUF[2]),
        .O(p_0_in[2]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT4 #(
    .INIT(16'h7F80)) 
    \cnt_reg[3]_i_1 
       (.I0(cnt_reg_OBUF[2]),
        .I1(cnt_reg_OBUF[0]),
        .I2(cnt_reg_OBUF[1]),
        .I3(cnt_reg_OBUF[3]),
        .O(p_0_in[3]));
  (* SOFT_HLUTNM = "soft_lutpair0" *) 
  LUT5 #(
    .INIT(32'h7FFF8000)) 
    \cnt_reg[4]_i_1 
       (.I0(cnt_reg_OBUF[3]),
        .I1(cnt_reg_OBUF[1]),
        .I2(cnt_reg_OBUF[0]),
        .I3(cnt_reg_OBUF[2]),
        .I4(cnt_reg_OBUF[4]),
        .O(p_0_in[4]));
  LUT6 #(
    .INIT(64'h7FFFFFFF80000000)) 
    \cnt_reg[5]_i_1 
       (.I0(cnt_reg_OBUF[4]),
        .I1(cnt_reg_OBUF[2]),
        .I2(cnt_reg_OBUF[0]),
        .I3(cnt_reg_OBUF[1]),
        .I4(cnt_reg_OBUF[3]),
        .I5(cnt_reg_OBUF[5]),
        .O(p_0_in[5]));
  LUT6 #(
    .INIT(64'hF7FFFFFF08000000)) 
    \cnt_reg[6]_i_1 
       (.I0(cnt_reg_OBUF[5]),
        .I1(cnt_reg_OBUF[3]),
        .I2(\cnt_reg[6]_i_2_n_0 ),
        .I3(cnt_reg_OBUF[2]),
        .I4(cnt_reg_OBUF[4]),
        .I5(cnt_reg_OBUF[6]),
        .O(p_0_in[6]));
  (* SOFT_HLUTNM = "soft_lutpair1" *) 
  LUT2 #(
    .INIT(4'h7)) 
    \cnt_reg[6]_i_2 
       (.I0(cnt_reg_OBUF[0]),
        .I1(cnt_reg_OBUF[1]),
        .O(\cnt_reg[6]_i_2_n_0 ));
  LUT6 #(
    .INIT(64'h80FF808080808080)) 
    \cnt_reg[7]_i_1 
       (.I0(A_IBUF),
        .I1(C_IBUF),
        .I2(B_IBUF),
        .I3(\cnt_reg[7]_i_4_n_0 ),
        .I4(cnt_reg_OBUF[6]),
        .I5(cnt_reg_OBUF[7]),
        .O(\cnt_reg[7]_i_1_n_0 ));
  LUT3 #(
    .INIT(8'hD2)) 
    \cnt_reg[7]_i_2 
       (.I0(cnt_reg_OBUF[6]),
        .I1(\cnt_reg[7]_i_4_n_0 ),
        .I2(cnt_reg_OBUF[7]),
        .O(p_0_in[7]));
  LUT1 #(
    .INIT(2'h1)) 
    \cnt_reg[7]_i_3 
       (.I0(reset_n_IBUF),
        .O(\cnt_reg[7]_i_3_n_0 ));
  LUT6 #(
    .INIT(64'h7FFFFFFFFFFFFFFF)) 
    \cnt_reg[7]_i_4 
       (.I0(cnt_reg_OBUF[4]),
        .I1(cnt_reg_OBUF[2]),
        .I2(cnt_reg_OBUF[0]),
        .I3(cnt_reg_OBUF[1]),
        .I4(cnt_reg_OBUF[3]),
        .I5(cnt_reg_OBUF[5]),
        .O(\cnt_reg[7]_i_4_n_0 ));
  OBUF \cnt_reg_OBUF[0]_inst 
       (.I(cnt_reg_OBUF[0]),
        .O(cnt_reg[0]));
  OBUF \cnt_reg_OBUF[1]_inst 
       (.I(cnt_reg_OBUF[1]),
        .O(cnt_reg[1]));
  OBUF \cnt_reg_OBUF[2]_inst 
       (.I(cnt_reg_OBUF[2]),
        .O(cnt_reg[2]));
  OBUF \cnt_reg_OBUF[3]_inst 
       (.I(cnt_reg_OBUF[3]),
        .O(cnt_reg[3]));
  OBUF \cnt_reg_OBUF[4]_inst 
       (.I(cnt_reg_OBUF[4]),
        .O(cnt_reg[4]));
  OBUF \cnt_reg_OBUF[5]_inst 
       (.I(cnt_reg_OBUF[5]),
        .O(cnt_reg[5]));
  OBUF \cnt_reg_OBUF[6]_inst 
       (.I(cnt_reg_OBUF[6]),
        .O(cnt_reg[6]));
  OBUF \cnt_reg_OBUF[7]_inst 
       (.I(cnt_reg_OBUF[7]),
        .O(cnt_reg[7]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg_reg[0] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt_reg[7]_i_1_n_0 ),
        .CLR(\cnt_reg[7]_i_3_n_0 ),
        .D(p_0_in[0]),
        .Q(cnt_reg_OBUF[0]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg_reg[1] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt_reg[7]_i_1_n_0 ),
        .CLR(\cnt_reg[7]_i_3_n_0 ),
        .D(\cnt_reg[1]_i_1_n_0 ),
        .Q(cnt_reg_OBUF[1]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg_reg[2] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt_reg[7]_i_1_n_0 ),
        .CLR(\cnt_reg[7]_i_3_n_0 ),
        .D(p_0_in[2]),
        .Q(cnt_reg_OBUF[2]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg_reg[3] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt_reg[7]_i_1_n_0 ),
        .CLR(\cnt_reg[7]_i_3_n_0 ),
        .D(p_0_in[3]),
        .Q(cnt_reg_OBUF[3]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg_reg[4] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt_reg[7]_i_1_n_0 ),
        .CLR(\cnt_reg[7]_i_3_n_0 ),
        .D(p_0_in[4]),
        .Q(cnt_reg_OBUF[4]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg_reg[5] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt_reg[7]_i_1_n_0 ),
        .CLR(\cnt_reg[7]_i_3_n_0 ),
        .D(p_0_in[5]),
        .Q(cnt_reg_OBUF[5]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg_reg[6] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt_reg[7]_i_1_n_0 ),
        .CLR(\cnt_reg[7]_i_3_n_0 ),
        .D(p_0_in[6]),
        .Q(cnt_reg_OBUF[6]));
  FDCE #(
    .INIT(1'b0)) 
    \cnt_reg_reg[7] 
       (.C(clk_IBUF_BUFG),
        .CE(\cnt_reg[7]_i_1_n_0 ),
        .CLR(\cnt_reg[7]_i_3_n_0 ),
        .D(p_0_in[7]),
        .Q(cnt_reg_OBUF[7]));
  IBUF reset_n_IBUF_inst
       (.I(reset_n),
        .O(reset_n_IBUF));
endmodule
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;
    parameter GRES_WIDTH = 10000;
    parameter GRES_START = 10000;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    wire GRESTORE;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;
    reg GRESTORE_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;
    assign (strong1, weak0) GRESTORE = GRESTORE_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

    initial begin 
	GRESTORE_int = 1'b0;
	#(GRES_START);
	GRESTORE_int = 1'b1;
	#(GRES_WIDTH);
	GRESTORE_int = 1'b0;
    end

endmodule
`endif
