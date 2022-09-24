import 'package:crypto_listing/shared/utils/providers/total_wallet_amount_provider.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final dioProvider = Provider(
  (ref) => Dio(),
);

final totalValueAmountProvider =
    StateNotifierProvider<TotalWalletAmountProvider, List<double>>(
  (ref) => TotalWalletAmountProvider(),
);
