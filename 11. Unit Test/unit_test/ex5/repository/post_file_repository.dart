abstract interface class PostFileRepository {
  Future<String> getFile(String fileName);
  Future<void> makeFile(String fileName, String text);
  Future<void> updateFile(String fileName, String text);
  Future<bool> deleteFile(String fileName);
}
