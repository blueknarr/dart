abstract class StarcraftObject {
  int _hp;
  int _mana;

  int get hp => _hp;

  int get mana => _mana;

  StarcraftObject({
    required int hp,
    required int mana,
  })  : _hp = hp,
        _mana = mana;

  setHp(int value) {
    _hp -= value;
  }

  setMana(int value) {
    _mana -= value;
  }
}

abstract interface class Move {
  void move(final int x, final int y);
}
