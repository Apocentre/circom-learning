pragma circom  2.1.6;

include "../circomlib/isEqual.circom";

template MultiplyByContantUnderconstraint() {
  signal input in;
  signal output out;

  out <== in * 5;
}

/// Here we are saying we know x, such that 5x = out, where out is public. So if out is 100, we expect x to be 20 right?
/// If we look at the R1CS, we see it is in fact empty, no constraints are created!
///
/// This is because although <== is a constraint, the constraint it generates is not a quadratic constraint,
/// it is multiplication by a constant.


/// The solution is to wire the IsEqual template in to enforce the equality.
template MultiplyByContant() {
  signal input in;
  signal output out;

  signal result <-- in * 5;
  
  component isEq = isEqual();
  isEq.in[0] <== in * 5;
  isEq.in[1] <== result;

  out <== isEq.out;
}

component main = MultiplyByContant();
