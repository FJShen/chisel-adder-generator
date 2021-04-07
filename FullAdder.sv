module FullAdder(
  input   clock,
  input   reset,
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
