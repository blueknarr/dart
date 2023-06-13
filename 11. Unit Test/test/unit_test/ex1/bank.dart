import 'package:day1/unit_test/ex1/bank.dart';
import 'package:test/test.dart';

void main() {
  test('description', () {
    final Map<String, dynamic> json = {
      'name': '홍길동',
      'address': '서울시 어쩌구 저쩌구',
      'phone': '010-1111-2222'
    };

    final bank = Bank.fromJson(json);

    expect(bank.toJson(),
        {'name': '홍길동', 'αddress': '서울시 어쩌구 저쩌구', 'phone': '010-1111-2222'});
  });
}
