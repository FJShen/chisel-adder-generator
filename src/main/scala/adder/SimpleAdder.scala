package adder

import chisel3._
import chisel3.util._

class SimpleAdder (n: Int) extends MultiIOModule{
  val io = IO(new Bundle {
        val a = Input(UInt(n.W))
        val b = Input(UInt(n.W))
        val c_in = Input(Bool())
        val s = Output(UInt(n.W))
        val c_out = Output(Bool())
        val pg = Output(Bool())
        val gg = Output(Bool())
      })
      
    //instantiate modules
    val cla_inst = Module(new CLA(n))
    val adder_inst = Seq.fill(n) (Module(new FullAdder))

    //connections
    val s_vec = Wire(Vec(n, Bool()))
    for(idx <- 0 until n){
        adder_inst(idx).io.a := io.a(idx)
        adder_inst(idx).io.b := io.b(idx)
        s_vec(idx) := adder_inst(idx).io.s
    }
    io.s := s_vec.asUInt()

    for(idx <- 0 until n){
        adder_inst(idx).io.cpg <> cla_inst.io.cpg(idx)
    }
    cla_inst.io.c_in := io.c_in
    io.c_out := cla_inst.io.c_out

    io.pg := cla_inst.io.pg
    io.gg := cla_inst.io.gg

}
