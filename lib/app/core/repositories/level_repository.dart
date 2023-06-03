import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../data/b4a/table/level_b4a.dart';
import '../../data/utils/pagination.dart';
import '../models/level_model.dart';

class LevelRepository {
  final LevelB4a levelB4a = LevelB4a();

  LevelRepository();
  Future<List<LevelModel>> list({
    required QueryBuilder<ParseObject> query,
    Pagination pagination = const Pagination(),
  }) =>
      levelB4a.list(query: query, pagination: pagination);
}
