package adder

import chisel3._

class CLA(amount_of_connected_full_adders: Int) extends MultiIOModule {
  val n = amount_of_connected_full_adders;
  val io = IO(new Bundle {
      val c_in = Input(Bool())
      val c_out = Output(Bool())
      val pg = Output(Bool()) //group propagate
      val gg = Output(Bool()) //group generate
      val cpg = Vec(n, new CLALink)
  })
  println(s"CLA instantiated with n=$n")

  //io.pg := io.p.reduce(_ & _) //pg = p0p1p2p3
  io.pg := io.cpg.foldLeft(true.B){case(a,b) => a & b.p}  //pg = p0p1p2p3
  
  /*io.gg :=  (io.p zip io.g).tail.foldLeft(io.g(0)){(a,b) =>
    (a & b._1) | b._2
  } //gg = g3 + p3g2 + p3p2g1 + p3p2p1g0*/
  io.gg :=  io.cpg.tail.foldLeft(io.cpg(0).g){case(a,b) =>
    (a & b.p) | b.g
  } //gg = g3 + p3g2 + p3p2g1 + p3p2p1g0

  io.c_out := (io.c_in & io.pg) | io.gg

  io.cpg(0).carry := io.c_in
  for(idx <- 1 until n){
    io.cpg(idx).carry := (io.cpg(idx-1).carry & io.cpg(idx-1).p) | io.cpg(idx-1).g
  }
  
  //printf(p"pg=${io.pg}, gg=${io.gg}, c_out=${io.c_out}\n")

}
