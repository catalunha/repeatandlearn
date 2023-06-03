import 'dart:convert';
import 'dart:math';

import 'alg_gcf_lcm.dart';

enum NumberQType { integer, decimal, fraction, mixed }

enum NumberQSignal { positive, negative }

class NumberQ {
  final NumberQSignal signal;
  final int? integer;
  final int? fractionNum;
  final int? fractionDen;
  final String? decimal;
  NumberQType? _type;
  int? _integerReduced;
  String? _decimalReduced;
  int? _decimalReducedInt;
  int? _decimalPlaces;
  int? _fractionNumReduced;
  int? _fractionDenReduced;
  NumberQType? _typeReduced;
  double? _inDouble;
  NumberQ({
    this.signal = NumberQSignal.positive,
    this.integer,
    this.decimal,
    this.fractionNum,
    this.fractionDen,
  }) {
    setTypeOrigin();
    simplifyValues();
    setTypeReduced();
    calculeInDouble();
  }

  bool isEqualsThe(NumberQ num2) {
    if (type != num2.type) {
      return false;
    }
    if (toStringReduced() != num2.toStringReduced()) {
      return false;
    }
    return true;
  }

  List<int> disassemble() {
    if (type != NumberQType.integer) {
      throw Exception('Operação permitida apenas com inteiros puros');
    }
    if (integer! > 999) {
      throw Exception('O valor deve ser menor que 1000');
    }
    List<int> valueList =
        integer.toString().split('').map((e) => int.parse(e)).toList();
    // valueList.reversed;
    List<int> potency = [1, 10, 100];
    for (var i = 0; i < valueList.length; i++) {
      valueList[i] = valueList[i] * potency[valueList.length - 1 - i];
    }
    valueList.sort();
    return valueList;
  }

  static NumberQ assemble(List<int> disassembleNumber) {
    int temp = 0;
    for (var element in disassembleNumber) {
      temp += element;
    }
    if (temp > 999) {
      throw Exception('O valor deve ser menor que 1000');
    }
    return NumberQ(integer: temp);
  }

  static NumberQ? parse(String myNumberInString) {
    bool isSuccessful = true;

    NumberQ myNumber = NumberQ();
    try {
      var parts = myNumberInString.split(' ');
      if (parts.length == 1) {
        String partUnic = parts[0];
        if (!partUnic.contains('.') && !partUnic.contains('/')) {
          //print('$parte Is integer');
          int a = int.parse(partUnic);
          NumberQSignal signalTemp =
              a >= 0 ? NumberQSignal.positive : NumberQSignal.negative;
          myNumber = myNumber.copyWith(
            integer: a.abs(),
            signal: signalTemp,
          );
        } else if (partUnic.contains('.')) {
          //print('$parte Is decimal');
          var partsDec = partUnic.split('.');
          int a = int.parse(partsDec[0]);
          String b = partsDec[1];
          NumberQSignal signalTemp = NumberQSignal.positive;
          if (a == 0) {
            if (partsDec[0][0] == '-') {
              signalTemp = NumberQSignal.negative;
            }
          } else {
            signalTemp =
                a >= 0 ? NumberQSignal.positive : NumberQSignal.negative;
          }
          myNumber = myNumber.copyWith(
            integer: a.abs(),
            decimal: b,
            signal: signalTemp,
          );
        } else if (partUnic.contains('/')) {
          //print('$parte Is fração');
          var partsFrac = partUnic.split('/');
          int a = int.parse(partsFrac[0]);
          int b = int.parse(partsFrac[1]);
          NumberQSignal signalTemp =
              a >= 0 ? NumberQSignal.positive : NumberQSignal.negative;
          myNumber = myNumber.copyWith(
            fractionNum: a.abs(),
            fractionDen: b.abs(),
            signal: signalTemp,
          );
        }
      } else {
        String partInt = parts[0];
        int a = int.parse(partInt);
        List<String> partFrac = parts[1].split('/');
        String partNum = partFrac[0];
        String partDen = partFrac[1];
        int b = int.parse(partNum);
        int c = int.parse(partDen);
        NumberQSignal signalTemp =
            a >= 0 ? NumberQSignal.positive : NumberQSignal.negative;
        myNumber = myNumber.copyWith(
          integer: a.abs(),
          fractionNum: b.abs(),
          fractionDen: c.abs(),
          signal: signalTemp,
        );
      }
    } catch (_) {
      isSuccessful = false;
    }
    if (isSuccessful) {
      return myNumber;
    } else {
      return null;
    }
  }

