import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../../core/authentication/riverpod/auth_prov.dart';
import '../../../../core/models/user_model.dart';
import '../../../../core/repositories/repositories_providers.dart';
import '../../../../data/b4a/b4a_exception.dart';
import 'states.dart';

part 'providers.g.dart';

// @riverpod
// UserLoginStatus userLoginStatus(UserLoginStatusRef ref) {
//   return UserLoginStatus.initial;
// }

final userLoginStatusProvider = StateProvider.autoDispose<UserLoginStatus>(
    (ref) => UserLoginStatus.initial);

final userLoginErrorProvider = StateProvider.autoDispose<String>((ref) => '');

// @riverpod
// String userLoginError(UserLoginErrorRef ref) {
//   return '';
// }

@riverpod
class UserLoginEmailPasswordRequest extends _$UserLoginEmailPasswordRequest {
  @override
  Future<UserModel?> build() async {
    return null;
  }

  Future<void> loginRequest(
      {required String email, required String password}) async {
    state = const AsyncLoading();
    // state = await AsyncValue.guard(() async {
    //   final repository = ref.read(userRepositoryProvider);
    //   final authChNotProvIR = ref.read(authChNotProv);

    //   UserModel? user =
    //       await repository.login(email: email, password: password);
    //   authChNotProvIR.user = user;

    //   return user;
    // });

    try {
      final repository = ref.read(userRepositoryProvider);
      final authChNotProvIR = ref.read(authChNotProvider);

      UserModel? user =
          await repository.login(email: email, password: password);
      authChNotProvIR.user = user;

      state = AsyncData(user);
    } on B4aException catch (e, st) {
      state = AsyncValue.error('texto 2', st);
    } catch (e, st) {
      state = AsyncValue.error('Erro desconhecido no login.', st);
    }
  }
}
