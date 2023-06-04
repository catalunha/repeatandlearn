import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalcsPage extends ConsumerStatefulWidget {
  const CalcsPage({Key? key}) : super(key: key);

  @override
  ConsumerState<CalcsPage> createState() => _CalcsPageState();
}

class _CalcsPageState extends ConsumerState<CalcsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcs'),
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
