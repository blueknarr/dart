import 'package:http/http.dart' as http;
import 'dart:typed_data';

final url1 =
    'https://velog.velcdn.com/images/terman/post/26fb3efb-deab-4a9c-b20d-9303bcfde236/image.png';
final url2 =
    'https://blog.kakaocdn.net/dn/I3uVW/btsfCsG5Lol/NSKMEyEIqYBQSbiFbcskcK/img.png';
final url3 =
    'https://i.namu.wiki/i/sjJGjBG7FBg2jzymT2KvN5hPMFTWzP2ynpOuVfGXZvs2vuedC2-5-FYEn5-bTds1_DJIah7OYV5wK3PW9Vn3bQ.svg';

Future<Uint8List> downloadImage(String url) async {
  final http.Response response = await http.get(Uri.parse(url));
  return response.bodyBytes;
}

Future<void> imgParallelDownload() async {
  Stopwatch stopwatch = Stopwatch()..start();
  List<Future<Uint8List>> images = [
    downloadImage(url1),
    downloadImage(url2),
    downloadImage(url3),
  ];
  List<Uint8List> results = await Future.wait(images);
  print('병렬 처리 이미지 개수 : ${results.length}');
  print('병렬 처리 시간 : ${stopwatch.elapsed}');
}

Future<void> imgSequenceDownload() async {
  Stopwatch stopwatch = Stopwatch()..start();
  List<Uint8List> images = [
    await downloadImage(url1),
    await downloadImage(url2),
    await downloadImage(url3),
  ];
  print('순차 처리 이미지 개수 : ${images.length}');
  print('순차 처리 시간 : ${stopwatch.elapsed}');
}

void main() async {
  // 병렬과 순차 이미지 다운로드 시간 비교
  imgParallelDownload();
  imgSequenceDownload();
}
