class Etl {
  Map<String, int> transform(Map<String, List<String>> legacy_input) {
    return legacy_input.entries
        .map((e) => {for (var v in e.value) v.toLowerCase(): int.parse(e.key)})
        .reduce((value, element) => value..addAll(element));
    // .reduce((value, element) => {...value, ...element});
  }
}
