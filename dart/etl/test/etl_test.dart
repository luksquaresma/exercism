import 'package:etl/etl.dart';
import 'package:test/test.dart';

void main() {
  final etl = Etl();

  group('ETL', () {
    test('Single letter', () {
      final legacy = {
        '1': ['A'],
      };
      final result = etl.transform(legacy);
      final expected = {'a': 1};
      expect(result, equals(expected));
    }, skip: false);

    test('Single score with multiple letters', () {
      final legacy = {
        '1': ["A", "E", "I", "O", "U"],
      };
      final result = etl.transform(legacy);
      final expected = {"a": 1, "e": 1, "i": 1, "o": 1, "u": 1};
      expect(result, equals(expected));
    }, skip: true);

    test('Single score with multiple letters', () {
      final legacy = {
        '1': ["A", "E", "I", "O", "U"],
      };
      final result = etl.transform(legacy);
      final expected = {"a": 1, "e": 1, "i": 1, "o": 1, "u": 1};
      expect(result, equals(expected));
    }, skip: true);

    test('Multiple scores with multiple letters', () {
      final legacy = {
        "1": ["A", "E"],
        "2": ["D", "G"],
      };
      final result = etl.transform(legacy);
      final expected = {"a": 1, "d": 2, "e": 1, "g": 2};
      expect(result, equals(expected));
    }, skip: true);

    test('Multiple scores with differing numbers of letter', () {
      final legacy = {
        "1": ["A", "E", "I", "O", "U", "L", "N", "R", "S", "T"],
        "2": ["D", "G"],
        "3": ["B", "C", "M", "P"],
        "4": ["F", "H", "V", "W", "Y"],
        "5": ["K"],
        "8": ["J", "X"],
        "10": ["Q", "Z"],
      };
      final result = etl.transform(legacy);
      final expected = {
        "a": 1,
        "b": 3,
        "c": 3,
        "d": 2,
        "e": 1,
        "f": 4,
        "g": 2,
        "h": 4,
        "i": 1,
        "j": 8,
        "k": 5,
        "l": 1,
        "m": 3,
        "n": 1,
        "o": 1,
        "p": 3,
        "q": 10,
        "r": 1,
        "s": 1,
        "t": 1,
        "u": 1,
        "v": 4,
        "w": 4,
        "x": 8,
        "y": 4,
        "z": 10,
      };
      expect(result, equals(expected));
    }, skip: true);
  });
}
