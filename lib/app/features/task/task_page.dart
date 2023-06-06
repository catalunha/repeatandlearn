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
    final userResponses = ref.watch(userResponseListProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Tasks of Level: ${levelSelected.title}',
        ),
      ),
      body: taskList.when(
        data: (dataTasks) {
          return userResponses.when(
            data: (dataUserResp) {
              return ListView.builder(
                itemCount: dataTasks.length,
                itemBuilder: (context, index) {
                  final task = dataTasks[index];
                  final indexUserResp = dataUserResp
                      .indexWhere((userResp) => userResp.task.id == task.id);
                  return TaskCard(
                    model: task,
                    userResponseModel:
                        indexUserResp >= 0 ? dataUserResp[indexUserResp] : null,
                  );
                },
              );
            },
            error: (error, stackTrace) {
              //log('Erro em TaskPage build');
              //log('$error');
              //log('$stackTrace');
              return const Center(
                child: Text('Erro em buscar userResponse'),
              );
            },
            loading: () {
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.yellow,
                ),
              );
            },
          );
        },
        error: (error, stackTrace) {
          //log('Erro em TaskPage build');
          //log('$error');
          //log('$stackTrace');
          return const Center(
            child: Text('Erro em buscar tasks'),
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
