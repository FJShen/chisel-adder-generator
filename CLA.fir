;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CLA : 
  module CLA : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip c_in : UInt<1>, c_out : UInt<1>, pg : UInt<1>, gg : UInt<1>, cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}[3]}
    
    node _io_pg_T = and(UInt<1>("h01"), io.cpg[0].p) @[CLA.scala 19:47]
    node _io_pg_T_1 = and(_io_pg_T, io.cpg[1].p) @[CLA.scala 19:47]
    node _io_pg_T_2 = and(_io_pg_T_1, io.cpg[2].p) @[CLA.scala 19:47]
    io.pg <= _io_pg_T_2 @[CLA.scala 19:9]
    node _io_gg_T = and(io.cpg[0].g, io.cpg[1].p) @[CLA.scala 25:8]
    node _io_gg_T_1 = or(_io_gg_T, io.cpg[1].g) @[CLA.scala 25:15]
    node _io_gg_T_2 = and(_io_gg_T_1, io.cpg[2].p) @[CLA.scala 25:8]
    node _io_gg_T_3 = or(_io_gg_T_2, io.cpg[2].g) @[CLA.scala 25:15]
    io.gg <= _io_gg_T_3 @[CLA.scala 24:9]
    node _io_c_out_T = and(io.c_in, io.pg) @[CLA.scala 28:24]
    node _io_c_out_T_1 = or(_io_c_out_T, io.gg) @[CLA.scala 28:33]
    io.c_out <= _io_c_out_T_1 @[CLA.scala 28:12]
    io.cpg[0].carry <= io.c_in @[CLA.scala 30:19]
    node _io_cpg_1_carry_T = and(io.cpg[0].carry, io.cpg[0].p) @[CLA.scala 32:47]
    node _io_cpg_1_carry_T_1 = or(_io_cpg_1_carry_T, io.cpg[0].g) @[CLA.scala 32:66]
    io.cpg[1].carry <= _io_cpg_1_carry_T_1 @[CLA.scala 32:23]
    node _io_cpg_2_carry_T = and(io.cpg[1].carry, io.cpg[1].p) @[CLA.scala 32:47]
    node _io_cpg_2_carry_T_1 = or(_io_cpg_2_carry_T, io.cpg[1].g) @[CLA.scala 32:66]
    io.cpg[2].carry <= _io_cpg_2_carry_T_1 @[CLA.scala 32:23]
    
