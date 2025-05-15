import 'dart:math';

class DifferenceOfSquares {
  int sumOfSquares(int until) {
    return Iterable.generate(until + 1, (x) => pow(x, 2))
        .reduce((v, e) => v + e)
        .toInt();
  }

  int squareOfSum(int until) {
    return pow(Iterable.generate(until + 1).reduce((v, e) => v + e), 2).toInt();
  }

  int differenceOfSquares(int until) {
    return squareOfSum(until) - sumOfSquares(until);
  }
}
