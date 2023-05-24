class Wand {
  String _name = '';
  double _power = 0;

  String get name => _name;
  double get power => _power;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('wand 이름의 길이가 3보다 작습니다.');
    }
    _name = value;
  }

  set power(double value) {
    if (value < 0.5 || value > 100) {
      throw Exception('지팡이의 마력은 0.5이상 100.0 이하여야 합니다.');
    }
    _power = value;
  }
}

class Wizard {
  String _name = '';
  int _hp = 0;
  int _mp = 0;
  Wand wand = Wand();

  String get name => _name;
  int get hp => _hp;
  int get mp => _mp;

  set name(String value) {
    if (value.length < 3) {
      throw Exception('wizard 이름의 길이가 3 이하입니다.');
    }
    _name = value;
  }

  set hp(int value) {
    if (value < 0) {
      _hp = 0;
    } else {
      _hp = value;
    }
  }

  set mp(int value) {
    if (value < 0) {
      throw Exception('mp는 0이상이어야 합니다.');
    }
    _mp = value;
  }
}

void main() {
  final wand = Wand();
  final wizard = Wizard();

  // wand.name = 'st'; 길이가 3이하, 에러메세지
  wand.name = 'sfaff';
  // wandd.power = 0.4; 0.5이하, 에러메세지
  wand.power = 0.6;
  print(wand._name);
  print(wand._power);

  wizard.name = 'elf';
  wizard.hp = 100;
  print(wizard._hp);
  wizard.hp = -100;
  print(wizard._hp);
  wizard.mp = 50;
  wizard.wand = wand;
  print('${wizard.wand._name}, ${wizard.wand._power}');
}
