import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:repeatandlearn/app/core/repositories/repositories_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/level_model.dart';
import '../../../data/b4a/entity/level_entity.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<LevelModel>> levelList(LevelListRef ref) async {
  QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject(LevelEntity.className));
  return await ref.read(levelRepositoryProvider).list(query: query);
}
