pragma circom  2.1.6;

template Powers(n) {
  signal input a;

  // An array of output signals
  signal output powers[n];

  // Constraints.
  powers[0] <== a;

  /// This loop will transpile to the following set of constraints
  ///
  /// powers[0] <== a;
  /// powers[1] <== powers[0] * a;
  /// powers[2] <== powers[1] * a;
  /// powers[3] <== powers[2] * a;
  /// powers[4] <== powers[3] * a;
  /// powers[5] <== powers[4] * a;
  ///
  /// Variables build helper code that exists outside the R1CS. They help define the circuit, but they are not part of the circuit.
  /// A signal is immutable and intended to be one of the columns of the R1CS. A variable is not part of the R1CS.
  /// It is intended for computing values outside the R1CS to help define the R1CS.
  for (var i = 1; i < n; i++) {
    powers[i] <== powers[i - 1] * a;
  }
}

/// A Rank 1 Constraint System must be fixed and immutable, this means we cannot change the number of rows or
/// columns once defined, and we cannot change the values of the matrices or the witness.
/// That is why we have  hard-coded argument Powers(6), this size must be fixed.
component main Powers(6);
