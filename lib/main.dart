import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'app/app.dart';
import 'app/observer.dart';

void main() {
  runApp(const ProviderScope(
    // observers: [Logger()],
    child: App(),
  ));
}
