;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CLAAdder_8 : 
  module CLA : 
    input clock : Clock
    input reset : Reset
    output io : {flip c_in : UInt<1>, c_out : UInt<1>, pg : UInt<1>, gg : UInt<1>, cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}[2]}
    
    node _io_pg_T = and(UInt<1>("h01"), io.cpg[0].p) @[CLA.scala 17:51]
    node _io_pg_T_1 = and(_io_pg_T, io.cpg[1].p) @[CLA.scala 17:51]
    io.pg <= _io_pg_T_1 @[CLA.scala 17:9]
    node _io_gg_T = and(io.cpg[0].g, io.cpg[1].p) @[CLA.scala 23:8]
    node _io_gg_T_1 = or(_io_gg_T, io.cpg[1].g) @[CLA.scala 23:15]
    io.gg <= _io_gg_T_1 @[CLA.scala 22:9]
    node _io_c_out_T = and(io.c_in, io.pg) @[CLA.scala 26:24]
    node _io_c_out_T_1 = or(_io_c_out_T, io.gg) @[CLA.scala 26:33]
    io.c_out <= _io_c_out_T_1 @[CLA.scala 26:12]
    io.cpg[0].carry <= io.c_in @[CLA.scala 28:19]
    node _io_cpg_1_carry_T = and(io.cpg[0].carry, io.cpg[0].p) @[CLA.scala 30:47]
    node _io_cpg_1_carry_T_1 = or(_io_cpg_1_carry_T, io.cpg[0].g) @[CLA.scala 30:66]
    io.cpg[1].carry <= _io_cpg_1_carry_T_1 @[CLA.scala 30:23]
    
  module CLA_1 : 
    input clock : Clock
    input reset : Reset
    output io : {flip c_in : UInt<1>, c_out : UInt<1>, pg : UInt<1>, gg : UInt<1>, cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}[4]}
    
    node _io_pg_T = and(UInt<1>("h01"), io.cpg[0].p) @[CLA.scala 17:51]
    node _io_pg_T_1 = and(_io_pg_T, io.cpg[1].p) @[CLA.scala 17:51]
    node _io_pg_T_2 = and(_io_pg_T_1, io.cpg[2].p) @[CLA.scala 17:51]
    node _io_pg_T_3 = and(_io_pg_T_2, io.cpg[3].p) @[CLA.scala 17:51]
    io.pg <= _io_pg_T_3 @[CLA.scala 17:9]
    node _io_gg_T = and(io.cpg[0].g, io.cpg[1].p) @[CLA.scala 23:8]
    node _io_gg_T_1 = or(_io_gg_T, io.cpg[1].g) @[CLA.scala 23:15]
    node _io_gg_T_2 = and(_io_gg_T_1, io.cpg[2].p) @[CLA.scala 23:8]
    node _io_gg_T_3 = or(_io_gg_T_2, io.cpg[2].g) @[CLA.scala 23:15]
    node _io_gg_T_4 = and(_io_gg_T_3, io.cpg[3].p) @[CLA.scala 23:8]
    node _io_gg_T_5 = or(_io_gg_T_4, io.cpg[3].g) @[CLA.scala 23:15]
    io.gg <= _io_gg_T_5 @[CLA.scala 22:9]
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
    node _io_cpg_3_carry_T = and(io.cpg[2].carry, io.cpg[2].p) @[CLA.scala 30:47]
    node _io_cpg_3_carry_T_1 = or(_io_cpg_3_carry_T, io.cpg[2].g) @[CLA.scala 30:66]
    io.cpg[3].carry <= _io_cpg_3_carry_T_1 @[CLA.scala 30:23]
    
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
    
    inst fa_inst of FullAdder @[CLAAdder.scala 21:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 22:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 23:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 24:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 25:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 25:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 25:22]
    
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
    
    inst fa_inst of FullAdder_1 @[CLAAdder.scala 21:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 22:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 23:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 24:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 25:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 25:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 25:22]
    
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
    
    inst fa_inst of FullAdder_2 @[CLAAdder.scala 21:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 22:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 23:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 24:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 25:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 25:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 25:22]
    
  module FullAdder_3 : 
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
    
  module CLAAdder_3 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_3 @[CLAAdder.scala 21:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 22:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 23:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 24:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 25:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 25:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 25:22]
    
  module CLAAdder_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<4>, flip b : UInt<4>, s : UInt<4>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst cla_inst of CLA_1 @[CLAAdder.scala 33:28]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    cla_inst.io.c_in <= io.cpg.carry @[CLAAdder.scala 34:24]
    io.cpg.p <= cla_inst.io.pg @[CLAAdder.scala 35:22]
    io.cpg.g <= cla_inst.io.gg @[CLAAdder.scala 36:22]
    inst adder_insts_0 of CLAAdder @[CLAAdder.scala 39:64]
    adder_insts_0.clock <= clock
    adder_insts_0.reset <= reset
    inst adder_insts_1 of CLAAdder_1 @[CLAAdder.scala 39:64]
    adder_insts_1.clock <= clock
    adder_insts_1.reset <= reset
    inst adder_insts_2 of CLAAdder_2 @[CLAAdder.scala 39:64]
    adder_insts_2.clock <= clock
    adder_insts_2.reset <= reset
    inst adder_insts_3 of CLAAdder_3 @[CLAAdder.scala 39:64]
    adder_insts_3.clock <= clock
    adder_insts_3.reset <= reset
    wire sum_collector : UInt<1>[4] @[CLAAdder.scala 41:31]
    node _adder_insts_0_io_a_T = bits(io.a, 0, 0) @[CLAAdder.scala 44:26]
    adder_insts_0.io.a <= _adder_insts_0_io_a_T @[CLAAdder.scala 44:19]
    node _adder_insts_0_io_b_T = bits(io.b, 0, 0) @[CLAAdder.scala 45:26]
    adder_insts_0.io.b <= _adder_insts_0_io_b_T @[CLAAdder.scala 45:19]
    sum_collector[0] <= adder_insts_0.io.s @[CLAAdder.scala 46:28]
    cla_inst.io.cpg[0].g <= adder_insts_0.io.cpg.g @[CLAAdder.scala 47:21]
    cla_inst.io.cpg[0].p <= adder_insts_0.io.cpg.p @[CLAAdder.scala 47:21]
    adder_insts_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 47:21]
    node _adder_insts_1_io_a_T = bits(io.a, 1, 1) @[CLAAdder.scala 44:26]
    adder_insts_1.io.a <= _adder_insts_1_io_a_T @[CLAAdder.scala 44:19]
    node _adder_insts_1_io_b_T = bits(io.b, 1, 1) @[CLAAdder.scala 45:26]
    adder_insts_1.io.b <= _adder_insts_1_io_b_T @[CLAAdder.scala 45:19]
    sum_collector[1] <= adder_insts_1.io.s @[CLAAdder.scala 46:28]
    cla_inst.io.cpg[1].g <= adder_insts_1.io.cpg.g @[CLAAdder.scala 47:21]
    cla_inst.io.cpg[1].p <= adder_insts_1.io.cpg.p @[CLAAdder.scala 47:21]
    adder_insts_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 47:21]
    node _adder_insts_2_io_a_T = bits(io.a, 2, 2) @[CLAAdder.scala 44:26]
    adder_insts_2.io.a <= _adder_insts_2_io_a_T @[CLAAdder.scala 44:19]
    node _adder_insts_2_io_b_T = bits(io.b, 2, 2) @[CLAAdder.scala 45:26]
    adder_insts_2.io.b <= _adder_insts_2_io_b_T @[CLAAdder.scala 45:19]
    sum_collector[2] <= adder_insts_2.io.s @[CLAAdder.scala 46:28]
    cla_inst.io.cpg[2].g <= adder_insts_2.io.cpg.g @[CLAAdder.scala 47:21]
    cla_inst.io.cpg[2].p <= adder_insts_2.io.cpg.p @[CLAAdder.scala 47:21]
    adder_insts_2.io.cpg.carry <= cla_inst.io.cpg[2].carry @[CLAAdder.scala 47:21]
    node _adder_insts_3_io_a_T = bits(io.a, 3, 3) @[CLAAdder.scala 44:26]
    adder_insts_3.io.a <= _adder_insts_3_io_a_T @[CLAAdder.scala 44:19]
    node _adder_insts_3_io_b_T = bits(io.b, 3, 3) @[CLAAdder.scala 45:26]
    adder_insts_3.io.b <= _adder_insts_3_io_b_T @[CLAAdder.scala 45:19]
    sum_collector[3] <= adder_insts_3.io.s @[CLAAdder.scala 46:28]
    cla_inst.io.cpg[3].g <= adder_insts_3.io.cpg.g @[CLAAdder.scala 47:21]
    cla_inst.io.cpg[3].p <= adder_insts_3.io.cpg.p @[CLAAdder.scala 47:21]
    adder_insts_3.io.cpg.carry <= cla_inst.io.cpg[3].carry @[CLAAdder.scala 47:21]
    node io_s_lo = cat(sum_collector[1], sum_collector[0]) @[CLAAdder.scala 50:35]
    node io_s_hi = cat(sum_collector[3], sum_collector[2]) @[CLAAdder.scala 50:35]
    node _io_s_T = cat(io_s_hi, io_s_lo) @[CLAAdder.scala 50:35]
    io.s <= _io_s_T @[CLAAdder.scala 50:12]
    
  module CLA_2 : 
    input clock : Clock
    input reset : Reset
    output io : {flip c_in : UInt<1>, c_out : UInt<1>, pg : UInt<1>, gg : UInt<1>, cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}[2]}
    
    node _io_pg_T = and(UInt<1>("h01"), io.cpg[0].p) @[CLA.scala 17:51]
    node _io_pg_T_1 = and(_io_pg_T, io.cpg[1].p) @[CLA.scala 17:51]
    io.pg <= _io_pg_T_1 @[CLA.scala 17:9]
    node _io_gg_T = and(io.cpg[0].g, io.cpg[1].p) @[CLA.scala 23:8]
    node _io_gg_T_1 = or(_io_gg_T, io.cpg[1].g) @[CLA.scala 23:15]
    io.gg <= _io_gg_T_1 @[CLA.scala 22:9]
    node _io_c_out_T = and(io.c_in, io.pg) @[CLA.scala 26:24]
    node _io_c_out_T_1 = or(_io_c_out_T, io.gg) @[CLA.scala 26:33]
    io.c_out <= _io_c_out_T_1 @[CLA.scala 26:12]
    io.cpg[0].carry <= io.c_in @[CLA.scala 28:19]
    node _io_cpg_1_carry_T = and(io.cpg[0].carry, io.cpg[0].p) @[CLA.scala 30:47]
    node _io_cpg_1_carry_T_1 = or(_io_cpg_1_carry_T, io.cpg[0].g) @[CLA.scala 30:66]
    io.cpg[1].carry <= _io_cpg_1_carry_T_1 @[CLA.scala 30:23]
    
  module FullAdder_4 : 
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
    
  module CLAAdder_5 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_4 @[CLAAdder.scala 21:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 22:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 23:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 24:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 25:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 25:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 25:22]
    
  module FullAdder_5 : 
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
    
  module CLAAdder_6 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_5 @[CLAAdder.scala 21:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 22:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 23:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 24:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 25:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 25:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 25:22]
    
  module CLAAdder_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<2>, flip b : UInt<2>, s : UInt<2>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst cla_inst of CLA_2 @[CLAAdder.scala 33:28]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    cla_inst.io.c_in <= io.cpg.carry @[CLAAdder.scala 34:24]
    io.cpg.p <= cla_inst.io.pg @[CLAAdder.scala 35:22]
    io.cpg.g <= cla_inst.io.gg @[CLAAdder.scala 36:22]
    inst adder_insts_0 of CLAAdder_5 @[CLAAdder.scala 39:64]
    adder_insts_0.clock <= clock
    adder_insts_0.reset <= reset
    inst adder_insts_1 of CLAAdder_6 @[CLAAdder.scala 39:64]
    adder_insts_1.clock <= clock
    adder_insts_1.reset <= reset
    wire sum_collector : UInt<1>[2] @[CLAAdder.scala 41:31]
    node _adder_insts_0_io_a_T = bits(io.a, 0, 0) @[CLAAdder.scala 44:26]
    adder_insts_0.io.a <= _adder_insts_0_io_a_T @[CLAAdder.scala 44:19]
    node _adder_insts_0_io_b_T = bits(io.b, 0, 0) @[CLAAdder.scala 45:26]
    adder_insts_0.io.b <= _adder_insts_0_io_b_T @[CLAAdder.scala 45:19]
    sum_collector[0] <= adder_insts_0.io.s @[CLAAdder.scala 46:28]
    cla_inst.io.cpg[0].g <= adder_insts_0.io.cpg.g @[CLAAdder.scala 47:21]
    cla_inst.io.cpg[0].p <= adder_insts_0.io.cpg.p @[CLAAdder.scala 47:21]
    adder_insts_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 47:21]
    node _adder_insts_1_io_a_T = bits(io.a, 1, 1) @[CLAAdder.scala 44:26]
    adder_insts_1.io.a <= _adder_insts_1_io_a_T @[CLAAdder.scala 44:19]
    node _adder_insts_1_io_b_T = bits(io.b, 1, 1) @[CLAAdder.scala 45:26]
    adder_insts_1.io.b <= _adder_insts_1_io_b_T @[CLAAdder.scala 45:19]
    sum_collector[1] <= adder_insts_1.io.s @[CLAAdder.scala 46:28]
    cla_inst.io.cpg[1].g <= adder_insts_1.io.cpg.g @[CLAAdder.scala 47:21]
    cla_inst.io.cpg[1].p <= adder_insts_1.io.cpg.p @[CLAAdder.scala 47:21]
    adder_insts_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 47:21]
    node _io_s_T = cat(sum_collector[1], sum_collector[0]) @[CLAAdder.scala 50:35]
    io.s <= _io_s_T @[CLAAdder.scala 50:12]
    
  module CLAAdder_8 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<6>, flip b : UInt<6>, s : UInt<6>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst cla_inst of CLA @[CLAAdder.scala 65:28]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    inst whole_granularity_adders_0 of CLAAdder_4 @[CLAAdder.scala 68:104]
    whole_granularity_adders_0.clock <= clock
    whole_granularity_adders_0.reset <= reset
    inst leftover_adder of CLAAdder_7 @[CLAAdder.scala 70:34]
    leftover_adder.clock <= clock
    leftover_adder.reset <= reset
    wire sum_collector : UInt<4>[1] @[CLAAdder.scala 72:31]
    wire io_s_hi : UInt<2> @[CLAAdder.scala 73:30]
    node _whole_granularity_adders_0_io_a_T = bits(io.a, 3, 0) @[CLAAdder.scala 77:26]
    whole_granularity_adders_0.io.a <= _whole_granularity_adders_0_io_a_T @[CLAAdder.scala 77:19]
    node _whole_granularity_adders_0_io_b_T = bits(io.b, 3, 0) @[CLAAdder.scala 78:26]
    whole_granularity_adders_0.io.b <= _whole_granularity_adders_0_io_b_T @[CLAAdder.scala 78:19]
    sum_collector[0] <= whole_granularity_adders_0.io.s @[CLAAdder.scala 79:40]
    cla_inst.io.cpg[0].g <= whole_granularity_adders_0.io.cpg.g @[CLAAdder.scala 80:21]
    cla_inst.io.cpg[0].p <= whole_granularity_adders_0.io.cpg.p @[CLAAdder.scala 80:21]
    whole_granularity_adders_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 80:21]
    node _leftover_adder_io_a_T = bits(io.a, 5, 4) @[CLAAdder.scala 83:34]
    leftover_adder.io.a <= _leftover_adder_io_a_T @[CLAAdder.scala 83:27]
    node _leftover_adder_io_b_T = bits(io.b, 5, 4) @[CLAAdder.scala 84:34]
    leftover_adder.io.b <= _leftover_adder_io_b_T @[CLAAdder.scala 84:27]
    io_s_hi <= leftover_adder.io.s @[CLAAdder.scala 85:20]
    cla_inst.io.cpg[1].g <= leftover_adder.io.cpg.g @[CLAAdder.scala 86:39]
    cla_inst.io.cpg[1].p <= leftover_adder.io.cpg.p @[CLAAdder.scala 86:39]
    leftover_adder.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 86:39]
    node _io_s_T = cat(io_s_hi, sum_collector[0]) @[Cat.scala 30:58]
    io.s <= _io_s_T @[CLAAdder.scala 87:12]
    cla_inst.io.c_in <= io.cpg.carry @[CLAAdder.scala 89:24]
    io.cpg.p <= cla_inst.io.pg @[CLAAdder.scala 90:22]
    io.cpg.g <= cla_inst.io.gg @[CLAAdder.scala 91:22]
    
