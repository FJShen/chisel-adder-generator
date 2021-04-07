module FullAdder(
  input   clock,
  input   reset,
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
