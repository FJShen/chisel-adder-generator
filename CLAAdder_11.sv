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
  wire  fa_inst_io_a; // @[CLAAdder.scala 25:27]
  wire  fa_inst_io_b; // @[CLAAdder.scala 25:27]
  wire  fa_inst_io_s; // @[CLAAdder.scala 25:27]
  wire  fa_inst_io_cpg_carry; // @[CLAAdder.scala 25:27]
  wire  fa_inst_io_cpg_p; // @[CLAAdder.scala 25:27]
  wire  fa_inst_io_cpg_g; // @[CLAAdder.scala 25:27]
  FullAdder fa_inst ( // @[CLAAdder.scala 25:27]
    .io_a(fa_inst_io_a),
    .io_b(fa_inst_io_b),
    .io_s(fa_inst_io_s),
    .io_cpg_carry(fa_inst_io_cpg_carry),
    .io_cpg_p(fa_inst_io_cpg_p),
    .io_cpg_g(fa_inst_io_cpg_g)
  );
  assign io_s = fa_inst_io_s; // @[CLAAdder.scala 28:20]
  assign io_cpg_p = fa_inst_io_cpg_p; // @[CLAAdder.scala 29:22]
  assign io_cpg_g = fa_inst_io_cpg_g; // @[CLAAdder.scala 29:22]
  assign fa_inst_io_a = io_a; // @[CLAAdder.scala 26:20]
  assign fa_inst_io_b = io_b; // @[CLAAdder.scala 27:20]
  assign fa_inst_io_cpg_carry = io_cpg_carry; // @[CLAAdder.scala 29:22]
