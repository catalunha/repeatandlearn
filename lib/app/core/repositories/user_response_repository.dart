import 'package:repeatandlearn/app/data/b4a/table/user_response_b4a.dart';

import '../models/user_response_model.dart';

class UserResponseRepository {
  final UserResponseB4a userResponseB4a = UserResponseB4a();
  Future<void> update(UserResponseModel model, String taskId) =>
      userResponseB4a.update(model: model, taskId: taskId);
}
