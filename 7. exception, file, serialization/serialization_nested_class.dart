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

  // 객체 안에 객체(?)
  Map<String, dynamic> toJson(Department instance) => {
        'name': name,
        'employee': instance.leader,
      };

  void writeFile(String src, String text) {
    final file = File(src);
    file.writeAsStringSync(text);
  }
}

void main() {
  Employee leader = Employee('가나다', 10);
  Department marketing = Department('marketing', leader);
  String departmentString = jsonEncode(marketing.toJson(marketing));

  marketing.writeFile('marketing.txt', departmentString);
}
