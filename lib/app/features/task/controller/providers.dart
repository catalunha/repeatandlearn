import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/authentication/riverpod/auth_prov.dart';
import '../../../core/models/task_model.dart';
import '../../../core/models/user_response_model.dart';
import '../../../core/repositories/repositories_providers.dart';
import '../../../data/b4a/entity/level_entity.dart';
import '../../../data/b4a/entity/task_entity.dart';
import '../../../data/b4a/entity/user_profile_entity.dart';
import '../../../data/b4a/entity/user_response_entity.dart';
import '../../home/controller/providers.dart';

part 'providers.g.dart';

// @riverpod
@Riverpod(keepAlive: true)
FutureOr<List<TaskModel>> taskList(
  TaskListRef ref,
) async {
  final levelSelected = ref.watch(levelSelectedProvider)!;
  QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject(TaskEntity.className));
  query.whereEqualTo(
      TaskEntity.level,
      (ParseObject(LevelEntity.className)..objectId = levelSelected.id)
          .toPointer());
  return await ref.read(taskRepositoryProvider).list(query: query);
}

// @riverpod
@Riverpod(keepAlive: true)
FutureOr<List<UserResponseModel>> userResponseList(
  UserResponseListRef ref,
) async {
  final levelSelected = ref.watch(levelSelectedProvider)!;
  final auth = ref.read(authChNotProvider);
  QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject(UserResponseEntity.className));
  query.whereEqualTo(
      UserResponseEntity.level,
      (ParseObject(LevelEntity.className)..objectId = levelSelected.id)
          .toPointer());
  query.whereEqualTo(
      UserResponseEntity.userProfile,
      (ParseObject(UserProfileEntity.className)
            ..objectId = auth.user!.userProfile!.id)
          .toPointer());
  return await ref.read(userResponseRepositoryProvider).list(query: query);
}

@Riverpod(keepAlive: true)
class TaskSelected extends _$TaskSelected {
  @override
  TaskModel? build() {
    return null;
  }

  setTask(TaskModel model) {
    state = model;
  }
}
