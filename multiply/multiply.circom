pragma circom 2.1.6;

template Multiply() {
  // input signals.
  signal input a;
  signal input b;
  signal input c;

  // intermediate signals
  signal v1;

  // output signals
  signal output out;

  // Constraints.
  v1 <== a * b;
  out <== v1 * c;
}

component main = Multiply();
