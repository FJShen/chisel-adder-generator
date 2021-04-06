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

    val sv_code2:String = (new ChiselStage).emitSystemVerilog((new CLA(4)))
    println(sv_code2)
}
