import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repeatandlearn/app/core/models/task_model.dart';

import 'level_model.dart';
import 'user_profile_model.dart';

part 'user_response_model.freezed.dart';

@freezed
abstract class UserResponseModel with _$UserResponseModel {
  factory UserResponseModel({
    String? id,
    required UserProfileModel userProfile,
    required LevelModel level,
    required TaskModel task,
    required DateTime startIn,
    required int minutes,
    required String rating,
  }) = _UserResponseModel;
}
