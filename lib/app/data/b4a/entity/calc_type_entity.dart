import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/models/calc_type_model.dart';

class CalcTypeEntity {
  static const String className = 'CalcType';
  // Nome do campo local =  no Database
  static const String id = 'objectId';
  static const String title = 'title';
  static const String description = 'description';

  CalcTypeModel toModel(ParseObject parseObject) {
    CalcTypeModel model = CalcTypeModel(
      id: parseObject.objectId!,
      title: parseObject.get<String>(CalcTypeEntity.title)!,
      description: parseObject.get<String>(CalcTypeEntity.description)!,
    );
    return model;
  }
}
