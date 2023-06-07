import 'package:freezed_annotation/freezed_annotation.dart';

import '../NumberQ/calc_type_01.dart';
import 'calc_type_model.dart';
import 'level_model.dart';
import 'task_model.dart';

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
