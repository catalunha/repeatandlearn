import 'package:freezed_annotation/freezed_annotation.dart';

part 'level_model.freezed.dart';

@freezed
abstract class LevelModel with _$LevelModel {
  factory LevelModel({
    String? id,
    String? image,
    required String title,
    required String description,
    @Default(true) bool isActive,
    @Default([]) List<String> tasks,
  }) = _LevelModel;
}
