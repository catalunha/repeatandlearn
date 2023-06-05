import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/NumberQ/calc_type_01.dart';
import '../../../core/NumberQ/number_q.dart';
import '../../../core/models/calc_model.dart';
import '../../../core/repositories/repositories_providers.dart';
import '../../../data/b4a/entity/calc_entity.dart';
import '../../../data/b4a/entity/level_entity.dart';
import '../../../data/b4a/entity/task_entity.dart';
import '../../task/controller/providers.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<CalcModel>> calcList(
  CalcListRef ref,
) async {
  final taskSelected = ref.watch(taskSelectedProvider)!;

  QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject(CalcEntity.className));
  query.whereEqualTo(
      CalcEntity.level,
      (ParseObject(LevelEntity.className)..objectId = taskSelected.level.id)
          .toPointer());
  query.whereEqualTo(
      CalcEntity.task,
      (ParseObject(TaskEntity.className)..objectId = taskSelected.id)
          .toPointer());
  final calcListTemp =
      await ref.read(calcRepositoryProvider).list(query: query);
  ref.read(indexEndProvider.notifier).state = calcListTemp.length;
  List<CalcType01> calcType01Temp = [];
  for (var calc in calcListTemp) {
    calcType01Temp.add(calc.calc);
  }
  ref.read(calcsListProvider.notifier).setState(calcType01Temp);

  return calcListTemp;
}

final indexEndProvider = StateProvider<int>((ref) {
  return 0;
});
final conversionOkProvider = StateProvider<bool>((ref) {
  return true;
});
// final ansStudentProvider = StateProvider<String>((ref) {
//   return '';
// });

@Riverpod(keepAlive: true)
class AnsStudent extends _$AnsStudent {
  @override
  String build() {
    return '';
  }

  void update(String value) {
    state = value;
  }

  void add(String char) {
    state = '$state$char';
  }

  void removeLast() {
    if (state.isNotEmpty) {
      state = state.substring(0, state.length - 1);
    }
  }

  void toggleSignal() {
    if (state.isNotEmpty) {
      if (state[0] == '-') {
        state = state.replaceFirst('-', '+');
      } else if (state[0] == '+') {
        state = state.replaceFirst('+', '-');
      } else {
        state = '-$state';
      }
    } else {
      state = '$state-';
    }
  }
}

@Riverpod(keepAlive: true)
class IndexCurrent extends _$IndexCurrent {
  @override
  int build() {
    return 0;
  }

  void previous() {
    if (state > 0) {
      final isCorrectAnsStudent =
          ref.read(calcsListProvider.notifier).setAnsStudent(state);
      ref.read(conversionOkProvider.notifier).state = isCorrectAnsStudent;
      state = state - 1;
      ref.read(conversionOkProvider.notifier).state = true;
      final ansStudent =
          ref.read(calcsListProvider.notifier).getAnsStudent(state);
      ref.read(ansStudentProvider.notifier).update(ansStudent ?? '');
    }
  }

  void next() {
    final indexEnd = ref.watch(indexEndProvider);
    final list = ref.read(calcsListProvider);
    log('$list', name: 'next calcsListProvider');
          final isCorrectAnsStudent =
          ref.read(calcsListProvider.notifier).setAnsStudent(state);
      ref.read(conversionOkProvider.notifier).state = isCorrectAnsStudent;
    if (state < (indexEnd - 1) && isCorrectAnsStudent) {

      state = state + 1;
      ref.read(conversionOkProvider.notifier).state = true;
      final ansStudent =
          ref.read(calcsListProvider.notifier).getAnsStudent(state);
      log('IndexCurrent: $state');
      log('next ansStudent: $ansStudent');
      ref.read(ansStudentProvider.notifier).update(ansStudent ?? '');
    }
  }
}

@riverpod
bool canGoToIndexPrevious(CanGoToIndexPreviousRef ref) {
  return ref.watch(indexCurrentProvider) != 0;
}

@riverpod
bool inLastIndexCurrent(CanGoToIndexPreviousRef ref) {
  final indexEnd = ref.watch(indexEndProvider);

  return ref.watch(indexCurrentProvider) == (indexEnd - 1);
}

@Riverpod(keepAlive: true)
class CalcsList extends _$CalcsList {
  @override
  List<CalcType01> build() {
    log('CalcsList build');
    return [];
  }

  void setState(List<CalcType01> temp) {
    state = temp;
  }

  String getNum1(int index) {
    // final indexCurr = ref.watch(indexCurrentProvider);
    return state[index].num1.toStringOrigin();
  }

  String getNum2(int index) {
    // final indexCurr = ref.watch(indexCurrentProvider);
    return state[index].num2.toStringOrigin();
  }

  // Type01Operator getOperator() {
  //   // final indexCurr = ref.watch(indexCurrentProvider);
  //   return state[indexCurr].operator;
  // }

  String getOperatorString(int index) {
    // final indexCurr = ref.watch(indexCurrentProvider);
    return switch (state[index].operator) {
      Type01Operator.sum => '+',
      Type01Operator.subtraction => '-',
      Type01Operator.multiply => '*',
      Type01Operator.division => '/',
    };
  }

  String getAnsCalc(int index) {
    // final indexCurr = ref.watch(indexCurrentProvider);
    return state[index].ansCalc.toStringOrigin();
  }

  String? getAnsStudent(int index) {
    // final indexCurr = ref.watch(indexCurrentProvider);
    return state[index].ansStudent?.toStringOrigin();
  }

  bool setAnsStudent(int index) {
    final ansStudentString = ref.read(ansStudentProvider);
    if (ansStudentString.isNotEmpty) {
      NumberQ? ansStudent = NumberQ.parse(ansStudentString);
      if (ansStudent != null) {
        // final indexCurr = ref.watch(indexCurrentProvider);
        // print(state);
        state[index] = state[index].copyWith(ansStudent: ansStudent);
        return true;
      } else {
        return false;
      }
    } else {
      return true;
    }
  }

  // String ansStudentToString() {
  //   final indexCurr = ref.watch(indexCurrentProvider);
  //   final ansStudent = state[indexCurr].ansStudent;
  //   final ansStudentString = ref.watch(ansStudentProvider.notifier).state =
  //       ansStudent?.toStringOrigin() ?? '';
  //   return ansStudentString;
  // }
}
