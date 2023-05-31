// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userLoginStatusHash() => r'a669cae9ef250c58c9feac4fd280ee8b83a28a40';

/// See also [userLoginStatus].
@ProviderFor(userLoginStatus)
final userLoginStatusProvider = AutoDisposeProvider<UserLoginStatus>.internal(
  userLoginStatus,
  name: r'userLoginStatusProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userLoginStatusHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserLoginStatusRef = AutoDisposeProviderRef<UserLoginStatus>;
String _$userLoginErrorHash() => r'f20600c4435d4757b746f6c28411981737bd3724';

/// See also [userLoginError].
@ProviderFor(userLoginError)
final userLoginErrorProvider = AutoDisposeProvider<String>.internal(
  userLoginError,
  name: r'userLoginErrorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userLoginErrorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef UserLoginErrorRef = AutoDisposeProviderRef<String>;
String _$userLoginEmailPasswordRequestHash() =>
    r'36f448a69bf847cb0e60c9920a32f1ba957b59aa';

/// See also [UserLoginEmailPasswordRequest].
@ProviderFor(UserLoginEmailPasswordRequest)
final userLoginEmailPasswordRequestProvider = AutoDisposeAsyncNotifierProvider<
    UserLoginEmailPasswordRequest, UserModel?>.internal(
  UserLoginEmailPasswordRequest.new,
  name: r'userLoginEmailPasswordRequestProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$userLoginEmailPasswordRequestHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$UserLoginEmailPasswordRequest = AutoDisposeAsyncNotifier<UserModel?>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
