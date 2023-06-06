import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:repeatandlearn/app/data/b4a/table/user_response_b4a.dart';

import '../../data/utils/pagination.dart';
import '../models/user_response_model.dart';

class UserResponseRepository {
  final UserResponseB4a userResponseB4a = UserResponseB4a();
  Future<List<UserResponseModel>> list({
    required QueryBuilder<ParseObject> query,
    Pagination pagination = const Pagination(),
  }) =>
      userResponseB4a.list(query: query, pagination: pagination);
  Future<void> update(UserResponseModel model, String taskId) =>
      userResponseB4a.update(model: model, taskId: taskId);
}
