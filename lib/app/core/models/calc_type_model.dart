import 'package:freezed_annotation/freezed_annotation.dart';

part 'calc_type_model.freezed.dart';

@freezed
abstract class CalcTypeModel with _$CalcTypeModel {
  factory CalcTypeModel({
    String? id,
    required String title,
    required String description,
  }) = _CalcTypeModel;
}
