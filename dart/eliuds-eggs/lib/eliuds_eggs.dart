import 'dart:math';

class EggCounter {
  int count(int brute) {
    var sum = 0;

    for (var i = brute.bitLength; i >= 0; i--) {
      if (brute / pow(2, i) >= 1) {
        sum += 1;
        brute -= pow(2, i).toInt();
      }
    }

    return sum;
  }
}
