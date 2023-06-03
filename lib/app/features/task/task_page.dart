import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearn/app/features/task/controller/providers.dart';

import '../../core/models/level_model.dart';
import 'comp/task_card.dart';

class TaskPage extends ConsumerWidget {
  final LevelModel model;
  const TaskPage({
    super.key,
    required this.model,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final taskList = ref.watch(taskListProvider(level: model));
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Level: ${model.title}',
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
