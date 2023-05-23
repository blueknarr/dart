import 'cleric.dart';

void main() {
  final cleric1 = Cleric('아서스', hp: 40, mp: 5);
  print('cleric1 instance: ${cleric1.name}, ${cleric1.hp}, ${cleric1.mp}');

  final cleric2 = Cleric('아서스', hp: 35);
  print('cleric2 instance: ${cleric2.name}, ${cleric2.hp}, ${cleric2.mp}');

  final cleric3 = Cleric('아서스');
  print('cleric1 instance: ${cleric3.name}, ${cleric3.hp}, ${cleric3.mp}');

  //final cleric4 = Cleric(); missing 1 argument, name 선언 안함
}
