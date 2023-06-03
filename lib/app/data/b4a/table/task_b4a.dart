import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/models/task_model.dart';
import '../../utils/pagination.dart';
import '../b4a_exception.dart';
import '../entity/task_entity.dart';
import '../utils/parse_error_translate.dart';

class TaskB4a {
  Future<List<TaskModel>> list({
    required QueryBuilder<ParseObject> query,
    Pagination pagination = const Pagination(),
  }) async {
    query.setAmountToSkip((pagination.page - 1) * pagination.limit);
    query.setLimit(pagination.limit);
    query.whereEqualTo(TaskEntity.isActive, true);
    query.includeObject(['level']);
    ParseResponse? response;
    try {
      response = await query.query();
      List<TaskModel> listTemp = <TaskModel>[];
      if (response.success && response.results != null) {
        for (var element in response.results!) {
          listTemp.add(TaskEntity().toModel(element));
        }
        return listTemp;
      } else {
        return [];
      }
    } on Exception {
      var errorTranslated = ParseErrorTranslate.translate(response!.error!);
      throw B4aException(
        errorTranslated,
        where: 'TaskB4a.list',
        originalError: '${response.error!.code} -${response.error!.message}',
      );
    }
  }
}
