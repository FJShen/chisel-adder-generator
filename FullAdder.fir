;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit FullAdder : 
  module FullAdder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<1>, flip b : UInt<1>, flip c : UInt<1>, s : UInt<1>, p : UInt<1>, g : UInt<1>}
    
    node _io_s_T = xor(io.a, io.b) @[FullAdder.scala 27:16]
    node _io_s_T_1 = xor(_io_s_T, io.c) @[FullAdder.scala 27:23]
    io.s <= _io_s_T_1 @[FullAdder.scala 27:8]
    node _io_p_T = or(io.a, io.b) @[FullAdder.scala 28:16]
    io.p <= _io_p_T @[FullAdder.scala 28:8]
    node _io_g_T = and(io.a, io.b) @[FullAdder.scala 29:16]
    io.g <= _io_g_T @[FullAdder.scala 29:8]
    
