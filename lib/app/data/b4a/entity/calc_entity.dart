import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../../core/NumberQ/calc_type_01.dart';
import '../../../core/models/calc_model.dart';
import 'calc_type_entity.dart';
import 'level_entity.dart';
import 'task_entity.dart';

class CalcEntity {
  static const String className = 'Calc';
  // Nome do campo local =  no Database
  static const String id = 'objectId';
  static const String level = 'level';
  static const String task = 'task';
  static const String calcType = 'calcType';
  static const String calc = 'calc';

  CalcModel toModel(ParseObject parseObject) {
    CalcModel model = CalcModel(
      id: parseObject.objectId!,
      level: LevelEntity().toModel(parseObject.get(CalcEntity.level)),
      task: TaskEntity().toModel(parseObject.get(CalcEntity.task)),
      calcType: CalcTypeEntity().toModel(parseObject.get(CalcEntity.calcType)),
      calc: CalcType01.fromMap(parseObject.get(CalcEntity.calc)),
    );

    return model;
  }
}
