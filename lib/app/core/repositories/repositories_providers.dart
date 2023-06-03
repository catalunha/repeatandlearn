import 'package:repeatandlearn/app/core/repositories/user_profile_repository.dart';
import 'package:repeatandlearn/app/core/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/b4a/table/user_b4a.dart';
import 'calc_repository.dart';
import 'level_repository.dart';
import 'task_repository.dart';

part 'repositories_providers.g.dart';

final userB4aProvider = Provider<UserB4a>((ref) => UserB4a());

final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepository(userB4a: ref.read(userB4aProvider)));

@riverpod
UserProfileRepository userProfileRepository(UserProfileRepositoryRef ref) {
  return UserProfileRepository();
}

@riverpod
LevelRepository levelRepository(LevelRepositoryRef ref) {
  return LevelRepository();
}

@riverpod
TaskRepository taskRepository(TaskRepositoryRef ref) {
  return TaskRepository();
}

@riverpod
CalcRepository calcRepository(CalcRepositoryRef ref) {
  return CalcRepository();
}
