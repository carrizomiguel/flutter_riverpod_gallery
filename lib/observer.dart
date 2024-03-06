import 'dart:developer';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class Observer extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    final text = {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "$newValue"
    };
    log(text.toString());
  }

  @override
  void didDisposeProvider(ProviderBase provider, ProviderContainer container) {
    final text = {
      "provider": "${provider.name ?? provider.runtimeType}",
      "newValue": "disposed"
    };
    log(text.toString());
    super.didDisposeProvider(provider, container);
  }
}
