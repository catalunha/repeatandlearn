import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearn/app/core/repositories/user_repository.dart';

import '../../data/b4a/table/user_b4a.dart';

final userB4aProvider = Provider<UserB4a>((ref) => UserB4a());
final userRepositoryProvider = Provider<UserRepository>(
    (ref) => UserRepository(userB4a: ref.read(userB4aProvider)));
