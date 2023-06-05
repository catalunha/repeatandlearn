import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearn/app/core/NumberQ/calc_type_01.dart';

import 'controller/providers.dart';

class CalcReportPage extends ConsumerWidget {
  const CalcReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calcsList = ref.read(calcsListProvider);
    final rating = ref.read(calcsListProvider.notifier).rating();
    final timerResolution = ref.read(timerResolutionProvider);
    final diffTimerResolution =
        ref.read(timerResolutionProvider.notifier).diference();
    return Scaffold(
      appBar: AppBar(
        title: const Text('CalcsReport'),
      ),
      body: Column(
        children: [
          Text('Seu nivel é: $rating'),
          Text('Você iniciou o treinamento em: ${timerResolution.start}'),
          Text('Com tempo de resolução de : $diffTimerResolution minutos'),
          // Flexible(
          //   child: ListView.builder(
          //     itemCount: calcsList.length,
          //     itemBuilder: (context, index) {
          //       return CalcType01Card(
          //         model: calcsList[index],
          //       );
          //     },
          //   ),
          // ),

          Flexible(
            child: Table(
              children: [
                const TableRow(
                  children: [
                    Text('n1'),
                    Text('Op.'),
                    Text('n2'),
                    Text('='),
                    Text('Ans'),
                    Text('->'),
                    Text('Std'),
                    Text('Sit'),
                  ],
                ),
                for (var item in calcsList)
                  TableRow(
                    children: [
                      Text(item.num1.toStringOrigin()),
                      Text(item.operator.toSymbol),
                      Text(item.num2.toStringOrigin()),
                      const Text('='),
                      Text(item.ansCalc.toStringOrigin()),
                      const Text('->'),
                      Text(item.ansStudent?.toStringOrigin() ?? '?'),
                      item.ansCalc.isEqualsThe(item.ansStudent)
                          ? const Text('ok')
                          : const Text('Not'),
                      // Text(item.ansCalc.isEqualsThe(item.ansStudent)
                      //     ? 'Eq'
                      //     : 'Dif'),
                    ],
                  )
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Registrar treinamento'),
          ),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Escolher outra tarefa'),
          ),
        ],
      ),
    );
  }
}
