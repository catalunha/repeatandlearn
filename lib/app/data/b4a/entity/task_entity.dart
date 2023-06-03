import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/models/task_model.dart';
import 'level_entity.dart';

class TaskEntity {
  static const String className = 'Task';
  // Nome do campo local =  no Database
  static const String id = 'objectId';
  static const String level = 'level';
  static const String image = 'image';
  static const String title = 'title';
  static const String description = 'description';
  static const String isActive = 'isActive';

  TaskModel toModel(ParseObject parseObject) {
    TaskModel model = TaskModel(
        id: parseObject.objectId!,
        image: parseObject.get(TaskEntity.image)?.get<String>('url'),
        title: parseObject.get<String>(TaskEntity.title)!,
        description: parseObject.get<String>(TaskEntity.description)!,
        isActive: parseObject.get<bool>(TaskEntity.isActive)!,
        level: LevelEntity().toModel(parseObject.get(TaskEntity.level)));
    return model;
  }

  Future<ParseObject> toParse(TaskModel model) async {
    final parseObject = ParseObject(TaskEntity.className);
    parseObject.objectId = model.id;
    parseObject.set<String>(TaskEntity.title, model.title);
    parseObject.set<String>(TaskEntity.description, model.description);
    parseObject.set<bool>(TaskEntity.isActive, model.isActive);
    parseObject.set(
        TaskEntity.level,
        (ParseObject(TaskEntity.className)..objectId = model.level.id)
            .toPointer());
    return parseObject;
  }
}
