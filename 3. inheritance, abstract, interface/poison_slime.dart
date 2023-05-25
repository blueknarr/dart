import 'day2.dart';
import 'slime.dart';

class PoisonSlime extends Slime {
  PoisonSlime(super.suffix);
  int _poisonCount = 5;
  final poisonEffect = 10;

  int get poisonCount => _poisonCount;

  @override
  void attack(Hero hero) {
    print('보통 슬라임과 같은 공격');

    if (_poisonCount > 0) {
      print('추가로, 독 포자를 살포했다!');
      hero.hp -= poisonEffect;
      _poisonCount -= 1;
      print('$poisonEffect 포인트의 독 데미지, 영웅의 남은 체력: ${hero.hp}');
    }
  }
}
