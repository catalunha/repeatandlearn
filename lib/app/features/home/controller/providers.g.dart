// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$levelListHash() => r'549ad900ed233aa3a2225e5116120866a7df8d1e';

/// See also [levelList].
@ProviderFor(levelList)
final levelListProvider = FutureProvider<List<LevelModel>>.internal(
  levelList,
  name: r'levelListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$levelListHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef LevelListRef = FutureProviderRef<List<LevelModel>>;
String _$levelSelectedHash() => r'709997525c0caa4dc5bad62a2f1d6bb4b1014d06';

/// See also [LevelSelected].
@ProviderFor(LevelSelected)
final levelSelectedProvider =
    NotifierProvider<LevelSelected, LevelModel?>.internal(
  LevelSelected.new,
  name: r'levelSelectedProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$levelSelectedHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$LevelSelected = Notifier<LevelModel?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
