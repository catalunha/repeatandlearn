// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calc_type_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalcTypeModel {
  String? get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalcTypeModelCopyWith<CalcTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalcTypeModelCopyWith<$Res> {
  factory $CalcTypeModelCopyWith(
          CalcTypeModel value, $Res Function(CalcTypeModel) then) =
      _$CalcTypeModelCopyWithImpl<$Res, CalcTypeModel>;
  @useResult
  $Res call({String? id, String title, String description});
}

/// @nodoc
class _$CalcTypeModelCopyWithImpl<$Res, $Val extends CalcTypeModel>
    implements $CalcTypeModelCopyWith<$Res> {
  _$CalcTypeModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CalcTypeModelCopyWith<$Res>
    implements $CalcTypeModelCopyWith<$Res> {
  factory _$$_CalcTypeModelCopyWith(
          _$_CalcTypeModel value, $Res Function(_$_CalcTypeModel) then) =
      __$$_CalcTypeModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? id, String title, String description});
}

/// @nodoc
class __$$_CalcTypeModelCopyWithImpl<$Res>
    extends _$CalcTypeModelCopyWithImpl<$Res, _$_CalcTypeModel>
    implements _$$_CalcTypeModelCopyWith<$Res> {
  __$$_CalcTypeModelCopyWithImpl(
      _$_CalcTypeModel _value, $Res Function(_$_CalcTypeModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = null,
    Object? description = null,
  }) {
    return _then(_$_CalcTypeModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CalcTypeModel implements _CalcTypeModel {
  _$_CalcTypeModel({this.id, required this.title, required this.description});

  @override
  final String? id;
  @override
  final String title;
  @override
  final String description;

  @override
  String toString() {
    return 'CalcTypeModel(id: $id, title: $title, description: $description)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalcTypeModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, title, description);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalcTypeModelCopyWith<_$_CalcTypeModel> get copyWith =>
      __$$_CalcTypeModelCopyWithImpl<_$_CalcTypeModel>(this, _$identity);
}

abstract class _CalcTypeModel implements CalcTypeModel {
  factory _CalcTypeModel(
      {final String? id,
      required final String title,
      required final String description}) = _$_CalcTypeModel;

  @override
  String? get id;
  @override
  String get title;
  @override
  String get description;
  @override
  @JsonKey(ignore: true)
  _$$_CalcTypeModelCopyWith<_$_CalcTypeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
