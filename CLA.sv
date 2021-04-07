module CLA(
  input   clock,
  input   reset,
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
