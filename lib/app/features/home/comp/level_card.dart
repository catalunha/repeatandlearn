import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:repeatandlearn/app/core/models/level_model.dart';
import 'package:repeatandlearn/app/routes.dart';

import '../../utils/app_photo_show.dart';
import '../controller/providers.dart';

class LevelCard extends ConsumerWidget {
  final LevelModel model;
  const LevelCard({
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
          ref.read(levelSelectedProvider.notifier).setLevel(model);
          context.goNamed(AppPage.tasks.name);
        },
      ),
    );
  }
}
