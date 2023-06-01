void main() {
  final numString = '10.5';
  int num;

  try {
    num = int.parse(numString);
  } on FormatException catch (e) {
    print(e);
    num = 0;
  }
  print(num);
}
