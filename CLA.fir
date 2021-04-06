;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CLA : 
  module CLA : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip c_in : UInt<1>, flip p : UInt<4>, flip g : UInt<4>, c_out : UInt<1>, pg : UInt<1>, gg : UInt<1>}
    
    node p_list_0 = bits(io.p, 0, 0) @[CLA.scala 16:28]
    node p_list_1 = bits(io.p, 1, 1) @[CLA.scala 16:28]
    node p_list_2 = bits(io.p, 2, 2) @[CLA.scala 16:28]
    node p_list_3 = bits(io.p, 3, 3) @[CLA.scala 16:28]
    node g_list_0 = bits(io.g, 0, 0) @[CLA.scala 17:28]
    node g_list_1 = bits(io.g, 1, 1) @[CLA.scala 17:28]
    node g_list_2 = bits(io.g, 2, 2) @[CLA.scala 17:28]
    node g_list_3 = bits(io.g, 3, 3) @[CLA.scala 17:28]
    node _io_pg_T = and(p_list_0, p_list_1) @[CLA.scala 22:28]
    node _io_pg_T_1 = and(_io_pg_T, p_list_2) @[CLA.scala 22:28]
    node _io_pg_T_2 = and(_io_pg_T_1, p_list_3) @[CLA.scala 22:28]
    io.pg <= _io_pg_T_2 @[CLA.scala 22:9]
    node _io_gg_T = and(g_list_0, p_list_1) @[CLA.scala 25:8]
    node _io_gg_T_1 = or(_io_gg_T, g_list_1) @[CLA.scala 25:16]
    node _io_gg_T_2 = and(_io_gg_T_1, p_list_2) @[CLA.scala 25:8]
    node _io_gg_T_3 = or(_io_gg_T_2, g_list_2) @[CLA.scala 25:16]
    node _io_gg_T_4 = and(_io_gg_T_3, p_list_3) @[CLA.scala 25:8]
    node _io_gg_T_5 = or(_io_gg_T_4, g_list_3) @[CLA.scala 25:16]
    io.gg <= _io_gg_T_5 @[CLA.scala 24:9]
    node _io_c_out_T = and(io.c_in, io.pg) @[CLA.scala 28:32]
    node _io_c_out_T_1 = or(io.gg, _io_c_out_T) @[CLA.scala 28:21]
    io.c_out <= _io_c_out_T_1 @[CLA.scala 28:12]
    
