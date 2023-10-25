pragma circom  2.1.6;

template PublicInput {
  // input signals
  signal input a;  
  signal input b;  
  signal input c;

  // intermediate signals
  signal v1;

  // output signals
  signal output out;

  v1 <== a * b;
  out <== v1 * c;
}

// a and c are public inputs, but b remains hidden.
component main {public [a, c]} = PublicInput();