endmodule
module CLAAdder_4(
  input  [3:0] io_a,
  input  [3:0] io_b,
  output [3:0] io_s,
  input        io_cpg_carry,
  output       io_cpg_p,
  output       io_cpg_g
);
  wire  cla_inst_io_c_in; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_pg; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_gg; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_0_p; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_0_g; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_1_p; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_1_g; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_2_carry; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_2_p; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_2_g; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_3_carry; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_3_p; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_3_g; // @[CLAAdder.scala 69:28]
  wire  whole_granularity_adders_0_io_a; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_0_io_b; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_0_io_s; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_0_io_cpg_carry; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_0_io_cpg_p; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_0_io_cpg_g; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_1_io_a; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_1_io_b; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_1_io_s; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_1_io_cpg_carry; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_1_io_cpg_p; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_1_io_cpg_g; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_2_io_a; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_2_io_b; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_2_io_s; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_2_io_cpg_carry; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_2_io_cpg_p; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_2_io_cpg_g; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_3_io_a; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_3_io_b; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_3_io_s; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_3_io_cpg_carry; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_3_io_cpg_p; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_3_io_cpg_g; // @[CLAAdder.scala 72:104]
  wire  sum_collector_1 = whole_granularity_adders_1_io_s; // @[CLAAdder.scala 74:31 CLAAdder.scala 81:40]
  wire  sum_collector_0 = whole_granularity_adders_0_io_s; // @[CLAAdder.scala 74:31 CLAAdder.scala 81:40]
  wire [1:0] io_s_lo = {sum_collector_1,sum_collector_0}; // @[CLAAdder.scala 86:36]
  wire  sum_collector_3 = whole_granularity_adders_3_io_s; // @[CLAAdder.scala 74:31 CLAAdder.scala 81:40]
  wire  sum_collector_2 = whole_granularity_adders_2_io_s; // @[CLAAdder.scala 74:31 CLAAdder.scala 81:40]
  wire [1:0] io_s_hi = {sum_collector_3,sum_collector_2}; // @[CLAAdder.scala 86:36]
  CLA_1 cla_inst ( // @[CLAAdder.scala 69:28]
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
  CLAAdder whole_granularity_adders_0 ( // @[CLAAdder.scala 72:104]
    .io_a(whole_granularity_adders_0_io_a),
    .io_b(whole_granularity_adders_0_io_b),
    .io_s(whole_granularity_adders_0_io_s),
    .io_cpg_carry(whole_granularity_adders_0_io_cpg_carry),
    .io_cpg_p(whole_granularity_adders_0_io_cpg_p),
    .io_cpg_g(whole_granularity_adders_0_io_cpg_g)
  );
  CLAAdder whole_granularity_adders_1 ( // @[CLAAdder.scala 72:104]
    .io_a(whole_granularity_adders_1_io_a),
    .io_b(whole_granularity_adders_1_io_b),
    .io_s(whole_granularity_adders_1_io_s),
    .io_cpg_carry(whole_granularity_adders_1_io_cpg_carry),
    .io_cpg_p(whole_granularity_adders_1_io_cpg_p),
    .io_cpg_g(whole_granularity_adders_1_io_cpg_g)
  );
  CLAAdder whole_granularity_adders_2 ( // @[CLAAdder.scala 72:104]
    .io_a(whole_granularity_adders_2_io_a),
    .io_b(whole_granularity_adders_2_io_b),
    .io_s(whole_granularity_adders_2_io_s),
    .io_cpg_carry(whole_granularity_adders_2_io_cpg_carry),
    .io_cpg_p(whole_granularity_adders_2_io_cpg_p),
    .io_cpg_g(whole_granularity_adders_2_io_cpg_g)
  );
  CLAAdder whole_granularity_adders_3 ( // @[CLAAdder.scala 72:104]
    .io_a(whole_granularity_adders_3_io_a),
    .io_b(whole_granularity_adders_3_io_b),
    .io_s(whole_granularity_adders_3_io_s),
    .io_cpg_carry(whole_granularity_adders_3_io_cpg_carry),
    .io_cpg_p(whole_granularity_adders_3_io_cpg_p),
    .io_cpg_g(whole_granularity_adders_3_io_cpg_g)
  );
  assign io_s = {io_s_hi,io_s_lo}; // @[CLAAdder.scala 86:36]
  assign io_cpg_p = cla_inst_io_pg; // @[CLAAdder.scala 89:22]
  assign io_cpg_g = cla_inst_io_gg; // @[CLAAdder.scala 90:22]
  assign cla_inst_io_c_in = io_cpg_carry; // @[CLAAdder.scala 88:24]
  assign cla_inst_io_cpg_0_p = whole_granularity_adders_0_io_cpg_p; // @[CLAAdder.scala 82:21]
  assign cla_inst_io_cpg_0_g = whole_granularity_adders_0_io_cpg_g; // @[CLAAdder.scala 82:21]
  assign cla_inst_io_cpg_1_p = whole_granularity_adders_1_io_cpg_p; // @[CLAAdder.scala 82:21]
  assign cla_inst_io_cpg_1_g = whole_granularity_adders_1_io_cpg_g; // @[CLAAdder.scala 82:21]
  assign cla_inst_io_cpg_2_p = whole_granularity_adders_2_io_cpg_p; // @[CLAAdder.scala 82:21]
  assign cla_inst_io_cpg_2_g = whole_granularity_adders_2_io_cpg_g; // @[CLAAdder.scala 82:21]
  assign cla_inst_io_cpg_3_p = whole_granularity_adders_3_io_cpg_p; // @[CLAAdder.scala 82:21]
  assign cla_inst_io_cpg_3_g = whole_granularity_adders_3_io_cpg_g; // @[CLAAdder.scala 82:21]
  assign whole_granularity_adders_0_io_a = io_a[0]; // @[CLAAdder.scala 79:26]
  assign whole_granularity_adders_0_io_b = io_b[0]; // @[CLAAdder.scala 80:26]
  assign whole_granularity_adders_0_io_cpg_carry = cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 82:21]
  assign whole_granularity_adders_1_io_a = io_a[1]; // @[CLAAdder.scala 79:26]
  assign whole_granularity_adders_1_io_b = io_b[1]; // @[CLAAdder.scala 80:26]
  assign whole_granularity_adders_1_io_cpg_carry = cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 82:21]
  assign whole_granularity_adders_2_io_a = io_a[2]; // @[CLAAdder.scala 79:26]
  assign whole_granularity_adders_2_io_b = io_b[2]; // @[CLAAdder.scala 80:26]
  assign whole_granularity_adders_2_io_cpg_carry = cla_inst_io_cpg_2_carry; // @[CLAAdder.scala 82:21]
  assign whole_granularity_adders_3_io_a = io_a[3]; // @[CLAAdder.scala 79:26]
  assign whole_granularity_adders_3_io_b = io_b[3]; // @[CLAAdder.scala 80:26]
  assign whole_granularity_adders_3_io_cpg_carry = cla_inst_io_cpg_3_carry; // @[CLAAdder.scala 82:21]
