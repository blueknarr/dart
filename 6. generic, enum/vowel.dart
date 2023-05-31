class Word {
  String word;

  Word(this.word);

  bool isVowel(int i) {
    return word
        .substring(i, i + 1)
        .toLowerCase()
        .contains(RegExp(r'[AEIOUaeiou]'));
  }

  bool isConsonant(int i) {
    return word
        .substring(i, i + 1)
        .toLowerCase()
        .contains(RegExp(r'[^AEIOUaeiou]'));
  }
}

void main() {
  Word q = Word('ABCDE');

  for (int i = 0; i < q.word.length; i++) {
    print(
        '${q.word.substring(i, i + 1)}: 모음(${q.isVowel(i)}), 자음(${q.isConsonant(i)})');
  }
}