  void simplifyValues() {
    //print('etapa0: ${toString()}');
    _integerReduced = integer;
    readDecimal();
    _fractionNumReduced = _fractionNumReduced ?? fractionNum;
    _fractionDenReduced = _fractionDenReduced ?? fractionDen;
    //print('etapa1: ${toString()}');
    if (_fractionNumReduced != null && _fractionDenReduced != null) {
      int lcm = algLCM(_fractionNumReduced!, _fractionDenReduced!);
      //print('lcm: $lcm');
      _fractionNumReduced = _fractionNumReduced! ~/ lcm;
      _fractionDenReduced = _fractionDenReduced! ~/ lcm;
      //print('etapa2: ${toString()}');

      if (_fractionNumReduced! > _fractionDenReduced!) {
        _integerReduced = (_integerReduced ?? 0) +
            _fractionNumReduced! ~/ _fractionDenReduced!;
        _fractionNumReduced = _fractionNumReduced! % _fractionDenReduced!;
      }
      //print('etapa3: ${toString()}');

      if (_fractionNumReduced == 0 && _fractionDenReduced == 1) {
        _fractionNumReduced = null;
        _fractionDenReduced = null;
      }
      if (_fractionNumReduced == null &&
          _fractionDenReduced == null &&
          _integerReduced == null) {
        _integerReduced = 0;
      }
      try {
        if (_fractionNumReduced == _fractionDenReduced &&
            _fractionNumReduced != null &&
            _fractionDenReduced != null) {
          _integerReduced = _integerReduced != null ? _integerReduced! + 1 : 1;
          _fractionNumReduced = null;
          _fractionDenReduced = null;
        }
      } catch (_) {
        print('+++ Eeeeeerrrrrooooo');
        print(this);
        print('--- Eeeeeerrrrrooooo');
        throw Exception('Erro 1');
      }
      //print('etapa4: ${toString()}');
    }
  }

  void readDecimal() {
    if (decimal != null && (fractionNum != null || fractionDen != null)) {
      throw Exception('A parte decimal é numérica ou fração ?');
    }
    if (decimal != null) {
      try {
        _decimalPlaces = decimal!.length;
        _decimalReduced = decimal;
        if (_decimalPlaces! > 3) {
          _decimalReduced = _decimalReduced!.substring(0, 3);
        }
        _decimalReduced = _decimalReduced!.padRight(3, '0');
        _decimalReducedInt = int.parse(_decimalReduced!);
        _fractionNumReduced = _decimalReducedInt;
        _fractionDenReduced = 1000;
      } catch (e) {
        throw Exception('Decimal informado fora do padrão.');
      }
    }
  }

  void calculeInDouble() {
    if (typeReduced == NumberQType.integer) {
      try {
        _inDouble = _integerReduced == null
            ? null
            : (signalValue * _integerReduced!).toDouble();
      } catch (e) {
        print('Erro em integer');
      }
    }
    if (typeReduced == NumberQType.decimal) {
      try {
        _inDouble = (signalValue *
            (_integerReduced! +
                (_fractionNumReduced ?? 0) / (_fractionDenReduced ?? 1)));
      } catch (_) {
        print('+++ Erro');
        print(this);
        print('--- Erro');
      }
    }
    if (typeReduced == NumberQType.fraction) {
      _inDouble = signalValue * _fractionNumReduced! / _fractionDenReduced!;
    }
    if (typeReduced == NumberQType.mixed) {
      _inDouble = (signalValue *
          (_integerReduced! + _fractionNumReduced! / _fractionDenReduced!));
    }
  }

  void setTypeOrigin() {
    //original
    if (integer != null &&
        decimal == null &&
        fractionNum == null &&
        fractionDen == null) {
      _type = NumberQType.integer;
    } else if (integer != null &&
        decimal != null &&
        fractionNum == null &&
        fractionDen == null) {
      _type = NumberQType.decimal;
    } else if (integer == null &&
        decimal == null &&
        fractionNum != null &&
        fractionDen != null &&
        fractionDen != 0) {
      _type = NumberQType.fraction;
    } else if (integer != null &&
        decimal == null &&
        fractionNum != null &&
        fractionDen != null &&
        fractionDen != 0) {
      _type = NumberQType.mixed;
    } else if (integer == null &&
        decimal == null &&
        fractionNum == null &&
        fractionDen == null) {
    } else {
      print(this);
      throw Exception('Numero desconhecido.');
    }
  }

