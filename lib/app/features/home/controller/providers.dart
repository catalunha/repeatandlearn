import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/models/level_model.dart';
import '../../../core/repositories/repositories_providers.dart';
import '../../../data/b4a/entity/level_entity.dart';

part 'providers.g.dart';

@Riverpod(keepAlive: true)
FutureOr<List<LevelModel>> levelList(LevelListRef ref) async {
  QueryBuilder<ParseObject> query =
      QueryBuilder<ParseObject>(ParseObject(LevelEntity.className));
  return await ref.read(levelRepositoryProvider).list(query: query);
}

@Riverpod(keepAlive: true)
class LevelSelected extends _$LevelSelected {
  @override
  LevelModel? build() {
    return null;
  }

  setLevel(LevelModel model) {
    state = model;
  }
}
