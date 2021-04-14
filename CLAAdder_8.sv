module CLA(
  input   io_c_in,
  output  io_pg,
  output  io_gg,
  output  io_cpg_0_carry,
  input   io_cpg_0_p,
  input   io_cpg_0_g,
  output  io_cpg_1_carry,
  input   io_cpg_1_p,
  input   io_cpg_1_g
);
  assign io_pg = io_cpg_0_p & io_cpg_1_p; // @[CLA.scala 17:51]
  assign io_gg = io_cpg_0_g & io_cpg_1_p | io_cpg_1_g; // @[CLA.scala 23:15]
  assign io_cpg_0_carry = io_c_in; // @[CLA.scala 28:19]
  assign io_cpg_1_carry = io_cpg_0_carry & io_cpg_0_p | io_cpg_0_g; // @[CLA.scala 30:66]
endmodule
module CLA_1(
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
  input   io_cpg_2_g,
  output  io_cpg_3_carry,
  input   io_cpg_3_p,
  input   io_cpg_3_g
);
  assign io_pg = io_cpg_0_p & io_cpg_1_p & io_cpg_2_p & io_cpg_3_p; // @[CLA.scala 17:51]
  assign io_gg = ((io_cpg_0_g & io_cpg_1_p | io_cpg_1_g) & io_cpg_2_p | io_cpg_2_g) & io_cpg_3_p | io_cpg_3_g; // @[CLA.scala 23:15]
  assign io_cpg_0_carry = io_c_in; // @[CLA.scala 28:19]
  assign io_cpg_1_carry = io_cpg_0_carry & io_cpg_0_p | io_cpg_0_g; // @[CLA.scala 30:66]
  assign io_cpg_2_carry = io_cpg_1_carry & io_cpg_1_p | io_cpg_1_g; // @[CLA.scala 30:66]
  assign io_cpg_3_carry = io_cpg_2_carry & io_cpg_2_p | io_cpg_2_g; // @[CLA.scala 30:66]
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
  wire  fa_inst_io_a; // @[CLAAdder.scala 21:27]
  wire  fa_inst_io_b; // @[CLAAdder.scala 21:27]
  wire  fa_inst_io_s; // @[CLAAdder.scala 21:27]
  wire  fa_inst_io_cpg_carry; // @[CLAAdder.scala 21:27]
  wire  fa_inst_io_cpg_p; // @[CLAAdder.scala 21:27]
  wire  fa_inst_io_cpg_g; // @[CLAAdder.scala 21:27]
  FullAdder fa_inst ( // @[CLAAdder.scala 21:27]
    .io_a(fa_inst_io_a),
    .io_b(fa_inst_io_b),
    .io_s(fa_inst_io_s),
    .io_cpg_carry(fa_inst_io_cpg_carry),
    .io_cpg_p(fa_inst_io_cpg_p),
    .io_cpg_g(fa_inst_io_cpg_g)
  );
  assign io_s = fa_inst_io_s; // @[CLAAdder.scala 24:20]
  assign io_cpg_p = fa_inst_io_cpg_p; // @[CLAAdder.scala 25:22]
  assign io_cpg_g = fa_inst_io_cpg_g; // @[CLAAdder.scala 25:22]
  assign fa_inst_io_a = io_a; // @[CLAAdder.scala 22:20]
  assign fa_inst_io_b = io_b; // @[CLAAdder.scala 23:20]
  assign fa_inst_io_cpg_carry = io_cpg_carry; // @[CLAAdder.scala 25:22]
