pragma circom  2.1.6;

include "./isZero.circom";

/// Returns 1 us the two input values are equal else return 0
template isEqual() {
  signal input in[2];
  signal output out;

  component isz = isZero();
  
  // remember The IsZero template returns 1 if the input signal is zero
  isz.in <== in[0] - in[1];

  out <== isz.out;
}
