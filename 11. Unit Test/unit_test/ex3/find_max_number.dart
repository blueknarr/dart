class FindMaxNumber {
  int isMaxNumber(List<int> number) {
    return number.reduce((prev, next) => prev > next ? prev : next);
  }
}
