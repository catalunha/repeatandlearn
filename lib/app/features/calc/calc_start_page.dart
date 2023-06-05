import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../routes.dart';
import '../task/controller/providers.dart';
import 'comp/calc_card.dart';
import 'controller/providers.dart';

class CalcStartPage extends ConsumerWidget {
  const CalcStartPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskSelected = ref.watch(taskSelectedProvider)!;

    final calcList = ref.watch(calcListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calcs of Level: ${taskSelected.level.title} - Task: ${taskSelected.title}',
        ),
      ),
      body: calcList.when(
        data: (data) {
          return Column(
            children: [
              Text('Level: ${taskSelected.level.title}'),
              Text('Task: ${taskSelected.title}'),
              const Text('Parabens,'),
              const Text(
                  'Você decidiu iniciar mais uma etapa do reforço de seu aprendizado, e tudo esta pronto pra começarmos.'),
              const Text(
                  'Prepare seu ambiente de aprendizado com papel, lapis e borracha. E as vezes uma regua geométrica.'),
              const Text(
                  'Lembre-se que ao começar seu tempo de desevolvimento será contato e não desista.'),
              const Text('Então pra começar clique no botão a seguir.'),
              ElevatedButton(
                  onPressed: () {
                    //resetando vários profiders
                    ref
                        .read(timerResolutionProvider.notifier)
                        .startResolution();
                    context.goNamed(AppPage.calcs.name);
                  },
                  child: const Text('Iniciar aprendizado')),
              Flexible(
                child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    return CalcCard(
                      model: data[index],
                    );
                  },
                ),
              ),
            ],
          );
        },
        error: (error, stackTrace) {
          log('Erro em CalcPage build');
          log('$error');
          log('$stackTrace');
          return const Center(
            child: Text('Erro'),
          );
        },
        loading: () {
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
