import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  static Route<void> route() {
    return MaterialPageRoute<void>(builder: (_) => const HomePage());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Olá',
        ),
      ),
      body: Center(
          child: TextButton(
        child: const Text('Logout'),
        onPressed: () {},
      )),
    );
  }
}
