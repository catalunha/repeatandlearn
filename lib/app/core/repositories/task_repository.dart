import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../data/b4a/table/task_b4a.dart';
import '../../data/utils/pagination.dart';
import '../models/task_model.dart';

class TaskRepository {
  final TaskB4a levelB4a = TaskB4a();

  Future<List<TaskModel>> list({
    required QueryBuilder<ParseObject> query,
    Pagination pagination = const Pagination(),
  }) =>
      levelB4a.list(query: query, pagination: pagination);
}
