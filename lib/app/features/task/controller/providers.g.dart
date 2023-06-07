// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskListHash() => r'8a0a5541242c284b75caed15722536bf47a30d5f';

/// See also [taskList].
@ProviderFor(taskList)
final taskListProvider = FutureProvider<List<TaskModel>>.internal(
  taskList,
  name: r'taskListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef TaskListRef = FutureProviderRef<List<TaskModel>>;
String _$userResponseListHash() => r'4bb7063a5511cb2c0c709836573ff35cbdce2d21';

/// See also [userResponseList].
@ProviderFor(userResponseList)
final userResponseListProvider =
    FutureProvider<List<UserResponseModel>>.internal(
  userResponseList,
  name: r'userResponseListProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userResponseListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserResponseListRef = FutureProviderRef<List<UserResponseModel>>;
String _$taskSelectedHash() => r'ceb7803b36dfc57a0dedf1947b3e490e2937f5a9';

/// See also [TaskSelected].
@ProviderFor(TaskSelected)
final taskSelectedProvider =
    NotifierProvider<TaskSelected, TaskModel?>.internal(
  TaskSelected.new,
  name: r'taskSelectedProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskSelectedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$TaskSelected = Notifier<TaskModel?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
