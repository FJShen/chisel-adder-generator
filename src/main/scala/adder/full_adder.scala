package adder

import chisel3._

class full_adder extends MultiIOModule {
  val io = IO(new Bundle {
    val a = Input(UInt(1.W))
    val b = Input(UInt(1.W))
    val c = Input(UInt(1.W))  //carry-in
    val s = Output(UInt(1.W)) //sum
    val p = Output(UInt(1.W)) //propagate
    val g = Output(UInt(1.W)) //generate
  })

  io.s := io.a ^ io.b ^ io.c;
  io.p := io.a | io.b;
  io.g := io.a & io.b;

}
