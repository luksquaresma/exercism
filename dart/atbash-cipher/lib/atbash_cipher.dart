class AtbashCipher {
  static String alphabet = "abcdefghijklmnopqrstuvwxyz";
  static List<String> _onwards = alphabet.split("");
  static List<String> _backwards = alphabet.split("").reversed.toList();

  Map<String, String> _encoder = {
    for (var (i, e) in _onwards.indexed) e: _backwards[i]
  };

  Map<String, String> _decoder = {
    for (var (i, e) in _backwards.indexed) e: _onwards[i]
  };

  String encode(String msg) {
    return msg.split("").map((e) => (e == " " ? " " : _encoder[e]!)).join("");
  }

  String decode(String msg) {
    return msg.split("").map((e) => (e == " " ? " " : _decoder[e]!)).join("");
  }
}
