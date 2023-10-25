pragma circom  2.1.6;

include "./mul.circom";

template SumOfMuls() {
  signal input a;
  signal input b;
  signal input c;
  signal input d;
  signal output out;

  component ml1 = Mul();
  component ml2 = Mul();

  // wiring the components together
  ml1.in[0] <== a;
  ml1.in[1] <== b;
  ml2.in[0] <== c;
  ml2.in[1] <== d;

  out <== ml1.out + ml2.out;
}

component main = SumOfMuls();
