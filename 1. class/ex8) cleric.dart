import 'dart:math';

class Cleric {
  final maxHp = 50;
  final maxMp = 10;

  String name;
  int mp = 10;
  int hp = 50;

  Cleric({required this.name});

  void selfAid() {
    if (mp < 5) {
      print('마나가 부족합니다.');
      return;
    }

    hp = maxHp;
    mp -= 5;
  }

  int pray(int sec) {
    int mpRecovery = sec + Random().nextInt(3);

    if (mp + mpRecovery > maxMp) {
      mp = maxMp;
      return maxMp - mp;
    }
    mp += mpRecovery;
    return mpRecovery;
  }
}
