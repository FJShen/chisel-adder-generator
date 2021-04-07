import chisel3.stage._
import gcd._
import adder._

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

    val sv_code_full_adder:String = (new ChiselStage).emitSystemVerilog((new FullAdder))
    println(sv_code_full_adder)

    val sv_code_cla:String = (new ChiselStage).emitSystemVerilog((new CLA(3)))
    println(sv_code_cla)

    val sv_code_adder:String = (new ChiselStage).emitSystemVerilog((new SimpleAdder(3)))
    println(sv_code_adder)
}
