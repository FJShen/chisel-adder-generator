import chisel3.stage._
import gcd._
import adder._
import chisel3._
import chisel3.util.MixedVec
import javax.swing.plaf.synth.SynthUI

object Main extends App {

 /* val a = Seq[Int](1, 2, 3, 4, 5)
  val b = Seq[Double](10, 20, 30, 40, 50)

  val c = a zip b

  val d = c.foldLeft(3.14: Double) { (a, b) => 
    val k= a + b._1 * b._2
    println(s"k=$k")
    k
  }

  println(a)
  println(b)
  println(c)
  println(d)
*/
  /* val sv_code = (new ChiselStage).emitSystemVerilog(new GCD)
    println(sv_code)*/

    /*val sv_code_full_adder:String = (new ChiselStage).emitSystemVerilog((new FullAdder))
    println(sv_code_full_adder)

    val sv_code_cla:String = (new ChiselStage).emitSystemVerilog((new CLA(3)))
    println(sv_code_cla)

    val sv_code_adder:String = (new ChiselStage).emitSystemVerilog((new SimpleAdder(3)))
    println(sv_code_adder)*/

    val sv_code_cla_adder:String = (new ChiselStage).emitSystemVerilog((new CLAAdder(6, "Adder0")))
    println(sv_code_cla_adder)

    /*val test:String = (new ChiselStage).emitSystemVerilog(new Foo)
    println(test)*/

}
 
/* Output will be 12'hf05 */
class Foo extends MultiIOModule{
  val io = IO(new Bundle{
    val out = Output(UInt(12.W))
  })

  val vec = Wire(MixedVec(UInt(4.W), Vec(2, UInt(4.W))))
  val subvec = Wire(Vec(2, UInt(4.W)))
  vec(1) := subvec

  vec(0) := 5.U(4.W)
  subvec(0) := 0.U(4.W)
  subvec(1) := 15.U(4.W)

  io.out := vec.asUInt

  println(s"${subvec.getClass()}")
  println(s"${subvec(0).getClass()}")
}