import 'package:day1/unit_test/ex3/find_max_number.dart';
import 'package:test/test.dart';

void main() {
  test('최대값 찾기 성공', () {
    FindMaxNumber max = FindMaxNumber();

    expect(max.isMaxNumber([2, 5, 1, 9, 3]), 9);
    expect(max.isMaxNumber([13, 2, -11, 0]), 13);
    expect(max.isMaxNumber([-1, -2, -3, -4]), -1);
    expect(max.isMaxNumber([2, 2, 2, 2]), 2);
  });
}
