import 'package:flutter/material.dart';

import '../../../core/NumberQ/calc_type_01.dart';

class CalcType01Card extends StatelessWidget {
  final CalcType01 model;
  const CalcType01Card({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Text(model.num1.toStringOrigin()),
          Text(model.operator.toSymbol),
          Text(model.num2.toStringOrigin()),
          const Text('='),
          Text(model.ansCalc.toStringOrigin()),
          const Text('->'),
          Text(model.ansStudent?.toStringOrigin() ?? '?'),
        ],
      ),
    );
  }
}
