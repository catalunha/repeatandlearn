// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calcListHash() => r'abac58a3104aa74f121069615c24e9658c101a42';

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

typedef CalcListRef = FutureProviderRef<List<CalcModel>>;

/// See also [calcList].
@ProviderFor(calcList)
const calcListProvider = CalcListFamily();

/// See also [calcList].
class CalcListFamily extends Family<AsyncValue<List<CalcModel>>> {
  /// See also [calcList].
  const CalcListFamily();

  /// See also [calcList].
  CalcListProvider call({
    required TaskModel task,
  }) {
    return CalcListProvider(
      task: task,
    );
  }

  @override
  CalcListProvider getProviderOverride(
    covariant CalcListProvider provider,
  ) {
    return call(
      task: provider.task,
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
  String? get name => r'calcListProvider';
}

/// See also [calcList].
class CalcListProvider extends FutureProvider<List<CalcModel>> {
  /// See also [calcList].
  CalcListProvider({
    required this.task,
  }) : super.internal(
          (ref) => calcList(
            ref,
            task: task,
          ),
          from: calcListProvider,
          name: r'calcListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$calcListHash,
          dependencies: CalcListFamily._dependencies,
          allTransitiveDependencies: CalcListFamily._allTransitiveDependencies,
        );

  final TaskModel task;

  @override
  bool operator ==(Object other) {
    return other is CalcListProvider && other.task == task;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, task.hashCode);

    return _SystemHash.finish(hash);
  }
}
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
