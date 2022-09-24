import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

class TotalWalletAmountProvider extends StateNotifier<List<double>> {
  final Random _random = Random();

  TotalWalletAmountProvider() : super([]) {
    for (double i = 1; i <= 10; i++) {
      state.add(_random.nextDouble());
    }
  }
}
