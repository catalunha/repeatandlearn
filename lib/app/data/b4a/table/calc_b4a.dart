import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/models/calc_model.dart';
import '../../utils/pagination.dart';
import '../b4a_exception.dart';
import '../entity/calc_entity.dart';
import '../utils/parse_error_translate.dart';

class CalcB4a {
  Future<List<CalcModel>> list({
    required QueryBuilder<ParseObject> query,
    Pagination pagination = const Pagination(),
  }) async {
    query.setAmountToSkip((pagination.page - 1) * pagination.limit);
    query.setLimit(pagination.limit);
    query.includeObject(['level', 'task', 'task.level', 'calcType']);

    ParseResponse? response;
    try {
      response = await query.query();
      List<CalcModel> listTemp = <CalcModel>[];
      if (response.success && response.results != null) {
        for (var element in response.results!) {
          listTemp.add(CalcEntity().toModel(element));
        }
        return listTemp;
      } else {
        return [];
      }
    } on Exception {
      var errorTranslated = ParseErrorTranslate.translate(response!.error!);
      throw B4aException(
        errorTranslated,
        where: 'CalcB4a.list',
        originalError: '${response.error!.code} -${response.error!.message}',
      );
    }
  }
}
