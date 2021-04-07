module CLA(
  input   clock,
  input   reset,
  input   io_c_in,
  input   io_p_0,
  input   io_p_1,
  input   io_p_2,
  input   io_g_0,
  input   io_g_1,
  input   io_g_2,
  output  io_c_out_0,
  output  io_c_out_1,
  output  io_c_out_2,
  output  io_pg,
  output  io_gg
);
  assign io_c_out_0 = io_c_in & io_p_0 | io_g_0; // @[CLA.scala 23:38]
  assign io_c_out_1 = io_c_out_0 & io_p_1 | io_g_1; // @[CLA.scala 25:52]
  assign io_c_out_2 = io_c_out_1 & io_p_2 | io_g_2; // @[CLA.scala 25:52]
  assign io_pg = io_p_0 & io_p_1 & io_p_2; // @[CLA.scala 17:26]
  assign io_gg = (io_g_0 & io_p_1 | io_g_1) & io_p_2 | io_g_2; // @[CLA.scala 20:16]
  always @(posedge clock) begin
    `ifndef SYNTHESIS
    `ifdef PRINTF_COND
      if (`PRINTF_COND) begin
    `endif
        if (~reset) begin
          $fwrite(32'h80000002,"pg=%d, gg=%d, c_out=Vec(%d, %d, %d)",io_pg,io_gg,io_c_out_0,io_c_out_1,io_c_out_2); // @[CLA.scala 28:9]
        end
    `ifdef PRINTF_COND
      end
    `endif
    `endif // SYNTHESIS
  end
endmodule
module FullAdder(
  input   io_a,
  input   io_b,
  input   io_c,
  output  io_s,
  output  io_p,
  output  io_g
);
  assign io_s = io_a ^ io_b ^ io_c; // @[FullAdder.scala 27:23]
  assign io_p = io_a | io_b; // @[FullAdder.scala 28:16]
  assign io_g = io_a & io_b; // @[FullAdder.scala 29:16]
endmodule
module SimpleAdder(
  input        clock,
  input        reset,
  input  [2:0] io_a,
  input  [2:0] io_b,
  input        io_c_in,
  output [2:0] io_s,
  output       io_c_out,
  output       io_pg,
  output       io_gg
);
  wire  cla_inst_clock; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_reset; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_c_in; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_p_0; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_p_1; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_p_2; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_g_0; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_g_1; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_g_2; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_c_out_0; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_c_out_1; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_c_out_2; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_pg; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_gg; // @[SimpleAdder.scala 18:26]
  wire  adder_inst_0_io_a; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_0_io_b; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_0_io_c; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_0_io_s; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_0_io_p; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_0_io_g; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_1_io_a; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_1_io_b; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_1_io_c; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_1_io_s; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_1_io_p; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_1_io_g; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_2_io_a; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_2_io_b; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_2_io_c; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_2_io_s; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_2_io_p; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_2_io_g; // @[SimpleAdder.scala 19:41]
  wire  s_vec_2 = adder_inst_2_io_s; // @[SimpleAdder.scala 22:21 SimpleAdder.scala 26:20]
  wire  s_vec_1 = adder_inst_1_io_s; // @[SimpleAdder.scala 22:21 SimpleAdder.scala 26:20]
  wire [1:0] io_s_hi = {s_vec_2,s_vec_1}; // @[SimpleAdder.scala 28:25]
  wire  s_vec_0 = adder_inst_0_io_s; // @[SimpleAdder.scala 22:21 SimpleAdder.scala 26:20]
  CLA cla_inst ( // @[SimpleAdder.scala 18:26]
    .clock(cla_inst_clock),
    .reset(cla_inst_reset),
    .io_c_in(cla_inst_io_c_in),
    .io_p_0(cla_inst_io_p_0),
    .io_p_1(cla_inst_io_p_1),
    .io_p_2(cla_inst_io_p_2),
    .io_g_0(cla_inst_io_g_0),
    .io_g_1(cla_inst_io_g_1),
    .io_g_2(cla_inst_io_g_2),
    .io_c_out_0(cla_inst_io_c_out_0),
    .io_c_out_1(cla_inst_io_c_out_1),
    .io_c_out_2(cla_inst_io_c_out_2),
    .io_pg(cla_inst_io_pg),
    .io_gg(cla_inst_io_gg)
  );
  FullAdder adder_inst_0 ( // @[SimpleAdder.scala 19:41]
    .io_a(adder_inst_0_io_a),
    .io_b(adder_inst_0_io_b),
    .io_c(adder_inst_0_io_c),
    .io_s(adder_inst_0_io_s),
    .io_p(adder_inst_0_io_p),
    .io_g(adder_inst_0_io_g)
  );
  FullAdder adder_inst_1 ( // @[SimpleAdder.scala 19:41]
    .io_a(adder_inst_1_io_a),
    .io_b(adder_inst_1_io_b),
    .io_c(adder_inst_1_io_c),
    .io_s(adder_inst_1_io_s),
    .io_p(adder_inst_1_io_p),
    .io_g(adder_inst_1_io_g)
  );
  FullAdder adder_inst_2 ( // @[SimpleAdder.scala 19:41]
    .io_a(adder_inst_2_io_a),
    .io_b(adder_inst_2_io_b),
    .io_c(adder_inst_2_io_c),
    .io_s(adder_inst_2_io_s),
    .io_p(adder_inst_2_io_p),
    .io_g(adder_inst_2_io_g)
  );
  assign io_s = {io_s_hi,s_vec_0}; // @[SimpleAdder.scala 28:25]
  assign io_c_out = cla_inst_io_c_out_2; // @[SimpleAdder.scala 30:21 SimpleAdder.scala 33:20]
  assign io_pg = cla_inst_io_pg; // @[SimpleAdder.scala 49:11]
  assign io_gg = cla_inst_io_gg; // @[SimpleAdder.scala 50:11]
  assign cla_inst_clock = clock;
  assign cla_inst_reset = reset;
  assign cla_inst_io_c_in = io_c_in; // @[SimpleAdder.scala 30:21 SimpleAdder.scala 31:14]
  assign cla_inst_io_p_0 = adder_inst_0_io_p; // @[SimpleAdder.scala 44:28]
  assign cla_inst_io_p_1 = adder_inst_1_io_p; // @[SimpleAdder.scala 44:28]
  assign cla_inst_io_p_2 = adder_inst_2_io_p; // @[SimpleAdder.scala 44:28]
  assign cla_inst_io_g_0 = adder_inst_0_io_g; // @[SimpleAdder.scala 45:28]
  assign cla_inst_io_g_1 = adder_inst_1_io_g; // @[SimpleAdder.scala 45:28]
  assign cla_inst_io_g_2 = adder_inst_2_io_g; // @[SimpleAdder.scala 45:28]
  assign adder_inst_0_io_a = io_a[0]; // @[SimpleAdder.scala 24:37]
  assign adder_inst_0_io_b = io_b[0]; // @[SimpleAdder.scala 25:37]
  assign adder_inst_0_io_c = io_c_in; // @[SimpleAdder.scala 30:21 SimpleAdder.scala 31:14]
  assign adder_inst_1_io_a = io_a[1]; // @[SimpleAdder.scala 24:37]
  assign adder_inst_1_io_b = io_b[1]; // @[SimpleAdder.scala 25:37]
  assign adder_inst_1_io_c = cla_inst_io_c_out_0; // @[SimpleAdder.scala 30:21 SimpleAdder.scala 33:20]
  assign adder_inst_2_io_a = io_a[2]; // @[SimpleAdder.scala 24:37]
  assign adder_inst_2_io_b = io_b[2]; // @[SimpleAdder.scala 25:37]
  assign adder_inst_2_io_c = cla_inst_io_c_out_1; // @[SimpleAdder.scala 30:21 SimpleAdder.scala 33:20]
endmodule
