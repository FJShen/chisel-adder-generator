module CLA(
  input   clock,
  input   reset,
  input   io_c_in,
  input   io_p_0,
  input   io_p_1,
  input   io_p_2,
  input   io_g_0,
  input   io_g_1,
  input   io_g_2,
  output  io_c_out_0,
  output  io_c_out_1,
  output  io_c_out_2,
  output  io_pg,
  output  io_gg
);
  assign io_c_out_0 = io_c_in & io_p_0 | io_g_0; // @[CLA.scala 23:38]
  assign io_c_out_1 = io_c_out_0 & io_p_1 | io_g_1; // @[CLA.scala 25:52]
  assign io_c_out_2 = io_c_out_1 & io_p_2 | io_g_2; // @[CLA.scala 25:52]
  assign io_pg = io_p_0 & io_p_1 & io_p_2; // @[CLA.scala 17:26]
  assign io_gg = (io_g_0 & io_p_1 | io_g_1) & io_p_2 | io_g_2; // @[CLA.scala 20:16]
endmodule
