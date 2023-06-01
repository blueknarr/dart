import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Employee.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        age = json['age'];

  Map<String, dynamic> toJson() => {
        'name': name,
        'age': age,
      };
}

class Department {
  String name;
  Employee leader;

  Department(this.name, this.leader);

  // Department.fromJson(Map<String, dynamic> json)
  //     : name = json['name'],
  //       leader = json['employee'];

  // 객체 안에 객체(?)
  Map<String, dynamic> toJson(Department instance) => {
        'name': name,
        'employee name': instance.leader.name,
        'employee age': instance.leader.age,
      };

  void writeFile(String src, String text) {
    final file = File(src);
    file.writeAsStringSync(text);
  }
}

class User {
  String name;
  String email;

  User(this.name, this.email);

  // 역질렬화 fromJson은 생성자이다
  User.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'];

  // 직렬화, 이름이 toJson이다.
  // json 형태로 변경
  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
      };
}

void main() {
  // String 형태로 데이터를 주고 받는다.
  // 실제 내가 받는 데이터
  //String jsonString = '{"name": name,"email": email}';
  String jsonString = '{"name": "홍길동","email": "abc@aaa.com"}';
  // jsonString을 map 형태로 변환해야한다.
  // jsonDecode : top level 함수, 역직렬화 했다.
  // json 포멧은 마지막에 ,가 올 수 없다.
  // map은 ,가 올 수 있다.
  Map<String, dynamic> json = jsonDecode(jsonString);

  // 직접 다루지 않는다. dart는 객체에 담아서 사용한다.
  // 직접 호출하는 방식은 매우 위험하다.
  print(json['name']);

  // 역직렬화가 끝난 상태이다.
  User user = User.fromJson(json);
  print(user.name);

  // String jsonString2 =
  //     '{"name": "marketing", "employee name": "가나다", "employee age": 10}';
  // Map<String, dynamic> json2 = jsonDecode(jsonString2);
  // Department marketing = Department.fromJson(json2);
  // print(marketing.leader.name);

  // 데이터를 변경한다면
  user.name = '김삿갓';

  // 아직 map이다.
  user.toJson();

  // 이게 json 형태 map을 String으로 변경.
  String userString = jsonEncode(user.toJson());
  print(userString);

  Employee leader = Employee('가나다', 10);
  Department marketing = Department('marketing', leader);
  String departmentString = jsonEncode(marketing.toJson(marketing));

  marketing.writeFile('marketing.txt', departmentString);
}
