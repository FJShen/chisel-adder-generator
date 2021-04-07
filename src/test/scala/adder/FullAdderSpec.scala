package adder

import chisel3._
import chisel3.util._ //Cat
import chisel3.tester._
import org.scalatest._

class FullAdderSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  behavior of "full adder"

  it should "output correct results" in {
    test(new FullAdder) { dut =>
      for (
        a <- 0 until 2;
        b <- 0 to 1;
        c <- 0 to 1
      ) {
        dut.io.a.poke(a.asUInt(1.W))
        dut.io.b.poke(b.asUInt)
        dut.io.cpg.carry.poke(c.B)
        /*println(
          s"a=$a, b=$b, c=$c, s=${dut.io.s.peek}, p=${dut.io.cpg.p.peek}, g=${dut.io.cpg.g.peek}"
        ) //, s=$c.io.s, p=$p, g=$g")*/
      }
    }
  }


}
