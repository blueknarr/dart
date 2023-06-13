import 'package:day1/unit_test/ex2/even_comparator.dart';
import 'package:test/test.dart';

void main() {
  test('짝수 판별 정상 동작', () {
    EvenComparator ec = EvenComparator();

    expect(ec.isEvenNumber(2), true);
    expect(ec.isEvenNumber(-2), true);
    expect(ec.isEvenNumber(3), false);
    expect(ec.isEvenNumber(4), true);
  });
}
