;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit CLAAdder_20 : 
  module CLA : 
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
    
    inst fa_inst of FullAdder @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
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
    
    inst fa_inst of FullAdder_1 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
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
    
    inst fa_inst of FullAdder_2 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
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
    
    inst fa_inst of FullAdder_3 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
  module CLAAdder_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<4>, flip b : UInt<4>, s : UInt<4>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst cla_inst of CLA_1 @[CLAAdder.scala 69:28]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    inst whole_granularity_adders_0 of CLAAdder @[CLAAdder.scala 72:104]
    whole_granularity_adders_0.clock <= clock
    whole_granularity_adders_0.reset <= reset
    inst whole_granularity_adders_1 of CLAAdder_1 @[CLAAdder.scala 72:104]
    whole_granularity_adders_1.clock <= clock
    whole_granularity_adders_1.reset <= reset
    inst whole_granularity_adders_2 of CLAAdder_2 @[CLAAdder.scala 72:104]
    whole_granularity_adders_2.clock <= clock
    whole_granularity_adders_2.reset <= reset
    inst whole_granularity_adders_3 of CLAAdder_3 @[CLAAdder.scala 72:104]
    whole_granularity_adders_3.clock <= clock
    whole_granularity_adders_3.reset <= reset
    wire sum_collector : UInt<1>[4] @[CLAAdder.scala 74:31]
    node _whole_granularity_adders_0_io_a_T = bits(io.a, 0, 0) @[CLAAdder.scala 79:26]
    whole_granularity_adders_0.io.a <= _whole_granularity_adders_0_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_0_io_b_T = bits(io.b, 0, 0) @[CLAAdder.scala 80:26]
    whole_granularity_adders_0.io.b <= _whole_granularity_adders_0_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[0] <= whole_granularity_adders_0.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[0].g <= whole_granularity_adders_0.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[0].p <= whole_granularity_adders_0.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_1_io_a_T = bits(io.a, 1, 1) @[CLAAdder.scala 79:26]
    whole_granularity_adders_1.io.a <= _whole_granularity_adders_1_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_1_io_b_T = bits(io.b, 1, 1) @[CLAAdder.scala 80:26]
    whole_granularity_adders_1.io.b <= _whole_granularity_adders_1_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[1] <= whole_granularity_adders_1.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[1].g <= whole_granularity_adders_1.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[1].p <= whole_granularity_adders_1.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_2_io_a_T = bits(io.a, 2, 2) @[CLAAdder.scala 79:26]
    whole_granularity_adders_2.io.a <= _whole_granularity_adders_2_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_2_io_b_T = bits(io.b, 2, 2) @[CLAAdder.scala 80:26]
    whole_granularity_adders_2.io.b <= _whole_granularity_adders_2_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[2] <= whole_granularity_adders_2.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[2].g <= whole_granularity_adders_2.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[2].p <= whole_granularity_adders_2.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_2.io.cpg.carry <= cla_inst.io.cpg[2].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_3_io_a_T = bits(io.a, 3, 3) @[CLAAdder.scala 79:26]
    whole_granularity_adders_3.io.a <= _whole_granularity_adders_3_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_3_io_b_T = bits(io.b, 3, 3) @[CLAAdder.scala 80:26]
    whole_granularity_adders_3.io.b <= _whole_granularity_adders_3_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[3] <= whole_granularity_adders_3.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[3].g <= whole_granularity_adders_3.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[3].p <= whole_granularity_adders_3.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_3.io.cpg.carry <= cla_inst.io.cpg[3].carry @[CLAAdder.scala 82:21]
    node io_s_lo = cat(sum_collector[1], sum_collector[0]) @[CLAAdder.scala 86:36]
    node io_s_hi = cat(sum_collector[3], sum_collector[2]) @[CLAAdder.scala 86:36]
    node _io_s_T = cat(io_s_hi, io_s_lo) @[CLAAdder.scala 86:36]
    io.s <= _io_s_T @[CLAAdder.scala 86:12]
    cla_inst.io.c_in <= io.cpg.carry @[CLAAdder.scala 88:24]
    io.cpg.p <= cla_inst.io.pg @[CLAAdder.scala 89:22]
    io.cpg.g <= cla_inst.io.gg @[CLAAdder.scala 90:22]
    
  module CLA_2 : 
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
    
    inst fa_inst of FullAdder_4 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
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
    
    inst fa_inst of FullAdder_5 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
  module FullAdder_6 : 
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
    
  module CLAAdder_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_6 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
  module FullAdder_7 : 
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
    
  module CLAAdder_8 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_7 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
  module CLAAdder_9 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<4>, flip b : UInt<4>, s : UInt<4>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst cla_inst of CLA_2 @[CLAAdder.scala 69:28]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    inst whole_granularity_adders_0 of CLAAdder_5 @[CLAAdder.scala 72:104]
    whole_granularity_adders_0.clock <= clock
    whole_granularity_adders_0.reset <= reset
    inst whole_granularity_adders_1 of CLAAdder_6 @[CLAAdder.scala 72:104]
    whole_granularity_adders_1.clock <= clock
    whole_granularity_adders_1.reset <= reset
    inst whole_granularity_adders_2 of CLAAdder_7 @[CLAAdder.scala 72:104]
    whole_granularity_adders_2.clock <= clock
    whole_granularity_adders_2.reset <= reset
    inst whole_granularity_adders_3 of CLAAdder_8 @[CLAAdder.scala 72:104]
    whole_granularity_adders_3.clock <= clock
    whole_granularity_adders_3.reset <= reset
    wire sum_collector : UInt<1>[4] @[CLAAdder.scala 74:31]
    node _whole_granularity_adders_0_io_a_T = bits(io.a, 0, 0) @[CLAAdder.scala 79:26]
    whole_granularity_adders_0.io.a <= _whole_granularity_adders_0_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_0_io_b_T = bits(io.b, 0, 0) @[CLAAdder.scala 80:26]
    whole_granularity_adders_0.io.b <= _whole_granularity_adders_0_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[0] <= whole_granularity_adders_0.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[0].g <= whole_granularity_adders_0.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[0].p <= whole_granularity_adders_0.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_1_io_a_T = bits(io.a, 1, 1) @[CLAAdder.scala 79:26]
    whole_granularity_adders_1.io.a <= _whole_granularity_adders_1_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_1_io_b_T = bits(io.b, 1, 1) @[CLAAdder.scala 80:26]
    whole_granularity_adders_1.io.b <= _whole_granularity_adders_1_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[1] <= whole_granularity_adders_1.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[1].g <= whole_granularity_adders_1.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[1].p <= whole_granularity_adders_1.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_2_io_a_T = bits(io.a, 2, 2) @[CLAAdder.scala 79:26]
    whole_granularity_adders_2.io.a <= _whole_granularity_adders_2_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_2_io_b_T = bits(io.b, 2, 2) @[CLAAdder.scala 80:26]
    whole_granularity_adders_2.io.b <= _whole_granularity_adders_2_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[2] <= whole_granularity_adders_2.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[2].g <= whole_granularity_adders_2.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[2].p <= whole_granularity_adders_2.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_2.io.cpg.carry <= cla_inst.io.cpg[2].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_3_io_a_T = bits(io.a, 3, 3) @[CLAAdder.scala 79:26]
    whole_granularity_adders_3.io.a <= _whole_granularity_adders_3_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_3_io_b_T = bits(io.b, 3, 3) @[CLAAdder.scala 80:26]
    whole_granularity_adders_3.io.b <= _whole_granularity_adders_3_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[3] <= whole_granularity_adders_3.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[3].g <= whole_granularity_adders_3.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[3].p <= whole_granularity_adders_3.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_3.io.cpg.carry <= cla_inst.io.cpg[3].carry @[CLAAdder.scala 82:21]
    node io_s_lo = cat(sum_collector[1], sum_collector[0]) @[CLAAdder.scala 86:36]
    node io_s_hi = cat(sum_collector[3], sum_collector[2]) @[CLAAdder.scala 86:36]
    node _io_s_T = cat(io_s_hi, io_s_lo) @[CLAAdder.scala 86:36]
    io.s <= _io_s_T @[CLAAdder.scala 86:12]
    cla_inst.io.c_in <= io.cpg.carry @[CLAAdder.scala 88:24]
    io.cpg.p <= cla_inst.io.pg @[CLAAdder.scala 89:22]
    io.cpg.g <= cla_inst.io.gg @[CLAAdder.scala 90:22]
    
  module CLA_3 : 
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
    
  module FullAdder_8 : 
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
    
  module CLAAdder_10 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_8 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
  module FullAdder_9 : 
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
    
  module CLAAdder_11 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_9 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
  module FullAdder_10 : 
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
    
  module CLAAdder_12 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_10 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
  module FullAdder_11 : 
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
    
  module CLAAdder_13 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_11 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
  module CLAAdder_14 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<4>, flip b : UInt<4>, s : UInt<4>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst cla_inst of CLA_3 @[CLAAdder.scala 69:28]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    inst whole_granularity_adders_0 of CLAAdder_10 @[CLAAdder.scala 72:104]
    whole_granularity_adders_0.clock <= clock
    whole_granularity_adders_0.reset <= reset
    inst whole_granularity_adders_1 of CLAAdder_11 @[CLAAdder.scala 72:104]
    whole_granularity_adders_1.clock <= clock
    whole_granularity_adders_1.reset <= reset
    inst whole_granularity_adders_2 of CLAAdder_12 @[CLAAdder.scala 72:104]
    whole_granularity_adders_2.clock <= clock
    whole_granularity_adders_2.reset <= reset
    inst whole_granularity_adders_3 of CLAAdder_13 @[CLAAdder.scala 72:104]
    whole_granularity_adders_3.clock <= clock
    whole_granularity_adders_3.reset <= reset
    wire sum_collector : UInt<1>[4] @[CLAAdder.scala 74:31]
    node _whole_granularity_adders_0_io_a_T = bits(io.a, 0, 0) @[CLAAdder.scala 79:26]
    whole_granularity_adders_0.io.a <= _whole_granularity_adders_0_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_0_io_b_T = bits(io.b, 0, 0) @[CLAAdder.scala 80:26]
    whole_granularity_adders_0.io.b <= _whole_granularity_adders_0_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[0] <= whole_granularity_adders_0.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[0].g <= whole_granularity_adders_0.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[0].p <= whole_granularity_adders_0.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_1_io_a_T = bits(io.a, 1, 1) @[CLAAdder.scala 79:26]
    whole_granularity_adders_1.io.a <= _whole_granularity_adders_1_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_1_io_b_T = bits(io.b, 1, 1) @[CLAAdder.scala 80:26]
    whole_granularity_adders_1.io.b <= _whole_granularity_adders_1_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[1] <= whole_granularity_adders_1.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[1].g <= whole_granularity_adders_1.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[1].p <= whole_granularity_adders_1.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_2_io_a_T = bits(io.a, 2, 2) @[CLAAdder.scala 79:26]
    whole_granularity_adders_2.io.a <= _whole_granularity_adders_2_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_2_io_b_T = bits(io.b, 2, 2) @[CLAAdder.scala 80:26]
    whole_granularity_adders_2.io.b <= _whole_granularity_adders_2_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[2] <= whole_granularity_adders_2.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[2].g <= whole_granularity_adders_2.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[2].p <= whole_granularity_adders_2.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_2.io.cpg.carry <= cla_inst.io.cpg[2].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_3_io_a_T = bits(io.a, 3, 3) @[CLAAdder.scala 79:26]
    whole_granularity_adders_3.io.a <= _whole_granularity_adders_3_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_3_io_b_T = bits(io.b, 3, 3) @[CLAAdder.scala 80:26]
    whole_granularity_adders_3.io.b <= _whole_granularity_adders_3_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[3] <= whole_granularity_adders_3.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[3].g <= whole_granularity_adders_3.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[3].p <= whole_granularity_adders_3.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_3.io.cpg.carry <= cla_inst.io.cpg[3].carry @[CLAAdder.scala 82:21]
    node io_s_lo = cat(sum_collector[1], sum_collector[0]) @[CLAAdder.scala 86:36]
    node io_s_hi = cat(sum_collector[3], sum_collector[2]) @[CLAAdder.scala 86:36]
    node _io_s_T = cat(io_s_hi, io_s_lo) @[CLAAdder.scala 86:36]
    io.s <= _io_s_T @[CLAAdder.scala 86:12]
    cla_inst.io.c_in <= io.cpg.carry @[CLAAdder.scala 88:24]
    io.cpg.p <= cla_inst.io.pg @[CLAAdder.scala 89:22]
    io.cpg.g <= cla_inst.io.gg @[CLAAdder.scala 90:22]
    
  module CLA_4 : 
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
    
  module FullAdder_12 : 
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
    
  module CLAAdder_15 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_12 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
  module FullAdder_13 : 
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
    
  module CLAAdder_16 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_13 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
  module FullAdder_14 : 
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
    
  module CLAAdder_17 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_14 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
  module FullAdder_15 : 
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
    
  module CLAAdder_18 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<1>, flip b : UInt<1>, s : UInt<1>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst fa_inst of FullAdder_15 @[CLAAdder.scala 25:27]
    fa_inst.clock <= clock
    fa_inst.reset <= reset
    fa_inst.io.a <= io.a @[CLAAdder.scala 26:20]
    fa_inst.io.b <= io.b @[CLAAdder.scala 27:20]
    io.s <= fa_inst.io.s @[CLAAdder.scala 28:20]
    io.cpg.g <= fa_inst.io.cpg.g @[CLAAdder.scala 29:22]
    io.cpg.p <= fa_inst.io.cpg.p @[CLAAdder.scala 29:22]
    fa_inst.io.cpg.carry <= io.cpg.carry @[CLAAdder.scala 29:22]
    
  module CLAAdder_19 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<4>, flip b : UInt<4>, s : UInt<4>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst cla_inst of CLA_4 @[CLAAdder.scala 69:28]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    inst whole_granularity_adders_0 of CLAAdder_15 @[CLAAdder.scala 72:104]
    whole_granularity_adders_0.clock <= clock
    whole_granularity_adders_0.reset <= reset
    inst whole_granularity_adders_1 of CLAAdder_16 @[CLAAdder.scala 72:104]
    whole_granularity_adders_1.clock <= clock
    whole_granularity_adders_1.reset <= reset
    inst whole_granularity_adders_2 of CLAAdder_17 @[CLAAdder.scala 72:104]
    whole_granularity_adders_2.clock <= clock
    whole_granularity_adders_2.reset <= reset
    inst whole_granularity_adders_3 of CLAAdder_18 @[CLAAdder.scala 72:104]
    whole_granularity_adders_3.clock <= clock
    whole_granularity_adders_3.reset <= reset
    wire sum_collector : UInt<1>[4] @[CLAAdder.scala 74:31]
    node _whole_granularity_adders_0_io_a_T = bits(io.a, 0, 0) @[CLAAdder.scala 79:26]
    whole_granularity_adders_0.io.a <= _whole_granularity_adders_0_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_0_io_b_T = bits(io.b, 0, 0) @[CLAAdder.scala 80:26]
    whole_granularity_adders_0.io.b <= _whole_granularity_adders_0_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[0] <= whole_granularity_adders_0.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[0].g <= whole_granularity_adders_0.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[0].p <= whole_granularity_adders_0.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_1_io_a_T = bits(io.a, 1, 1) @[CLAAdder.scala 79:26]
    whole_granularity_adders_1.io.a <= _whole_granularity_adders_1_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_1_io_b_T = bits(io.b, 1, 1) @[CLAAdder.scala 80:26]
    whole_granularity_adders_1.io.b <= _whole_granularity_adders_1_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[1] <= whole_granularity_adders_1.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[1].g <= whole_granularity_adders_1.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[1].p <= whole_granularity_adders_1.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_2_io_a_T = bits(io.a, 2, 2) @[CLAAdder.scala 79:26]
    whole_granularity_adders_2.io.a <= _whole_granularity_adders_2_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_2_io_b_T = bits(io.b, 2, 2) @[CLAAdder.scala 80:26]
    whole_granularity_adders_2.io.b <= _whole_granularity_adders_2_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[2] <= whole_granularity_adders_2.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[2].g <= whole_granularity_adders_2.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[2].p <= whole_granularity_adders_2.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_2.io.cpg.carry <= cla_inst.io.cpg[2].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_3_io_a_T = bits(io.a, 3, 3) @[CLAAdder.scala 79:26]
    whole_granularity_adders_3.io.a <= _whole_granularity_adders_3_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_3_io_b_T = bits(io.b, 3, 3) @[CLAAdder.scala 80:26]
    whole_granularity_adders_3.io.b <= _whole_granularity_adders_3_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[3] <= whole_granularity_adders_3.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[3].g <= whole_granularity_adders_3.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[3].p <= whole_granularity_adders_3.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_3.io.cpg.carry <= cla_inst.io.cpg[3].carry @[CLAAdder.scala 82:21]
    node io_s_lo = cat(sum_collector[1], sum_collector[0]) @[CLAAdder.scala 86:36]
    node io_s_hi = cat(sum_collector[3], sum_collector[2]) @[CLAAdder.scala 86:36]
    node _io_s_T = cat(io_s_hi, io_s_lo) @[CLAAdder.scala 86:36]
    io.s <= _io_s_T @[CLAAdder.scala 86:12]
    cla_inst.io.c_in <= io.cpg.carry @[CLAAdder.scala 88:24]
    io.cpg.p <= cla_inst.io.pg @[CLAAdder.scala 89:22]
    io.cpg.g <= cla_inst.io.gg @[CLAAdder.scala 90:22]
    
  module CLAAdder_20 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<16>, flip b : UInt<16>, s : UInt<16>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst cla_inst of CLA @[CLAAdder.scala 69:28]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    inst whole_granularity_adders_0 of CLAAdder_4 @[CLAAdder.scala 72:104]
    whole_granularity_adders_0.clock <= clock
    whole_granularity_adders_0.reset <= reset
    inst whole_granularity_adders_1 of CLAAdder_9 @[CLAAdder.scala 72:104]
    whole_granularity_adders_1.clock <= clock
    whole_granularity_adders_1.reset <= reset
    inst whole_granularity_adders_2 of CLAAdder_14 @[CLAAdder.scala 72:104]
    whole_granularity_adders_2.clock <= clock
    whole_granularity_adders_2.reset <= reset
    inst whole_granularity_adders_3 of CLAAdder_19 @[CLAAdder.scala 72:104]
    whole_granularity_adders_3.clock <= clock
    whole_granularity_adders_3.reset <= reset
    wire sum_collector : UInt<4>[4] @[CLAAdder.scala 74:31]
    node _whole_granularity_adders_0_io_a_T = bits(io.a, 3, 0) @[CLAAdder.scala 79:26]
    whole_granularity_adders_0.io.a <= _whole_granularity_adders_0_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_0_io_b_T = bits(io.b, 3, 0) @[CLAAdder.scala 80:26]
    whole_granularity_adders_0.io.b <= _whole_granularity_adders_0_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[0] <= whole_granularity_adders_0.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[0].g <= whole_granularity_adders_0.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[0].p <= whole_granularity_adders_0.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_1_io_a_T = bits(io.a, 7, 4) @[CLAAdder.scala 79:26]
    whole_granularity_adders_1.io.a <= _whole_granularity_adders_1_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_1_io_b_T = bits(io.b, 7, 4) @[CLAAdder.scala 80:26]
    whole_granularity_adders_1.io.b <= _whole_granularity_adders_1_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[1] <= whole_granularity_adders_1.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[1].g <= whole_granularity_adders_1.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[1].p <= whole_granularity_adders_1.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_2_io_a_T = bits(io.a, 11, 8) @[CLAAdder.scala 79:26]
    whole_granularity_adders_2.io.a <= _whole_granularity_adders_2_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_2_io_b_T = bits(io.b, 11, 8) @[CLAAdder.scala 80:26]
    whole_granularity_adders_2.io.b <= _whole_granularity_adders_2_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[2] <= whole_granularity_adders_2.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[2].g <= whole_granularity_adders_2.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[2].p <= whole_granularity_adders_2.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_2.io.cpg.carry <= cla_inst.io.cpg[2].carry @[CLAAdder.scala 82:21]
    node _whole_granularity_adders_3_io_a_T = bits(io.a, 15, 12) @[CLAAdder.scala 79:26]
    whole_granularity_adders_3.io.a <= _whole_granularity_adders_3_io_a_T @[CLAAdder.scala 79:19]
    node _whole_granularity_adders_3_io_b_T = bits(io.b, 15, 12) @[CLAAdder.scala 80:26]
    whole_granularity_adders_3.io.b <= _whole_granularity_adders_3_io_b_T @[CLAAdder.scala 80:19]
    sum_collector[3] <= whole_granularity_adders_3.io.s @[CLAAdder.scala 81:40]
    cla_inst.io.cpg[3].g <= whole_granularity_adders_3.io.cpg.g @[CLAAdder.scala 82:21]
    cla_inst.io.cpg[3].p <= whole_granularity_adders_3.io.cpg.p @[CLAAdder.scala 82:21]
    whole_granularity_adders_3.io.cpg.carry <= cla_inst.io.cpg[3].carry @[CLAAdder.scala 82:21]
    node io_s_lo = cat(sum_collector[1], sum_collector[0]) @[CLAAdder.scala 86:36]
    node io_s_hi = cat(sum_collector[3], sum_collector[2]) @[CLAAdder.scala 86:36]
    node _io_s_T = cat(io_s_hi, io_s_lo) @[CLAAdder.scala 86:36]
    io.s <= _io_s_T @[CLAAdder.scala 86:12]
    cla_inst.io.c_in <= io.cpg.carry @[CLAAdder.scala 88:24]
    io.cpg.p <= cla_inst.io.pg @[CLAAdder.scala 89:22]
    io.cpg.g <= cla_inst.io.gg @[CLAAdder.scala 90:22]
    
