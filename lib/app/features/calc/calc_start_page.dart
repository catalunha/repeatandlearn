import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:repeatandlearn/app/core/authentication/riverpod/auth_prov.dart';

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
    final auth = ref.watch(authChNotProvider);
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
              Text(
                  'Parabens, ${auth.user?.userProfile?.name ?? auth.user!.userProfile!.email}'),
              const Text(
                  'Mais uma etapa do reforço de seu aprendizado esta pronto'),
              const Text(
                  'Prapare seu ambiente de aprendizado com papel, lapis e borracha. E as vezes uma regua geométrica.'),
              const Text(
                  'Lembre-se que ao começar seu tempo de desevolvimento será contato e não desista.'),
              const Text('Então pra começar clique no botão a seguir.'),
              ElevatedButton(
                  onPressed: () {
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
