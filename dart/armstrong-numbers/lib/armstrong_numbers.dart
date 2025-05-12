import 'dart:math';

class ArmstrongNumbers {
  bool isArmstrongNumber(String n) {
    return (int.parse(n) ==
        n.split("").fold(
            0,
            (value, element) =>
                value + pow(int.parse(element), n.length).toInt()));
  }
}
