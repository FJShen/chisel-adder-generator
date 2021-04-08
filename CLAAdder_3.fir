;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CLAAdder_3 : 
  module CLA : 
    input clock : Clock
    input reset : Reset
    output io : {flip c_in : UInt<1>, c_out : UInt<1>, pg : UInt<1>, gg : UInt<1>, cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}[3]}
    
    node _io_pg_T = and(UInt<1>("h01"), io.cpg[0].p) @[CLA.scala 17:51]
    node _io_pg_T_1 = and(_io_pg_T, io.cpg[1].p) @[CLA.scala 17:51]
    node _io_pg_T_2 = and(_io_pg_T_1, io.cpg[2].p) @[CLA.scala 17:51]
    io.pg <= _io_pg_T_2 @[CLA.scala 17:9]
    node _io_gg_T = and(io.cpg[0].g, io.cpg[1].p) @[CLA.scala 23:8]
    node _io_gg_T_1 = or(_io_gg_T, io.cpg[1].g) @[CLA.scala 23:15]
    node _io_gg_T_2 = and(_io_gg_T_1, io.cpg[2].p) @[CLA.scala 23:8]
    node _io_gg_T_3 = or(_io_gg_T_2, io.cpg[2].g) @[CLA.scala 23:15]
    io.gg <= _io_gg_T_3 @[CLA.scala 22:9]
    node _io_c_out_T = and(io.c_in, io.pg) @[CLA.scala 26:24]
    node _io_c_out_T_1 = or(_io_c_out_T, io.gg) @[CLA.scala 26:33]
    io.c_out <= _io_c_out_T_1 @[CLA.scala 26:12]
    io.cpg[0].carry <= io.c_in @[CLA.scala 28:19]
    node _io_cpg_1_carry_T = and(io.cpg[0].carry, io.cpg[0].p) @[CLA.scala 30:47]
    node _io_cpg_1_carry_T_1 = or(_io_cpg_1_carry_T, io.cpg[0].g) @[CLA.scala 30:66]
    io.cpg[1].carry <= _io_cpg_1_carry_T_1 @[CLA.scala 30:23]
    node _io_cpg_2_carry_T = and(io.cpg[1].carry, io.cpg[1].p) @[CLA.scala 30:47]
    node _io_cpg_2_carry_T_1 = or(_io_cpg_2_carry_T, io.cpg[1].g) @[CLA.scala 30:66]
    io.cpg[2].carry <= _io_cpg_2_carry_T_1 @[CLA.scala 30:23]
    
  module FullAdder : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    node _io_s_T = xor(io.a, io.b) @[FullAdder.scala 30:16]
    node _io_s_T_1 = xor(_io_s_T, io.cpg.carry) @[FullAdder.scala 30:23]
    io.s <= _io_s_T_1 @[FullAdder.scala 30:8]
    node _io_cpg_p_T = or(io.a, io.b) @[FullAdder.scala 31:13]
    io.cpg.p <= _io_cpg_p_T @[FullAdder.scala 31:5]
    node _io_cpg_g_T = and(io.a, io.b) @[FullAdder.scala 32:13]
    io.cpg.g <= _io_cpg_g_T @[FullAdder.scala 32:5]
    
  module CLAAdder : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder @[CLAAdder.scala 18:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 19:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 20:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 21:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 22:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 22:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 22:22]
    
  module FullAdder_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    node _io_s_T = xor(io.a, io.b) @[FullAdder.scala 30:16]
    node _io_s_T_1 = xor(_io_s_T, io.cpg.carry) @[FullAdder.scala 30:23]
    io.s <= _io_s_T_1 @[FullAdder.scala 30:8]
    node _io_cpg_p_T = or(io.a, io.b) @[FullAdder.scala 31:13]
    io.cpg.p <= _io_cpg_p_T @[FullAdder.scala 31:5]
    node _io_cpg_g_T = and(io.a, io.b) @[FullAdder.scala 32:13]
    io.cpg.g <= _io_cpg_g_T @[FullAdder.scala 32:5]
    
  module CLAAdder_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_1 @[CLAAdder.scala 18:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 19:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 20:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 21:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 22:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 22:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 22:22]
    
  module FullAdder_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    node _io_s_T = xor(io.a, io.b) @[FullAdder.scala 30:16]
    node _io_s_T_1 = xor(_io_s_T, io.cpg.carry) @[FullAdder.scala 30:23]
    io.s <= _io_s_T_1 @[FullAdder.scala 30:8]
    node _io_cpg_p_T = or(io.a, io.b) @[FullAdder.scala 31:13]
    io.cpg.p <= _io_cpg_p_T @[FullAdder.scala 31:5]
    node _io_cpg_g_T = and(io.a, io.b) @[FullAdder.scala 32:13]
    io.cpg.g <= _io_cpg_g_T @[FullAdder.scala 32:5]
    
  module CLAAdder_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_2 @[CLAAdder.scala 18:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 19:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 20:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 21:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 22:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 22:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 22:22]
    
  module CLAAdder_3 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<3>, flip b : UInt<3>, s : UInt<3>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst cla_inst of CLA @[CLAAdder.scala 25:28]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    inst adder_inst_0 of CLAAdder @[CLAAdder.scala 26:42]
    adder_inst_0.clock <= clock
    adder_inst_0.reset <= reset
    inst adder_inst_1 of CLAAdder_1 @[CLAAdder.scala 26:42]
    adder_inst_1.clock <= clock
    adder_inst_1.reset <= reset
    inst adder_inst_2 of CLAAdder_2 @[CLAAdder.scala 26:42]
    adder_inst_2.clock <= clock
    adder_inst_2.reset <= reset
    cla_inst.io.c_in <= io.cpg.carry @[CLAAdder.scala 31:24]
    wire sum_bit_collector : UInt<1>[3] @[CLAAdder.scala 34:35]
    sum_bit_collector[0] <= adder_inst_0.io.s @[CLAAdder.scala 35:75]
    sum_bit_collector[1] <= adder_inst_1.io.s @[CLAAdder.scala 35:75]
    sum_bit_collector[2] <= adder_inst_2.io.s @[CLAAdder.scala 35:75]
    node io_s_hi = cat(sum_bit_collector[2], sum_bit_collector[1]) @[CLAAdder.scala 36:39]
    node _io_s_T = cat(io_s_hi, sum_bit_collector[0]) @[CLAAdder.scala 36:39]
    io.s <= _io_s_T @[CLAAdder.scala 36:12]
    node _T = bits(io.a, 0, 0) @[CLAAdder.scala 39:46]
    node _T_1 = bits(io.a, 1, 1) @[CLAAdder.scala 39:46]
    node _T_2 = bits(io.a, 2, 2) @[CLAAdder.scala 39:46]
    adder_inst_0.io.a <= _T @[CLAAdder.scala 39:71]
    adder_inst_1.io.a <= _T_1 @[CLAAdder.scala 39:71]
    adder_inst_2.io.a <= _T_2 @[CLAAdder.scala 39:71]
    node _T_3 = bits(io.b, 0, 0) @[CLAAdder.scala 40:46]
    node _T_4 = bits(io.b, 1, 1) @[CLAAdder.scala 40:46]
    node _T_5 = bits(io.b, 2, 2) @[CLAAdder.scala 40:46]
    adder_inst_0.io.b <= _T_3 @[CLAAdder.scala 40:71]
    adder_inst_1.io.b <= _T_4 @[CLAAdder.scala 40:71]
    adder_inst_2.io.b <= _T_5 @[CLAAdder.scala 40:71]
    io.cpg.p <= cla_inst.io.pg @[CLAAdder.scala 43:16]
    io.cpg.g <= cla_inst.io.gg @[CLAAdder.scala 44:16]
    cla_inst.io.cpg[0].g <= adder_inst_0.io.cpg.g @[CLAAdder.scala 48:32]
    cla_inst.io.cpg[0].p <= adder_inst_0.io.cpg.p @[CLAAdder.scala 48:32]
    adder_inst_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 48:32]
    cla_inst.io.cpg[1].g <= adder_inst_1.io.cpg.g @[CLAAdder.scala 48:32]
    cla_inst.io.cpg[1].p <= adder_inst_1.io.cpg.p @[CLAAdder.scala 48:32]
    adder_inst_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 48:32]
    cla_inst.io.cpg[2].g <= adder_inst_2.io.cpg.g @[CLAAdder.scala 48:32]
    cla_inst.io.cpg[2].p <= adder_inst_2.io.cpg.p @[CLAAdder.scala 48:32]
    adder_inst_2.io.cpg.carry <= cla_inst.io.cpg[2].carry @[CLAAdder.scala 48:32]
    cla_inst.io.cpg[0].g <= adder_inst_0.io.cpg.g @[CLAAdder.scala 50:74]
    cla_inst.io.cpg[0].p <= adder_inst_0.io.cpg.p @[CLAAdder.scala 50:74]
    adder_inst_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 50:74]
    cla_inst.io.cpg[1].g <= adder_inst_1.io.cpg.g @[CLAAdder.scala 50:74]
    cla_inst.io.cpg[1].p <= adder_inst_1.io.cpg.p @[CLAAdder.scala 50:74]
    adder_inst_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 50:74]
    cla_inst.io.cpg[2].g <= adder_inst_2.io.cpg.g @[CLAAdder.scala 50:74]
    cla_inst.io.cpg[2].p <= adder_inst_2.io.cpg.p @[CLAAdder.scala 50:74]
    adder_inst_2.io.cpg.carry <= cla_inst.io.cpg[2].carry @[CLAAdder.scala 50:74]
    
