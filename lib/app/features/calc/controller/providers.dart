import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/calc_model.dart';
import '../../../core/repositories/repositories_providers.dart';
import '../../../data/b4a/entity/calc_entity.dart';
import '../../../data/b4a/entity/level_entity.dart';
import '../../../data/b4a/entity/task_entity.dart';
import '../../task/controller/providers.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<CalcModel>> calcList(
  CalcListRef ref,
) async {
  final taskSelected = ref.watch(taskSelectedProvider)!;

  QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject(CalcEntity.className));
  query.whereEqualTo(
      CalcEntity.level,
      (ParseObject(LevelEntity.className)..objectId = taskSelected.level.id)
          .toPointer());
  query.whereEqualTo(
      CalcEntity.task,
      (ParseObject(TaskEntity.className)..objectId = taskSelected.id)
          .toPointer());
  return await ref.read(calcRepositoryProvider).list(query: query);
}
