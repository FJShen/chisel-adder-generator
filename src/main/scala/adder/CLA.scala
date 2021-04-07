package adder

import chisel3._

class CLA(amount_of_connected_full_adders: Int) extends MultiIOModule {
  val n = amount_of_connected_full_adders;
  val io = IO(new Bundle {
      val c_in = Input(Bool())
      val p = Input(Vec(n, Bool()))   //propagates from full adders
      val g = Input(Vec(n, Bool()))  //generates from full adders
      val c_out = Output(Vec(n, Bool()))
      val pg = Output(Bool()) //group propagate
      val gg = Output(Bool()) //group generate
  })


  io.pg := io.p.reduce(_ & _) //pg = p0p1p2p3
  
  io.gg :=  (io.p zip io.g).tail.foldLeft(io.g(0)){(a,b) =>
    (a & b._1) | b._2
  } //gg = g3 + p3g2 + p3p2g1 + p3p2p1g0

  io.c_out(0) := (io.c_in & io.p(0)) | io.g(0)
  for(idx <- 1 until n){
    io.c_out(idx) := (io.c_out(idx-1) & io.p(idx)) | io.g(idx)
  }
  

}