endmodule
module CLAAdder_4(
  input  [3:0] io_a,
  input  [3:0] io_b,
  output [3:0] io_s,
  input        io_cpg_carry,
  output       io_cpg_p,
  output       io_cpg_g
);
  wire  cla_inst_io_c_in; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_pg; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_gg; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_0_p; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_0_g; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_1_p; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_1_g; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_2_carry; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_2_p; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_2_g; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_3_carry; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_3_p; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_3_g; // @[CLAAdder.scala 33:28]
  wire  adder_insts_0_io_a; // @[CLAAdder.scala 39:64]
  wire  adder_insts_0_io_b; // @[CLAAdder.scala 39:64]
  wire  adder_insts_0_io_s; // @[CLAAdder.scala 39:64]
  wire  adder_insts_0_io_cpg_carry; // @[CLAAdder.scala 39:64]
  wire  adder_insts_0_io_cpg_p; // @[CLAAdder.scala 39:64]
  wire  adder_insts_0_io_cpg_g; // @[CLAAdder.scala 39:64]
  wire  adder_insts_1_io_a; // @[CLAAdder.scala 39:64]
  wire  adder_insts_1_io_b; // @[CLAAdder.scala 39:64]
  wire  adder_insts_1_io_s; // @[CLAAdder.scala 39:64]
  wire  adder_insts_1_io_cpg_carry; // @[CLAAdder.scala 39:64]
  wire  adder_insts_1_io_cpg_p; // @[CLAAdder.scala 39:64]
  wire  adder_insts_1_io_cpg_g; // @[CLAAdder.scala 39:64]
  wire  adder_insts_2_io_a; // @[CLAAdder.scala 39:64]
  wire  adder_insts_2_io_b; // @[CLAAdder.scala 39:64]
  wire  adder_insts_2_io_s; // @[CLAAdder.scala 39:64]
  wire  adder_insts_2_io_cpg_carry; // @[CLAAdder.scala 39:64]
  wire  adder_insts_2_io_cpg_p; // @[CLAAdder.scala 39:64]
  wire  adder_insts_2_io_cpg_g; // @[CLAAdder.scala 39:64]
  wire  adder_insts_3_io_a; // @[CLAAdder.scala 39:64]
  wire  adder_insts_3_io_b; // @[CLAAdder.scala 39:64]
  wire  adder_insts_3_io_s; // @[CLAAdder.scala 39:64]
  wire  adder_insts_3_io_cpg_carry; // @[CLAAdder.scala 39:64]
  wire  adder_insts_3_io_cpg_p; // @[CLAAdder.scala 39:64]
  wire  adder_insts_3_io_cpg_g; // @[CLAAdder.scala 39:64]
  wire  sum_collector_1 = adder_insts_1_io_s; // @[CLAAdder.scala 41:31 CLAAdder.scala 46:28]
  wire  sum_collector_0 = adder_insts_0_io_s; // @[CLAAdder.scala 41:31 CLAAdder.scala 46:28]
  wire [1:0] io_s_lo = {sum_collector_1,sum_collector_0}; // @[CLAAdder.scala 50:35]
  wire  sum_collector_3 = adder_insts_3_io_s; // @[CLAAdder.scala 41:31 CLAAdder.scala 46:28]
  wire  sum_collector_2 = adder_insts_2_io_s; // @[CLAAdder.scala 41:31 CLAAdder.scala 46:28]
  wire [1:0] io_s_hi = {sum_collector_3,sum_collector_2}; // @[CLAAdder.scala 50:35]
  CLA_1 cla_inst ( // @[CLAAdder.scala 33:28]
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
    .io_cpg_2_g(cla_inst_io_cpg_2_g),
    .io_cpg_3_carry(cla_inst_io_cpg_3_carry),
    .io_cpg_3_p(cla_inst_io_cpg_3_p),
    .io_cpg_3_g(cla_inst_io_cpg_3_g)
  );
  CLAAdder adder_insts_0 ( // @[CLAAdder.scala 39:64]
    .io_a(adder_insts_0_io_a),
    .io_b(adder_insts_0_io_b),
    .io_s(adder_insts_0_io_s),
    .io_cpg_carry(adder_insts_0_io_cpg_carry),
    .io_cpg_p(adder_insts_0_io_cpg_p),
    .io_cpg_g(adder_insts_0_io_cpg_g)
  );
  CLAAdder adder_insts_1 ( // @[CLAAdder.scala 39:64]
    .io_a(adder_insts_1_io_a),
    .io_b(adder_insts_1_io_b),
    .io_s(adder_insts_1_io_s),
    .io_cpg_carry(adder_insts_1_io_cpg_carry),
    .io_cpg_p(adder_insts_1_io_cpg_p),
    .io_cpg_g(adder_insts_1_io_cpg_g)
  );
  CLAAdder adder_insts_2 ( // @[CLAAdder.scala 39:64]
    .io_a(adder_insts_2_io_a),
    .io_b(adder_insts_2_io_b),
    .io_s(adder_insts_2_io_s),
    .io_cpg_carry(adder_insts_2_io_cpg_carry),
    .io_cpg_p(adder_insts_2_io_cpg_p),
    .io_cpg_g(adder_insts_2_io_cpg_g)
  );
  CLAAdder adder_insts_3 ( // @[CLAAdder.scala 39:64]
    .io_a(adder_insts_3_io_a),
    .io_b(adder_insts_3_io_b),
    .io_s(adder_insts_3_io_s),
    .io_cpg_carry(adder_insts_3_io_cpg_carry),
    .io_cpg_p(adder_insts_3_io_cpg_p),
    .io_cpg_g(adder_insts_3_io_cpg_g)
  );
  assign io_s = {io_s_hi,io_s_lo}; // @[CLAAdder.scala 50:35]
  assign io_cpg_p = cla_inst_io_pg; // @[CLAAdder.scala 35:22]
  assign io_cpg_g = cla_inst_io_gg; // @[CLAAdder.scala 36:22]
  assign cla_inst_io_c_in = io_cpg_carry; // @[CLAAdder.scala 34:24]
  assign cla_inst_io_cpg_0_p = adder_insts_0_io_cpg_p; // @[CLAAdder.scala 47:21]
  assign cla_inst_io_cpg_0_g = adder_insts_0_io_cpg_g; // @[CLAAdder.scala 47:21]
  assign cla_inst_io_cpg_1_p = adder_insts_1_io_cpg_p; // @[CLAAdder.scala 47:21]
  assign cla_inst_io_cpg_1_g = adder_insts_1_io_cpg_g; // @[CLAAdder.scala 47:21]
  assign cla_inst_io_cpg_2_p = adder_insts_2_io_cpg_p; // @[CLAAdder.scala 47:21]
  assign cla_inst_io_cpg_2_g = adder_insts_2_io_cpg_g; // @[CLAAdder.scala 47:21]
  assign cla_inst_io_cpg_3_p = adder_insts_3_io_cpg_p; // @[CLAAdder.scala 47:21]
  assign cla_inst_io_cpg_3_g = adder_insts_3_io_cpg_g; // @[CLAAdder.scala 47:21]
  assign adder_insts_0_io_a = io_a[0]; // @[CLAAdder.scala 44:26]
  assign adder_insts_0_io_b = io_b[0]; // @[CLAAdder.scala 45:26]
  assign adder_insts_0_io_cpg_carry = cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 47:21]
  assign adder_insts_1_io_a = io_a[1]; // @[CLAAdder.scala 44:26]
  assign adder_insts_1_io_b = io_b[1]; // @[CLAAdder.scala 45:26]
  assign adder_insts_1_io_cpg_carry = cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 47:21]
  assign adder_insts_2_io_a = io_a[2]; // @[CLAAdder.scala 44:26]
  assign adder_insts_2_io_b = io_b[2]; // @[CLAAdder.scala 45:26]
  assign adder_insts_2_io_cpg_carry = cla_inst_io_cpg_2_carry; // @[CLAAdder.scala 47:21]
  assign adder_insts_3_io_a = io_a[3]; // @[CLAAdder.scala 44:26]
  assign adder_insts_3_io_b = io_b[3]; // @[CLAAdder.scala 45:26]
  assign adder_insts_3_io_cpg_carry = cla_inst_io_cpg_3_carry; // @[CLAAdder.scala 47:21]
