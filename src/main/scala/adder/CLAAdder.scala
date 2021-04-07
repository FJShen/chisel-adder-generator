package adder

import chisel3._

class CLAAdder(n: Int) extends MultiIOModule {
  val io = IO(new Bundle {
    val a = Input(UInt(n.W))
    val b = Input(UInt(n.W))
    val s = Output(UInt(n.W))
    val cpg = Flipped(new CLALink)
  })
  n match {
    case 1 => {
      val fa_inst = Module(new FullAdder)
      fa_inst.io.a <> io.a
      fa_inst.io.b <> io.b
      fa_inst.io.s <> io.s 
      fa_inst.io.cpg <> io.cpg
    }
    case x if (x > 1 && x <= 4) => {
      val cla_inst = Module(new CLA(n))
      val adder_inst = IndexedSeq.fill(n)(Module(new CLAAdder(1)))

      //external connections
      cla_inst.io.c_in := io.cpg.carry

      val sum_vec = Wire(Vec(n, UInt(1.W)))
      for (idx <- 0 until n) {
        sum_vec(idx) := adder_inst(idx).io.s
        adder_inst(idx).io.a := io.a(idx)
        adder_inst(idx).io.b := io.b(idx)
      }
      io.s := sum_vec.asUInt()
      io.cpg.p := cla_inst.io.pg
      io.cpg.g := cla_inst.io.gg

      //interal connections
      for (idx <- 0 until n) {
        adder_inst(idx).io.cpg <> cla_inst.io.cpg(idx)
      }
    }
    case _ => {
      println("n exceeds 4, I give up!")
    }
  }
}
