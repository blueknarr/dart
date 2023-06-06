import 'dart:math';

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);
}

void main() {
  final transactions = [
    Transaction(Trader("Brian", "Cambridge"), 2011, 300),
    Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
    Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
    Transaction(Trader("Mario", "Milan"), 2012, 710),
    Transaction(Trader("Mario", "Milan"), 2012, 700),
    Transaction(Trader("Alan", "Cambridge"), 2012, 950),
  ];

  final result1 = transactions.where((x) => x.year == 2011).toList()
    ..sort((a, b) => a.value.compareTo(b.value));
  final resultName = result1.map((x) => x.trader.name);
  print(resultName);

  final result2 = transactions.map((x) => x.trader.city).toSet();
  print(result2);

  final result3 = transactions
      .where((x) => x.trader.city == 'Cambridge')
      .map((x) => x.trader.name)
      .toSet()
      .toList()
    ..sort();
  print(result3);

  final result4 = transactions.map((x) => x.trader.name).toSet().toList()
    ..sort();
  print(result4);

  final result5 = transactions.any((x) => x.trader.city == 'Milan');
  print(result5);

  final result6 =
      transactions.where((x) => x.trader.city == 'Cambridge').toList();
  result6.forEach((transaction) => print(
      '${transaction.trader.name}, ${transaction.trader.city}, ${transaction.year}, ${transaction.value}'));

  final result7 = transactions.map((x) => x.value).toList().reduce(max);
  print(result7);

  final result8 = transactions.map((x) => x.value).toList().reduce(min);
  print(result8);
}
