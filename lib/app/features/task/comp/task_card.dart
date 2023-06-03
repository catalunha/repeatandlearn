import 'package:flutter/material.dart';

import '../../../core/models/task_model.dart';
import '../../utils/app_photo_show.dart';

class TaskCard extends StatelessWidget {
  final TaskModel model;

  const TaskCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        leading: AppImageShow(
          photoUrl: model.image,
        ),
        title: Text(model.title),
        subtitle: Text(model.description),
      ),
    );
  }
}
