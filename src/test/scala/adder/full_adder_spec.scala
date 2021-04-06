package adder

import chisel3._
import chisel3.tester._
import org.scalatest._

class full_adder_spec
    extends FlatSpec
    with ChiselScalatestTester
    with Matchers {
  behavior of "full adder"

  it should "output correct results" in {
    test(new full_adder) { dut =>
      for (
        a <- 0 until 2;
        b <- 0 to 1;
        c <- 0 to 1
      ) {
        dut.io.a.poke(a.asUInt(1.W))
        dut.io.b.poke(b.asUInt)
        dut.io.c.poke(c.asUInt())
        println(s"a=$a, b=$b, c=$c, s=${dut.io.s.peek}, p=${dut.io.p.peek}, g=${dut.io.g.peek}") //, s=$c.io.s, p=$p, g=$g")
      }
    }
  }
}
