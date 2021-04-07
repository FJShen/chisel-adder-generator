;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit SimpleAdder : 
  module CLA : 
    input clock : Clock
    input reset : Reset
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
    
  module FullAdder : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, flip c : UInt<1>, s : UInt<1>, p : UInt<1>, g : UInt<1>}
    
    node _io_s_T = xor(io.a, io.b) @[FullAdder.scala 27:16]
    node _io_s_T_1 = xor(_io_s_T, io.c) @[FullAdder.scala 27:23]
    io.s <= _io_s_T_1 @[FullAdder.scala 27:8]
    node _io_p_T = or(io.a, io.b) @[FullAdder.scala 28:16]
    io.p <= _io_p_T @[FullAdder.scala 28:8]
    node _io_g_T = and(io.a, io.b) @[FullAdder.scala 29:16]
    io.g <= _io_g_T @[FullAdder.scala 29:8]
    
  module FullAdder_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, flip c : UInt<1>, s : UInt<1>, p : UInt<1>, g : UInt<1>}
    
    node _io_s_T = xor(io.a, io.b) @[FullAdder.scala 27:16]
    node _io_s_T_1 = xor(_io_s_T, io.c) @[FullAdder.scala 27:23]
    io.s <= _io_s_T_1 @[FullAdder.scala 27:8]
    node _io_p_T = or(io.a, io.b) @[FullAdder.scala 28:16]
    io.p <= _io_p_T @[FullAdder.scala 28:8]
    node _io_g_T = and(io.a, io.b) @[FullAdder.scala 29:16]
    io.g <= _io_g_T @[FullAdder.scala 29:8]
    
  module FullAdder_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, flip c : UInt<1>, s : UInt<1>, p : UInt<1>, g : UInt<1>}
    
    node _io_s_T = xor(io.a, io.b) @[FullAdder.scala 27:16]
    node _io_s_T_1 = xor(_io_s_T, io.c) @[FullAdder.scala 27:23]
    io.s <= _io_s_T_1 @[FullAdder.scala 27:8]
    node _io_p_T = or(io.a, io.b) @[FullAdder.scala 28:16]
    io.p <= _io_p_T @[FullAdder.scala 28:8]
    node _io_g_T = and(io.a, io.b) @[FullAdder.scala 29:16]
    io.g <= _io_g_T @[FullAdder.scala 29:8]
    
  module SimpleAdder : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<3>, flip b : UInt<3>, flip c_in : UInt<1>, s : UInt<3>, c_out : UInt<1>, pg : UInt<1>, gg : UInt<1>}
    
    inst cla_inst of CLA @[SimpleAdder.scala 18:26]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    inst adder_inst_0 of FullAdder @[SimpleAdder.scala 19:41]
    adder_inst_0.clock <= clock
    adder_inst_0.reset <= reset
    inst adder_inst_1 of FullAdder_1 @[SimpleAdder.scala 19:41]
    adder_inst_1.clock <= clock
    adder_inst_1.reset <= reset
    inst adder_inst_2 of FullAdder_2 @[SimpleAdder.scala 19:41]
    adder_inst_2.clock <= clock
    adder_inst_2.reset <= reset
    wire s_vec : UInt<1>[3] @[SimpleAdder.scala 22:21]
    node _adder_inst_0_io_a_T = bits(io.a, 0, 0) @[SimpleAdder.scala 24:37]
    adder_inst_0.io.a <= _adder_inst_0_io_a_T @[SimpleAdder.scala 24:30]
    node _adder_inst_0_io_b_T = bits(io.b, 0, 0) @[SimpleAdder.scala 25:37]
    adder_inst_0.io.b <= _adder_inst_0_io_b_T @[SimpleAdder.scala 25:30]
    s_vec[0] <= adder_inst_0.io.s @[SimpleAdder.scala 26:20]
    node _adder_inst_1_io_a_T = bits(io.a, 1, 1) @[SimpleAdder.scala 24:37]
    adder_inst_1.io.a <= _adder_inst_1_io_a_T @[SimpleAdder.scala 24:30]
    node _adder_inst_1_io_b_T = bits(io.b, 1, 1) @[SimpleAdder.scala 25:37]
    adder_inst_1.io.b <= _adder_inst_1_io_b_T @[SimpleAdder.scala 25:30]
    s_vec[1] <= adder_inst_1.io.s @[SimpleAdder.scala 26:20]
    node _adder_inst_2_io_a_T = bits(io.a, 2, 2) @[SimpleAdder.scala 24:37]
    adder_inst_2.io.a <= _adder_inst_2_io_a_T @[SimpleAdder.scala 24:30]
    node _adder_inst_2_io_b_T = bits(io.b, 2, 2) @[SimpleAdder.scala 25:37]
    adder_inst_2.io.b <= _adder_inst_2_io_b_T @[SimpleAdder.scala 25:30]
    s_vec[2] <= adder_inst_2.io.s @[SimpleAdder.scala 26:20]
    node io_s_hi = cat(s_vec[2], s_vec[1]) @[SimpleAdder.scala 28:25]
    node _io_s_T = cat(io_s_hi, s_vec[0]) @[SimpleAdder.scala 28:25]
    io.s <= _io_s_T @[SimpleAdder.scala 28:10]
    wire c_vec : UInt<1>[4] @[SimpleAdder.scala 30:21]
    c_vec[0] <= io.c_in @[SimpleAdder.scala 31:14]
    c_vec[1] <= cla_inst.io.c_out[0] @[SimpleAdder.scala 33:20]
    c_vec[2] <= cla_inst.io.c_out[1] @[SimpleAdder.scala 33:20]
    c_vec[3] <= cla_inst.io.c_out[2] @[SimpleAdder.scala 33:20]
    io.c_out <= c_vec[3] @[SimpleAdder.scala 35:14]
    cla_inst.io.c_in <= c_vec[0] @[SimpleAdder.scala 36:22]
    adder_inst_0.io.c <= c_vec[0] @[SimpleAdder.scala 40:30]
    adder_inst_1.io.c <= c_vec[1] @[SimpleAdder.scala 40:30]
    adder_inst_2.io.c <= c_vec[2] @[SimpleAdder.scala 40:30]
    cla_inst.io.p[0] <= adder_inst_0.io.p @[SimpleAdder.scala 44:28]
    cla_inst.io.g[0] <= adder_inst_0.io.g @[SimpleAdder.scala 45:28]
    cla_inst.io.p[1] <= adder_inst_1.io.p @[SimpleAdder.scala 44:28]
    cla_inst.io.g[1] <= adder_inst_1.io.g @[SimpleAdder.scala 45:28]
    cla_inst.io.p[2] <= adder_inst_2.io.p @[SimpleAdder.scala 44:28]
    cla_inst.io.g[2] <= adder_inst_2.io.g @[SimpleAdder.scala 45:28]
    io.pg <= cla_inst.io.pg @[SimpleAdder.scala 49:11]
    io.gg <= cla_inst.io.gg @[SimpleAdder.scala 50:11]
    
