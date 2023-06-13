import 'dart:math';

import 'package:day1/unit_test/ex5/repository/post_file_repository.dart';
import 'package:day1/unit_test/ex5/repository/post_file_repository_impl.dart';
import 'package:test/test.dart';

void main() {
  test('PostFileRepository 테스트', () async {
    final PostFileRepository file = PostFileRepositoryImpl();

    /// test 파일 만들기
    await file.makeFile('test.txt', 'test1234');

    /// test 파일 읽기
    final readFile = await file.getFile('test.txt');
    expect(readFile, 'test1234');

    /// test 파일 수정하고 다시 읽기
    await file.updateFile('test.txt', 'test5678');
    final readUpdateFile = await file.getFile('test.txt');
    expect(readUpdateFile, 'test5678');

    /// 파일 삭제
    final delFile = await file.deleteFile('test.txt');
    expect(delFile, true);

    expect(() => file.deleteFile('test2.txt'), throwsException);
  });
}
