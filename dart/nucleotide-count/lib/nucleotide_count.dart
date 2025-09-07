class InvalidNucleotideException implements Exception {
  InvalidNucleotideException();
}

class NucleotideCount {
  int check(s, ss) {
    return s
        .split("")
        .fold(0, (value, element) => (value + ((element == ss) ? 1 : 0)));
  }

  Map<String, int> count(String strand) {
    Map<String, int> result = Map.fromEntries(["A", "C", "G", "T"]
        .map((nucleotide) => MapEntry(nucleotide, check(strand, nucleotide))));

    if (result.values.reduce((v, e) => v + e) == strand.length) {
      return result;
    }

    throw new InvalidNucleotideException();
  }
}
