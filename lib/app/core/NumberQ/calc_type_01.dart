import 'dart:convert';

import 'number_q.dart';

enum Type1Operator { sum, subtraction, multiply, division }

extension ToMap on Type1Operator {
  String get toMap {
    return switch (this) {
      Type1Operator.sum => Type1Operator.sum.name,
      Type1Operator.subtraction => Type1Operator.subtraction.name,
      Type1Operator.multiply => Type1Operator.multiply.name,
      Type1Operator.division => Type1Operator.division.name,
    };
  }
}

extension FromMap on String {
  Type1Operator get fromMap {
    return switch (this) {
      'sum' => Type1Operator.sum,
      'subtraction' => Type1Operator.subtraction,
      'multiply' => Type1Operator.multiply,
      'division' => Type1Operator.division,
      _ => Type1Operator.sum,
    };
  }
}

class CalcType01 {
  final NumberQ num1;
  final NumberQ num2;
  final Type1Operator operator;
  final NumberQ ans;
  CalcType01({
    required this.num1,
    required this.num2,
    required this.operator,
    required this.ans,
  });

  CalcType01 copyWith({
    NumberQ? num1,
    NumberQ? num2,
    Type1Operator? operator,
    NumberQ? ans,
  }) {
    return CalcType01(
      num1: num1 ?? this.num1,
      num2: num2 ?? this.num2,
      operator: operator ?? this.operator,
      ans: ans ?? this.ans,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'num1': num1.toMap()});
    result.addAll({'num2': num2.toMap()});
    result.addAll({'operator': operator.toMap});
    result.addAll({'ans': ans.toMap()});

    return result;
  }

  factory CalcType01.fromMap(Map<String, dynamic> map) {
    return CalcType01(
      num1: NumberQ.fromMap(map['num1']),
      num2: NumberQ.fromMap(map['num2']),
      operator: map['operator'].toString().fromMap,
      ans: NumberQ.fromMap(map['ans']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CalcType01.fromJson(String source) =>
      CalcType01.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Type1(num1: $num1, num2: $num2, operator: $operator, ans: $ans)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CalcType01 &&
        other.num1 == num1 &&
        other.num2 == num2 &&
        other.operator == operator &&
        other.ans == ans;
  }

  @override
  int get hashCode {
    return num1.hashCode ^ num2.hashCode ^ operator.hashCode ^ ans.hashCode;
  }
}
