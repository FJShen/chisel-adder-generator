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
module my_name(
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
module my_name_4(
  input  [3:0] io_a,
  input  [3:0] io_b,
  output [3:0] io_s,
  input        io_cpg_carry,
  output       io_cpg_p,
  output       io_cpg_g
);
  wire  cla_inst_io_c_in; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_pg; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_gg; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_0_p; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_0_g; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_1_p; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_1_g; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_2_carry; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_2_p; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_2_g; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_3_carry; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_3_p; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_3_g; // @[CLAAdder.scala 28:28]
  wire  adder_inst_0_io_a; // @[CLAAdder.scala 29:42]
  wire  adder_inst_0_io_b; // @[CLAAdder.scala 29:42]
  wire  adder_inst_0_io_s; // @[CLAAdder.scala 29:42]
  wire  adder_inst_0_io_cpg_carry; // @[CLAAdder.scala 29:42]
  wire  adder_inst_0_io_cpg_p; // @[CLAAdder.scala 29:42]
  wire  adder_inst_0_io_cpg_g; // @[CLAAdder.scala 29:42]
  wire  adder_inst_1_io_a; // @[CLAAdder.scala 29:42]
  wire  adder_inst_1_io_b; // @[CLAAdder.scala 29:42]
  wire  adder_inst_1_io_s; // @[CLAAdder.scala 29:42]
  wire  adder_inst_1_io_cpg_carry; // @[CLAAdder.scala 29:42]
  wire  adder_inst_1_io_cpg_p; // @[CLAAdder.scala 29:42]
  wire  adder_inst_1_io_cpg_g; // @[CLAAdder.scala 29:42]
  wire  adder_inst_2_io_a; // @[CLAAdder.scala 29:42]
  wire  adder_inst_2_io_b; // @[CLAAdder.scala 29:42]
  wire  adder_inst_2_io_s; // @[CLAAdder.scala 29:42]
  wire  adder_inst_2_io_cpg_carry; // @[CLAAdder.scala 29:42]
  wire  adder_inst_2_io_cpg_p; // @[CLAAdder.scala 29:42]
  wire  adder_inst_2_io_cpg_g; // @[CLAAdder.scala 29:42]
  wire  adder_inst_3_io_a; // @[CLAAdder.scala 29:42]
  wire  adder_inst_3_io_b; // @[CLAAdder.scala 29:42]
  wire  adder_inst_3_io_s; // @[CLAAdder.scala 29:42]
  wire  adder_inst_3_io_cpg_carry; // @[CLAAdder.scala 29:42]
  wire  adder_inst_3_io_cpg_p; // @[CLAAdder.scala 29:42]
  wire  adder_inst_3_io_cpg_g; // @[CLAAdder.scala 29:42]
  wire  sum_bit_collector_1 = adder_inst_1_io_s; // @[CLAAdder.scala 37:35 CLAAdder.scala 38:75]
  wire  sum_bit_collector_0 = adder_inst_0_io_s; // @[CLAAdder.scala 37:35 CLAAdder.scala 38:75]
  wire [1:0] io_s_lo = {sum_bit_collector_1,sum_bit_collector_0}; // @[CLAAdder.scala 39:39]
  wire  sum_bit_collector_3 = adder_inst_3_io_s; // @[CLAAdder.scala 37:35 CLAAdder.scala 38:75]
  wire  sum_bit_collector_2 = adder_inst_2_io_s; // @[CLAAdder.scala 37:35 CLAAdder.scala 38:75]
  wire [1:0] io_s_hi = {sum_bit_collector_3,sum_bit_collector_2}; // @[CLAAdder.scala 39:39]
  CLA_1 cla_inst ( // @[CLAAdder.scala 28:28]
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
  my_name adder_inst_0 ( // @[CLAAdder.scala 29:42]
    .io_a(adder_inst_0_io_a),
    .io_b(adder_inst_0_io_b),
    .io_s(adder_inst_0_io_s),
    .io_cpg_carry(adder_inst_0_io_cpg_carry),
    .io_cpg_p(adder_inst_0_io_cpg_p),
    .io_cpg_g(adder_inst_0_io_cpg_g)
  );
  my_name adder_inst_1 ( // @[CLAAdder.scala 29:42]
    .io_a(adder_inst_1_io_a),
    .io_b(adder_inst_1_io_b),
    .io_s(adder_inst_1_io_s),
    .io_cpg_carry(adder_inst_1_io_cpg_carry),
    .io_cpg_p(adder_inst_1_io_cpg_p),
    .io_cpg_g(adder_inst_1_io_cpg_g)
  );
  my_name adder_inst_2 ( // @[CLAAdder.scala 29:42]
    .io_a(adder_inst_2_io_a),
    .io_b(adder_inst_2_io_b),
    .io_s(adder_inst_2_io_s),
    .io_cpg_carry(adder_inst_2_io_cpg_carry),
    .io_cpg_p(adder_inst_2_io_cpg_p),
    .io_cpg_g(adder_inst_2_io_cpg_g)
  );
  my_name adder_inst_3 ( // @[CLAAdder.scala 29:42]
    .io_a(adder_inst_3_io_a),
    .io_b(adder_inst_3_io_b),
    .io_s(adder_inst_3_io_s),
    .io_cpg_carry(adder_inst_3_io_cpg_carry),
    .io_cpg_p(adder_inst_3_io_cpg_p),
    .io_cpg_g(adder_inst_3_io_cpg_g)
  );
  assign io_s = {io_s_hi,io_s_lo}; // @[CLAAdder.scala 39:39]
  assign io_cpg_p = cla_inst_io_pg; // @[CLAAdder.scala 46:16]
  assign io_cpg_g = cla_inst_io_gg; // @[CLAAdder.scala 47:16]
  assign cla_inst_io_c_in = io_cpg_carry; // @[CLAAdder.scala 34:24]
  assign cla_inst_io_cpg_0_p = adder_inst_0_io_cpg_p; // @[CLAAdder.scala 53:74]
  assign cla_inst_io_cpg_0_g = adder_inst_0_io_cpg_g; // @[CLAAdder.scala 53:74]
  assign cla_inst_io_cpg_1_p = adder_inst_1_io_cpg_p; // @[CLAAdder.scala 53:74]
  assign cla_inst_io_cpg_1_g = adder_inst_1_io_cpg_g; // @[CLAAdder.scala 53:74]
  assign cla_inst_io_cpg_2_p = adder_inst_2_io_cpg_p; // @[CLAAdder.scala 53:74]
  assign cla_inst_io_cpg_2_g = adder_inst_2_io_cpg_g; // @[CLAAdder.scala 53:74]
  assign cla_inst_io_cpg_3_p = adder_inst_3_io_cpg_p; // @[CLAAdder.scala 53:74]
  assign cla_inst_io_cpg_3_g = adder_inst_3_io_cpg_g; // @[CLAAdder.scala 53:74]
  assign adder_inst_0_io_a = io_a[0]; // @[CLAAdder.scala 42:46]
  assign adder_inst_0_io_b = io_b[0]; // @[CLAAdder.scala 43:46]
  assign adder_inst_0_io_cpg_carry = cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 53:74]
  assign adder_inst_1_io_a = io_a[1]; // @[CLAAdder.scala 42:46]
  assign adder_inst_1_io_b = io_b[1]; // @[CLAAdder.scala 43:46]
  assign adder_inst_1_io_cpg_carry = cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 53:74]
  assign adder_inst_2_io_a = io_a[2]; // @[CLAAdder.scala 42:46]
  assign adder_inst_2_io_b = io_b[2]; // @[CLAAdder.scala 43:46]
  assign adder_inst_2_io_cpg_carry = cla_inst_io_cpg_2_carry; // @[CLAAdder.scala 53:74]
  assign adder_inst_3_io_a = io_a[3]; // @[CLAAdder.scala 42:46]
  assign adder_inst_3_io_b = io_b[3]; // @[CLAAdder.scala 43:46]
  assign adder_inst_3_io_cpg_carry = cla_inst_io_cpg_3_carry; // @[CLAAdder.scala 53:74]
