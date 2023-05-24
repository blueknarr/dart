class Person {
  String name;

  Person({required this.name});
}

void main() {
  /*
       1) 대한민국의 도시 이름 모음 - Set
       2) 10명 학생의 시험 점수 - List
       3) 대한민국의 도시별 인구수 - Map
  */

  final hong = Person(name: '홍길동');
  final han = Person(name: '한석봉');

  final List<Person> people = [];
  final Map<String, int> bioInfo = {
    '홍길동': 20,
    '한석봉': 25,
  };

  people.add(hong);
  people.add(han);

  people.forEach((element) {
    print(element.name);
  });

  bioInfo.forEach((key, value) {
    print('$key의 나이는 $value살');
  });
}