endmodule
module CLAAdder_7(
  input  [1:0] io_a,
  input  [1:0] io_b,
  output [1:0] io_s,
  input        io_cpg_carry,
  output       io_cpg_p,
  output       io_cpg_g
);
  wire  cla_inst_io_c_in; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_pg; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_gg; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_0_p; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_0_g; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_1_p; // @[CLAAdder.scala 33:28]
  wire  cla_inst_io_cpg_1_g; // @[CLAAdder.scala 33:28]
  wire  adder_insts_0_io_a; // @[CLAAdder.scala 39:64]
  wire  adder_insts_0_io_b; // @[CLAAdder.scala 39:64]
  wire  adder_insts_0_io_s; // @[CLAAdder.scala 39:64]
  wire  adder_insts_0_io_cpg_carry; // @[CLAAdder.scala 39:64]
  wire  adder_insts_0_io_cpg_p; // @[CLAAdder.scala 39:64]
  wire  adder_insts_0_io_cpg_g; // @[CLAAdder.scala 39:64]
  wire  adder_insts_1_io_a; // @[CLAAdder.scala 39:64]
  wire  adder_insts_1_io_b; // @[CLAAdder.scala 39:64]
  wire  adder_insts_1_io_s; // @[CLAAdder.scala 39:64]
  wire  adder_insts_1_io_cpg_carry; // @[CLAAdder.scala 39:64]
  wire  adder_insts_1_io_cpg_p; // @[CLAAdder.scala 39:64]
  wire  adder_insts_1_io_cpg_g; // @[CLAAdder.scala 39:64]
  wire  sum_collector_1 = adder_insts_1_io_s; // @[CLAAdder.scala 41:31 CLAAdder.scala 46:28]
  wire  sum_collector_0 = adder_insts_0_io_s; // @[CLAAdder.scala 41:31 CLAAdder.scala 46:28]
  CLA cla_inst ( // @[CLAAdder.scala 33:28]
    .io_c_in(cla_inst_io_c_in),
    .io_pg(cla_inst_io_pg),
    .io_gg(cla_inst_io_gg),
    .io_cpg_0_carry(cla_inst_io_cpg_0_carry),
    .io_cpg_0_p(cla_inst_io_cpg_0_p),
    .io_cpg_0_g(cla_inst_io_cpg_0_g),
    .io_cpg_1_carry(cla_inst_io_cpg_1_carry),
    .io_cpg_1_p(cla_inst_io_cpg_1_p),
    .io_cpg_1_g(cla_inst_io_cpg_1_g)
  );
  CLAAdder adder_insts_0 ( // @[CLAAdder.scala 39:64]
    .io_a(adder_insts_0_io_a),
    .io_b(adder_insts_0_io_b),
    .io_s(adder_insts_0_io_s),
    .io_cpg_carry(adder_insts_0_io_cpg_carry),
    .io_cpg_p(adder_insts_0_io_cpg_p),
    .io_cpg_g(adder_insts_0_io_cpg_g)
  );
  CLAAdder adder_insts_1 ( // @[CLAAdder.scala 39:64]
    .io_a(adder_insts_1_io_a),
    .io_b(adder_insts_1_io_b),
    .io_s(adder_insts_1_io_s),
    .io_cpg_carry(adder_insts_1_io_cpg_carry),
    .io_cpg_p(adder_insts_1_io_cpg_p),
    .io_cpg_g(adder_insts_1_io_cpg_g)
  );
  assign io_s = {sum_collector_1,sum_collector_0}; // @[CLAAdder.scala 50:35]
  assign io_cpg_p = cla_inst_io_pg; // @[CLAAdder.scala 35:22]
  assign io_cpg_g = cla_inst_io_gg; // @[CLAAdder.scala 36:22]
  assign cla_inst_io_c_in = io_cpg_carry; // @[CLAAdder.scala 34:24]
  assign cla_inst_io_cpg_0_p = adder_insts_0_io_cpg_p; // @[CLAAdder.scala 47:21]
  assign cla_inst_io_cpg_0_g = adder_insts_0_io_cpg_g; // @[CLAAdder.scala 47:21]
  assign cla_inst_io_cpg_1_p = adder_insts_1_io_cpg_p; // @[CLAAdder.scala 47:21]
  assign cla_inst_io_cpg_1_g = adder_insts_1_io_cpg_g; // @[CLAAdder.scala 47:21]
  assign adder_insts_0_io_a = io_a[0]; // @[CLAAdder.scala 44:26]
  assign adder_insts_0_io_b = io_b[0]; // @[CLAAdder.scala 45:26]
  assign adder_insts_0_io_cpg_carry = cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 47:21]
  assign adder_insts_1_io_a = io_a[1]; // @[CLAAdder.scala 44:26]
  assign adder_insts_1_io_b = io_b[1]; // @[CLAAdder.scala 45:26]
  assign adder_insts_1_io_cpg_carry = cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 47:21]
