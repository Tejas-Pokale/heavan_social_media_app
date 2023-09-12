import 'package:flutter_riverpod/flutter_riverpod.dart';

class FabVisibilityProvider extends StateNotifier<bool> {
  FabVisibilityProvider() : super(true);

  bool toggleFabVisibility({required bool vertical, required bool horizontal}) {
    if (horizontal) return state; // Return the current state when horizontal is true
    state = vertical;
    return vertical;
  }
}

final fabVisibilityProvider =
    StateNotifierProvider<FabVisibilityProvider, bool>(
  (ref) => FabVisibilityProvider(),
);
