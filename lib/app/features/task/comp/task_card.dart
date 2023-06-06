import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import 'package:repeatandlearn/app/core/models/user_response_model.dart';

import '../../../core/models/task_model.dart';
import '../../../routes.dart';
import '../../utils/app_photo_show.dart';
import '../controller/providers.dart';

class TaskCard extends ConsumerWidget {
  final TaskModel model;
  final UserResponseModel? userResponseModel;

  const TaskCard({
    Key? key,
    required this.model,
    required this.userResponseModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dateFormat = DateFormat('dd/MM/y HH:mm');

    return Card(
      elevation: 10,
      child: Column(
        children: [
          ListTile(
            leading: AppImageShow(
              photoUrl: model.image,
            ),
            title: Text(model.title),
            subtitle: Text(model.description),
            onTap: () {
              ref.read(taskSelectedProvider.notifier).setTask(model);

              context.goNamed(
                AppPage.calcStart.name,
              );
            },
          ),
          if (userResponseModel != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                    'Ultimo treinamento: ${dateFormat.format(userResponseModel!.startIn)}'),
                Text('Minutos: ${userResponseModel?.minutes}'),
                Text('Classificação: ${userResponseModel?.rating}')
              ],
            )
        ],
      ),
    );
  }
}
