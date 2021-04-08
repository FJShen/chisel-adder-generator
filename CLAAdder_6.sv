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
  wire  fa_inst_io_a; // @[CLAAdder.scala 18:27]
  wire  fa_inst_io_b; // @[CLAAdder.scala 18:27]
  wire  fa_inst_io_s; // @[CLAAdder.scala 18:27]
  wire  fa_inst_io_cpg_carry; // @[CLAAdder.scala 18:27]
  wire  fa_inst_io_cpg_p; // @[CLAAdder.scala 18:27]
  wire  fa_inst_io_cpg_g; // @[CLAAdder.scala 18:27]
  FullAdder fa_inst ( // @[CLAAdder.scala 18:27]
    .io_a(fa_inst_io_a),
    .io_b(fa_inst_io_b),
    .io_s(fa_inst_io_s),
    .io_cpg_carry(fa_inst_io_cpg_carry),
    .io_cpg_p(fa_inst_io_cpg_p),
    .io_cpg_g(fa_inst_io_cpg_g)
  );
  assign io_s = fa_inst_io_s; // @[CLAAdder.scala 21:20]
  assign io_cpg_p = fa_inst_io_cpg_p; // @[CLAAdder.scala 22:22]
  assign io_cpg_g = fa_inst_io_cpg_g; // @[CLAAdder.scala 22:22]
  assign fa_inst_io_a = io_a; // @[CLAAdder.scala 19:20]
  assign fa_inst_io_b = io_b; // @[CLAAdder.scala 20:20]
  assign fa_inst_io_cpg_carry = io_cpg_carry; // @[CLAAdder.scala 22:22]
