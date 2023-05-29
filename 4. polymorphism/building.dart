import 'starcraft_object.dart';

abstract class Building extends StarcraftObject {
  Building({
    required super.hp,
    required super.mana,
  });
}

class Terran extends Building implements Move {
  Terran({required super.hp, required super.mana});

  @override
  void move(int x, int y) {
    print('건물 이동');
  }
}

class CommandCenter extends Terran {
  int _mana;
  final maxMana = 200;

  int get mana => _mana;

  CommandCenter({required super.hp, required super.mana}) : _mana = mana;

  @override
  void move(int x, int y) {
    print('커멘드 센터 ($x, $y) 이동');
  }

  void rechargeScanMana() {
    if (_mana < maxMana) {
      _mana++;
    }
  }

  void scan(final int x, final int y) {
    if (_mana >= 50) {
      print('($x, $y) 좌표를 스캔했습니다.');
      _mana -= 50;
    } else {
      print('마나가 부족합니다.');
    }
  }
}

class Zerg extends Building {
  Zerg({required super.hp, required super.mana});
}

class Hatchery extends Zerg {
  int _evolutionCnt = 0;

  int get evolutionCnt => _evolutionCnt;

  Hatchery({required super.hp, required super.mana});

  void evolve(Hatchery hatchery) {
    if (_evolutionCnt > 2) {
      print('최종 진화 단계입니다.');
    } else {
      print('저그 본진이 진화했습니다.');
      _evolutionCnt++;
    }
  }
}

class Protoss extends Building {
  Protoss({required super.hp, required super.mana});
}

class Nexus extends Protoss {
  int _barrier = 400;
  final maxBarrier = 400;

  int get barrier => _barrier;

  Nexus({required super.hp, required super.mana});

  void recoverBarrier(Nexus nexus) {
    if (_barrier < maxBarrier) {
      _barrier++;
    }
  }
}
