import 'package:hooks_riverpod/hooks_riverpod.dart';

class TotalWalletAmountProvider extends StateNotifier<List<double>> {
  TotalWalletAmountProvider() : super([]) {
    List<double> quantityCoin = [
      0.65554321,
      0.94,
      0.82,
      1.0,
      0.03,
      0.25,
      1.8,
      0.8978,
      0.74,
      0.80
    ];
    for (int i = 1; i <= 10; i++) {
      state.add(quantityCoin[i - 1]);
    }
  }
}