endmodule
module CLAAdder_4(
  input  [3:0] io_a,
  input  [3:0] io_b,
  output [3:0] io_s,
  input        io_cpg_carry,
  output       io_cpg_p,
  output       io_cpg_g
);
  wire  cla_inst_io_c_in; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_pg; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_gg; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_cpg_0_p; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_cpg_0_g; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_cpg_1_p; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_cpg_1_g; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_cpg_2_carry; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_cpg_2_p; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_cpg_2_g; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_cpg_3_carry; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_cpg_3_p; // @[CLAAdder.scala 25:28]
  wire  cla_inst_io_cpg_3_g; // @[CLAAdder.scala 25:28]
  wire  adder_inst_0_io_a; // @[CLAAdder.scala 26:42]
  wire  adder_inst_0_io_b; // @[CLAAdder.scala 26:42]
  wire  adder_inst_0_io_s; // @[CLAAdder.scala 26:42]
  wire  adder_inst_0_io_cpg_carry; // @[CLAAdder.scala 26:42]
  wire  adder_inst_0_io_cpg_p; // @[CLAAdder.scala 26:42]
  wire  adder_inst_0_io_cpg_g; // @[CLAAdder.scala 26:42]
  wire  adder_inst_1_io_a; // @[CLAAdder.scala 26:42]
  wire  adder_inst_1_io_b; // @[CLAAdder.scala 26:42]
  wire  adder_inst_1_io_s; // @[CLAAdder.scala 26:42]
  wire  adder_inst_1_io_cpg_carry; // @[CLAAdder.scala 26:42]
  wire  adder_inst_1_io_cpg_p; // @[CLAAdder.scala 26:42]
  wire  adder_inst_1_io_cpg_g; // @[CLAAdder.scala 26:42]
  wire  adder_inst_2_io_a; // @[CLAAdder.scala 26:42]
  wire  adder_inst_2_io_b; // @[CLAAdder.scala 26:42]
  wire  adder_inst_2_io_s; // @[CLAAdder.scala 26:42]
  wire  adder_inst_2_io_cpg_carry; // @[CLAAdder.scala 26:42]
  wire  adder_inst_2_io_cpg_p; // @[CLAAdder.scala 26:42]
  wire  adder_inst_2_io_cpg_g; // @[CLAAdder.scala 26:42]
  wire  adder_inst_3_io_a; // @[CLAAdder.scala 26:42]
  wire  adder_inst_3_io_b; // @[CLAAdder.scala 26:42]
  wire  adder_inst_3_io_s; // @[CLAAdder.scala 26:42]
  wire  adder_inst_3_io_cpg_carry; // @[CLAAdder.scala 26:42]
  wire  adder_inst_3_io_cpg_p; // @[CLAAdder.scala 26:42]
  wire  adder_inst_3_io_cpg_g; // @[CLAAdder.scala 26:42]
  wire  sum_bit_collector_1 = adder_inst_1_io_s; // @[CLAAdder.scala 34:35 CLAAdder.scala 35:75]
  wire  sum_bit_collector_0 = adder_inst_0_io_s; // @[CLAAdder.scala 34:35 CLAAdder.scala 35:75]
  wire [1:0] io_s_lo = {sum_bit_collector_1,sum_bit_collector_0}; // @[CLAAdder.scala 36:39]
  wire  sum_bit_collector_3 = adder_inst_3_io_s; // @[CLAAdder.scala 34:35 CLAAdder.scala 35:75]
  wire  sum_bit_collector_2 = adder_inst_2_io_s; // @[CLAAdder.scala 34:35 CLAAdder.scala 35:75]
  wire [1:0] io_s_hi = {sum_bit_collector_3,sum_bit_collector_2}; // @[CLAAdder.scala 36:39]
  CLA_1 cla_inst ( // @[CLAAdder.scala 25:28]
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
  CLAAdder adder_inst_0 ( // @[CLAAdder.scala 26:42]
    .io_a(adder_inst_0_io_a),
    .io_b(adder_inst_0_io_b),
    .io_s(adder_inst_0_io_s),
    .io_cpg_carry(adder_inst_0_io_cpg_carry),
    .io_cpg_p(adder_inst_0_io_cpg_p),
    .io_cpg_g(adder_inst_0_io_cpg_g)
  );
  CLAAdder adder_inst_1 ( // @[CLAAdder.scala 26:42]
    .io_a(adder_inst_1_io_a),
    .io_b(adder_inst_1_io_b),
    .io_s(adder_inst_1_io_s),
    .io_cpg_carry(adder_inst_1_io_cpg_carry),
    .io_cpg_p(adder_inst_1_io_cpg_p),
    .io_cpg_g(adder_inst_1_io_cpg_g)
  );
  CLAAdder adder_inst_2 ( // @[CLAAdder.scala 26:42]
    .io_a(adder_inst_2_io_a),
    .io_b(adder_inst_2_io_b),
    .io_s(adder_inst_2_io_s),
    .io_cpg_carry(adder_inst_2_io_cpg_carry),
    .io_cpg_p(adder_inst_2_io_cpg_p),
    .io_cpg_g(adder_inst_2_io_cpg_g)
  );
  CLAAdder adder_inst_3 ( // @[CLAAdder.scala 26:42]
    .io_a(adder_inst_3_io_a),
    .io_b(adder_inst_3_io_b),
    .io_s(adder_inst_3_io_s),
    .io_cpg_carry(adder_inst_3_io_cpg_carry),
    .io_cpg_p(adder_inst_3_io_cpg_p),
    .io_cpg_g(adder_inst_3_io_cpg_g)
  );
  assign io_s = {io_s_hi,io_s_lo}; // @[CLAAdder.scala 36:39]
  assign io_cpg_p = cla_inst_io_pg; // @[CLAAdder.scala 43:16]
  assign io_cpg_g = cla_inst_io_gg; // @[CLAAdder.scala 44:16]
  assign cla_inst_io_c_in = io_cpg_carry; // @[CLAAdder.scala 31:24]
  assign cla_inst_io_cpg_0_p = adder_inst_0_io_cpg_p; // @[CLAAdder.scala 50:74]
  assign cla_inst_io_cpg_0_g = adder_inst_0_io_cpg_g; // @[CLAAdder.scala 50:74]
  assign cla_inst_io_cpg_1_p = adder_inst_1_io_cpg_p; // @[CLAAdder.scala 50:74]
  assign cla_inst_io_cpg_1_g = adder_inst_1_io_cpg_g; // @[CLAAdder.scala 50:74]
  assign cla_inst_io_cpg_2_p = adder_inst_2_io_cpg_p; // @[CLAAdder.scala 50:74]
  assign cla_inst_io_cpg_2_g = adder_inst_2_io_cpg_g; // @[CLAAdder.scala 50:74]
  assign cla_inst_io_cpg_3_p = adder_inst_3_io_cpg_p; // @[CLAAdder.scala 50:74]
  assign cla_inst_io_cpg_3_g = adder_inst_3_io_cpg_g; // @[CLAAdder.scala 50:74]
  assign adder_inst_0_io_a = io_a[0]; // @[CLAAdder.scala 39:46]
  assign adder_inst_0_io_b = io_b[0]; // @[CLAAdder.scala 40:46]
  assign adder_inst_0_io_cpg_carry = cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 50:74]
  assign adder_inst_1_io_a = io_a[1]; // @[CLAAdder.scala 39:46]
  assign adder_inst_1_io_b = io_b[1]; // @[CLAAdder.scala 40:46]
  assign adder_inst_1_io_cpg_carry = cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 50:74]
  assign adder_inst_2_io_a = io_a[2]; // @[CLAAdder.scala 39:46]
  assign adder_inst_2_io_b = io_b[2]; // @[CLAAdder.scala 40:46]
  assign adder_inst_2_io_cpg_carry = cla_inst_io_cpg_2_carry; // @[CLAAdder.scala 50:74]
  assign adder_inst_3_io_a = io_a[3]; // @[CLAAdder.scala 39:46]
  assign adder_inst_3_io_b = io_b[3]; // @[CLAAdder.scala 40:46]
  assign adder_inst_3_io_cpg_carry = cla_inst_io_cpg_3_carry; // @[CLAAdder.scala 50:74]
