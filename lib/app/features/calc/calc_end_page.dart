import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalcEndPage extends ConsumerStatefulWidget {
  const CalcEndPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CalcEndPage> createState() => _CalcEndPageState();
}

class _CalcEndPageState extends ConsumerState<CalcEndPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CalcEnd'),
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
