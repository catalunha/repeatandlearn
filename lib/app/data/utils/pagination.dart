import 'package:freezed_annotation/freezed_annotation.dart';

part 'pagination.freezed.dart';

@freezed
abstract class Pagination with _$Pagination {
  const factory Pagination({
    @Default(1) int page,
    @Default(100) int limit,
  }) = _Pagination;
}
