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

    val c_vec = Wire(Vec(n+1, Bool()))
    c_vec(0) := io.c_in
    for(idx <- 1 until (n+1)){
        c_vec(idx) := cla_inst.io.c_out(idx-1)
    }
    io.c_out := c_vec(n)
    cla_inst.io.c_in := c_vec(0)


    for(idx <- 0 until n){
        adder_inst(idx).io.c := c_vec(idx)
    }

    for(idx <- 0 until n){
        cla_inst.io.p(idx) := adder_inst(idx).io.p
        cla_inst.io.g(idx) := adder_inst(idx).io.g
    }


    io.pg := cla_inst.io.pg
    io.gg := cla_inst.io.gg

}
