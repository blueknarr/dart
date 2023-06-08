import 'dart:io';

import 'package:http/http.dart' as http;
import 'dart:typed_data';

Future<Uint8List> downloadImage(String url) async {
  print('다운로드 시작');
  final http.Response response = await http.get(Uri.parse(url));
  print('다운로드 끝');
  return response.bodyBytes;
}

Future<File> saveFile(Uint8List bytes, String fileName) async {
  final imgFile = File(fileName);
  final img = await imgFile.writeAsBytes(bytes);
  return img;
}

Future<void> futureError() async {
  throw Exception('이미지 url이 잘못되었습니다.');
}

void main() async {
  final url = 'https://alimipro.com/favicon.ic';
  final fileName = 'icon.ico';

  Stopwatch stopwatch = Stopwatch()..start();
  Uint8List imgBytes;

  try {
    imgBytes = await downloadImage(url);
  } catch (e) {
    // 문제 : 에러 메세지 패스해버림
    // (1) throw Exception('이미지 url이 잘못되었습니다. $url');
    // (2) print('이미지 url이 잘못되었습니다. $url');
    // (3) Future.error(Exception('이미지 url이 잘못되었습니다. $url'));
    futureError();
  } finally {
    imgBytes = await downloadImage(
        'https://velog.velcdn.com/images/terman/post/26fb3efb-deab-4a9c-b20d-9303bcfde236/image.png');
  }

  final File img = await saveFile(imgBytes, fileName);
  print('================');
  print('소요시간 : ${stopwatch.elapsed}');
  print('용량 : ${await img.length()}bytes');
}
