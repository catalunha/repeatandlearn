import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/providers.dart';

class CalcsAns extends ConsumerWidget {
  const CalcsAns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ans = ref.watch(ansStudentProvider);
    return Text(ans);
  }
}
