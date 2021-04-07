module CLA(
  input   io_c_in,
  output  io_c_out,
  output  io_pg,
  output  io_gg,
  output  io_cpg_0_carry,
  input   io_cpg_0_p,
  input   io_cpg_0_g,
  output  io_cpg_1_carry,
  input   io_cpg_1_p,
  input   io_cpg_1_g,
  output  io_cpg_2_carry,
  input   io_cpg_2_p,
  input   io_cpg_2_g
);
  assign io_c_out = io_c_in & io_pg | io_gg; // @[CLA.scala 28:33]
  assign io_pg = io_cpg_0_p & io_cpg_1_p & io_cpg_2_p; // @[CLA.scala 19:47]
  assign io_gg = (io_cpg_0_g & io_cpg_1_p | io_cpg_1_g) & io_cpg_2_p | io_cpg_2_g; // @[CLA.scala 25:15]
  assign io_cpg_0_carry = io_c_in; // @[CLA.scala 30:19]
  assign io_cpg_1_carry = io_cpg_0_carry & io_cpg_0_p | io_cpg_0_g; // @[CLA.scala 32:66]
  assign io_cpg_2_carry = io_cpg_1_carry & io_cpg_1_p | io_cpg_1_g; // @[CLA.scala 32:66]
endmodule
module FullAdder(
  input   io_a,
  input   io_b,
  output  io_s,
  input   io_cpg_carry,
  output  io_cpg_p,
  output  io_cpg_g
);
  assign io_s = io_a ^ io_b ^ io_cpg_carry; // @[FullAdder.scala 33:23]
  assign io_cpg_p = io_a | io_b; // @[FullAdder.scala 34:13]
  assign io_cpg_g = io_a & io_b; // @[FullAdder.scala 35:13]
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
  wire  cla_inst_io_c_in; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_c_out; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_pg; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_gg; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_cpg_0_carry; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_cpg_0_p; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_cpg_0_g; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_cpg_1_carry; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_cpg_1_p; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_cpg_1_g; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_cpg_2_carry; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_cpg_2_p; // @[SimpleAdder.scala 18:26]
  wire  cla_inst_io_cpg_2_g; // @[SimpleAdder.scala 18:26]
  wire  adder_inst_0_io_a; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_0_io_b; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_0_io_s; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_0_io_cpg_carry; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_0_io_cpg_p; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_0_io_cpg_g; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_1_io_a; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_1_io_b; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_1_io_s; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_1_io_cpg_carry; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_1_io_cpg_p; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_1_io_cpg_g; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_2_io_a; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_2_io_b; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_2_io_s; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_2_io_cpg_carry; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_2_io_cpg_p; // @[SimpleAdder.scala 19:41]
  wire  adder_inst_2_io_cpg_g; // @[SimpleAdder.scala 19:41]
  wire  s_vec_2 = adder_inst_2_io_s; // @[SimpleAdder.scala 22:21 SimpleAdder.scala 26:20]
  wire  s_vec_1 = adder_inst_1_io_s; // @[SimpleAdder.scala 22:21 SimpleAdder.scala 26:20]
  wire [1:0] io_s_hi = {s_vec_2,s_vec_1}; // @[SimpleAdder.scala 28:25]
  wire  s_vec_0 = adder_inst_0_io_s; // @[SimpleAdder.scala 22:21 SimpleAdder.scala 26:20]
  CLA cla_inst ( // @[SimpleAdder.scala 18:26]
    .io_c_in(cla_inst_io_c_in),
    .io_c_out(cla_inst_io_c_out),
    .io_pg(cla_inst_io_pg),
    .io_gg(cla_inst_io_gg),
    .io_cpg_0_carry(cla_inst_io_cpg_0_carry),
    .io_cpg_0_p(cla_inst_io_cpg_0_p),
    .io_cpg_0_g(cla_inst_io_cpg_0_g),
    .io_cpg_1_carry(cla_inst_io_cpg_1_carry),
    .io_cpg_1_p(cla_inst_io_cpg_1_p),
    .io_cpg_1_g(cla_inst_io_cpg_1_g),
    .io_cpg_2_carry(cla_inst_io_cpg_2_carry),
    .io_cpg_2_p(cla_inst_io_cpg_2_p),
    .io_cpg_2_g(cla_inst_io_cpg_2_g)
  );
  FullAdder adder_inst_0 ( // @[SimpleAdder.scala 19:41]
    .io_a(adder_inst_0_io_a),
    .io_b(adder_inst_0_io_b),
    .io_s(adder_inst_0_io_s),
    .io_cpg_carry(adder_inst_0_io_cpg_carry),
    .io_cpg_p(adder_inst_0_io_cpg_p),
    .io_cpg_g(adder_inst_0_io_cpg_g)
  );
  FullAdder adder_inst_1 ( // @[SimpleAdder.scala 19:41]
    .io_a(adder_inst_1_io_a),
    .io_b(adder_inst_1_io_b),
    .io_s(adder_inst_1_io_s),
    .io_cpg_carry(adder_inst_1_io_cpg_carry),
    .io_cpg_p(adder_inst_1_io_cpg_p),
    .io_cpg_g(adder_inst_1_io_cpg_g)
  );
  FullAdder adder_inst_2 ( // @[SimpleAdder.scala 19:41]
    .io_a(adder_inst_2_io_a),
    .io_b(adder_inst_2_io_b),
    .io_s(adder_inst_2_io_s),
    .io_cpg_carry(adder_inst_2_io_cpg_carry),
    .io_cpg_p(adder_inst_2_io_cpg_p),
    .io_cpg_g(adder_inst_2_io_cpg_g)
  );
  assign io_s = {io_s_hi,s_vec_0}; // @[SimpleAdder.scala 28:25]
  assign io_c_out = cla_inst_io_c_out; // @[SimpleAdder.scala 34:14]
  assign io_pg = cla_inst_io_pg; // @[SimpleAdder.scala 36:11]
  assign io_gg = cla_inst_io_gg; // @[SimpleAdder.scala 37:11]
  assign cla_inst_io_c_in = io_c_in; // @[SimpleAdder.scala 33:22]
  assign cla_inst_io_cpg_0_p = adder_inst_0_io_cpg_p; // @[SimpleAdder.scala 31:32]
  assign cla_inst_io_cpg_0_g = adder_inst_0_io_cpg_g; // @[SimpleAdder.scala 31:32]
  assign cla_inst_io_cpg_1_p = adder_inst_1_io_cpg_p; // @[SimpleAdder.scala 31:32]
  assign cla_inst_io_cpg_1_g = adder_inst_1_io_cpg_g; // @[SimpleAdder.scala 31:32]
  assign cla_inst_io_cpg_2_p = adder_inst_2_io_cpg_p; // @[SimpleAdder.scala 31:32]
  assign cla_inst_io_cpg_2_g = adder_inst_2_io_cpg_g; // @[SimpleAdder.scala 31:32]
  assign adder_inst_0_io_a = io_a[0]; // @[SimpleAdder.scala 24:37]
  assign adder_inst_0_io_b = io_b[0]; // @[SimpleAdder.scala 25:37]
  assign adder_inst_0_io_cpg_carry = cla_inst_io_cpg_0_carry; // @[SimpleAdder.scala 31:32]
  assign adder_inst_1_io_a = io_a[1]; // @[SimpleAdder.scala 24:37]
  assign adder_inst_1_io_b = io_b[1]; // @[SimpleAdder.scala 25:37]
  assign adder_inst_1_io_cpg_carry = cla_inst_io_cpg_1_carry; // @[SimpleAdder.scala 31:32]
  assign adder_inst_2_io_a = io_a[2]; // @[SimpleAdder.scala 24:37]
  assign adder_inst_2_io_b = io_b[2]; // @[SimpleAdder.scala 25:37]
  assign adder_inst_2_io_cpg_carry = cla_inst_io_cpg_2_carry; // @[SimpleAdder.scala 31:32]
endmodule
