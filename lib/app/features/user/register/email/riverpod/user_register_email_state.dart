import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/models/user_model.dart';
import '../../../../../core/repositories/user_repository.dart';
import '../../../../../data/b4a/b4a_exception.dart';

class UserRegisterEmailStNot extends StateNotifier<UserRegisterEmailState> {
  final UserRepository _userRepository;

  UserRegisterEmailStNot({required UserRepository userRepository})
      : _userRepository = userRepository,
        super(UserRegisterEmailState.initial());

  FutureOr<void> formSubmitted(
      {required String email, required String password}) async {
    state = state.copyWith(status: UserRegisterEmailStateStatus.loading);
    try {
      UserModel? user;
      // UserModel? user = await _userRepository.register(
      //     email: state.email, password: state.password);
      Future.delayed(const Duration(seconds: 3));
      if (user != null) {
        state = state.copyWith(status: UserRegisterEmailStateStatus.success);
      }
      state = state.copyWith(status: UserRegisterEmailStateStatus.error);
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

enum UserRegisterEmailStateStatus { initial, loading, success, error }

class UserRegisterEmailState {
  final UserRegisterEmailStateStatus status;
  final String? error;
  final String email;
  final String password;

  UserRegisterEmailState(this.status, this.error, this.email, this.password);
  UserRegisterEmailState.initial()
      : status = UserRegisterEmailStateStatus.initial,
        error = '',
        email = '',
        password = '';

  UserRegisterEmailState copyWith({
    UserRegisterEmailStateStatus? status,
    String? error,
    String? email,
    String? password,
  }) {
    return UserRegisterEmailState(
      status ?? this.status,
      error ?? this.error,
      email ?? this.email,
      password ?? this.password,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserRegisterEmailState &&
        other.status == status &&
        other.error == error &&
        other.email == email &&
        other.password == password;
  }

  @override
  int get hashCode {
    return status.hashCode ^
        error.hashCode ^
        email.hashCode ^
        password.hashCode;
  }
}