endmodule
module my_name_7(
  input  [1:0] io_a,
  input  [1:0] io_b,
  output [1:0] io_s,
  input        io_cpg_carry,
  output       io_cpg_p,
  output       io_cpg_g
);
  wire  cla_inst_io_c_in; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_pg; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_gg; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_0_p; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_0_g; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_1_p; // @[CLAAdder.scala 28:28]
  wire  cla_inst_io_cpg_1_g; // @[CLAAdder.scala 28:28]
  wire  adder_inst_0_io_a; // @[CLAAdder.scala 29:42]
  wire  adder_inst_0_io_b; // @[CLAAdder.scala 29:42]
  wire  adder_inst_0_io_s; // @[CLAAdder.scala 29:42]
  wire  adder_inst_0_io_cpg_carry; // @[CLAAdder.scala 29:42]
  wire  adder_inst_0_io_cpg_p; // @[CLAAdder.scala 29:42]
  wire  adder_inst_0_io_cpg_g; // @[CLAAdder.scala 29:42]
  wire  adder_inst_1_io_a; // @[CLAAdder.scala 29:42]
  wire  adder_inst_1_io_b; // @[CLAAdder.scala 29:42]
  wire  adder_inst_1_io_s; // @[CLAAdder.scala 29:42]
  wire  adder_inst_1_io_cpg_carry; // @[CLAAdder.scala 29:42]
  wire  adder_inst_1_io_cpg_p; // @[CLAAdder.scala 29:42]
  wire  adder_inst_1_io_cpg_g; // @[CLAAdder.scala 29:42]
  wire  sum_bit_collector_1 = adder_inst_1_io_s; // @[CLAAdder.scala 37:35 CLAAdder.scala 38:75]
  wire  sum_bit_collector_0 = adder_inst_0_io_s; // @[CLAAdder.scala 37:35 CLAAdder.scala 38:75]
  CLA cla_inst ( // @[CLAAdder.scala 28:28]
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
  my_name adder_inst_0 ( // @[CLAAdder.scala 29:42]
    .io_a(adder_inst_0_io_a),
    .io_b(adder_inst_0_io_b),
    .io_s(adder_inst_0_io_s),
    .io_cpg_carry(adder_inst_0_io_cpg_carry),
    .io_cpg_p(adder_inst_0_io_cpg_p),
    .io_cpg_g(adder_inst_0_io_cpg_g)
  );
  my_name adder_inst_1 ( // @[CLAAdder.scala 29:42]
    .io_a(adder_inst_1_io_a),
    .io_b(adder_inst_1_io_b),
    .io_s(adder_inst_1_io_s),
    .io_cpg_carry(adder_inst_1_io_cpg_carry),
    .io_cpg_p(adder_inst_1_io_cpg_p),
    .io_cpg_g(adder_inst_1_io_cpg_g)
  );
  assign io_s = {sum_bit_collector_1,sum_bit_collector_0}; // @[CLAAdder.scala 39:39]
  assign io_cpg_p = cla_inst_io_pg; // @[CLAAdder.scala 46:16]
  assign io_cpg_g = cla_inst_io_gg; // @[CLAAdder.scala 47:16]
  assign cla_inst_io_c_in = io_cpg_carry; // @[CLAAdder.scala 34:24]
  assign cla_inst_io_cpg_0_p = adder_inst_0_io_cpg_p; // @[CLAAdder.scala 53:74]
  assign cla_inst_io_cpg_0_g = adder_inst_0_io_cpg_g; // @[CLAAdder.scala 53:74]
  assign cla_inst_io_cpg_1_p = adder_inst_1_io_cpg_p; // @[CLAAdder.scala 53:74]
  assign cla_inst_io_cpg_1_g = adder_inst_1_io_cpg_g; // @[CLAAdder.scala 53:74]
  assign adder_inst_0_io_a = io_a[0]; // @[CLAAdder.scala 42:46]
  assign adder_inst_0_io_b = io_b[0]; // @[CLAAdder.scala 43:46]
  assign adder_inst_0_io_cpg_carry = cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 53:74]
  assign adder_inst_1_io_a = io_a[1]; // @[CLAAdder.scala 42:46]
  assign adder_inst_1_io_b = io_b[1]; // @[CLAAdder.scala 43:46]
  assign adder_inst_1_io_cpg_carry = cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 53:74]
