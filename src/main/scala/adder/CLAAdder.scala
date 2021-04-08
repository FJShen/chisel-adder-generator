package adder

import chisel3._
import chisel3.util._

class CLAAdder(n: Int) extends MultiIOModule {
  val io = IO(new Bundle {
    val a = Input(UInt(n.W))
    val b = Input(UInt(n.W))
    val s = Output(UInt(n.W))
    val cpg = Flipped(new CLALink)
  })

  val max_children = 4

  n match {
    case 1 => {
      val fa_inst = Module(new FullAdder)
      fa_inst.io.a <> io.a
      fa_inst.io.b <> io.b
      fa_inst.io.s <> io.s 
      fa_inst.io.cpg <> io.cpg
    }
    case x if (x > 1 && x <= max_children) => {
      val cla_inst = Module(new CLA(n))
      val adder_inst = Seq.fill(n)(Module(new CLAAdder(1)))

      /* external connections */

      //carry-in
      cla_inst.io.c_in := io.cpg.carry

      //sum outputs
      val sum_bit_collector = Wire(Vec(n, UInt(1.W)))
      adder_inst.map(_.io.s).zip(sum_bit_collector).foreach{case(x,y) => x<>y}
      io.s := sum_bit_collector.asUInt()

      //a and b
      adder_inst.map(_.io.a).zip(io.a.asBools()).foreach{case(x,y)=> x<>y}
      adder_inst.map(_.io.b).zip(io.b.asBools()).foreach{case(x,y)=> x<>y}

      //group propagate and generate
      io.cpg.p := cla_inst.io.pg
      io.cpg.g := cla_inst.io.gg

      /* interal connections */
      for (idx <- 0 until n) {
        adder_inst(idx).io.cpg <> cla_inst.io.cpg(idx)
      }
      adder_inst.map(_.io.cpg).zip(cla_inst.io.cpg).foreach{case(x,y)=> x<>y}
    }
    case _ => {

      //how many children CLA to use?
      val number_of_children_CLA = math.ceil(n.toDouble/max_children).toInt
      
      val cla_inst = Module(new CLA(number_of_children_CLA))
      cla_inst.io.c_in <> io.cpg.carry
      cla_inst.io.pg <> io.cpg.p
      cla_inst.io.gg <> io.cpg.g

      //how many bits are left unconnected?
      val width_of_last_adder = n - 4 * (number_of_children_CLA-1)
      val sum_collector = Wire(Vec(number_of_children_CLA-1, UInt(4.W)))
      val last_adder_sum = Wire(UInt(width_of_last_adder.W))

      val children_cla_adder_inst = Seq.fill(number_of_children_CLA-1)(Module(new CLAAdder(4)))

      //instantiate and connect all but the last adder
      (0 until number_of_children_CLA-1).toList.map(4*_).zip(children_cla_adder_inst)
      .foreach{case (idx, inst) =>
        inst.io.a <> io.a(idx+3, idx)
        inst.io.b <> io.b(idx+3, idx)
        inst.io.s <> sum_collector(idx)
        inst.io.cpg <> cla_inst.io.cpg(idx)
      }

      //instantiate and connect the last adder
      val last_adder_inst = Module(new CLAAdder(width_of_last_adder))
      last_adder_inst.io.a <> io.a(n-1, n-width_of_last_adder)
      last_adder_inst.io.b <> io.b(n-1, n-width_of_last_adder)
      last_adder_inst.io.s <> last_adder_sum
      last_adder_inst.io.cpg <> cla_inst.io.cpg(number_of_children_CLA-1)

      io.s <> Cat(last_adder_sum, sum_collector.asUInt)

    }
  }
}
