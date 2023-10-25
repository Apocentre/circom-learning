pragma circom  2.1.6;

import "./square.circom";

template SumOfSquares() {
  signal input a;
  signal input b;
  signal output out;

  component sq1 = Square();
  component sq2 = Square();

  // witing the components together
  sq1.in <== a;
  sq1.in <== b;

  out <== sq1.out + sq2.out;
}

component SumOfSquares()
