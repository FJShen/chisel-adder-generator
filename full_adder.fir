;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit full_adder : 
  module full_adder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<1>, flip b : UInt<1>, flip c : UInt<1>, s : UInt<1>, p : UInt<1>, g : UInt<1>}
    
    node _io_s_T = xor(io.a, io.b) @[full_adder.scala 15:16]
    node _io_s_T_1 = xor(_io_s_T, io.c) @[full_adder.scala 15:23]
    io.s <= _io_s_T_1 @[full_adder.scala 15:8]
    node _io_p_T = or(io.a, io.b) @[full_adder.scala 16:16]
    io.p <= _io_p_T @[full_adder.scala 16:8]
    node _io_g_T = and(io.a, io.b) @[full_adder.scala 17:16]
    io.g <= _io_g_T @[full_adder.scala 17:8]
    
