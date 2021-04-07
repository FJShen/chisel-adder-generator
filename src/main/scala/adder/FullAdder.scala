package adder

import chisel3._

/**
  * FullAdder
  * 
  * Rationale of using UInt for a,b,s; Bool for c, p, g:
  * The adder can be generalized to the form of 
  * {s[n-1:0], p, g} = a[n-1:0] + b[n-1:0] + c
  * 
  * a,b, and s can have more than one bits, therefore they are UInt,
  * whereas carry-in, propagate and generate are one-bit signals that merit using Bool
  *
  */

class FullAdder extends MultiIOModule {
  val io = IO(new Bundle {
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val c = Input(Bool())  //carry-in
    val s = Output(UInt(1.W)) //sum
    val p = Output(Bool()) //propagate
    val g = Output(Bool()) //generate
  })

  io.s := io.a ^ io.b ^ io.c;
  io.p := io.a | io.b;
  io.g := io.a & io.b;

}
