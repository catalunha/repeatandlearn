import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearn/app/core/repositories/user_repository.dart';

import '../../data/b4a/table/user_b4a.dart';

final userB4aProv = Provider<UserB4a>((ref) => UserB4a());
final userRepositoryProv = Provider<UserRepository>(
    (ref) => UserRepository(userB4a: ref.read(userB4aProv)));
