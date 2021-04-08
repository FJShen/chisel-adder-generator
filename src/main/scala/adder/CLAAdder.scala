package adder

import chisel3._
import chisel3.util._
import math._

class CLAAdder(n: Int) extends MultiIOModule {
  val io = IO(new Bundle {
    val a = Input(UInt(n.W))
    val b = Input(UInt(n.W))
    val s = Output(UInt(n.W))
    val cpg = Flipped(new CLALink)
  })

  val max_children = 4 //how many children a CLA (not CLAAdder) block can directly derive

  n match {
    case 1 => {
      val fa_inst = Module(new FullAdder)
      fa_inst.io.a <> io.a
      fa_inst.io.b <> io.b
      fa_inst.io.s <> io.s 
      fa_inst.io.cpg <> io.cpg
    }
    case x if (x < 1) => {
      println("CLAAdder cannot have a bitwidht of less than one!")
    }
    case _ => {
      //the following calculation aims to figure out how many direct children should the CLA block spawn
      //the comments after the code demonstrates the fact that a 18-bit adder 
      //will be dissected into 1*16 + 2

      val tree_depth = floor(log(n)/log(max_children)).toInt //e.g. floor{log(18)/log(4)} = 2
      val granularity = pow(max_children, tree_depth).toInt //e.g. 4^2 = 16
      val num_whole_granularity_adders = n / granularity //e.g. 18 / 16 = 1
      val leftover_adder_width = n % granularity  //e.g. 18%16 = 2
      val num_adders = if(leftover_adder_width>0) 1+num_whole_granularity_adders else num_whole_granularity_adders

      val cla_inst = Module(new CLA(num_adders))
      val whole_granularity_adders = Seq.fill(num_whole_granularity_adders)(Module(new CLAAdder(granularity)))
      val leftover_adder = Module(new CLAAdder(leftover_adder_width)) //the leftover adder will map to the highest-index bits

      val sum_collector = Wire(Vec(num_whole_granularity_adders, UInt(granularity.W)))
      val leftover_sum = Wire(UInt(leftover_adder_width.W))

      (0 until num_whole_granularity_adders).map(_*granularity).zip(whole_granularity_adders)
      .foreach{case(idx, inst) =>
        inst.io.a <> io.a(idx+granularity-1, idx)
        inst.io.b <> io.b(idx+granularity-1, idx)
        sum_collector(idx/granularity) := inst.io.s
        inst.io.cpg <> cla_inst.io.cpg(idx/granularity)
      }

      leftover_adder.io.a <> io.a(n-1, n-leftover_adder_width)
      leftover_adder.io.b <> io.b(n-1, n-leftover_adder_width)
      leftover_sum := leftover_adder.io.s
      cla_inst.io.cpg(num_adders - 1) <> leftover_adder.io.cpg
      io.s := Cat(leftover_sum, sum_collector.asUInt())
      
    }
  }
}
