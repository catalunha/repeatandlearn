import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalcReportPage extends ConsumerStatefulWidget {
  const CalcReportPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CalcReportPage> createState() => _CalcReportPageState();
}

class _CalcReportPageState extends ConsumerState<CalcReportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CalcReport'),
      ),
      body: const SingleChildScrollView(
        child: Column(
          children: [
            Text('Ok'),
          ],
        ),
      ),
    );
  }
}
