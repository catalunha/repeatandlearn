import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/models/level_model.dart';
import '../../utils/pagination.dart';
import '../b4a_exception.dart';
import '../entity/level_entity.dart';
import '../utils/parse_error_translate.dart';

class LevelB4a {
  Future<List<LevelModel>> list({
    required QueryBuilder<ParseObject> query,
    Pagination pagination = const Pagination(),
  }) async {
    query.setAmountToSkip((pagination.page - 1) * pagination.limit);
    query.setLimit(pagination.limit);
    query.whereEqualTo(LevelEntity.isActive, true);

    ParseResponse? response;
    try {
      response = await query.query();
      List<LevelModel> listTemp = <LevelModel>[];
      if (response.success && response.results != null) {
        for (var element in response.results!) {
          listTemp.add(LevelEntity().fromParse(element));
        }
        return listTemp;
      } else {
        return [];
      }
    } on Exception {
      var errorTranslated = ParseErrorTranslate.translate(response!.error!);
      throw B4aException(
        errorTranslated,
        where: 'LevelB4a.list',
        originalError: '${response.error!.code} -${response.error!.message}',
      );
    }
  }
}
