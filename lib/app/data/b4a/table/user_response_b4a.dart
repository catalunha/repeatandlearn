import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:repeatandlearn/app/core/models/user_response_model.dart';

import '../b4a_exception.dart';
import '../entity/task_entity.dart';
import '../entity/user_response_entity.dart';
import '../utils/parse_error_translate.dart';

class UserResponseB4a {
  Future<void> update(
      {required UserResponseModel model, required String taskId}) async {
    QueryBuilder<ParseObject> query =
        QueryBuilder<ParseObject>(ParseObject(UserResponseEntity.className));
    query.whereEqualTo(UserResponseEntity.task,
        (ParseObject(TaskEntity.className)..objectId = taskId).toPointer());
    query.first();
    ParseResponse? parseResponseQuery;
    parseResponseQuery = await query.query();
    String? idQuery;
    if (parseResponseQuery.success && parseResponseQuery.results != null) {
      ParseObject parseObjectItem =
          parseResponseQuery.results!.first as ParseObject;
      idQuery = parseObjectItem.objectId!;
    }
    UserResponseModel modelNew = model.copyWith(id: idQuery);
    final parseObject = await UserResponseEntity().toParse(modelNew);
    ParseResponse? parseResponse;
    try {
      parseResponse = await parseObject.save();

      if (parseResponse.success && parseResponse.results != null) {
        // ParseObject parseObjectItem =
        //     parseResponse.results!.first as ParseObject;
        // return parseObjectItem.objectId!;
      } else {
        throw Exception();
      }
    } on Exception {
      var errorTranslated =
          ParseErrorTranslate.translate(parseResponse!.error!);
      throw B4aException(
        errorTranslated,
        where: 'UserResponseRepositoryB4a.update',
        originalError:
            '${parseResponse.error!.code} -${parseResponse.error!.message}',
      );
    }
  }
}
