class HighScores {
  List<int> scores;

  int latest() {
    return this.scores.last;
  }

  int personalBest() {
    return this.scores.reduce((v, e) => (v >= e ? v : e));
  }

  List<int> personalTopThree() {
    return this.scores
      ..sort((a, b) => (a > b ? a : b))
      ..take(3);
  }

  HighScores(this.scores);
}
