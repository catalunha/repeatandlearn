import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/models/user_response_model.dart';
import 'level_entity.dart';
import 'task_entity.dart';
import 'user_profile_entity.dart';

class UserResponseEntity {
  static const String className = 'UserResponse';
  // Nome do campo local =  no Database
  static const String id = 'objectId';
  static const String userProfile = 'userProfile';
  static const String level = 'level';
  static const String task = 'task';
  static const String startIn = 'startIn';
  static const String minutes = 'minutes';
  static const String rating = 'rating';

  UserResponseModel toModel(ParseObject parseObject) {
    UserResponseModel model = UserResponseModel(
      id: parseObject.objectId!,
      userProfile: UserProfileEntity()
          .toModel(parseObject.get(UserResponseEntity.userProfile)),
      level: LevelEntity().toModel(parseObject.get(UserResponseEntity.level)),
      task: TaskEntity().toModel(parseObject.get(UserResponseEntity.task)),
      startIn: parseObject.get<DateTime>(UserResponseEntity.startIn)!.toLocal(),
      minutes: parseObject.get<int>(UserResponseEntity.minutes)!,
      rating: parseObject.get<String>(UserResponseEntity.rating)!,
    );
    return model;
  }

  Future<ParseObject> toParse(UserResponseModel model) async {
    final parseObject = ParseObject(UserResponseEntity.className);
    parseObject.objectId = model.id;
    parseObject.set(
        UserResponseEntity.userProfile,
        (ParseObject(UserProfileEntity.className)
              ..objectId = model.userProfile.id)
            .toPointer());
    parseObject.set(
        UserResponseEntity.level,
        (ParseObject(LevelEntity.className)..objectId = model.level.id)
            .toPointer());
    parseObject.set(
        UserResponseEntity.task,
        (ParseObject(TaskEntity.className)..objectId = model.task.id)
            .toPointer());
    parseObject.set<DateTime?>(
        UserResponseEntity.startIn,
        DateTime(model.startIn.year, model.startIn.month, model.startIn.day,
            model.startIn.hour, model.startIn.minute));
    parseObject.set<int>(UserResponseEntity.minutes, model.minutes);
    parseObject.set<String>(UserResponseEntity.rating, model.rating);
    return parseObject;
  }
}
