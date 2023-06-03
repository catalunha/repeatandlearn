import 'package:flutter/material.dart';

import '../../../core/models/calc_model.dart';

class CalcCard extends StatelessWidget {
  final CalcModel model;

  const CalcCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: ListTile(
        title: Text(model.id!),
        subtitle: Text(model.calc.toJson()),
      ),
    );
  }
}
