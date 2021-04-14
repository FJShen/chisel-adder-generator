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
  input   clock,
  input   reset,
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