endmodule
module my_name_8(
  input        clock,
  input        reset,
  input  [5:0] io_a,
  input  [5:0] io_b,
  output [5:0] io_s,
  input        io_cpg_carry,
  output       io_cpg_p,
  output       io_cpg_g
);
  wire  cla_inst_io_c_in; // @[CLAAdder.scala 60:28]
  wire  cla_inst_io_pg; // @[CLAAdder.scala 60:28]
  wire  cla_inst_io_gg; // @[CLAAdder.scala 60:28]
  wire  cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 60:28]
  wire  cla_inst_io_cpg_0_p; // @[CLAAdder.scala 60:28]
  wire  cla_inst_io_cpg_0_g; // @[CLAAdder.scala 60:28]
  wire  cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 60:28]
  wire  cla_inst_io_cpg_1_p; // @[CLAAdder.scala 60:28]
  wire  cla_inst_io_cpg_1_g; // @[CLAAdder.scala 60:28]
  wire [3:0] children_cla_adder_inst_0_io_a; // @[CLAAdder.scala 70:78]
  wire [3:0] children_cla_adder_inst_0_io_b; // @[CLAAdder.scala 70:78]
  wire [3:0] children_cla_adder_inst_0_io_s; // @[CLAAdder.scala 70:78]
  wire  children_cla_adder_inst_0_io_cpg_carry; // @[CLAAdder.scala 70:78]
  wire  children_cla_adder_inst_0_io_cpg_p; // @[CLAAdder.scala 70:78]
  wire  children_cla_adder_inst_0_io_cpg_g; // @[CLAAdder.scala 70:78]
  wire [1:0] last_adder_inst_io_a; // @[CLAAdder.scala 82:35]
  wire [1:0] last_adder_inst_io_b; // @[CLAAdder.scala 82:35]
  wire [1:0] last_adder_inst_io_s; // @[CLAAdder.scala 82:35]
  wire  last_adder_inst_io_cpg_carry; // @[CLAAdder.scala 82:35]
  wire  last_adder_inst_io_cpg_p; // @[CLAAdder.scala 82:35]
  wire  last_adder_inst_io_cpg_g; // @[CLAAdder.scala 82:35]
  wire [1:0] io_s_hi = last_adder_inst_io_s; // @[CLAAdder.scala 68:32 CLAAdder.scala 85:28]
  wire [3:0] sum_collector_0 = children_cla_adder_inst_0_io_s; // @[CLAAdder.scala 67:31 CLAAdder.scala 77:19]
  CLA cla_inst ( // @[CLAAdder.scala 60:28]
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
  my_name_4 children_cla_adder_inst_0 ( // @[CLAAdder.scala 70:78]
    .io_a(children_cla_adder_inst_0_io_a),
    .io_b(children_cla_adder_inst_0_io_b),
    .io_s(children_cla_adder_inst_0_io_s),
    .io_cpg_carry(children_cla_adder_inst_0_io_cpg_carry),
    .io_cpg_p(children_cla_adder_inst_0_io_cpg_p),
    .io_cpg_g(children_cla_adder_inst_0_io_cpg_g)
  );
  my_name_7 last_adder_inst ( // @[CLAAdder.scala 82:35]
    .io_a(last_adder_inst_io_a),
    .io_b(last_adder_inst_io_b),
    .io_s(last_adder_inst_io_s),
    .io_cpg_carry(last_adder_inst_io_cpg_carry),
    .io_cpg_p(last_adder_inst_io_cpg_p),
    .io_cpg_g(last_adder_inst_io_cpg_g)
  );
  assign io_s = {io_s_hi,sum_collector_0}; // @[Cat.scala 30:58]
  assign io_cpg_p = cla_inst_io_pg; // @[CLAAdder.scala 62:22]
  assign io_cpg_g = cla_inst_io_gg; // @[CLAAdder.scala 63:22]
  assign cla_inst_io_c_in = io_cpg_carry; // @[CLAAdder.scala 61:24]
  assign cla_inst_io_cpg_0_p = children_cla_adder_inst_0_io_cpg_p; // @[CLAAdder.scala 78:21]
  assign cla_inst_io_cpg_0_g = children_cla_adder_inst_0_io_cpg_g; // @[CLAAdder.scala 78:21]
  assign cla_inst_io_cpg_1_p = last_adder_inst_io_cpg_p; // @[CLAAdder.scala 86:30]
  assign cla_inst_io_cpg_1_g = last_adder_inst_io_cpg_g; // @[CLAAdder.scala 86:30]
  assign children_cla_adder_inst_0_io_a = io_a[3:0]; // @[CLAAdder.scala 75:26]
  assign children_cla_adder_inst_0_io_b = io_b[3:0]; // @[CLAAdder.scala 76:26]
  assign children_cla_adder_inst_0_io_cpg_carry = cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 78:21]
  assign last_adder_inst_io_a = io_a[5:4]; // @[CLAAdder.scala 83:35]
  assign last_adder_inst_io_b = io_b[5:4]; // @[CLAAdder.scala 84:35]
  assign last_adder_inst_io_cpg_carry = cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 86:30]
endmodule
