import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearn/app/core/models/user_model.dart';

import '../../../../../core/repositories/repositories_providers.dart';
import 'user_register_email_notifiers.dart';
import 'user_register_email_states.dart';

final currentTodo = Provider<UserModel>((ref) => throw UnimplementedError());

final userRegisterEmailStNotProv =
    StateNotifierProvider<UserRegisterEmailStNot, UserRegisterEmailState>(
        (ref) {
  final userRepositoryProvIR = ref.read(userRepositoryProv);

  return UserRegisterEmailStNot(userRepository: userRepositoryProvIR);
});
