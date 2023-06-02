import 'package:repeatandlearn/app/core/repositories/user_profile_repository.dart';
import 'package:repeatandlearn/app/core/repositories/user_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../data/b4a/table/user_b4a.dart';

part 'repositories_providers.g.dart';

final userB4aProvider = Provider<UserB4a>((ref) => UserB4a());
final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepository(userB4a: ref.read(userB4aProvider)));
@riverpod
UserProfileRepository userProfileRepository(UserProfileRepositoryRef ref) {
  return UserProfileRepository();
}
