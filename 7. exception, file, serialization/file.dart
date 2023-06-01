import 'dart:io';

String fileRead(String src) {
  final file = File(src);
  final text = file.readAsStringSync();

  return text;
}

void fileWrite(String src, String text) {
  final file = File(src);
  file.writeAsStringSync(text);
}

void fileCopy(String src, String target) {
  final srcText = fileRead(src);
  final targetFile = File(target);

  targetFile.writeAsStringSync(srcText);
}

void main() {
  String text = '오준석의 생존코딩: 플러터 완벽 정복';
  fileWrite('src.txt', text);
  print(fileRead('src.txt'));

  fileCopy('src.txt', 'target.txt');
  print(fileRead('target.txt'));
}
