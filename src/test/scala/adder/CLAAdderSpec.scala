package adder

import chisel3._
import chisel3.util._ //Cat
import chisel3.tester._
import org.scalatest._
import scala.util.Random
import scala.math._

class CLAAdderSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  val IT_Max = 10000 //max number of random tests
  // val adder_bits = 6
  //var max_input_value: Int = 0
  behavior of "CLA adder"

  val adder_bits_set = (1 to 32)
  for (adder_bits <- adder_bits_set) {
    it should s"output correct results when adder width is $adder_bits" in {

      val max_input_value = math.pow(2.toDouble, adder_bits).toLong

      test(new CLAAdder(adder_bits, "DUT")) { dut =>
        for (iteration <- 0 until IT_Max) {
          val a = Random.nextLong.abs % max_input_value
          val b = Random.nextLong.abs % max_input_value
          val c_in = Random.nextLongrandom.abs % 2

          val expected_s: Long = (a + b + c_in) % max_input_value
          val expected_c_out: Long = (a + b + c_in) / max_input_value

          //println(s"stimulus: $a + $b + ${c_in}, expected = ${expected_s} ... ${expected_c_out}")

          dut.io.a.poke(a.asUInt)
          dut.io.b.poke(b.asUInt)
          dut.io.cpg.carry.poke(c_in.B)

          /*val dut_s = dut.io.s.peek
        val dut_c_out = dut.io.c_out.peek
        printf(p"result = ${dut_s} ... ${dut_c_out}")*/

          dut.io.s.expect(expected_s.asUInt(adder_bits.W))
          //dut.io.c_out.expect(expected_c_out.B)

          /*if (iteration % 30 == 0) {
            println(s"$a + $b +${c_in} = ${dut.io.s.peek}")
          }*/

          dut.clock.step()
        }

      }

    }

  }
}
