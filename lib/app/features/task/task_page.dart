import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearn/app/features/task/controller/providers.dart';

import '../home/controller/providers.dart';
import 'comp/task_card.dart';

class TaskPage extends ConsumerWidget {
  const TaskPage({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final levelSelected = ref.watch(levelSelectedProvider)!;
    final taskList = ref.watch(taskListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tasks of Level: ${levelSelected.title}',
        ),
      ),
      body: taskList.when(
        data: (data) {
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return TaskCard(
                model: data[index],
              );
            },
          );
        },
        error: (error, stackTrace) {
          log('Erro em TaskPage build');
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
