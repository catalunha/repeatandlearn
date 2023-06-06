import 'dart:developer';
import 'dart:core';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:repeatandlearn/app/core/authentication/riverpod/auth_prov.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/NumberQ/calc_type_01.dart';
import '../../../core/NumberQ/number_q.dart';
import '../../../core/models/calc_model.dart';
import '../../../core/models/user_response_model.dart';
import '../../../core/repositories/repositories_providers.dart';
import '../../../data/b4a/b4a_exception.dart';
import '../../../data/b4a/entity/calc_entity.dart';
import '../../../data/b4a/entity/level_entity.dart';
import '../../../data/b4a/entity/task_entity.dart';
import '../../task/controller/providers.dart';
import 'states.dart';

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
        state = state.replaceFirst('-', '');
        // } else if (state[0] != '+') {
        //   // state = state.replaceFirst('+', '-');
        //   state = '-$state';
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
    // final isCorrectAnsStudent = beforeUpdateState();
    final isCorrectAnsStudent =
        ref.read(calcsListProvider.notifier).setAnsStudent(state);
    ref.read(conversionOkProvider.notifier).state = isCorrectAnsStudent;
    if (state > 0 && isCorrectAnsStudent) {
      state = state - 1;
      afterUpdateState();

      ref.read(conversionOkProvider.notifier).state = true;
      final ansStudent =
          ref.read(calcsListProvider.notifier).getAnsStudent(state);
      ref.read(ansStudentProvider.notifier).update(ansStudent ?? '');
    }
    ref.read(conversionOkProvider.notifier).state = true;
  }

  void next() {
    final indexEnd = ref.read(indexEndProvider);
    // final isCorrectAnsStudent = beforeUpdateState();
    final isCorrectAnsStudent =
        ref.read(calcsListProvider.notifier).setAnsStudent(state);
    ref.read(conversionOkProvider.notifier).state = isCorrectAnsStudent;
    if (state < (indexEnd - 1) && isCorrectAnsStudent) {
      state = state + 1;
      // afterUpdateState();
      ref.read(conversionOkProvider.notifier).state = true;
      final ansStudent =
          ref.read(calcsListProvider.notifier).getAnsStudent(state);
      ref.read(ansStudentProvider.notifier).update(ansStudent ?? '');
    }
    ref.read(conversionOkProvider.notifier).state = true;
  }

  bool beforeUpdateState() {
    final isCorrectAnsStudent =
        ref.read(calcsListProvider.notifier).setAnsStudent(state);
    ref.read(conversionOkProvider.notifier).state = isCorrectAnsStudent;
    return isCorrectAnsStudent;
  }

  void afterUpdateState() {
    ref.read(conversionOkProvider.notifier).state = true;
    final ansStudent =
        ref.read(calcsListProvider.notifier).getAnsStudent(state);
    ref.read(ansStudentProvider.notifier).update(ansStudent ?? '');
  }
}

@riverpod
bool canGoToIndexPrevious(CanGoToIndexPreviousRef ref) {
  return ref.watch(indexCurrentProvider) != 0;
}

@riverpod
bool inLastIndexCurrent(CanGoToIndexPreviousRef ref) {
  final indexEnd = ref.read(indexEndProvider);

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
    return state[index].num1.toStringOrigin();
  }

  String getNum2(int index) {
    return state[index].num2.toStringOrigin();
  }

  // Type01Operator getOperator() {
  //   return state[indexCurr].operator;
  // }

  String getOperatorString(int index) {
    return switch (state[index].operator) {
      Type01Operator.sum => '+',
      Type01Operator.subtraction => '-',
      Type01Operator.multiply => '*',
      Type01Operator.division => '/',
    };
  }

  String getAnsCalc(int index) {
    return state[index].ansCalc.toStringOrigin();
  }

  String? getAnsStudent(int index) {
    return state[index].ansStudent?.toStringOrigin();
  }

  bool setAnsStudent(int index) {
    final ansStudentString = ref.read(ansStudentProvider);
    log(ansStudentString);
    ref.read(ansStudentProvider.notifier).update('');

    if (ansStudentString.isNotEmpty) {
      NumberQ? ansStudent = NumberQ.parse(ansStudentString);
      if (ansStudent != null) {
        log('$state');
        state[index] = state[index].copyWith(ansStudent: ansStudent);
        log('$state');
        return true;
      } else {
        return false;
      }
    } else {
      state[index] = state[index].copyWith(ansStudentSetNull: true);
      return true;
    }
  }

  int countSolved() {
    int countSolved = 0;
    for (var item in state) {
      if (item.ansCalc.isEqualsThe(item.ansStudent)) {
        countSolved++;
      }
    }
    return countSolved;
  }

  String rating() {
    int countSolved = 0;
    for (var item in state) {
      if (item.ansCalc.isEqualsThe(item.ansStudent)) {
        countSolved++;
      }
    }
    double points = countSolved / state.length;
    String rating = 'E';
    if (points > 0.999) {
      rating = 'A';
    } else if (points > 0.9) {
      rating = 'B';
    } else if (points > 0.8) {
      rating = 'C';
    } else if (points > 0.7) {
      rating = 'D';
    }
    return rating;
  }
}

@Riverpod(keepAlive: true)
class TimerResolution extends _$TimerResolution {
  @override
  TimerResolutionState build() {
    return TimerResolutionState();
  }

  void startResolution() {
    state = state.copyWith(start: DateTime.now());
  }

  void stopResolution() {
    state = state.copyWith(end: DateTime.now());
    _diference();
  }

  void _diference() {
    // if (state.start != null && state.end != null) {
    Duration diff = state.end!.difference(state.start!);
    // return diff.inMinutes;
    state = state.copyWith(diference: diff.inMinutes);

    // } else {
    //   return null;
    // }
  }
}

final registerStatusProvider =
    StateProvider.autoDispose<RegisterStatus>((ref) => RegisterStatus.initial);

@riverpod
class RegisterTraining extends _$RegisterTraining {
  @override
  bool build() {
    return true;
  }

  Future<void> register() async {
    ref.read(registerStatusProvider.notifier).state = RegisterStatus.loading;
    try {
      final userResponseRepository = ref.read(userResponseRepositoryProvider);
      final taskSelected = ref.watch(taskSelectedProvider)!;
      final auth = ref.read(authChNotProvider);
      final timer = ref.read(timerResolutionProvider);
      await userResponseRepository.update(
        UserResponseModel(
          userProfile: auth.user!.userProfile!,
          level: taskSelected.level,
          task: taskSelected,
          startIn: timer.start!,
          minutes: timer.diference!,
          rating: ref.read(calcsListProvider.notifier).rating(),
        ),
        taskSelected.id!,
      );
      ref.read(registerStatusProvider.notifier).state = RegisterStatus.success;
    } on B4aException catch (e, st) {
      // ref.read(userLoginErrorProvider.notifier).state = e.message;
      ref.read(registerStatusProvider.notifier).state = RegisterStatus.error;
      log('$st');
    } catch (e, st) {
      // ref.read(userLoginErrorProvider.notifier).state =
      //     'Erro desconhecido no login.';
      ref.read(registerStatusProvider.notifier).state = RegisterStatus.error;
      log('$st');
    }
  }
}
