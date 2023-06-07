import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/app_mixin_messages.dart';
import 'comp/calcs_ans.dart';
import 'comp/calcs_bottons.dart';
import 'comp/calcs_calc.dart';
import 'comp/calcs_keyboard.dart';
import 'controller/providers.dart';

class CalcsPage extends ConsumerWidget with Messages {
  const CalcsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<bool>(conversionOkProvider, (previous, next) {
      if (next == false) {
        showMessageError(context,
            'Valor com erro. Corrija ou limpe tudo. Antes de prosseguir');
      }
    });
    final ans = ref.watch(ansStudentProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calcs'),
        automaticallyImplyLeading: false,
        leading: null,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CalcsCalc(),
              const CalcsAns(),
              const CalcsKeyboard(),
              const CalcsBottons(),
              Text('->$ans<-')
            ],
          ),
        ),
      ),
    );
  }
}
