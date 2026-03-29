import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Notifier for managing offline mode state.
class OfflineModeNotifier extends Notifier<bool> {
  @override
  bool build() => false; // Default to online

  void toggle() {
    state = !state;
  }

  void setOffline(bool isOffline) {
    state = isOffline;
  }
}

final offlineModeProvider = NotifierProvider<OfflineModeNotifier, bool>(
  OfflineModeNotifier.new,
);
