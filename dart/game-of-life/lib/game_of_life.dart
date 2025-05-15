class GameOfLife {
  List<List<int>> matrix_data;

  List<List<int>> matrix() {
    return this.matrix_data;
  }

  List<List<int>> border(List<List<int>> mat) {
    return [
      ...[
        for (var _ in mat)
          [
            0,
            ...[for (var __ in mat) 0],
            0
          ]
      ],
      ...[
        for (var l in mat)
          [
            0,
            ...[for (var v in l) v],
            0
          ]
      ],
      ...[
        for (var _ in mat)
          [
            0,
            ...[for (var __ in mat) 0],
            0
          ]
      ],
    ];
  }

  List<List<int>> unborder(List<List<int>> mat) {
    return mat
        .sublist(1, mat.length - 1)
        .map((e) => e.sublist(1, e.length - 1))
        .toList();
  }

  List<List<bool>> binzarize(List<List<int>> mat) {
    return mat.map((l) => l.map((e) => (e == 1)).toList()).toList();
  }

  List<List<int>> debinzarize(List<List<bool>> mat) {
    return mat.map((l) => l.map((e) => (e ? 1 : 0)).toList()).toList();
  }

  GameOfLife(this.matrix_data);

  void tick() {
    if (this.matrix_data.isNotEmpty) {
      var mat = border(this.matrix_data);

      var sums = mat
          .sublist(1, mat.length - 1)
          .indexed
          .map((l) => l.$2
              .sublist(1, mat.length - 1)
              .indexed
              .map((e) => mat
                  .sublist(l.$1 - 1, l.$1 + 1)
                  .expand((lines) => lines.sublist(e.$1 - 1, e.$1 + 1))
                  .reduce((value, element) => value + element))
              .toList())
          .toList();

      this.matrix_data = [
        for (var i = 0; i < matrix_data.length; i++)
          [
            for (var j = 0; j < matrix_data.length; j++)
              matrix_data[i][j] == 1
                  ? ([2, 3].any((x) => x == sums[i][j]) ? 1 : 0)
                  : (3 == sums[i][j] ? 1 : 0)
          ]
      ];
    }
  }
}
