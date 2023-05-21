import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repeatandlearn/app/core/authentication/riverpod/auth_prov.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Olá',
        ),
      ),
      body: Center(
          child: TextButton(
        child: const Text('Logout'),
        onPressed: () {
          ref.read(authChNotProv).isLoggedIn = false;
        },
      )),
    );
  }
}
