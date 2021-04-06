import chisel3.stage._
import gcd._
import adder._

object Main extends App{
    val sv_code = (new ChiselStage).emitSystemVerilog(new GCD)
    println(sv_code)

    val sv_code2:String = (new ChiselStage).emitSystemVerilog((new full_adder))
    println(sv_code2)
}