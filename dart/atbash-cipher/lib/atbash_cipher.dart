class AtbashCipher {
  static final alphabet = "abcdefghijklmnopqrstuvwxyz";
  static final _onwards = alphabet.split("");
  static final _backwards = alphabet.split("").reversed.toList();

  static Map<String, String> _encoder =
      ({for (var (i, e) in _onwards.indexed) e: _backwards[i]});

  static Map<String, String> _decoder =
      ({for (var e in _encoder.entries) e.value: e.key});

  String encode(String msg) {
    return msg.split("").map((element) => _encoder[element]!).join("");
  }

  String decode(String msg) {
    return msg.split("").map((element) => _decoder[element]!).join("");
  }
}
