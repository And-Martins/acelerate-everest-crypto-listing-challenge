import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'total_amount_provider.dart';

final hideWalletStateProvider = StateProvider((ref) => false);
final cryptoNameProvider = StateProvider((ref) => '');
final cryptoAbrevProvider = StateProvider((ref) => '');
final cryptoImageProvider = StateProvider((ref) => '');
final cryptoCotacaoProvider = StateProvider((ref) => Decimal.parse('00.0'));
final cryptoVariacaoProvider = StateProvider((ref) => 00.0);
final cryptoValueWalletReaisProvider = StateProvider((ref) => 00.0);
final cryptoQtdWalletCriptoProvider = StateProvider((ref) => 00.0);
final cryptoDaysProvider = StateProvider((ref) => 5);
final cryptoActualCurrencyProvider = StateProvider((ref) => 0.0);
final cryptoIdProvider = StateProvider((ref) => '');
final fieldTransferValue = StateProvider((ref) => "");
final dioProvider = Provider(
  (ref) => Dio(BaseOptions(baseUrl: 'https://api.coingecko.com/api/v3')),
);

final totalValueAmountProvider =
    StateNotifierProvider<TotalWalletAmountProvider, List<double>>(
  (ref) => TotalWalletAmountProvider(),
);
