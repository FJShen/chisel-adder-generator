;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit SimpleAdder : 
  module CLA : 
    input clock : Clock
    input reset : Reset
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
    
  module FullAdder : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    node _io_s_T = xor(io.a, io.b) @[FullAdder.scala 33:16]
    node _io_s_T_1 = xor(_io_s_T, io.cpg.carry) @[FullAdder.scala 33:23]
    io.s <= _io_s_T_1 @[FullAdder.scala 33:8]
    node _io_cpg_p_T = or(io.a, io.b) @[FullAdder.scala 34:13]
    io.cpg.p <= _io_cpg_p_T @[FullAdder.scala 34:5]
    node _io_cpg_g_T = and(io.a, io.b) @[FullAdder.scala 35:13]
    io.cpg.g <= _io_cpg_g_T @[FullAdder.scala 35:5]
    
  module FullAdder_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    node _io_s_T = xor(io.a, io.b) @[FullAdder.scala 33:16]
    node _io_s_T_1 = xor(_io_s_T, io.cpg.carry) @[FullAdder.scala 33:23]
    io.s <= _io_s_T_1 @[FullAdder.scala 33:8]
    node _io_cpg_p_T = or(io.a, io.b) @[FullAdder.scala 34:13]
    io.cpg.p <= _io_cpg_p_T @[FullAdder.scala 34:5]
    node _io_cpg_g_T = and(io.a, io.b) @[FullAdder.scala 35:13]
    io.cpg.g <= _io_cpg_g_T @[FullAdder.scala 35:5]
    
  module FullAdder_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    node _io_s_T = xor(io.a, io.b) @[FullAdder.scala 33:16]
    node _io_s_T_1 = xor(_io_s_T, io.cpg.carry) @[FullAdder.scala 33:23]
    io.s <= _io_s_T_1 @[FullAdder.scala 33:8]
    node _io_cpg_p_T = or(io.a, io.b) @[FullAdder.scala 34:13]
    io.cpg.p <= _io_cpg_p_T @[FullAdder.scala 34:5]
    node _io_cpg_g_T = and(io.a, io.b) @[FullAdder.scala 35:13]
    io.cpg.g <= _io_cpg_g_T @[FullAdder.scala 35:5]
    
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
    cla_inst.io.cpg[0].g <= adder_inst_0.io.cpg.g @[SimpleAdder.scala 31:32]
    cla_inst.io.cpg[0].p <= adder_inst_0.io.cpg.p @[SimpleAdder.scala 31:32]
    adder_inst_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[SimpleAdder.scala 31:32]
    cla_inst.io.cpg[1].g <= adder_inst_1.io.cpg.g @[SimpleAdder.scala 31:32]
    cla_inst.io.cpg[1].p <= adder_inst_1.io.cpg.p @[SimpleAdder.scala 31:32]
    adder_inst_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[SimpleAdder.scala 31:32]
    cla_inst.io.cpg[2].g <= adder_inst_2.io.cpg.g @[SimpleAdder.scala 31:32]
    cla_inst.io.cpg[2].p <= adder_inst_2.io.cpg.p @[SimpleAdder.scala 31:32]
    adder_inst_2.io.cpg.carry <= cla_inst.io.cpg[2].carry @[SimpleAdder.scala 31:32]
    cla_inst.io.c_in <= io.c_in @[SimpleAdder.scala 33:22]
    io.c_out <= cla_inst.io.c_out @[SimpleAdder.scala 34:14]
    io.pg <= cla_inst.io.pg @[SimpleAdder.scala 36:11]
    io.gg <= cla_inst.io.gg @[SimpleAdder.scala 37:11]
    
