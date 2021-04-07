;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CLA : 
  module CLA : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip c_in : UInt<1>, flip p : UInt<1>[3], flip g : UInt<1>[3], c_out : UInt<1>[3], pg : UInt<1>, gg : UInt<1>}
    
    node _io_pg_T = and(io.p[0], io.p[1]) @[CLA.scala 17:26]
    node _io_pg_T_1 = and(_io_pg_T, io.p[2]) @[CLA.scala 17:26]
    io.pg <= _io_pg_T_1 @[CLA.scala 17:9]
    node _io_gg_T = and(io.g[0], io.p[1]) @[CLA.scala 20:8]
    node _io_gg_T_1 = or(_io_gg_T, io.g[1]) @[CLA.scala 20:16]
    node _io_gg_T_2 = and(_io_gg_T_1, io.p[2]) @[CLA.scala 20:8]
    node _io_gg_T_3 = or(_io_gg_T_2, io.g[2]) @[CLA.scala 20:16]
    io.gg <= _io_gg_T_3 @[CLA.scala 19:9]
    node _io_c_out_0_T = and(io.c_in, io.p[0]) @[CLA.scala 23:27]
    node _io_c_out_0_T_1 = or(_io_c_out_0_T, io.g[0]) @[CLA.scala 23:38]
    io.c_out[0] <= _io_c_out_0_T_1 @[CLA.scala 23:15]
    node _io_c_out_1_T = and(io.c_out[0], io.p[1]) @[CLA.scala 25:39]
    node _io_c_out_1_T_1 = or(_io_c_out_1_T, io.g[1]) @[CLA.scala 25:52]
    io.c_out[1] <= _io_c_out_1_T_1 @[CLA.scala 25:19]
    node _io_c_out_2_T = and(io.c_out[1], io.p[2]) @[CLA.scala 25:39]
    node _io_c_out_2_T_1 = or(_io_c_out_2_T, io.g[2]) @[CLA.scala 25:52]
    io.c_out[2] <= _io_c_out_2_T_1 @[CLA.scala 25:19]
    
