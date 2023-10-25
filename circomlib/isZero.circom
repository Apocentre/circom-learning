pragma circom  2.1.6;

/// The IsZero template returns 1 if the input signal is zero, and zero if the input signal is non-zero.
/// If you spend some time thinking about how to test if a number is zero using only multiplications
/// (constraints must have one multiplication), you will find yourself getting stuck; it will turn out
/// to be a fiendishly difficult problem.
template isZero() {
  signal input in;
  signal output out;

  signal inv;

  /// inv is an auxiliary input signal to make it easier to create a valid circuit. We compute inv to be either zero or
  /// the inverse of x outside the R1CS then force inv to be correct as part of the constraints.
  /// This is following the pattern of “compute, then constrain.”
  ///
  /// But why make inv a signal instead of a variable? It appears to only be used ephemerally. If we set inv to be a var
  /// and replace <-- with = we will get the non-quadratic constraints error because we are multiplying the signal in with a variable, 
  inv <-- in != 0 ? 1/in : 0;
  out <== -in * inv + 1;

  in * out === 0;
}
