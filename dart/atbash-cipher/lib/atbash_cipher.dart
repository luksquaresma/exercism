class AtbashCipher {
  // Put your code here
  static final alphabet = "abcdefghijklmnopqrstuvwxyz";
  static final _onwards = alphabet.split("");
  static final _backwards = alphabet.split("").reversed.toList();

  static Map<String, String> _encoder =
      ({for (var (i, e) in _onwards.indexed) e: _backwards[i]});

  static Map<String, String> _decoder =
      ({for (var e in _encoder.entries) e.value: e.key});

  // {for (var (i, e) in _onwards.indexed)e.toUpperCase(): _backwards[i].toUpperCase()}

  String encode(String msg) {
    return msg.split("").forEach((e) => _encoder[e]).join();
  }

  String decode(String msg) {
    return msg.split("").reduce((value, element) => value + _decoder[element]!);
  }
}
