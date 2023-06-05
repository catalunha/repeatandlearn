import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearn/app/features/calc/controller/providers.dart';

class CalcsCalc extends ConsumerWidget {
  const CalcsCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexCurrent = ref.watch(indexCurrentProvider);

    final calc = ref.watch(calcsListProvider.notifier);
    return Text(
        '${calc.getNum1(indexCurrent)} ${calc.getOperatorString(indexCurrent)} ${calc.getNum2(indexCurrent)}');
  }
}
