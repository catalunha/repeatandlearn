import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../controller/providers.dart';

class CalcsKeyboard extends ConsumerWidget {
  const CalcsKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Wrap(
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).add('1');
                },
                child: const Text('1')),
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).add('2');
                },
                child: const Text('2')),
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).add('3');
                },
                child: const Text('3')),
          ],
        ),
        Wrap(
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).add('4');
                },
                child: const Text('4')),
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).add('5');
                },
                child: const Text('5')),
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).add('6');
                },
                child: const Text('6')),
          ],
        ),
        Wrap(
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).add('7');
                },
                child: const Text('7')),
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).add('8');
                },
                child: const Text('8')),
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).add('9');
                },
                child: const Text('9')),
          ],
        ),
        Wrap(
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).toggleSignal();
                },
                child: const Text('-+')),
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).add('0');
                },
                child: const Text('0')),
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).removeLast();
                },
                child: const Text('<<')),
          ],
        ),
        Wrap(
          children: [
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).add(' ');
                },
                child: const Text('~')),
            ElevatedButton(
                onPressed: () {
                  ref.read(ansStudentProvider.notifier).add('/');
                },
                child: const Text('/')),
          ],
        ),
        // const Wrap(
        //   children: [],
        // ),
        // Wrap(
        //   children: [
        //     SizedBox(
        //         width: 120,
        //         child: ElevatedButton(
        //             onPressed: () {}, child: const Text('previous'))),
        //     SizedBox(
        //         width: 120,
        //         child: ElevatedButton(
        //             onPressed: () {}, child: const Text('next'))),
        //   ],
        // ),
      ],
    );
  }
}
