// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'calc_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$CalcModel {
  String? get id => throw _privateConstructorUsedError;
  LevelModel get level => throw _privateConstructorUsedError;
  TaskModel get task => throw _privateConstructorUsedError;
  CalcTypeModel get calcType => throw _privateConstructorUsedError;
  CalcType01 get calc => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CalcModelCopyWith<CalcModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CalcModelCopyWith<$Res> {
  factory $CalcModelCopyWith(CalcModel value, $Res Function(CalcModel) then) =
      _$CalcModelCopyWithImpl<$Res, CalcModel>;
  @useResult
  $Res call(
      {String? id,
      LevelModel level,
      TaskModel task,
      CalcTypeModel calcType,
      CalcType01 calc});

  $LevelModelCopyWith<$Res> get level;
  $TaskModelCopyWith<$Res> get task;
  $CalcTypeModelCopyWith<$Res> get calcType;
}

/// @nodoc
class _$CalcModelCopyWithImpl<$Res, $Val extends CalcModel>
    implements $CalcModelCopyWith<$Res> {
  _$CalcModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? level = null,
    Object? task = null,
    Object? calcType = null,
    Object? calc = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as LevelModel,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      calcType: null == calcType
          ? _value.calcType
          : calcType // ignore: cast_nullable_to_non_nullable
              as CalcTypeModel,
      calc: null == calc
          ? _value.calc
          : calc // ignore: cast_nullable_to_non_nullable
              as CalcType01,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LevelModelCopyWith<$Res> get level {
    return $LevelModelCopyWith<$Res>(_value.level, (value) {
      return _then(_value.copyWith(level: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $TaskModelCopyWith<$Res> get task {
    return $TaskModelCopyWith<$Res>(_value.task, (value) {
      return _then(_value.copyWith(task: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CalcTypeModelCopyWith<$Res> get calcType {
    return $CalcTypeModelCopyWith<$Res>(_value.calcType, (value) {
      return _then(_value.copyWith(calcType: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_CalcModelCopyWith<$Res> implements $CalcModelCopyWith<$Res> {
  factory _$$_CalcModelCopyWith(
          _$_CalcModel value, $Res Function(_$_CalcModel) then) =
      __$$_CalcModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      LevelModel level,
      TaskModel task,
      CalcTypeModel calcType,
      CalcType01 calc});

  @override
  $LevelModelCopyWith<$Res> get level;
  @override
  $TaskModelCopyWith<$Res> get task;
  @override
  $CalcTypeModelCopyWith<$Res> get calcType;
}

/// @nodoc
class __$$_CalcModelCopyWithImpl<$Res>
    extends _$CalcModelCopyWithImpl<$Res, _$_CalcModel>
    implements _$$_CalcModelCopyWith<$Res> {
  __$$_CalcModelCopyWithImpl(
      _$_CalcModel _value, $Res Function(_$_CalcModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? level = null,
    Object? task = null,
    Object? calcType = null,
    Object? calc = null,
  }) {
    return _then(_$_CalcModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as LevelModel,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      calcType: null == calcType
          ? _value.calcType
          : calcType // ignore: cast_nullable_to_non_nullable
              as CalcTypeModel,
      calc: null == calc
          ? _value.calc
          : calc // ignore: cast_nullable_to_non_nullable
              as CalcType01,
    ));
  }
}

/// @nodoc

class _$_CalcModel implements _CalcModel {
  _$_CalcModel(
      {this.id,
      required this.level,
      required this.task,
      required this.calcType,
      required this.calc});

  @override
  final String? id;
  @override
  final LevelModel level;
  @override
  final TaskModel task;
  @override
  final CalcTypeModel calcType;
  @override
  final CalcType01 calc;

  @override
  String toString() {
    return 'CalcModel(id: $id, level: $level, task: $task, calcType: $calcType, calc: $calc)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CalcModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.calcType, calcType) ||
                other.calcType == calcType) &&
            (identical(other.calc, calc) || other.calc == calc));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, level, task, calcType, calc);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CalcModelCopyWith<_$_CalcModel> get copyWith =>
      __$$_CalcModelCopyWithImpl<_$_CalcModel>(this, _$identity);
}

abstract class _CalcModel implements CalcModel {
  factory _CalcModel(
      {final String? id,
      required final LevelModel level,
      required final TaskModel task,
      required final CalcTypeModel calcType,
      required final CalcType01 calc}) = _$_CalcModel;

  @override
  String? get id;
  @override
  LevelModel get level;
  @override
  TaskModel get task;
  @override
  CalcTypeModel get calcType;
  @override
  CalcType01 get calc;
  @override
  @JsonKey(ignore: true)
  _$$_CalcModelCopyWith<_$_CalcModel> get copyWith =>
      throw _privateConstructorUsedError;
}
