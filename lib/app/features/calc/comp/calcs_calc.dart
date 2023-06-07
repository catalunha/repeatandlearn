import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/providers.dart';

class CalcsCalc extends ConsumerWidget {
  const CalcsCalc({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final indexCurrent = ref.watch(indexCurrentProvider);

    final calc = ref.watch(calcsListProvider.notifier);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          calc.getNum1(indexCurrent),
          style: const TextStyle(fontSize: 70),
        ),
        const SizedBox(width: 10),
        Text(
          calc.getOperatorString(indexCurrent),
          style: const TextStyle(fontSize: 50, color: Colors.blue),
        ),
        const SizedBox(width: 10),
        Text(
          calc.getNum2(indexCurrent),
          style: const TextStyle(fontSize: 70),
        ),
      ],
    );
  }
}
