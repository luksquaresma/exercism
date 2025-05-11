int score(String word) {
  var invertedScoreTable = {
    1: {"A", "E", "I", "O", "U", "L", "N", "R", "S", "T"},
    2: {"D", "G"},
    3: {"B", "C", "M", "P"},
    4: {"F", "H", "V", "W", "Y"},
    5: {"K"},
    8: {"J", "X"},
    10: {"Q", "Z"},
  };

  Map<String, int> scoreTable = {};

  invertedScoreTable.forEach((key, value) {
    value.forEach((element) {
      scoreTable[element.toUpperCase()] = key;
      scoreTable[element.toLowerCase()] = key;
    });
  });

  return (word.split(''))
      .fold(0, (total, element) => (total + scoreTable[element]!));
}
