import 'building.dart';
import 'unit.dart';

void main() {
  Marine m1 = Marine(hp: 40, mana: 0);
  Marine m2 = Marine(hp: 40, mana: 0);
  Medic md1 = Medic(hp: 40, mana: 40);
  Tank t1 = Tank(hp: 100, mana: 0);
  Scv scv = Scv(hp: 10, mana: 0);

  // 마린 이동
  m1.move(1, 1);
  m2.move(2, 2);
  // 마린1 -> 마린 2 공격
  m1.attack(m2);
  print('마린2 체력: ${m2.hp}');
  // 메딕 회복
  md1.cure(m2);
  print('마린2 체력: ${m2.hp}');
  // 탱크 -> 마린 1 공격
  t1.attack(m1);
  print('마린1 체력: ${m1.hp}');

  // 유닛들 그룹으로 한 곳으로 모이기
  final List<Unit> units = [];
  units.add(m1);
  units.add(t1);
  units.add(md1);

  units.forEach((unit) {
    unit.move(10, 10);
  });

  CommandCenter cc = scv.buildCommandCenter();
  print('커멘드 센터 체력 : ${cc.hp}, 스캔 마나 : ${cc.mana}');

  // 커멘드 센터 마나 충전
  for (int i = 0; i <= 50; i++) {
    cc.rechargeScanMana();
  }
  print('커멘드 센터 현재 마나량 : ${cc.mana}');
  // 커멘드 센터 스캔
  cc.scan(4, 10);
  // 탱크 -> 커멘드 센터 공격
  t1.attack(cc);
  print('커멘드 센터 현재 체력 : ${cc.hp}');
  // scv -> 커멘드 센터 수리
  print('커멘드 센터 수리');
  scv.repair(cc);
  print('커멘드 센터 현재 체력 : ${cc.hp}');
  cc.move(50, 50);
}
