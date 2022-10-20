import 'package:crypto_listing/shared/providers/total_amount_provider.dart';
import 'package:decimal/decimal.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../wallet/model/crypto_view_data.dart';

final hideWalletStateProvider = StateProvider((ref) => false);
final cryptoCotacaoProvider = StateProvider((ref) => Decimal.parse('00.0'));
final cryptoValueWalletReaisProvider = StateProvider((ref) => 00.0);
final cryptoQtdWalletCriptoProvider = StateProvider((ref) => 00.0);
final cryptoDaysProvider = StateProvider((ref) => 5);

final fieldTransferValue = StateProvider((ref) => "0");
final dioProvider = Provider(
  (ref) => Dio(BaseOptions(baseUrl: 'https://api.coingecko.com/api/v3')),
);

final totalValueAmountProvider =
    StateNotifierProvider<TotalWalletAmountProvider, List<double>>(
  (ref) => TotalWalletAmountProvider(),
);

final cryptoDataProvider =
    StateProvider<CryptoViewData>((ref) => CryptoViewData());
