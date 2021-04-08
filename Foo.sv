module Foo(
  input         clock,
  input         reset,
  output [11:0] io_out
);
  assign io_out = 12'hf05; // @[main.scala 60:17]
endmodule