  void setTypeReduced() {
    //reduced
    if (_decimalReduced == null &&
        _fractionNumReduced == null &&
        _fractionDenReduced == null) {
      _typeReduced = NumberQType.integer;
    } else if (_integerReduced != null && _decimalReduced != null) {
      _typeReduced = NumberQType.decimal;
    } else if (_integerReduced == null &&
        _fractionNumReduced != null &&
        _fractionDenReduced != null) {
      _typeReduced = NumberQType.fraction;
    } else {
      _typeReduced = NumberQType.mixed;
    }
  }

  int get signalValue {
    if (signal == NumberQSignal.positive) {
      return 1;
    } else {
      return -1;
    }
  }

  String get signalSymbol {
    if (signal == NumberQSignal.positive) {
      return '+';
    } else {
      return '-';
    }
  }

  String? get decimalReduced {
    return _decimalReduced;
  }

  int? get decimalReducedInt {
    return _decimalReducedInt;
  }

  int? get decimalPlaces {
    return _decimalPlaces;
  }

  int? get integerReduced {
    return _integerReduced;
  }

  int? get fractionNumReduced {
    return _fractionNumReduced;
  }

  int? get fractionDenReduced {
    return _fractionDenReduced;
  }

  double get inDouble {
    return _inDouble!;
  }

  NumberQType? get type {
    return _type;
  }

  NumberQType? get typeReduced {
    return _typeReduced;
  }

  String toStringReduced() {
    String myNumber = '';
    if (typeReduced == NumberQType.integer) {
      myNumber += '$signalSymbol$integerReduced';
    }
    if (typeReduced == NumberQType.decimal) {
      myNumber += '$signalSymbol$integerReduced.$_decimalReduced';
    }
    if (typeReduced == NumberQType.fraction) {
      myNumber += '$signalSymbol$fractionNumReduced/$_fractionDenReduced';
    }
    if (typeReduced == NumberQType.mixed) {
      myNumber +=
          '$signalSymbol$integerReduced $fractionNumReduced/$_fractionDenReduced';
    }
    return myNumber;
  }

  String toStringFraction() {
    String myNumber = '';
    if (typeReduced == NumberQType.integer) {
      myNumber += '$signalSymbol$integerReduced/1';
    }
    if (typeReduced == NumberQType.decimal) {
      // int num = (pow(10, _decimalPlaces!).toInt() *
      //     _integerReduced! *
      //     _decimalReducedInt!);
      // myNumber += '$signalSymbol$num/${pow(10, _decimalPlaces!).toInt()}';
      myNumber += '$signalSymbol$fractionNumReduced/$_fractionDenReduced';
    }
    if (typeReduced == NumberQType.fraction) {
      myNumber += '$signalSymbol$fractionNumReduced/$_fractionDenReduced';
    }
    if (typeReduced == NumberQType.mixed) {
      int num = _fractionDenReduced! * _integerReduced! + fractionNumReduced!;
      myNumber += '$signalSymbol$num/$_fractionDenReduced';
    }
    return myNumber;
  }

