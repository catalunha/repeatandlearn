import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/models/user_model.dart';
import '../../../../../core/repositories/user_repository.dart';
import '../../../../../data/b4a/b4a_exception.dart';
import 'user_register_email_states.dart';

class UserRegisterEmailStNot extends StateNotifier<UserRegisterEmailState> {
  final UserRepository _userRepository;

  UserRegisterEmailStNot({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserRegisterEmailState.initial());

  FutureOr<void> formSubmitted(
      {required String email, required String password}) async {
    state = state.copyWith(status: UserRegisterEmailStateStatus.loading);
    state = state.copyWith(email: email, password: password);
    try {
      // UserModel? user;
      UserModel? user = await _userRepository.register(
          email: state.email!, password: state.password!);
      // await Future.delayed(const Duration(seconds: 5));
      if (user != null) {
        state = state.copyWith(status: UserRegisterEmailStateStatus.success);
      } else {
        state = state.copyWith(
            error: 'Erro no registro do usuario',
            status: UserRegisterEmailStateStatus.error);
      }
    } on B4aException catch (e) {
      state = state.copyWith(
          status: UserRegisterEmailStateStatus.error,
          error: '${e.message} (${e.where} -> ${e.originalError}');
    } catch (e) {
      print(e);
      state = state.copyWith(
          status: UserRegisterEmailStateStatus.error,
          error: 'Erro desconhecido em registrar seu cadastro');
    }
  }
}
