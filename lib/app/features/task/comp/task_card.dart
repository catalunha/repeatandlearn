import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/models/task_model.dart';
import '../../../routes.dart';
import '../../utils/app_photo_show.dart';
import '../controller/providers.dart';

class TaskCard extends ConsumerWidget {
  final TaskModel model;

  const TaskCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      elevation: 10,
      child: ListTile(
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
    );
  }
}
