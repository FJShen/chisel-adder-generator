;buildInfoPackage: chisel3, version: 3.4.3, scalaVersion: 2.12.12, sbtVersion: 1.3.10
circuit my_name_8 : 
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
    
  module my_name : 
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
    
  module my_name_1 : 
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
    
  module my_name_2 : 
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
    
  module my_name_3 : 
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
    
  module my_name_4 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<4>, flip b : UInt<4>, s : UInt<4>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst cla_inst of CLA_1 @[CLAAdder.scala 28:28]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    inst adder_inst_0 of my_name @[CLAAdder.scala 29:42]
    adder_inst_0.clock <= clock
    adder_inst_0.reset <= reset
    inst adder_inst_1 of my_name_1 @[CLAAdder.scala 29:42]
    adder_inst_1.clock <= clock
    adder_inst_1.reset <= reset
    inst adder_inst_2 of my_name_2 @[CLAAdder.scala 29:42]
    adder_inst_2.clock <= clock
    adder_inst_2.reset <= reset
    inst adder_inst_3 of my_name_3 @[CLAAdder.scala 29:42]
    adder_inst_3.clock <= clock
    adder_inst_3.reset <= reset
    cla_inst.io.c_in <= io.cpg.carry @[CLAAdder.scala 34:24]
    wire sum_bit_collector : UInt<1>[4] @[CLAAdder.scala 37:35]
    sum_bit_collector[0] <= adder_inst_0.io.s @[CLAAdder.scala 38:75]
    sum_bit_collector[1] <= adder_inst_1.io.s @[CLAAdder.scala 38:75]
    sum_bit_collector[2] <= adder_inst_2.io.s @[CLAAdder.scala 38:75]
    sum_bit_collector[3] <= adder_inst_3.io.s @[CLAAdder.scala 38:75]
    node io_s_lo = cat(sum_bit_collector[1], sum_bit_collector[0]) @[CLAAdder.scala 39:39]
    node io_s_hi = cat(sum_bit_collector[3], sum_bit_collector[2]) @[CLAAdder.scala 39:39]
    node _io_s_T = cat(io_s_hi, io_s_lo) @[CLAAdder.scala 39:39]
    io.s <= _io_s_T @[CLAAdder.scala 39:12]
    node _T = bits(io.a, 0, 0) @[CLAAdder.scala 42:46]
    node _T_1 = bits(io.a, 1, 1) @[CLAAdder.scala 42:46]
    node _T_2 = bits(io.a, 2, 2) @[CLAAdder.scala 42:46]
    node _T_3 = bits(io.a, 3, 3) @[CLAAdder.scala 42:46]
    adder_inst_0.io.a <= _T @[CLAAdder.scala 42:71]
    adder_inst_1.io.a <= _T_1 @[CLAAdder.scala 42:71]
    adder_inst_2.io.a <= _T_2 @[CLAAdder.scala 42:71]
    adder_inst_3.io.a <= _T_3 @[CLAAdder.scala 42:71]
    node _T_4 = bits(io.b, 0, 0) @[CLAAdder.scala 43:46]
    node _T_5 = bits(io.b, 1, 1) @[CLAAdder.scala 43:46]
    node _T_6 = bits(io.b, 2, 2) @[CLAAdder.scala 43:46]
    node _T_7 = bits(io.b, 3, 3) @[CLAAdder.scala 43:46]
    adder_inst_0.io.b <= _T_4 @[CLAAdder.scala 43:71]
    adder_inst_1.io.b <= _T_5 @[CLAAdder.scala 43:71]
    adder_inst_2.io.b <= _T_6 @[CLAAdder.scala 43:71]
    adder_inst_3.io.b <= _T_7 @[CLAAdder.scala 43:71]
    io.cpg.p <= cla_inst.io.pg @[CLAAdder.scala 46:16]
    io.cpg.g <= cla_inst.io.gg @[CLAAdder.scala 47:16]
    cla_inst.io.cpg[0].g <= adder_inst_0.io.cpg.g @[CLAAdder.scala 51:32]
    cla_inst.io.cpg[0].p <= adder_inst_0.io.cpg.p @[CLAAdder.scala 51:32]
    adder_inst_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 51:32]
    cla_inst.io.cpg[1].g <= adder_inst_1.io.cpg.g @[CLAAdder.scala 51:32]
    cla_inst.io.cpg[1].p <= adder_inst_1.io.cpg.p @[CLAAdder.scala 51:32]
    adder_inst_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 51:32]
    cla_inst.io.cpg[2].g <= adder_inst_2.io.cpg.g @[CLAAdder.scala 51:32]
    cla_inst.io.cpg[2].p <= adder_inst_2.io.cpg.p @[CLAAdder.scala 51:32]
    adder_inst_2.io.cpg.carry <= cla_inst.io.cpg[2].carry @[CLAAdder.scala 51:32]
    cla_inst.io.cpg[3].g <= adder_inst_3.io.cpg.g @[CLAAdder.scala 51:32]
    cla_inst.io.cpg[3].p <= adder_inst_3.io.cpg.p @[CLAAdder.scala 51:32]
    adder_inst_3.io.cpg.carry <= cla_inst.io.cpg[3].carry @[CLAAdder.scala 51:32]
    cla_inst.io.cpg[0].g <= adder_inst_0.io.cpg.g @[CLAAdder.scala 53:74]
    cla_inst.io.cpg[0].p <= adder_inst_0.io.cpg.p @[CLAAdder.scala 53:74]
    adder_inst_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 53:74]
    cla_inst.io.cpg[1].g <= adder_inst_1.io.cpg.g @[CLAAdder.scala 53:74]
    cla_inst.io.cpg[1].p <= adder_inst_1.io.cpg.p @[CLAAdder.scala 53:74]
    adder_inst_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 53:74]
    cla_inst.io.cpg[2].g <= adder_inst_2.io.cpg.g @[CLAAdder.scala 53:74]
    cla_inst.io.cpg[2].p <= adder_inst_2.io.cpg.p @[CLAAdder.scala 53:74]
    adder_inst_2.io.cpg.carry <= cla_inst.io.cpg[2].carry @[CLAAdder.scala 53:74]
    cla_inst.io.cpg[3].g <= adder_inst_3.io.cpg.g @[CLAAdder.scala 53:74]
    cla_inst.io.cpg[3].p <= adder_inst_3.io.cpg.p @[CLAAdder.scala 53:74]
    adder_inst_3.io.cpg.carry <= cla_inst.io.cpg[3].carry @[CLAAdder.scala 53:74]
    
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
    
  module my_name_5 : 
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
    
  module my_name_6 : 
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
    
  module my_name_7 : 
    input clock : Clock
    input reset : Reset
    output io : {flip a : UInt<2>, flip b : UInt<2>, s : UInt<2>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst cla_inst of CLA_2 @[CLAAdder.scala 28:28]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    inst adder_inst_0 of my_name_5 @[CLAAdder.scala 29:42]
    adder_inst_0.clock <= clock
    adder_inst_0.reset <= reset
    inst adder_inst_1 of my_name_6 @[CLAAdder.scala 29:42]
    adder_inst_1.clock <= clock
    adder_inst_1.reset <= reset
    cla_inst.io.c_in <= io.cpg.carry @[CLAAdder.scala 34:24]
    wire sum_bit_collector : UInt<1>[2] @[CLAAdder.scala 37:35]
    sum_bit_collector[0] <= adder_inst_0.io.s @[CLAAdder.scala 38:75]
    sum_bit_collector[1] <= adder_inst_1.io.s @[CLAAdder.scala 38:75]
    node _io_s_T = cat(sum_bit_collector[1], sum_bit_collector[0]) @[CLAAdder.scala 39:39]
    io.s <= _io_s_T @[CLAAdder.scala 39:12]
    node _T = bits(io.a, 0, 0) @[CLAAdder.scala 42:46]
    node _T_1 = bits(io.a, 1, 1) @[CLAAdder.scala 42:46]
    adder_inst_0.io.a <= _T @[CLAAdder.scala 42:71]
    adder_inst_1.io.a <= _T_1 @[CLAAdder.scala 42:71]
    node _T_2 = bits(io.b, 0, 0) @[CLAAdder.scala 43:46]
    node _T_3 = bits(io.b, 1, 1) @[CLAAdder.scala 43:46]
    adder_inst_0.io.b <= _T_2 @[CLAAdder.scala 43:71]
    adder_inst_1.io.b <= _T_3 @[CLAAdder.scala 43:71]
    io.cpg.p <= cla_inst.io.pg @[CLAAdder.scala 46:16]
    io.cpg.g <= cla_inst.io.gg @[CLAAdder.scala 47:16]
    cla_inst.io.cpg[0].g <= adder_inst_0.io.cpg.g @[CLAAdder.scala 51:32]
    cla_inst.io.cpg[0].p <= adder_inst_0.io.cpg.p @[CLAAdder.scala 51:32]
    adder_inst_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 51:32]
    cla_inst.io.cpg[1].g <= adder_inst_1.io.cpg.g @[CLAAdder.scala 51:32]
    cla_inst.io.cpg[1].p <= adder_inst_1.io.cpg.p @[CLAAdder.scala 51:32]
    adder_inst_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 51:32]
    cla_inst.io.cpg[0].g <= adder_inst_0.io.cpg.g @[CLAAdder.scala 53:74]
    cla_inst.io.cpg[0].p <= adder_inst_0.io.cpg.p @[CLAAdder.scala 53:74]
    adder_inst_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 53:74]
    cla_inst.io.cpg[1].g <= adder_inst_1.io.cpg.g @[CLAAdder.scala 53:74]
    cla_inst.io.cpg[1].p <= adder_inst_1.io.cpg.p @[CLAAdder.scala 53:74]
    adder_inst_1.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 53:74]
    
  module my_name_8 : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip a : UInt<6>, flip b : UInt<6>, s : UInt<6>, flip cpg : {carry : UInt<1>, flip p : UInt<1>, flip g : UInt<1>}}
    
    inst cla_inst of CLA @[CLAAdder.scala 60:28]
    cla_inst.clock <= clock
    cla_inst.reset <= reset
    cla_inst.io.c_in <= io.cpg.carry @[CLAAdder.scala 61:24]
    io.cpg.p <= cla_inst.io.pg @[CLAAdder.scala 62:22]
    io.cpg.g <= cla_inst.io.gg @[CLAAdder.scala 63:22]
    wire sum_collector : UInt<4>[1] @[CLAAdder.scala 67:31]
    wire io_s_hi : UInt<2> @[CLAAdder.scala 68:32]
    inst children_cla_adder_inst_0 of my_name_4 @[CLAAdder.scala 70:78]
    children_cla_adder_inst_0.clock <= clock
    children_cla_adder_inst_0.reset <= reset
    node _children_cla_adder_inst_0_io_a_T = bits(io.a, 3, 0) @[CLAAdder.scala 75:26]
    children_cla_adder_inst_0.io.a <= _children_cla_adder_inst_0_io_a_T @[CLAAdder.scala 75:19]
    node _children_cla_adder_inst_0_io_b_T = bits(io.b, 3, 0) @[CLAAdder.scala 76:26]
    children_cla_adder_inst_0.io.b <= _children_cla_adder_inst_0_io_b_T @[CLAAdder.scala 76:19]
    sum_collector[0] <= children_cla_adder_inst_0.io.s @[CLAAdder.scala 77:19]
    cla_inst.io.cpg[0].g <= children_cla_adder_inst_0.io.cpg.g @[CLAAdder.scala 78:21]
    cla_inst.io.cpg[0].p <= children_cla_adder_inst_0.io.cpg.p @[CLAAdder.scala 78:21]
    children_cla_adder_inst_0.io.cpg.carry <= cla_inst.io.cpg[0].carry @[CLAAdder.scala 78:21]
    inst last_adder_inst of my_name_7 @[CLAAdder.scala 82:35]
    last_adder_inst.clock <= clock
    last_adder_inst.reset <= reset
    node _last_adder_inst_io_a_T = bits(io.a, 5, 4) @[CLAAdder.scala 83:35]
    last_adder_inst.io.a <= _last_adder_inst_io_a_T @[CLAAdder.scala 83:28]
    node _last_adder_inst_io_b_T = bits(io.b, 5, 4) @[CLAAdder.scala 84:35]
    last_adder_inst.io.b <= _last_adder_inst_io_b_T @[CLAAdder.scala 84:28]
    io_s_hi <= last_adder_inst.io.s @[CLAAdder.scala 85:28]
    cla_inst.io.cpg[1].g <= last_adder_inst.io.cpg.g @[CLAAdder.scala 86:30]
    cla_inst.io.cpg[1].p <= last_adder_inst.io.cpg.p @[CLAAdder.scala 86:30]
    last_adder_inst.io.cpg.carry <= cla_inst.io.cpg[1].carry @[CLAAdder.scala 86:30]
    node _io_s_T = cat(io_s_hi, sum_collector[0]) @[Cat.scala 30:58]
    io.s <= _io_s_T @[CLAAdder.scala 88:12]
    
