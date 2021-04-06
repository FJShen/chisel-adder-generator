module full_adder(
  input   clock,
  input   reset,
  input   io_a,
  input   io_b,
  input   io_c,
  output  io_s,
  output  io_p,
  output  io_g
);
  assign io_s = io_a ^ io_b ^ io_c; // @[full_adder.scala 15:23]
  assign io_p = io_a | io_b; // @[full_adder.scala 16:16]
  assign io_g = io_a & io_b; // @[full_adder.scala 17:16]
endmodule
