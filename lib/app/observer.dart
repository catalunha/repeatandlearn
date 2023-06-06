import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Logger extends ProviderObserver {
  Logger();
  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    log(
      '''
{
  "providerName":"${provider.name}",
  "providerRuntimeType":"${provider.runtimeType}",
  "value":"$value",
}
''',
      name: 'didAddProvider',
    );
  }

  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    log(
      '''
{
  "providerName":"${provider.name}",
  "previousValue":"$previousValue",
  "newValue":"$newValue",
}
''',
      name: 'didUpdateProvider',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    log(
      '''
{
  "providerName":"${provider.name}",
}
''',
      name: 'didDisposeProvider',
    );
  }
}
