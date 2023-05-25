enum UserRegisterEmailStateStatus { initial, loading, success, error }

class UserRegisterEmailState {
  final UserRegisterEmailStateStatus status;
  final String? error;
  final String? email;
  final String? password;

  UserRegisterEmailState({
    required this.status,
    this.error,
    this.email,
    this.password,
  });
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
      status: status ?? this.status,
      error: error ?? this.error,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  String toString() {
    return 'UserRegisterEmailState(status: $status, error: $error, email: $email, password: $password)';
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
