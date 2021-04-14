package adder

import chisel3._
import chisel3.util._ //Cat
import chisel3.tester._
import org.scalatest._
import scala.util.Random
import scala.math._

class CLAAdderSpec extends FlatSpec with ChiselScalatestTester with Matchers {
  val IT_Max = 10000 //max number of random tests
  val adder_bits = 6
  val max_input_value: Int = math.pow(2.toDouble, adder_bits).toInt
  behavior of "CLA adder"

  it should "output correct results" in {
    test(new CLAAdder(adder_bits)) { dut =>
      for (iteration <- 0 until IT_Max) {
        val a = Random.nextInt(max_input_value)
        val b = Random.nextInt(max_input_value)
        val c_in = Random.nextInt(2)

        val expected_s: Int = (a + b + c_in) % max_input_value
        val expected_c_out: Int = (a + b + c_in) / max_input_value

        //println(s"stimulus: $a + $b + ${c_in}, expected = ${expected_s} ... ${expected_c_out}")

        dut.io.a.poke(a.asUInt)
        dut.io.b.poke(b.asUInt)
        dut.io.cpg.carry.poke(c_in.B)

        /*val dut_s = dut.io.s.peek
        val dut_c_out = dut.io.c_out.peek
        printf(p"result = ${dut_s} ... ${dut_c_out}")*/

        dut.io.s.expect(expected_s.asUInt())
        //dut.io.c_out.expect(expected_c_out.B)

        if(iteration%30 == 0){
          println(s"$a + $b +${c_in} = ${dut.io.s.peek}")
        }

        dut.clock.step()
      }
    }
  }

}
