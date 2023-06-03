import 'package:flutter/material.dart';

import 'package:repeatandlearn/app/core/models/level_model.dart';

import '../../utils/app_photo_show.dart';

class LevelCard extends StatelessWidget {
  final LevelModel model;
  const LevelCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: AppImageShow(
        photoUrl: model.image,
      ),
      title: Text(model.title),
      subtitle: Text(model.description),
    );
  }
}
