// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$TimerResolutionState {
  DateTime? get start => throw _privateConstructorUsedError;
  DateTime? get end => throw _privateConstructorUsedError;
  int? get diference => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $TimerResolutionStateCopyWith<TimerResolutionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TimerResolutionStateCopyWith<$Res> {
  factory $TimerResolutionStateCopyWith(TimerResolutionState value,
          $Res Function(TimerResolutionState) then) =
      _$TimerResolutionStateCopyWithImpl<$Res, TimerResolutionState>;
  @useResult
  $Res call({DateTime? start, DateTime? end, int? diference});
}

/// @nodoc
class _$TimerResolutionStateCopyWithImpl<$Res,
        $Val extends TimerResolutionState>
    implements $TimerResolutionStateCopyWith<$Res> {
  _$TimerResolutionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
    Object? diference = freezed,
  }) {
    return _then(_value.copyWith(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      diference: freezed == diference
          ? _value.diference
          : diference // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TimerResolutionStateCopyWith<$Res>
    implements $TimerResolutionStateCopyWith<$Res> {
  factory _$$_TimerResolutionStateCopyWith(_$_TimerResolutionState value,
          $Res Function(_$_TimerResolutionState) then) =
      __$$_TimerResolutionStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({DateTime? start, DateTime? end, int? diference});
}

/// @nodoc
class __$$_TimerResolutionStateCopyWithImpl<$Res>
    extends _$TimerResolutionStateCopyWithImpl<$Res, _$_TimerResolutionState>
    implements _$$_TimerResolutionStateCopyWith<$Res> {
  __$$_TimerResolutionStateCopyWithImpl(_$_TimerResolutionState _value,
      $Res Function(_$_TimerResolutionState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = freezed,
    Object? end = freezed,
    Object? diference = freezed,
  }) {
    return _then(_$_TimerResolutionState(
      start: freezed == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      end: freezed == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      diference: freezed == diference
          ? _value.diference
          : diference // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$_TimerResolutionState implements _TimerResolutionState {
  _$_TimerResolutionState({this.start, this.end, this.diference});

  @override
  final DateTime? start;
  @override
  final DateTime? end;
  @override
  final int? diference;

  @override
  String toString() {
    return 'TimerResolutionState(start: $start, end: $end, diference: $diference)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TimerResolutionState &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.diference, diference) ||
                other.diference == diference));
  }

  @override
  int get hashCode => Object.hash(runtimeType, start, end, diference);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TimerResolutionStateCopyWith<_$_TimerResolutionState> get copyWith =>
      __$$_TimerResolutionStateCopyWithImpl<_$_TimerResolutionState>(
          this, _$identity);
}

abstract class _TimerResolutionState implements TimerResolutionState {
  factory _TimerResolutionState(
      {final DateTime? start,
      final DateTime? end,
      final int? diference}) = _$_TimerResolutionState;

  @override
  DateTime? get start;
  @override
  DateTime? get end;
  @override
  int? get diference;
  @override
  @JsonKey(ignore: true)
  _$$_TimerResolutionStateCopyWith<_$_TimerResolutionState> get copyWith =>
      throw _privateConstructorUsedError;
}
