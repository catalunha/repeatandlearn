import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repeatandlearn/app/core/models/level_model.dart';

part 'task_model.freezed.dart';

@freezed
abstract class TaskModel with _$TaskModel {
  factory TaskModel({
    String? id,
    required LevelModel level,
    String? image,
    required String title,
    required String description,
    @Default(true) bool isActive,
  }) = _TaskModel;
}
