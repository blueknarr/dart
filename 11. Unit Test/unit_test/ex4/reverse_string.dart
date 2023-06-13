class ReverseString {
  String reverseString(String? str) {
    if (str == null) {
      return '';
    }
    return str.split('').reversed.join();
  }
}
