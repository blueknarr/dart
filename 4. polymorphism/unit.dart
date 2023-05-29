import 'building.dart';
import 'starcraft_object.dart';

abstract class Unit extends StarcraftObject implements Move {
  Unit({required super.hp, required super.mana});
}

class Marine extends Unit {
  int damage = 2;

  Marine({required super.hp, required super.mana});

  @override
  void attack(StarcraftObject object) {
    object.setHp(damage);
    print('마린 공격');
  }

  @override
  void move(final x, final y) {
    print('마린 ($x, $y)로 이동');
  }
}

class Medic extends Unit {
  final heal = -2;

  Medic({required super.hp, required super.mana});

  @override
  void move(final x, final y) {
    print('메딕 ($x, $y)로 이동');
  }

  @override
  void attack(Unit unit) {
    // TODO: implement attack
  }

  void cure(Unit unit) {
    unit.setHp(heal);
    print('메딕 치료');
  }
}

class Tank extends Unit {
  int damage = 20;

  Tank({required super.hp, required super.mana});

  @override
  void attack(StarcraftObject object) {
    object.setHp(damage);
    print('탱크 공격');
  }

  @override
  void move(int x, int y) {
    print('탱크 ($x, $y)로 이동');
  }
}

class Scv extends Unit implements Building {
  int damage = 1;
  final repairing = -10;

  Scv({required super.hp, required super.mana});

  @override
  void attack(StarcraftObject object) {
    object.setHp(damage);
    print('SCV 공격');
  }

  CommandCenter buildCommandCenter() {
    CommandCenter cc = CommandCenter(hp: 400, mana: 0);
    return cc;
  }

  @override
  void move(int x, int y) {
    print('SCV ($x, $y)로 이동');
  }

  @override
  void repair(Building building) {
    building.setHp(repairing);
  }

  void getResource() {
    print('미네랄/가스를 채취했습니다.');
  }
}