  String toStringOrigin() {
    String myNumber = '';
    // MyNumberType typeTemp;
    // if (decimal == null && fractionNum == null && fractionDen == null) {
    //   typeTemp = MyNumberType.integer;
    // } else if (fractionNum == null && fractionDen == null) {
    //   typeTemp = MyNumberType.decimal;
    // } else if (integer == null && fractionNum != null && fractionDen != null) {
    //   typeTemp = MyNumberType.fraction;
    // } else {
    //   typeTemp = MyNumberType.mixed;
    // }

    if (type == NumberQType.integer) {
      myNumber += '$signalSymbol$integer';
    }
    if (type == NumberQType.decimal) {
      myNumber += '$signalSymbol$integer.$_decimalReduced';
    }
    if (type == NumberQType.fraction) {
      myNumber += '$signalSymbol$fractionNum/$fractionDen';
    }
    if (type == NumberQType.mixed) {
      myNumber += '$signalSymbol$integer $fractionNum/$fractionDen';
    }
    return myNumber;
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'signal': signal == NumberQSignal.positive ? '+' : '-'});
    if (integer != null) {
      result.addAll({'integer': integer});
    }
    if (fractionNum != null) {
      result.addAll({'fractionNum': fractionNum});
    }
    if (fractionDen != null) {
      result.addAll({'fractionDen': fractionDen});
    }
    if (decimal != null) {
      result.addAll({'decimal': decimal});
    }

    return result;
  }

  factory NumberQ.fromMap(Map<String, dynamic> map) {
    return NumberQ(
      signal: map['signal'] == '+'
          ? NumberQSignal.positive
          : NumberQSignal.negative,
      integer: map['integer']?.toInt(),
      fractionNum: map['fractionNum']?.toInt(),
      fractionDen: map['fractionDen']?.toInt(),
      decimal: map['decimal'],
    );
  }

  String toJson() => json.encode(toMap());

  factory NumberQ.fromJson(String source) =>
      NumberQ.fromMap(json.decode(source));

  NumberQ copyWith({
    NumberQSignal? signal,
    int? integer,
    int? fractionNum,
    int? fractionDen,
    String? decimal,
  }) {
    return NumberQ(
      signal: signal ?? this.signal,
      integer: integer ?? this.integer,
      fractionNum: fractionNum ?? this.fractionNum,
      fractionDen: fractionDen ?? this.fractionDen,
      decimal: decimal ?? this.decimal,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is NumberQ &&
        other.signal == signal &&
        other.integer == integer &&
        other.fractionNum == fractionNum &&
        other.fractionDen == fractionDen &&
        other.decimal == decimal &&
        other._integerReduced == _integerReduced &&
        other._decimalReduced == _decimalReduced &&
        other._decimalReducedInt == _decimalReducedInt &&
        other._decimalPlaces == _decimalPlaces &&
        other._fractionNumReduced == _fractionNumReduced &&
        other._fractionDenReduced == _fractionDenReduced &&
        other._inDouble == _inDouble;
  }

  @override
  int get hashCode {
    return signal.hashCode ^
        integer.hashCode ^
        fractionNum.hashCode ^
        fractionDen.hashCode ^
        decimal.hashCode ^
        _integerReduced.hashCode ^
        _decimalReduced.hashCode ^
        _decimalReducedInt.hashCode ^
        _decimalPlaces.hashCode ^
        _fractionNumReduced.hashCode ^
        _fractionDenReduced.hashCode ^
        _inDouble.hashCode;
  }

  @override
  String toString() {
    return 'MyNumber(signal: $signal, integer: $integer, decimal: $decimal, fractionNum: $fractionNum, fractionDen: $fractionDen, _type: $_type _integerReduced: $_integerReduced, _decimalReduced: $_decimalReduced, _fractionNumReduced: $_fractionNumReduced, _fractionDenReduced: $_fractionDenReduced, _typeReduced: $_typeReduced _inDouble: $_inDouble)';
  }

  NumberQ operator +(NumberQ num2) {
    //print('+++ sum +++');
    NumberQ output = NumberQ();
    if (type == NumberQType.integer && num2.type == NumberQType.integer) {
      int? integerTemp = (integerReduced == null) && num2.integerReduced == null
          ? null
          : signalValue * (integerReduced ?? 0) +
              num2.signalValue * (num2.integerReduced ?? 0);
      NumberQSignal signal = integerTemp != null && integerTemp < 0
          ? NumberQSignal.negative
          : NumberQSignal.positive;
      output = output.copyWith(
        integer: integerTemp?.abs(),
        signal: signal,
      );
      return output;
    }

    if (type == NumberQType.decimal && num2.type == NumberQType.decimal) {
      var res1 = (integerReduced! + decimalReducedInt! / 1000);
      var res2 = (num2.integerReduced! + num2.decimalReducedInt! / 1000);
      NumberQSignal signal = NumberQSignal.positive;
      // if ((res1 - res2) != 0.0) {
      signal = res1 >= res2 ? this.signal : num2.signal;
      // }
      int? integerTemp = signalValue * (integerReduced ?? 0) +
          num2.signalValue * (num2.integerReduced ?? 0);

      int? decimalTemp = signalValue * (decimalReducedInt!) +
          num2.signalValue * (num2.decimalReducedInt!);

      if (decimalTemp >= 1000) {
        decimalTemp = decimalTemp - 1000;
        integerTemp++;
      }

      output = output.copyWith(
        integer: integerTemp.abs(),
        decimal: decimalTemp.abs().toString().padLeft(3, '0'),
        signal: signal,
      );
      return output;
    }

    int f1num = (_fractionDenReduced ?? 1) * (_integerReduced ?? 0) +
        (fractionNumReduced ?? 0);
    int f1den = fractionDenReduced ?? 1;
    int f2num = (num2.fractionDenReduced ?? 1) * (num2.integerReduced ?? 0) +
        (num2.fractionNumReduced ?? 0);
    int f2den = num2.fractionDenReduced ?? 1;

    int gcf = algGCF(f1den, f2den);
    f1num = (f1num) * (gcf ~/ (f1den));
    f2num = (f2num) * (gcf ~/ (f2den));
    int fnum = signalValue * f1num + num2.signalValue * f2num;
    int fden = gcf;
    NumberQSignal signal =
        fnum < 0 ? NumberQSignal.negative : NumberQSignal.positive;
    //print('+++ sum 2 +++');

    output = output.copyWith(
      fractionNum: fnum.abs(),
      fractionDen: fden,
      signal: signal,
    );
    //print('+++ sum 3 +++');

    // output.simplifyFraction();
    // output.calculeInDouble();
    // output.setType();
    return output;
  }

  NumberQ operator -(NumberQ num2) {
    NumberQ output = NumberQ();
    if (type == NumberQType.integer && num2.type == NumberQType.integer) {
      int? integerTemp = (integerReduced == null) && num2.integerReduced == null
          ? null
          : signalValue * (integerReduced ?? 0) -
              num2.signalValue * (num2.integerReduced ?? 0);
      NumberQSignal signal = integerTemp != null && integerTemp < 0
          ? NumberQSignal.negative
          : NumberQSignal.positive;
      output = output.copyWith(
        integer: integerTemp?.abs(),
        signal: signal,
      );
      return output;
    }

    if (type == NumberQType.decimal && num2.type == NumberQType.decimal) {
      var res1 = (integerReduced! + decimalReducedInt! / 1000);
      var res2 = -1 * (num2.integerReduced! + num2.decimalReducedInt! / 1000);
      NumberQSignal signal = res1 > res2 ? this.signal : num2.signal;

      int? integerTemp = signalValue * (integerReduced ?? 0) -
          num2.signalValue * (num2.integerReduced ?? 0);

      int? decimalTemp = signalValue * (decimalReducedInt ?? 0) -
          num2.signalValue * (num2.decimalReducedInt ?? 0);

      if (decimalTemp >= 1000) {
        decimalTemp = decimalTemp - 1000;
        integerTemp++;
      }

      output = output.copyWith(
        integer: integerTemp.abs(),
        decimal: decimalTemp.abs().toString().padLeft(3, '0'),
        signal: signal,
      );
      return output;
    }

    int f1num = (_fractionDenReduced ?? 1) * (_integerReduced ?? 0) +
        (fractionNumReduced ?? 0);
    int f1den = fractionDenReduced ?? 1;
    int f2num = (num2.fractionDenReduced ?? 1) * (num2.integerReduced ?? 0) +
        (num2.fractionNumReduced ?? 0);
    int f2den = num2.fractionDenReduced ?? 1;

    int gcf = algGCF(f1den, f2den);
    f1num = (f1num) * (gcf ~/ (f1den));
    f2num = (f2num) * (gcf ~/ (f2den));
    int fnum = signalValue * f1num - num2.signalValue * f2num;
    int fden = gcf;
    NumberQSignal signal =
        fnum < 0 ? NumberQSignal.negative : NumberQSignal.positive;
    output = output.copyWith(
      fractionNum: fnum.abs(),
      fractionDen: fden,
      signal: signal,
    );
    return output;
  }

  NumberQ operator *(NumberQ num2) {
    NumberQ output = NumberQ();

    if (type == NumberQType.decimal && num2.type == NumberQType.decimal) {
      NumberQSignal signal = (signalValue * num2.signalValue) > 0
          ? NumberQSignal.positive
          : NumberQSignal.negative;

      int product = (integerReduced! * 1000 + decimalReducedInt!) *
          (num2.integerReduced! * 1000 + num2.decimalReducedInt!);

      double productDouble = product / 1000000;

      output = output.copyWith(
        integer: productDouble.toInt(),
        decimal: productDouble.toStringAsFixed(3).split('.')[1],
        signal: signal,
      );
      return output;
    }

    int f1num = (fractionDenReduced ?? 1) * (integerReduced ?? 0) +
        (fractionNumReduced ?? 0);
    int f1den = fractionDenReduced ?? 1;
    int f2num = (num2.fractionDenReduced ?? 1) * (num2.integerReduced ?? 0) +
        (num2.fractionNumReduced ?? 0);
    int f2den = num2.fractionDenReduced ?? 1;
    int fnum = signalValue * f1num * num2.signalValue * f2num;
    int fden = f1den * f2den;
    int lcm = algLCM(fnum, fden);
    fnum = fnum ~/ lcm;
    fden = fden ~/ lcm;
    NumberQSignal signal =
        fnum < 0 ? NumberQSignal.negative : NumberQSignal.positive;
    fnum = fnum.abs();
    output = output.copyWith(
      integer: fden == 1 ? fnum : null,
      fractionNum: fden == 1 ? null : fnum,
      fractionDen: fden == 1 ? null : fden,
      signal: signal,
    );
    return output;
  }

  NumberQ operator /(NumberQ num2) {
    NumberQ output = NumberQ();
    int f1num = (fractionDenReduced ?? 1) * (integerReduced ?? 0) +
        (fractionNumReduced ?? 0);
    int f1den = fractionDenReduced ?? 1;
    int f2num = (num2.fractionDenReduced ?? 1) * (num2.integerReduced ?? 0) +
        (num2.fractionNumReduced ?? 0);
    int f2den = num2.fractionDenReduced ?? 1;
    int fnum = signalValue * f1num * num2.signalValue * f2den;
    int fden = f1den * f2num;
    int lcm = algLCM(fnum, fden);
    fnum = fnum ~/ lcm;
    fden = fden ~/ lcm;
    NumberQSignal signal =
        fnum < 0 ? NumberQSignal.negative : NumberQSignal.positive;
    fnum = fnum.abs();
    output = output.copyWith(
      integer: fden == 1 ? fnum : null,
      fractionNum: fden == 1 ? null : fnum,
      fractionDen: fden == 1 ? null : fden,
      signal: signal,
    );
    return output;
  }

  NumberQ operator ^(NumberQ num2) {
    if (num2.type != NumberQType.integer &&
        num2.signal != NumberQSignal.positive) {
      throw Exception('Expoente precisa ser inteiro e positivo');
    }
    NumberQ output = NumberQ();
    if (type == NumberQType.integer) {
      output = output.copyWith(
          integer: pow(integerReduced!, num2.integerReduced!).toInt());
      return output;
    }
    int f1num = (fractionDenReduced ?? 1) * (integerReduced ?? 0) +
        (fractionNumReduced ?? 0);
    int f1den = fractionDenReduced ?? 1;

    int fnum = pow(signalValue * f1num, num2.integerReduced!).toInt();
    int fden = pow(f1den, num2.integerReduced!).toInt();
    NumberQSignal signal =
        fnum < 0 ? NumberQSignal.negative : NumberQSignal.positive;
    fnum = fnum.abs();
    output = output.copyWith(
      signal: signal,
      fractionNum: fnum,
      fractionDen: fden,
    );
    return output;
  }

  NumberQ operator &(NumberQ num2) {
    if (num2.type != NumberQType.integer &&
        num2.signal != NumberQSignal.positive) {
      throw Exception('Raiz precisa ser inteiro e positivo');
    }
    NumberQ output = NumberQ();

    if (type == NumberQType.integer) {
      num temp = pow(integerReduced!, 1 / num2.integerReduced!);
      if (temp % 1 != 0) {
        throw Exception('Erro: A raiz quadrada é decimal');
      }
      output = output.copyWith(integer: (temp % 1 == 0) ? temp.toInt() : null);
      return output;
    }
    int f1num = (fractionDenReduced ?? 1) * (integerReduced ?? 0) +
        (fractionNumReduced ?? 0);
    //print('f1num: $f1num');
    int f1den = fractionDenReduced ?? 1;
    //print('f1den: $f1den');

    num fnum = pow(signalValue * f1num, 1 / num2.integerReduced!);
    //print('fnum: $fnum');
    if (fnum % 1 != 0) {
      throw Exception('Erro: A raiz quadrada é decimal');
    }
    num fden = pow(f1den, 1 / num2.integerReduced!);
    //print('fden: $fden');
    if (fden % 1 != 0) {
      throw Exception('Erro: A raiz quadrada é decimal');
    }
    NumberQSignal signal =
        fnum < 0 ? NumberQSignal.negative : NumberQSignal.positive;
    fnum = fnum.abs();
    //print('output1: $output');
    output = output.copyWith(
      signal: signal,
      fractionNum: (fnum % 1 == 0) ? fnum.toInt() : null,
      fractionDen: (fden % 1 == 0) ? fden.toInt() : null,
    );
    return output;
  }
}
