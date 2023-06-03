import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/models/task_model.dart';
import 'comp/calc_card.dart';
import 'controller/providers.dart';

class CalcPage extends ConsumerWidget {
  final TaskModel model;
  const CalcPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final calcList = ref.watch(calcListProvider(task: model));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calcs of Level: ${model.level.title} - Task: ${model.title}',
        ),
      ),
      body: calcList.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return CalcCard(
                model: data[index],
              );
            },
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
