module CLA(
  input        clock,
  input        reset,
  input        io_c_in,
  input  [3:0] io_p,
  input  [3:0] io_g,
  output       io_c_out,
  output       io_pg,
  output       io_gg
);
  wire  p_list_0 = io_p[0]; // @[CLA.scala 16:28]
  wire  p_list_1 = io_p[1]; // @[CLA.scala 16:28]
  wire  p_list_2 = io_p[2]; // @[CLA.scala 16:28]
  wire  p_list_3 = io_p[3]; // @[CLA.scala 16:28]
  wire  g_list_0 = io_g[0]; // @[CLA.scala 17:28]
  wire  g_list_1 = io_g[1]; // @[CLA.scala 17:28]
  wire  g_list_2 = io_g[2]; // @[CLA.scala 17:28]
  wire  g_list_3 = io_g[3]; // @[CLA.scala 17:28]
  assign io_c_out = io_gg | io_c_in & io_pg; // @[CLA.scala 28:21]
  assign io_pg = p_list_0 & p_list_1 & p_list_2 & p_list_3; // @[CLA.scala 22:28]
  assign io_gg = ((g_list_0 & p_list_1 | g_list_1) & p_list_2 | g_list_2) & p_list_3 | g_list_3; // @[CLA.scala 25:16]
endmodule
