import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

import '../../data/b4a/table/calc_b4a.dart';
import '../../data/utils/pagination.dart';
import '../models/calc_model.dart';

class CalcRepository {
  final CalcB4a calcB4a = CalcB4a();

  CalcRepository();
  Future<List<CalcModel>> list({
    required QueryBuilder<ParseObject> query,
    Pagination pagination = const Pagination(),
  }) =>
      calcB4a.list(query: query, pagination: pagination);
}
