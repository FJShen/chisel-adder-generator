module CLA(
  input   io_c_in,
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
  assign io_pg = io_cpg_0_p & io_cpg_1_p & io_cpg_2_p; // @[CLA.scala 17:51]
  assign io_gg = (io_cpg_0_g & io_cpg_1_p | io_cpg_1_g) & io_cpg_2_p | io_cpg_2_g; // @[CLA.scala 23:15]
  assign io_cpg_0_carry = io_c_in; // @[CLA.scala 28:19]
  assign io_cpg_1_carry = io_cpg_0_carry & io_cpg_0_p | io_cpg_0_g; // @[CLA.scala 30:66]
  assign io_cpg_2_carry = io_cpg_1_carry & io_cpg_1_p | io_cpg_1_g; // @[CLA.scala 30:66]
endmodule
module FullAdder(
  input   io_a,
  input   io_b,
  output  io_s,
  input   io_cpg_carry,
  output  io_cpg_p,
  output  io_cpg_g
);
  assign io_s = io_a ^ io_b ^ io_cpg_carry; // @[FullAdder.scala 30:23]
  assign io_cpg_p = io_a | io_b; // @[FullAdder.scala 31:13]
  assign io_cpg_g = io_a & io_b; // @[FullAdder.scala 32:13]
endmodule
module CLAAdder(
  input   io_a,
  input   io_b,
  output  io_s,
  input   io_cpg_carry,
  output  io_cpg_p,
  output  io_cpg_g
);
  wire  fa_inst_io_a; // @[CLAAdder.scala 14:27]
  wire  fa_inst_io_b; // @[CLAAdder.scala 14:27]
  wire  fa_inst_io_s; // @[CLAAdder.scala 14:27]
  wire  fa_inst_io_cpg_carry; // @[CLAAdder.scala 14:27]
  wire  fa_inst_io_cpg_p; // @[CLAAdder.scala 14:27]
  wire  fa_inst_io_cpg_g; // @[CLAAdder.scala 14:27]
  FullAdder fa_inst ( // @[CLAAdder.scala 14:27]
    .io_a(fa_inst_io_a),
    .io_b(fa_inst_io_b),
    .io_s(fa_inst_io_s),
    .io_cpg_carry(fa_inst_io_cpg_carry),
    .io_cpg_p(fa_inst_io_cpg_p),
    .io_cpg_g(fa_inst_io_cpg_g)
  );
  assign io_s = fa_inst_io_s; // @[CLAAdder.scala 18:20]
  assign io_cpg_p = fa_inst_io_cpg_p; // @[CLAAdder.scala 19:22]
  assign io_cpg_g = fa_inst_io_cpg_g; // @[CLAAdder.scala 19:22]
  assign fa_inst_io_a = io_a; // @[CLAAdder.scala 15:20]
  assign fa_inst_io_b = io_b; // @[CLAAdder.scala 16:20]
  assign fa_inst_io_cpg_carry = io_cpg_carry; // @[CLAAdder.scala 19:22]
endmodule
module CLAAdder_3(
  input        clock,
  input        reset,
  input  [2:0] io_a,
  input  [2:0] io_b,
  output [2:0] io_s,
  input        io_cpg_carry,
  output       io_cpg_p,
  output       io_cpg_g
);
  wire  cla_inst_io_c_in; // @[CLAAdder.scala 22:28]
  wire  cla_inst_io_pg; // @[CLAAdder.scala 22:28]
  wire  cla_inst_io_gg; // @[CLAAdder.scala 22:28]
  wire  cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 22:28]
  wire  cla_inst_io_cpg_0_p; // @[CLAAdder.scala 22:28]
  wire  cla_inst_io_cpg_0_g; // @[CLAAdder.scala 22:28]
  wire  cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 22:28]
  wire  cla_inst_io_cpg_1_p; // @[CLAAdder.scala 22:28]
  wire  cla_inst_io_cpg_1_g; // @[CLAAdder.scala 22:28]
  wire  cla_inst_io_cpg_2_carry; // @[CLAAdder.scala 22:28]
  wire  cla_inst_io_cpg_2_p; // @[CLAAdder.scala 22:28]
  wire  cla_inst_io_cpg_2_g; // @[CLAAdder.scala 22:28]
  wire  adder_inst_0_io_a; // @[CLAAdder.scala 23:49]
  wire  adder_inst_0_io_b; // @[CLAAdder.scala 23:49]
  wire  adder_inst_0_io_s; // @[CLAAdder.scala 23:49]
  wire  adder_inst_0_io_cpg_carry; // @[CLAAdder.scala 23:49]
  wire  adder_inst_0_io_cpg_p; // @[CLAAdder.scala 23:49]
  wire  adder_inst_0_io_cpg_g; // @[CLAAdder.scala 23:49]
  wire  adder_inst_1_io_a; // @[CLAAdder.scala 23:49]
  wire  adder_inst_1_io_b; // @[CLAAdder.scala 23:49]
  wire  adder_inst_1_io_s; // @[CLAAdder.scala 23:49]
  wire  adder_inst_1_io_cpg_carry; // @[CLAAdder.scala 23:49]
  wire  adder_inst_1_io_cpg_p; // @[CLAAdder.scala 23:49]
  wire  adder_inst_1_io_cpg_g; // @[CLAAdder.scala 23:49]
  wire  adder_inst_2_io_a; // @[CLAAdder.scala 23:49]
  wire  adder_inst_2_io_b; // @[CLAAdder.scala 23:49]
  wire  adder_inst_2_io_s; // @[CLAAdder.scala 23:49]
  wire  adder_inst_2_io_cpg_carry; // @[CLAAdder.scala 23:49]
  wire  adder_inst_2_io_cpg_p; // @[CLAAdder.scala 23:49]
  wire  adder_inst_2_io_cpg_g; // @[CLAAdder.scala 23:49]
  wire  sum_vec_2 = adder_inst_2_io_s; // @[CLAAdder.scala 28:25 CLAAdder.scala 30:22]
  wire  sum_vec_1 = adder_inst_1_io_s; // @[CLAAdder.scala 28:25 CLAAdder.scala 30:22]
  wire [1:0] io_s_hi = {sum_vec_2,sum_vec_1}; // @[CLAAdder.scala 34:29]
  wire  sum_vec_0 = adder_inst_0_io_s; // @[CLAAdder.scala 28:25 CLAAdder.scala 30:22]
  CLA cla_inst ( // @[CLAAdder.scala 22:28]
    .io_c_in(cla_inst_io_c_in),
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
  CLAAdder adder_inst_0 ( // @[CLAAdder.scala 23:49]
    .io_a(adder_inst_0_io_a),
    .io_b(adder_inst_0_io_b),
    .io_s(adder_inst_0_io_s),
    .io_cpg_carry(adder_inst_0_io_cpg_carry),
    .io_cpg_p(adder_inst_0_io_cpg_p),
    .io_cpg_g(adder_inst_0_io_cpg_g)
  );
  CLAAdder adder_inst_1 ( // @[CLAAdder.scala 23:49]
    .io_a(adder_inst_1_io_a),
    .io_b(adder_inst_1_io_b),
    .io_s(adder_inst_1_io_s),
    .io_cpg_carry(adder_inst_1_io_cpg_carry),
    .io_cpg_p(adder_inst_1_io_cpg_p),
    .io_cpg_g(adder_inst_1_io_cpg_g)
  );
  CLAAdder adder_inst_2 ( // @[CLAAdder.scala 23:49]
    .io_a(adder_inst_2_io_a),
    .io_b(adder_inst_2_io_b),
    .io_s(adder_inst_2_io_s),
    .io_cpg_carry(adder_inst_2_io_cpg_carry),
    .io_cpg_p(adder_inst_2_io_cpg_p),
    .io_cpg_g(adder_inst_2_io_cpg_g)
  );
  assign io_s = {io_s_hi,sum_vec_0}; // @[CLAAdder.scala 34:29]
  assign io_cpg_p = cla_inst_io_pg; // @[CLAAdder.scala 35:16]
  assign io_cpg_g = cla_inst_io_gg; // @[CLAAdder.scala 36:16]
  assign cla_inst_io_c_in = io_cpg_carry; // @[CLAAdder.scala 26:24]
  assign cla_inst_io_cpg_0_p = adder_inst_0_io_cpg_p; // @[CLAAdder.scala 40:32]
  assign cla_inst_io_cpg_0_g = adder_inst_0_io_cpg_g; // @[CLAAdder.scala 40:32]
  assign cla_inst_io_cpg_1_p = adder_inst_1_io_cpg_p; // @[CLAAdder.scala 40:32]
  assign cla_inst_io_cpg_1_g = adder_inst_1_io_cpg_g; // @[CLAAdder.scala 40:32]
  assign cla_inst_io_cpg_2_p = adder_inst_2_io_cpg_p; // @[CLAAdder.scala 40:32]
  assign cla_inst_io_cpg_2_g = adder_inst_2_io_cpg_g; // @[CLAAdder.scala 40:32]
  assign adder_inst_0_io_a = io_a[0]; // @[CLAAdder.scala 31:37]
  assign adder_inst_0_io_b = io_b[0]; // @[CLAAdder.scala 32:37]
  assign adder_inst_0_io_cpg_carry = cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 40:32]
  assign adder_inst_1_io_a = io_a[1]; // @[CLAAdder.scala 31:37]
  assign adder_inst_1_io_b = io_b[1]; // @[CLAAdder.scala 32:37]
  assign adder_inst_1_io_cpg_carry = cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 40:32]
  assign adder_inst_2_io_a = io_a[2]; // @[CLAAdder.scala 31:37]
  assign adder_inst_2_io_b = io_b[2]; // @[CLAAdder.scala 32:37]
  assign adder_inst_2_io_cpg_carry = cla_inst_io_cpg_2_carry; // @[CLAAdder.scala 40:32]
endmodule
