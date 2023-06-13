import 'package:day1/unit_test/ex4/reverse_string.dart';
import 'package:test/test.dart';

void main() {
  test('문자열 뒤집기 성공', () {
    ReverseString rs = ReverseString();

    expect(rs.reverseString('abcde'), 'edcba');
    expect(rs.reverseString(''), '');
    expect(rs.reverseString('abc de'), 'ed cba');
    expect(rs.reverseString(null), '');
  });
}
