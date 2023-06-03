import 'package:freezed_annotation/freezed_annotation.dart';

part 'level_model.freezed.dart';

@freezed
abstract class LevelModel with _$LevelModel {
  factory LevelModel({
    String? id,
    String? title,
    String? description,
    @Default([]) List<String> tasks,
  }) = _LevelModel;
}
