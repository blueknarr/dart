import 'dart:io';
import 'dart:convert';

Future<void> fileWrite(String src, String content) async {
  final file = File(src);
  await file.writeAsString(content, mode: FileMode.writeOnlyAppend);
}

Future<String> fileRead(String src) async {
  final file = File(src);
  final content = await file.readAsString();

  return content;
}

Future<void> fileCopy(String src, String target) async {
  final srcContent = await fileRead(src);
  await fileWrite(target, srcContent);
}

Future<void> fileReplace(String content) async {
  print(fileRead(content));
}

Future<String> getMovieInfo() async {
  await Future.delayed(Duration(seconds: 2));
  final mockData = {
    'title': 'Star Wars',
    'director': 'George Lucas',
    'year': 1977,
  };
  return jsonEncode(mockData);
}

Future<String> timeoutFuture() async {
  await Future.delayed(Duration(seconds: 6));
  return 'ok';
}

Future<void> dummyData() async {
  await fileWrite('sample.csv', '1, 홍길동, 30\n');
  await fileWrite('sample.csv', '2, 한석봉, 20\n');
}

void main() async {
  // 초기 데이터 파일에 쓰기
  //await dummyData();

  // (1) 파일 처리
  final src = 'sample.csv';
  final target = 'sample_copy.csv';

  try {
    final content = await fileRead(src);
    await fileWrite(target, content.replaceAll('한석봉', '김석봉'));
  } catch (e) {
    print('$src 파일을 찾을 수가 없습니다.');
  }

  // (2) API 호출 및 데이터 처리
  final jsonString = await getMovieInfo();
  final jsonMap = jsonDecode(jsonString);
  print(jsonMap['director']);

  // (3) 타임 아웃 처리
  final timeoutResult = await timeoutFuture()
      .timeout(const Duration(seconds: 5), onTimeout: () => 'timeout');
  print(timeoutResult);
}
