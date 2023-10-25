pragma circom 2.1.6;

/// The following circuits are equivalent.
///
template Multiply() {
  signal input a;
  signal input b;
  signal output c;
  
  c <-- a * b;
  c === a * b;
}

template MultiplySame() {
  signal input a;
  signal input b;
  signal output c;
  
  /// The <== operator computes, then assigns, then adds a constraint.
  /// If you only want to constrain, use the ===.
  c <== a * b;
}

///  Suppose we want the prover to supply both the inputs and the output. This is how we would do it using the === operator.
template Multiply3() {
  signal input a;
  signal input b;

  /// Circom does not require an output signal to exist, as that is merely syntatic sugar for a public input.
  /// Remember, an “input” is merely an entry to the witness vector, so everything is an input from a zero knowledge proof
  /// perspective. In the above example, there is no output signal, but this is a perfectly valid circuit with proper constraints.
  signal input c;

  c === a * b;
}