endmodule
module CLAAdder_11(
  input        clock,
  input        reset,
  input  [8:0] io_a,
  input  [8:0] io_b,
  output [8:0] io_s,
  input        io_cpg_carry,
  output       io_cpg_p,
  output       io_cpg_g
);
  wire  cla_inst_io_c_in; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_pg; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_gg; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_0_p; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_0_g; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_1_p; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_1_g; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_2_carry; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_2_p; // @[CLAAdder.scala 69:28]
  wire  cla_inst_io_cpg_2_g; // @[CLAAdder.scala 69:28]
  wire [3:0] whole_granularity_adders_0_io_a; // @[CLAAdder.scala 72:104]
  wire [3:0] whole_granularity_adders_0_io_b; // @[CLAAdder.scala 72:104]
  wire [3:0] whole_granularity_adders_0_io_s; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_0_io_cpg_carry; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_0_io_cpg_p; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_0_io_cpg_g; // @[CLAAdder.scala 72:104]
  wire [3:0] whole_granularity_adders_1_io_a; // @[CLAAdder.scala 72:104]
  wire [3:0] whole_granularity_adders_1_io_b; // @[CLAAdder.scala 72:104]
  wire [3:0] whole_granularity_adders_1_io_s; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_1_io_cpg_carry; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_1_io_cpg_p; // @[CLAAdder.scala 72:104]
  wire  whole_granularity_adders_1_io_cpg_g; // @[CLAAdder.scala 72:104]
  wire  leftover_adder_io_a; // @[CLAAdder.scala 94:36]
  wire  leftover_adder_io_b; // @[CLAAdder.scala 94:36]
  wire  leftover_adder_io_s; // @[CLAAdder.scala 94:36]
  wire  leftover_adder_io_cpg_carry; // @[CLAAdder.scala 94:36]
  wire  leftover_adder_io_cpg_p; // @[CLAAdder.scala 94:36]
  wire  leftover_adder_io_cpg_g; // @[CLAAdder.scala 94:36]
  wire [3:0] sum_collector_1 = whole_granularity_adders_1_io_s; // @[CLAAdder.scala 74:31 CLAAdder.scala 81:40]
  wire [3:0] sum_collector_0 = whole_granularity_adders_0_io_s; // @[CLAAdder.scala 74:31 CLAAdder.scala 81:40]
  wire [7:0] _io_s_T = {sum_collector_1,sum_collector_0}; // @[CLAAdder.scala 86:36]
  wire  io_s_hi = leftover_adder_io_s; // @[CLAAdder.scala 95:32 CLAAdder.scala 98:22]
  CLA cla_inst ( // @[CLAAdder.scala 69:28]
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
  CLAAdder_4 whole_granularity_adders_0 ( // @[CLAAdder.scala 72:104]
    .io_a(whole_granularity_adders_0_io_a),
    .io_b(whole_granularity_adders_0_io_b),
    .io_s(whole_granularity_adders_0_io_s),
    .io_cpg_carry(whole_granularity_adders_0_io_cpg_carry),
    .io_cpg_p(whole_granularity_adders_0_io_cpg_p),
    .io_cpg_g(whole_granularity_adders_0_io_cpg_g)
  );
  CLAAdder_4 whole_granularity_adders_1 ( // @[CLAAdder.scala 72:104]
    .io_a(whole_granularity_adders_1_io_a),
    .io_b(whole_granularity_adders_1_io_b),
    .io_s(whole_granularity_adders_1_io_s),
    .io_cpg_carry(whole_granularity_adders_1_io_cpg_carry),
    .io_cpg_p(whole_granularity_adders_1_io_cpg_p),
    .io_cpg_g(whole_granularity_adders_1_io_cpg_g)
  );
  CLAAdder leftover_adder ( // @[CLAAdder.scala 94:36]
    .io_a(leftover_adder_io_a),
    .io_b(leftover_adder_io_b),
    .io_s(leftover_adder_io_s),
    .io_cpg_carry(leftover_adder_io_cpg_carry),
    .io_cpg_p(leftover_adder_io_cpg_p),
    .io_cpg_g(leftover_adder_io_cpg_g)
  );
  assign io_s = {io_s_hi,_io_s_T}; // @[Cat.scala 30:58]
  assign io_cpg_p = cla_inst_io_pg; // @[CLAAdder.scala 89:22]
  assign io_cpg_g = cla_inst_io_gg; // @[CLAAdder.scala 90:22]
  assign cla_inst_io_c_in = io_cpg_carry; // @[CLAAdder.scala 88:24]
  assign cla_inst_io_cpg_0_p = whole_granularity_adders_0_io_cpg_p; // @[CLAAdder.scala 82:21]
  assign cla_inst_io_cpg_0_g = whole_granularity_adders_0_io_cpg_g; // @[CLAAdder.scala 82:21]
  assign cla_inst_io_cpg_1_p = whole_granularity_adders_1_io_cpg_p; // @[CLAAdder.scala 82:21]
  assign cla_inst_io_cpg_1_g = whole_granularity_adders_1_io_cpg_g; // @[CLAAdder.scala 82:21]
  assign cla_inst_io_cpg_2_p = leftover_adder_io_cpg_p; // @[CLAAdder.scala 99:41]
  assign cla_inst_io_cpg_2_g = leftover_adder_io_cpg_g; // @[CLAAdder.scala 99:41]
  assign whole_granularity_adders_0_io_a = io_a[3:0]; // @[CLAAdder.scala 79:26]
  assign whole_granularity_adders_0_io_b = io_b[3:0]; // @[CLAAdder.scala 80:26]
  assign whole_granularity_adders_0_io_cpg_carry = cla_inst_io_cpg_0_carry; // @[CLAAdder.scala 82:21]
  assign whole_granularity_adders_1_io_a = io_a[7:4]; // @[CLAAdder.scala 79:26]
  assign whole_granularity_adders_1_io_b = io_b[7:4]; // @[CLAAdder.scala 80:26]
  assign whole_granularity_adders_1_io_cpg_carry = cla_inst_io_cpg_1_carry; // @[CLAAdder.scala 82:21]
  assign leftover_adder_io_a = io_a[8]; // @[CLAAdder.scala 96:36]
  assign leftover_adder_io_b = io_b[8]; // @[CLAAdder.scala 97:36]
  assign leftover_adder_io_cpg_carry = cla_inst_io_cpg_2_carry; // @[CLAAdder.scala 99:41]
endmodule
