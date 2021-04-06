package adder

import chisel3._

class CLA(amount_of_connected_full_adders: Int) extends MultiIOModule {
  val n = amount_of_connected_full_adders;
  val io = IO(new Bundle {
      val c_in = Input(UInt(1.W))
      val p = Input(UInt(n.W))   //propagates from full adders
      val g = Input(UInt(n.W))  //generates from full adders
      val c_out = Output(UInt(1.W))
      val pg = Output(UInt(1.W)) //group propagate
      val gg = Output(UInt(1.W)) //group generate
  })

  val p_list = io.p.asBools()
  val g_list = io.g.asBools()
  /*io.c_out := (p_list zip g_list).foldLeft(io.c_in){(a,b) =>
    (a & b._1) | b._2
  } */ //c4 = g3 + p3g2 + p3p2g1 + p3p2p1g0 + p3p2p1p0c0

  io.pg := p_list.reduce(_ & _) //pg = p0p1p2p3
  
  io.gg :=  (p_list zip g_list).tail.foldLeft(g_list(0)){(a,b) =>
    (a & b._1) | b._2
  } //gg = g3 + p3g2 + p3p2g1 + p3p2p1g0

  io.c_out := io.gg | (io.c_in & io.pg)
  

}
