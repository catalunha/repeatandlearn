// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$calcListHash() => r'd14ec346c5300078d165bc283398ed130ce52dd8';

/// See also [calcList].
@ProviderFor(calcList)
final calcListProvider = FutureProvider<List<CalcModel>>.internal(
  calcList,
  name: r'calcListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$calcListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CalcListRef = FutureProviderRef<List<CalcModel>>;
String _$canGoToIndexPreviousHash() =>
    r'e91b437814189d8e4527adbf67e8ceb7e4e74419';

/// See also [canGoToIndexPrevious].
@ProviderFor(canGoToIndexPrevious)
final canGoToIndexPreviousProvider = AutoDisposeProvider<bool>.internal(
  canGoToIndexPrevious,
  name: r'canGoToIndexPreviousProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$canGoToIndexPreviousHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CanGoToIndexPreviousRef = AutoDisposeProviderRef<bool>;
String _$inLastIndexCurrentHash() =>
    r'5272d477358963eb35f2cfcd46cd5d282147be22';

/// See also [inLastIndexCurrent].
@ProviderFor(inLastIndexCurrent)
final inLastIndexCurrentProvider = AutoDisposeProvider<bool>.internal(
  inLastIndexCurrent,
  name: r'inLastIndexCurrentProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$inLastIndexCurrentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef InLastIndexCurrentRef = AutoDisposeProviderRef<bool>;
String _$ansStudentHash() => r'9f45962ec7451074bc3391b36cbdc100a73f1891';

/// See also [AnsStudent].
@ProviderFor(AnsStudent)
final ansStudentProvider = NotifierProvider<AnsStudent, String>.internal(
  AnsStudent.new,
  name: r'ansStudentProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$ansStudentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AnsStudent = Notifier<String>;
String _$indexCurrentHash() => r'247667f2e71e49539956f5f061c04fe1e25a4e80';

/// See also [IndexCurrent].
@ProviderFor(IndexCurrent)
final indexCurrentProvider = NotifierProvider<IndexCurrent, int>.internal(
  IndexCurrent.new,
  name: r'indexCurrentProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$indexCurrentHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$IndexCurrent = Notifier<int>;
String _$calcsListHash() => r'35b12b6fda4b0e5440461a4b686b6fdfe6b75469';

/// See also [CalcsList].
@ProviderFor(CalcsList)
final calcsListProvider =
    NotifierProvider<CalcsList, List<CalcType01>>.internal(
  CalcsList.new,
  name: r'calcsListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$calcsListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CalcsList = Notifier<List<CalcType01>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
