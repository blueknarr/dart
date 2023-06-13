import 'dart:io';

import 'package:day1/unit_test/ex5/repository/post_file_repository.dart';

class PostFileRepositoryImpl implements PostFileRepository {
  @override
  Future<String> getFile(String fileName) async {
    final file = File(fileName);
    final text = await file.readAsString();

    return text;
  }

  @override
  Future<void> makeFile(String fileName, String text) async {
    final file = File(fileName);
    await file.writeAsString(text);
  }

  @override
  Future<void> updateFile(String fileName, String text) async {
    await makeFile(fileName, text);
  }

  @override
  Future<bool> deleteFile(String fileName) async {
    File file = File(fileName);

    if (await file.exists()) {
      await file.delete();
      return true;
    } else {
      throw Exception('$file is not exists');
    }
  }
}
