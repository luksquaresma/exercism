class Proverb {

  List<String> consume(List<String> ls, String se) {
    List<String> f2(String a, String b, String c) {
      String article(String word) {
        var vogals = ["a", "e", "i", "o", "u"];

        return ((vogals + vogals.map((e) => e.toUpperCase()).toList()).contains(
          word.substring(0, 1),
        )
            ? "an"
            : "a");
      }

      return [
        "For want of ${article(a)} $a the $b was lost.",
        "And all for the want of ${article(c)} $c.",
      ];
    }

    if (ls.length == 1) {
      return f2(ls[0], ls[0], ls[0]).sublist(1);
    } else if (ls.length == 2) {
      return f2(ls[0], ls[1], se);
    } else {
      return f2(ls[0], ls[1], se).sublist(0, 1) + consume(ls.sublist(1), se);
    }
  }

  String recite(List<String> words) {
    return words.isNotEmpty ? consume(words, words[0]).join("\n") : "";
  }
}
