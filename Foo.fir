;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit Foo : 
  module Foo : 
    input clock : Clock
    input reset : UInt<1>
    output io : {out : UInt<12>}
    
    wire vec : {1 : UInt<4>[2], 0 : UInt<4>} @[main.scala 52:17]
    wire subvec : UInt<4>[2] @[main.scala 53:20]
    vec.1[0] <= subvec[0] @[main.scala 54:10]
    vec.1[1] <= subvec[1] @[main.scala 54:10]
    vec.0 <= UInt<4>("h05") @[main.scala 56:10]
    subvec[0] <= UInt<4>("h00") @[main.scala 57:13]
    subvec[1] <= UInt<4>("h0f") @[main.scala 58:13]
    node io_out_hi = cat(vec.1[1], vec.1[0]) @[main.scala 60:17]
    node _io_out_T = cat(io_out_hi, vec.0) @[main.scala 60:17]
    io.out <= _io_out_T @[main.scala 60:10]
    
