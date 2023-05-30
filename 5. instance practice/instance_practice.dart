import 'dart:collection';

class Book {
  String title;
  DateTime publishDate;
  String comment;

  Book({
    required this.title,
    required this.publishDate,
    required this.comment,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book &&
          runtimeType == other.runtimeType &&
          title == other.title &&
          publishDate == other.publishDate;

  @override
  int get hashCode => title.hashCode ^ publishDate.hashCode;

  @override
  String toString() {
    return '{title: $title, publishDate: $publishDate, comment: $comment}';
  }

  @override
  int compareTo(Book other) {
    return publishDate.compareTo(other.publishDate);
  }

  // Deep Copy
  Book copyWith({String? title, DateTime? publishDate, String? comment}) {
    return Book(
        title: title ?? this.title,
        publishDate: publishDate ?? this.publishDate,
        comment: comment ?? this.comment);
  }
}

void main() {
  final andorid = Book(
    title: '오준석의 생존코딩 안드로이드편',
    publishDate: DateTime(2023, 5, 28),
    comment: '2쇄',
  );
  final flutter = Book(
    title: '오준석의 생존코딩 플러터',
    publishDate: DateTime(2023, 5, 29),
    comment: '초판',
  );
  final ios = Book(
    title: '오준석의 생존코딩 ios',
    publishDate: DateTime(2023, 5, 30),
    comment: '2쇄',
  );
  final andorid2 = Book(
    title: '오준석의 생존코딩 안드로이드편',
    publishDate: DateTime(2023, 5, 28),
    comment: '3쇄',
  );

  // (1) 제목, 출간일 동일 객체
  final List<Book> bookList = [];
  bookList.add(ios);
  bookList.add(andorid);
  bookList.add(flutter);
  bookList.add(andorid2);

  print('List 객체');
  bookList.forEach((book) {
    print(book);
  });
  print('');

  final Set<Book> bookSet = {};
  bookSet.add(ios);
  bookSet.add(flutter);
  bookSet.add(andorid);
  bookSet.add(andorid2);

  print('Set 객체');
  bookSet.forEach((book) {
    print(book);
  });
  print('');

  final Map<Book, dynamic> bookMap = {
    andorid: '안드로이드 도서 정보',
    ios: 'ios 도서 정보',
    flutter: 'flutter 도서 정보',
    andorid2: '안드로이드 도서 정보'
  };
  print('Map 객체');
  bookMap.forEach((k, v) {
    print(k);
  });
  print('');

  // (2) List, Set, Map 정렬
  bookList.sort((a, b) => a.publishDate.compareTo(b.publishDate));
  print('List 객체 sort 후');
  bookList.forEach((book) {
    print(book);
  });
  print('');

  bookSet.toList().sort((a, b) => a.publishDate.compareTo(b.publishDate));
  print('Set 객체 sort 후');
  bookList.forEach((book) {
    print(book);
  });

  final sortedBookMap = Map.fromEntries(bookMap.entries.toList()
    ..sort((a, b) => a.key.publishDate.compareTo(b.key.publishDate)));
  print('Map 객체 sort 후');
  sortedBookMap.forEach((key, value) {
    print(key);
  });
  print('');

  // (3) Deep Copy
  final flutter2 = flutter.copyWith(title: '오준석의 생존코딩: 플러터 개정 ', comment: '2쇄');
  print('flutter deep copy: $flutter2');
}
