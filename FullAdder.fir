;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit FullAdder : 
  module FullAdder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    node _io_s_T = xor(io.a, io.b) @[FullAdder.scala 33:16]
    node _io_s_T_1 = xor(_io_s_T, io.cpg.carry) @[FullAdder.scala 33:23]
    io.s <= _io_s_T_1 @[FullAdder.scala 33:8]
    node _io_cpg_p_T = or(io.a, io.b) @[FullAdder.scala 34:13]
    io.cpg.p <= _io_cpg_p_T @[FullAdder.scala 34:5]
    node _io_cpg_g_T = and(io.a, io.b) @[FullAdder.scala 35:13]
    io.cpg.g <= _io_cpg_g_T @[FullAdder.scala 35:5]
    
