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

  LevelModel fromParse(ParseObject parseObject) {
    LevelModel profileModel = LevelModel(
      id: parseObject.objectId!,
      image: parseObject.get(LevelEntity.image).get<String>('url'),
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
    return profileModel;
  }

  Future<ParseObject> toParse(LevelModel profileModel) async {
    final profileParseObject = ParseObject(LevelEntity.className);
    profileParseObject.objectId = profileModel.id;
    profileParseObject.set<String>(LevelEntity.title, profileModel.title);
    profileParseObject.set<String>(
        LevelEntity.description, profileModel.description);
    profileParseObject.set<bool>(LevelEntity.isActive, profileModel.isActive);
    profileParseObject.set<List<String>>(LevelEntity.tasks, profileModel.tasks);
    return profileParseObject;
  }
}
