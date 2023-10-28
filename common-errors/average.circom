pragma circom  2.1.6;

include "../circomlib/isEqual.circom";

function invert(x) {
  return 1 / x;
}

template AvgWrong(n) {
  signal input in[n];
  signal denominator_inv;
  signal output out;

  // The average of n signals is their sum divided by the number of signals. Division in finite fields is the same as
  // multiplying by the inverse, so we need to add up the signals, then multiply it by the inverse of the length of the array.
  var sum;
  for (var i = 0; i < n; i++){
    sum += in[i];
  }

  denominator_inv <-- invert(n);

  // "force" the denominator to be equal to the inverse of
  // NOTE! This does not create a contraint because we are comparing a signal to a contract value
  1 === denominator_inv * n;

  out <== sum * denominator_inv;
}

template Avg(n) {
  signal input in[n];
  signal denominator_inv;
  signal output out;

  // The average of n signals is their sum divided by the number of signals. Division in finite fields is the same as
  // multiplying by the inverse, so we need to add up the signals, then multiply it by the inverse of the length of the array.
  var sum;
  for (var i = 0; i < n; i++){
    sum += in[i];
  }

  denominator_inv <-- 1 / n;

  // When comparing a signal to a constant, use the IsEqual component, not ===
  component isEq = isEqual();
  isEq.in[0] <== 1;
  isEq.in[1] <== denominator_inv * n;

  out <== sum * denominator_inv;
}


component main = Avg(10);
