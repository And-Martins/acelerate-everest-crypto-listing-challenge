import 'package:crypto_listing/shared/providers/total_amount_provider.dart';
import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final hideWalletStateProvider = StateProvider((ref) => false);
final criptoNameProvider = StateProvider((ref) => '');
final criptoAbrevProvider = StateProvider((ref) => '');
final criptoImageProvider = StateProvider((ref) => '');
final criptoCotacaoProvider = StateProvider((ref) => Decimal.parse('00.0'));
final criptoVariacaoProvider = StateProvider((ref) => 00.0);
final criptoValueWalletReaisProvider = StateProvider((ref) => 00.0);
final criptoQtdWalletCriptoProvider = StateProvider((ref) => 00.0);
final criptoDaysProvider = StateProvider((ref) => 5);
final criptoActualCurrencyProvider = StateProvider((ref) => 0.0);
final cryptoIdProvider = StateProvider((ref) => '');

final dioProvider = Provider(
  (ref) => Dio(BaseOptions(baseUrl: 'https://api.coingecko.com/api/v3')),
);

final totalValueAmountProvider =
    StateNotifierProvider<TotalWalletAmountProvider, List<double>>(
  (ref) => TotalWalletAmountProvider(),
);
