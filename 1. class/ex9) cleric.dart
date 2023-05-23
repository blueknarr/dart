import 'dart:math';

class Cleric {
  static const maxHp = 50;
  static const maxMp = 10;

  String name;
  int mp;
  int hp;

  Cleric(
    this.name, {
    this.hp = Cleric.maxHp,
    this.mp = Cleric.maxMp,
  });

  void selfAid() {
    if (mp < 5) {
      print('마나가 부족합니다.');
      return;
    }

    hp = Cleric.maxHp;
    mp -= 5;
  }

  int pray(int sec) {
    int mpRecovery = sec + Random().nextInt(3);

    if (mp + mpRecovery > Cleric.maxMp) {
      mp = Cleric.maxMp;
      return Cleric.maxMp - mp;
    }
    mp += mpRecovery;
    return mpRecovery;
  }
}
