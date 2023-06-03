import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:repeatandlearn/app/core/NumberQ/calc_type_01.dart';
import 'package:repeatandlearn/app/core/models/task_model.dart';

import 'calc_type_model.dart';
import 'level_model.dart';

part 'calc_model.freezed.dart';

@freezed
abstract class CalcModel with _$CalcModel {
  factory CalcModel({
    String? id,
    required LevelModel level,
    required TaskModel task,
    required CalcTypeModel calcType,
    required CalcType01 calc,
  }) = _CalcModel;
}
