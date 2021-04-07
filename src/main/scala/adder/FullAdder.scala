package adder

import chisel3._
import org.antlr.v4.runtime.misc.FlexibleHashMap

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
    val s = Output(UInt(1.W)) //sum
    val cpg = Flipped(new CLALink)
  })

  val c = io.cpg.carry
  val p = io.cpg.p
  val g = io.cpg.g

  io.s := io.a ^ io.b ^ c;
  p := io.a | io.b;
  g := io.a & io.b;

}

/**
  * Link between a bare CLA module and a full adder,
  * from the perspective of the CLA module (CLA module 
  * provides (Output) the carries to FAs and receives (Input)
  *  G and P from FAs)
  *
  */
class CLALink extends Bundle{
  val carry = Output(Bool()) //carry-in of FA
  val p = Input(Bool())
  val g = Input(Bool())
}