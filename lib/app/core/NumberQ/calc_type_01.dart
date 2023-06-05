import 'dart:convert';

import 'number_q.dart';

enum Type01Operator { sum, subtraction, multiply, division }

extension ToMap on Type01Operator {
  String get toMap {
    return switch (this) {
      Type01Operator.sum => Type01Operator.sum.name,
      Type01Operator.subtraction => Type01Operator.subtraction.name,
      Type01Operator.multiply => Type01Operator.multiply.name,
      Type01Operator.division => Type01Operator.division.name,
    };
  }
}

extension FromMap on String {
  Type01Operator get fromMap {
    return switch (this) {
      'sum' => Type01Operator.sum,
      'subtraction' => Type01Operator.subtraction,
      'multiply' => Type01Operator.multiply,
      'division' => Type01Operator.division,
      _ => Type01Operator.sum,
    };
  }
}

class CalcType01 {
  final NumberQ num1;
  final NumberQ num2;
  final Type01Operator operator;
  final NumberQ ansCalc;
  final NumberQ? ansStudent;
  CalcType01({
    required this.num1,
    required this.num2,
    required this.operator,
    required this.ansCalc,
    this.ansStudent,
  });

  CalcType01 copyWith({
    NumberQ? num1,
    NumberQ? num2,
    Type01Operator? operator,
    NumberQ? ansCalc,
    NumberQ? ansStudent,
  }) {
    return CalcType01(
      num1: num1 ?? this.num1,
      num2: num2 ?? this.num2,
      operator: operator ?? this.operator,
      ansCalc: ansCalc ?? this.ansCalc,
      ansStudent: ansStudent ?? this.ansStudent,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'num1': num1.toMap()});
    result.addAll({'num2': num2.toMap()});
    result.addAll({'operator': operator.toMap});
    result.addAll({'ans': ansCalc.toMap()});

    return result;
  }

  factory CalcType01.fromMap(Map<String, dynamic> map) {
    return CalcType01(
      num1: NumberQ.fromMap(map['num1']),
      num2: NumberQ.fromMap(map['num2']),
      operator: map['operator'].toString().fromMap,
      ansCalc: NumberQ.fromMap(map['ans']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CalcType01.fromJson(String source) =>
      CalcType01.fromMap(json.decode(source));

  @override
  String toString() {
    return 'CalcType01(num1: $num1, num2: $num2, operator: $operator, ans: $ansCalc, response: $ansStudent)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CalcType01 &&
        other.num1 == num1 &&
        other.num2 == num2 &&
        other.operator == operator &&
        other.ansCalc == ansCalc &&
        other.ansStudent == ansStudent;
  }

  @override
  int get hashCode {
    return num1.hashCode ^
        num2.hashCode ^
        operator.hashCode ^
        ansCalc.hashCode ^
        ansStudent.hashCode;
  }
}