endmodule
module CLAAdder_6(
  input        clock,
  input        reset,
  input  [4:0] io_a,
  input  [4:0] io_b,
  output [4:0] io_s,
  input        io_cpg_carry,
  output       io_cpg_p,
  output       io_cpg_g
);
  wire  cla_inst_io_c_in; // @[CLAAdder.scala 58:28]
  wire  cla_inst_io_pg; // @[CLAAdder.scala 58:28]
  wire  cla_inst_io_gg; // @[CLAAdder.scala 58:28]
  wire  cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 58:28]
  wire  cla_inst_io_cpg_0_p; // @[CLAAdder.scala 58:28]
  wire  cla_inst_io_cpg_0_g; // @[CLAAdder.scala 58:28]
  wire  cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 58:28]
  wire  cla_inst_io_cpg_1_p; // @[CLAAdder.scala 58:28]
  wire  cla_inst_io_cpg_1_g; // @[CLAAdder.scala 58:28]
  wire [3:0] children_cla_adder_inst_0_io_a; // @[CLAAdder.scala 69:78]
  wire [3:0] children_cla_adder_inst_0_io_b; // @[CLAAdder.scala 69:78]
  wire [3:0] children_cla_adder_inst_0_io_s; // @[CLAAdder.scala 69:78]
  wire  children_cla_adder_inst_0_io_cpg_carry; // @[CLAAdder.scala 69:78]
  wire  children_cla_adder_inst_0_io_cpg_p; // @[CLAAdder.scala 69:78]
  wire  children_cla_adder_inst_0_io_cpg_g; // @[CLAAdder.scala 69:78]
  wire  last_adder_inst_io_a; // @[CLAAdder.scala 81:35]
  wire  last_adder_inst_io_b; // @[CLAAdder.scala 81:35]
  wire  last_adder_inst_io_s; // @[CLAAdder.scala 81:35]
  wire  last_adder_inst_io_cpg_carry; // @[CLAAdder.scala 81:35]
  wire  last_adder_inst_io_cpg_p; // @[CLAAdder.scala 81:35]
  wire  last_adder_inst_io_cpg_g; // @[CLAAdder.scala 81:35]
  wire  io_s_hi = last_adder_inst_io_s; // @[CLAAdder.scala 67:32 CLAAdder.scala 84:28]
  wire [3:0] sum_collector_0 = children_cla_adder_inst_0_io_s; // @[CLAAdder.scala 66:31 CLAAdder.scala 76:19]
  CLA cla_inst ( // @[CLAAdder.scala 58:28]
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
  CLAAdder_4 children_cla_adder_inst_0 ( // @[CLAAdder.scala 69:78]
    .io_a(children_cla_adder_inst_0_io_a),
    .io_b(children_cla_adder_inst_0_io_b),
    .io_s(children_cla_adder_inst_0_io_s),
    .io_cpg_carry(children_cla_adder_inst_0_io_cpg_carry),
    .io_cpg_p(children_cla_adder_inst_0_io_cpg_p),
    .io_cpg_g(children_cla_adder_inst_0_io_cpg_g)
  );
  CLAAdder last_adder_inst ( // @[CLAAdder.scala 81:35]
    .io_a(last_adder_inst_io_a),
    .io_b(last_adder_inst_io_b),
    .io_s(last_adder_inst_io_s),
    .io_cpg_carry(last_adder_inst_io_cpg_carry),
    .io_cpg_p(last_adder_inst_io_cpg_p),
    .io_cpg_g(last_adder_inst_io_cpg_g)
  );
  assign io_s = {io_s_hi,sum_collector_0}; // @[Cat.scala 30:58]
  assign io_cpg_p = cla_inst_io_pg; // @[CLAAdder.scala 60:22]
  assign io_cpg_g = cla_inst_io_gg; // @[CLAAdder.scala 61:22]
  assign cla_inst_io_c_in = io_cpg_carry; // @[CLAAdder.scala 59:24]
  assign cla_inst_io_cpg_0_p = children_cla_adder_inst_0_io_cpg_p; // @[CLAAdder.scala 77:21]
  assign cla_inst_io_cpg_0_g = children_cla_adder_inst_0_io_cpg_g; // @[CLAAdder.scala 77:21]
  assign cla_inst_io_cpg_1_p = last_adder_inst_io_cpg_p; // @[CLAAdder.scala 85:30]
  assign cla_inst_io_cpg_1_g = last_adder_inst_io_cpg_g; // @[CLAAdder.scala 85:30]
  assign children_cla_adder_inst_0_io_a = io_a[3:0]; // @[CLAAdder.scala 74:26]
  assign children_cla_adder_inst_0_io_b = io_b[3:0]; // @[CLAAdder.scala 75:26]
  assign children_cla_adder_inst_0_io_cpg_carry = cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 77:21]
  assign last_adder_inst_io_a = io_a[4]; // @[CLAAdder.scala 82:35]
  assign last_adder_inst_io_b = io_b[4]; // @[CLAAdder.scala 83:35]
  assign last_adder_inst_io_cpg_carry = cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 85:30]
endmodule
