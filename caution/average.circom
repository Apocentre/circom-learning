pragma circom  2.1.6;

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

  denominator_inv <-- 1 / n;

  // "force" the denominator to be equal to the inverse of
  n === denominator_inv * n;

  // NOTE! This does not create a contraint
  out <== sum * denominator_inv;
}

component main = AvgWrong(10);
