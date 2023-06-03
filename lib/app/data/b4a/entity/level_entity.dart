import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/models/level_model.dart';

class LevelEntity {
  static const String className = 'Level';
  // Nome do campo local =  no Database
  static const String id = 'objectId';
  static const String image = 'image';
  static const String title = 'title';
  static const String description = 'description';
  static const String isActive = 'isActive';
  static const String tasks = 'tasks';

  LevelModel toModel(ParseObject parseObject) {
    LevelModel model = LevelModel(
      id: parseObject.objectId!,
      image: parseObject.get(LevelEntity.image)?.get<String>('url'),
      title: parseObject.get<String>(LevelEntity.title)!,
      description: parseObject.get<String>(LevelEntity.description)!,
      isActive: parseObject.get<bool>(LevelEntity.isActive)!,
      tasks: parseObject.get<List<dynamic>>(LevelEntity.tasks) != null
          ? parseObject
              .get<List<dynamic>>(LevelEntity.tasks)!
              .map((e) => e.toString())
              .toList()
          : [],
    );
    return model;
  }

  Future<ParseObject> toParse(LevelModel model) async {
    final parseObject = ParseObject(LevelEntity.className);
    parseObject.objectId = model.id;
    parseObject.set<String>(LevelEntity.title, model.title);
    parseObject.set<String>(LevelEntity.description, model.description);
    parseObject.set<bool>(LevelEntity.isActive, model.isActive);
    parseObject.set<List<String>>(LevelEntity.tasks, model.tasks);
    return parseObject;
  }
}
