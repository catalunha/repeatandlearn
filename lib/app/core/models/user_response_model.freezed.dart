// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserResponseModel {
  String? get id => throw _privateConstructorUsedError;
  UserProfileModel get userProfile => throw _privateConstructorUsedError;
  LevelModel get level => throw _privateConstructorUsedError;
  TaskModel get task => throw _privateConstructorUsedError;
  DateTime get startIn => throw _privateConstructorUsedError;
  int get minutes => throw _privateConstructorUsedError;
  String get rating => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserResponseModelCopyWith<UserResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserResponseModelCopyWith<$Res> {
  factory $UserResponseModelCopyWith(
          UserResponseModel value, $Res Function(UserResponseModel) then) =
      _$UserResponseModelCopyWithImpl<$Res, UserResponseModel>;
  @useResult
  $Res call(
      {String? id,
      UserProfileModel userProfile,
      LevelModel level,
      TaskModel task,
      DateTime startIn,
      int minutes,
      String rating});

  $LevelModelCopyWith<$Res> get level;
  $TaskModelCopyWith<$Res> get task;
}

/// @nodoc
class _$UserResponseModelCopyWithImpl<$Res, $Val extends UserResponseModel>
    implements $UserResponseModelCopyWith<$Res> {
  _$UserResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfile = null,
    Object? level = null,
    Object? task = null,
    Object? startIn = null,
    Object? minutes = null,
    Object? rating = null,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as LevelModel,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      startIn: null == startIn
          ? _value.startIn
          : startIn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
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
}

/// @nodoc
abstract class _$$_UserResponseModelCopyWith<$Res>
    implements $UserResponseModelCopyWith<$Res> {
  factory _$$_UserResponseModelCopyWith(_$_UserResponseModel value,
          $Res Function(_$_UserResponseModel) then) =
      __$$_UserResponseModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      UserProfileModel userProfile,
      LevelModel level,
      TaskModel task,
      DateTime startIn,
      int minutes,
      String rating});

  @override
  $LevelModelCopyWith<$Res> get level;
  @override
  $TaskModelCopyWith<$Res> get task;
}

/// @nodoc
class __$$_UserResponseModelCopyWithImpl<$Res>
    extends _$UserResponseModelCopyWithImpl<$Res, _$_UserResponseModel>
    implements _$$_UserResponseModelCopyWith<$Res> {
  __$$_UserResponseModelCopyWithImpl(
      _$_UserResponseModel _value, $Res Function(_$_UserResponseModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? userProfile = null,
    Object? level = null,
    Object? task = null,
    Object? startIn = null,
    Object? minutes = null,
    Object? rating = null,
  }) {
    return _then(_$_UserResponseModel(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfileModel,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as LevelModel,
      task: null == task
          ? _value.task
          : task // ignore: cast_nullable_to_non_nullable
              as TaskModel,
      startIn: null == startIn
          ? _value.startIn
          : startIn // ignore: cast_nullable_to_non_nullable
              as DateTime,
      minutes: null == minutes
          ? _value.minutes
          : minutes // ignore: cast_nullable_to_non_nullable
              as int,
      rating: null == rating
          ? _value.rating
          : rating // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_UserResponseModel implements _UserResponseModel {
  _$_UserResponseModel(
      {this.id,
      required this.userProfile,
      required this.level,
      required this.task,
      required this.startIn,
      required this.minutes,
      required this.rating});

  @override
  final String? id;
  @override
  final UserProfileModel userProfile;
  @override
  final LevelModel level;
  @override
  final TaskModel task;
  @override
  final DateTime startIn;
  @override
  final int minutes;
  @override
  final String rating;

  @override
  String toString() {
    return 'UserResponseModel(id: $id, userProfile: $userProfile, level: $level, task: $task, startIn: $startIn, minutes: $minutes, rating: $rating)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_UserResponseModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.level, level) || other.level == level) &&
            (identical(other.task, task) || other.task == task) &&
            (identical(other.startIn, startIn) || other.startIn == startIn) &&
            (identical(other.minutes, minutes) || other.minutes == minutes) &&
            (identical(other.rating, rating) || other.rating == rating));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, userProfile, level, task, startIn, minutes, rating);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserResponseModelCopyWith<_$_UserResponseModel> get copyWith =>
      __$$_UserResponseModelCopyWithImpl<_$_UserResponseModel>(
          this, _$identity);
}

abstract class _UserResponseModel implements UserResponseModel {
  factory _UserResponseModel(
      {final String? id,
      required final UserProfileModel userProfile,
      required final LevelModel level,
      required final TaskModel task,
      required final DateTime startIn,
      required final int minutes,
      required final String rating}) = _$_UserResponseModel;

  @override
  String? get id;
  @override
  UserProfileModel get userProfile;
  @override
  LevelModel get level;
  @override
  TaskModel get task;
  @override
  DateTime get startIn;
  @override
  int get minutes;
  @override
  String get rating;
  @override
  @JsonKey(ignore: true)
  _$$_UserResponseModelCopyWith<_$_UserResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}
