// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$taskListHash() => r'60b52138f4438f57feb2c6fb0104ffa10bc77c28';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

typedef TaskListRef = FutureProviderRef<List<TaskModel>>;

/// See also [taskList].
@ProviderFor(taskList)
const taskListProvider = TaskListFamily();

/// See also [taskList].
class TaskListFamily extends Family<AsyncValue<List<TaskModel>>> {
  /// See also [taskList].
  const TaskListFamily();

  /// See also [taskList].
  TaskListProvider call({
    required LevelModel level,
  }) {
    return TaskListProvider(
      level: level,
    );
  }

  @override
  TaskListProvider getProviderOverride(
    covariant TaskListProvider provider,
  ) {
    return call(
      level: provider.level,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'taskListProvider';
}

/// See also [taskList].
class TaskListProvider extends FutureProvider<List<TaskModel>> {
  /// See also [taskList].
  TaskListProvider({
    required this.level,
  }) : super.internal(
          (ref) => taskList(
            ref,
            level: level,
          ),
          from: taskListProvider,
          name: r'taskListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$taskListHash,
          dependencies: TaskListFamily._dependencies,
          allTransitiveDependencies: TaskListFamily._allTransitiveDependencies,
        );

  final LevelModel level;

  @override
  bool operator ==(Object other) {
    return other is TaskListProvider && other.level == level;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, level.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