endmodule
module CLAAdder_8(
  input        clock,
  input        reset,
  input  [5:0] io_a,
  input  [5:0] io_b,
  output [5:0] io_s,
  input        io_cpg_carry,
  output       io_cpg_p,
  output       io_cpg_g
);
  wire  cla_inst_io_c_in; // @[CLAAdder.scala 65:28]
  wire  cla_inst_io_pg; // @[CLAAdder.scala 65:28]
  wire  cla_inst_io_gg; // @[CLAAdder.scala 65:28]
  wire  cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 65:28]
  wire  cla_inst_io_cpg_0_p; // @[CLAAdder.scala 65:28]
  wire  cla_inst_io_cpg_0_g; // @[CLAAdder.scala 65:28]
  wire  cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 65:28]
  wire  cla_inst_io_cpg_1_p; // @[CLAAdder.scala 65:28]
  wire  cla_inst_io_cpg_1_g; // @[CLAAdder.scala 65:28]
  wire [3:0] whole_granularity_adders_0_io_a; // @[CLAAdder.scala 68:104]
  wire [3:0] whole_granularity_adders_0_io_b; // @[CLAAdder.scala 68:104]
  wire [3:0] whole_granularity_adders_0_io_s; // @[CLAAdder.scala 68:104]
  wire  whole_granularity_adders_0_io_cpg_carry; // @[CLAAdder.scala 68:104]
  wire  whole_granularity_adders_0_io_cpg_p; // @[CLAAdder.scala 68:104]
  wire  whole_granularity_adders_0_io_cpg_g; // @[CLAAdder.scala 68:104]
  wire [1:0] leftover_adder_io_a; // @[CLAAdder.scala 70:34]
  wire [1:0] leftover_adder_io_b; // @[CLAAdder.scala 70:34]
  wire [1:0] leftover_adder_io_s; // @[CLAAdder.scala 70:34]
  wire  leftover_adder_io_cpg_carry; // @[CLAAdder.scala 70:34]
  wire  leftover_adder_io_cpg_p; // @[CLAAdder.scala 70:34]
  wire  leftover_adder_io_cpg_g; // @[CLAAdder.scala 70:34]
  wire [1:0] io_s_hi = leftover_adder_io_s; // @[CLAAdder.scala 73:30 CLAAdder.scala 85:20]
  wire [3:0] sum_collector_0 = whole_granularity_adders_0_io_s; // @[CLAAdder.scala 72:31 CLAAdder.scala 79:40]
  CLA cla_inst ( // @[CLAAdder.scala 65:28]
    .io_c_in(cla_inst_io_c_in),
    .io_pg(cla_inst_io_pg),
    .io_gg(cla_inst_io_gg),
    .io_cpg_0_carry(cla_inst_io_cpg_0_carry),
    .io_cpg_0_p(cla_inst_io_cpg_0_p),
    .io_cpg_0_g(cla_inst_io_cpg_0_g),
    .io_cpg_1_carry(cla_inst_io_cpg_1_carry),
    .io_cpg_1_p(cla_inst_io_cpg_1_p),
    .io_cpg_1_g(cla_inst_io_cpg_1_g)
  );
  CLAAdder_4 whole_granularity_adders_0 ( // @[CLAAdder.scala 68:104]
    .io_a(whole_granularity_adders_0_io_a),
    .io_b(whole_granularity_adders_0_io_b),
    .io_s(whole_granularity_adders_0_io_s),
    .io_cpg_carry(whole_granularity_adders_0_io_cpg_carry),
    .io_cpg_p(whole_granularity_adders_0_io_cpg_p),
    .io_cpg_g(whole_granularity_adders_0_io_cpg_g)
  );
  CLAAdder_7 leftover_adder ( // @[CLAAdder.scala 70:34]
    .io_a(leftover_adder_io_a),
    .io_b(leftover_adder_io_b),
    .io_s(leftover_adder_io_s),
    .io_cpg_carry(leftover_adder_io_cpg_carry),
    .io_cpg_p(leftover_adder_io_cpg_p),
    .io_cpg_g(leftover_adder_io_cpg_g)
  );
  assign io_s = {io_s_hi,sum_collector_0}; // @[Cat.scala 30:58]
  assign io_cpg_p = cla_inst_io_pg; // @[CLAAdder.scala 90:22]
  assign io_cpg_g = cla_inst_io_gg; // @[CLAAdder.scala 91:22]
  assign cla_inst_io_c_in = io_cpg_carry; // @[CLAAdder.scala 89:24]
  assign cla_inst_io_cpg_0_p = whole_granularity_adders_0_io_cpg_p; // @[CLAAdder.scala 80:21]
  assign cla_inst_io_cpg_0_g = whole_granularity_adders_0_io_cpg_g; // @[CLAAdder.scala 80:21]
  assign cla_inst_io_cpg_1_p = leftover_adder_io_cpg_p; // @[CLAAdder.scala 86:39]
  assign cla_inst_io_cpg_1_g = leftover_adder_io_cpg_g; // @[CLAAdder.scala 86:39]
  assign whole_granularity_adders_0_io_a = io_a[3:0]; // @[CLAAdder.scala 77:26]
  assign whole_granularity_adders_0_io_b = io_b[3:0]; // @[CLAAdder.scala 78:26]
  assign whole_granularity_adders_0_io_cpg_carry = cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 80:21]
  assign leftover_adder_io_a = io_a[5:4]; // @[CLAAdder.scala 83:34]
  assign leftover_adder_io_b = io_b[5:4]; // @[CLAAdder.scala 84:34]
  assign leftover_adder_io_cpg_carry = cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 86:39]
endmodule
