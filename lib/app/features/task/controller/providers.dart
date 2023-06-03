import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/level_model.dart';
import '../../../core/models/task_model.dart';
import '../../../core/repositories/repositories_providers.dart';
import '../../../data/b4a/entity/level_entity.dart';
import '../../../data/b4a/entity/task_entity.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<TaskModel>> taskList(TaskListRef ref,
    {required LevelModel level}) async {
  QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject(TaskEntity.className));
  query.whereEqualTo(TaskEntity.level,
      (ParseObject(LevelEntity.className)..objectId = level.id).toPointer());
  return await ref.read(taskRepositoryProvider).list(query: query);
}
