import 'computer.dart';
import 'day2.dart';
import 'poison_slime.dart';

void main() {
  final Hero zelda = Hero(name: 'zelda', hp: 100);
  final PoisonSlime ps = PoisonSlime('A');

  print(ps.suffix);
  for (int i = 0; i < 6; i++) {
    ps.attack(zelda);
  }

  final Computer mac = Computer('Mac Book Air', 'silver', 100, 1.3, 'Apple');

  print('$mac.name');
  print('$mac.color');
  print('$mac.price');
  print('$mac.weight');
  print('$mac.makerName');
}
